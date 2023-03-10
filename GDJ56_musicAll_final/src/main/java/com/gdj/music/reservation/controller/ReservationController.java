package com.gdj.music.reservation.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.mypage.model.service.MypageService;
import com.gdj.music.pay.model.service.PayService;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.perfor.model.service.PerformanceService;
import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.reservation.model.service.ReservationService;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;
import com.gdj.music.reservation.model.vo.Seat;


@Controller
@RequestMapping("/booking")
public class ReservationController {

	private ReservationService service;
	private PayService service2;
	private MypageService service3;
	private PerformanceService service4;
	
	@Autowired
	public ReservationController(ReservationService service, PayService service2, MypageService service3, PerformanceService service4) {
		super();
		this.service = service;
		this.service2 = service2;
		this.service3 = service3;
		this.service4 = service4;
	}

	
	//예매할 공연리스트
	@RequestMapping("/bookinglist.do")
		public ModelAndView bookingList(ModelAndView mv) {
			List<Map<String,PerformancePhoto>> pp = service4.selectPerforList();
			mv.addObject("musicalPhoto",pp);
			mv.setViewName("reservation/bookingList");
			return mv;
		
	}
	
	//제목 검색
	@RequestMapping("/searchForTitle.do")
	public ModelAndView searchForTitle(ModelAndView mv,String mTitle) {

		Map<String,Object> map=Map.of("mTitle",mTitle);		
		List<Map<String,PerformancePhoto>> pp=service4.searchForTitle(map);
		mv.addObject("musicalPhoto",pp);
		mv.setViewName("reservation/bookingList");
		return mv;

	}
	
	//타입으로 검색하기
	@RequestMapping("/searchForType.do")
	@ResponseBody
	public ModelAndView searchForType(ModelAndView mv,int mType) {
		//System.out.println("공연 유형"+mType);
		String mType1="";
		if(mType==1) {
			mType1="오리지널";
		}
		if(mType==2) {
			mType1="라이센스";
		}
		if(mType==3) {
			mType1="창작뮤지컬";
		}
		if(mType==4) {
			mType1="넌버벌";
		}
		if(mType==5) {
			mType1="아동";
		}
		;
		List<Map<String,PerformancePhoto>> p=service4.searchForType(mType1);
		System.out.println("출력결과"+p);
	
		mv.addObject("musicalPhoto",p);
		mv.setViewName("reservation/bookingList");
		return mv;
	}
	
	
	//예매하기 화면
	@RequestMapping("/bookingview.do")
	public String bookingView(int mCode, Model model ) {
		
		List<Map<String,Performance>> p= service.selectPerform(mCode);
		List day = new ArrayList();
		for(int i=0;i<p.size();i++) {
			day.add(p.get(i).get("S_DAY"));
			
		}
		//썸네일 조회
		String img = service.selectImg(mCode);
		
		//요일 중복제거
		model.addAttribute("day",day.stream().distinct().collect(Collectors.toList()));
		model.addAttribute("mCode",mCode);
		model.addAttribute("performance",p);
		model.addAttribute("img",img);
		
		return "reservation/bookingView";
	}
	
	
	//좌석선택 화면
	@RequestMapping("/selectSeat.do")
	public String selectSeat(int mCode,String date, String time,Model model) {
		int hCode = service.selectHall(mCode);
		List<Map<String,Performance>> p= service.selectPerform(mCode);
		Map<String,Object> map = Map.of("hCode",hCode,"rDate",date,"rTime",time);
		List<String> seats = service.selectSeats(map);
		model.addAttribute("hCode",hCode);
		model.addAttribute("mCode",mCode);
		model.addAttribute("date",date);
		model.addAttribute("time",time);
		model.addAttribute("seats",seats);
		model.addAttribute("performance",p);
		return "/reservation/selectSeat";
	
	}
	
	//결제 화면
	@RequestMapping("/pay.do")
	public String bookingPay(String[] seat,String[] info,Model model) {

		int money2 = Integer.parseInt(info[3]);
		Point p = service3.selectPoint(Integer.parseInt(info[4]));
		model.addAttribute("money",money2);
		model.addAttribute("seatArr",seat);
		model.addAttribute("point",p);
		model.addAttribute("info",info);
		return "/reservation/bookingPay";
		
	}
	
	//결제완료 화면
	@RequestMapping("/payend.do")
	public ModelAndView bookingPayEnd(String[] info,ModelAndView mv) {
		Pay p = Pay.builder().pWay("card").pPrice(Integer.parseInt(info[4]))
				.pUid(info[5]).mUid(info[6]).build();
		String seats = "";
		for(int i=8;i<info.length;i++) {
			if(i!=info.length-1) {
				seats+=info[i]+",";}
			else {
				seats+=info[i];
			}
		}
		System.out.println(seats);
		Reservation r = Reservation.builder().rSeat(seats.split(",")).mCode(Integer.parseInt(info[1]))
						.memberNo(Integer.parseInt(info[0])).rDate(info[2]).rTime(info[3]).build();
		
		//결제 적립금
		int mpPrice = (Integer.parseInt(info[4]))/10;
		//적용 포인트
		int usedPoint = Integer.parseInt(info[7]);
		int mpPoint = service3.selectPoint(Integer.parseInt(info[0]))==null?0:service3.selectPoint(Integer.parseInt(info[0])).getMpPoint();
	
		Point point = Point.builder().mpPrice(usedPoint).mpType("-").memberNo(Integer.parseInt(info[0])).mpHistory("결제 시 사용").mpPoint(mpPoint).build();
		
	
		int result = service2.insertPay(p, r);
		int hCode = service.selectHall(Integer.parseInt(info[1]));
		int result2=0;
		if(result>0) {
			for(int i=8;i<info.length;i++) {
				Seat s = Seat.builder().seatName(info[i]).hCode(hCode).rDate(info[2]).rTime(info[3]).build();
				result2 = service2.insertSeat(s);
			}
			
			if(result2>0) {
				if(usedPoint>0) {
					service.insertPoint(point);
					Point po =  service3.selectPoint(Integer.parseInt(info[0]));
					service.minusPoint(po);
				}
				mpPoint= service3.selectPoint(Integer.parseInt(info[0]))==null?0:service3.selectPoint(Integer.parseInt(info[0])).getMpPoint();
				Point point2 = Point.builder().mpPrice(mpPrice).mpType("+").memberNo(Integer.parseInt(info[0])).mpHistory("예매 적립").mpPoint(mpPoint).build();
				service.insertPoint(point2);
				Point po2 =  service3.selectPoint(Integer.parseInt(info[0]));
				service.addPoint(po2);

				String title = service.selectMusical(Integer.parseInt(info[1]));
				mv.addObject("msg","예매가 완료되었습니다.");
				mv.addObject("info",info);
				mv.addObject("title",title);
				mv.setViewName("/reservation/bookingPayEnd");
			}
			return mv;
		}
		else {
			mv.addObject("msg","예매 실패! 다시 시도해주세요.");
			mv.addObject("loc","/");
			mv.setViewName("common/msg");
			return mv;
		}
		
		
		
	}
	
}
