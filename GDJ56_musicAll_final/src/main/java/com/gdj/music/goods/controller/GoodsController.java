package com.gdj.music.goods.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminGoodsService;
import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.goods.model.service.GoodsService;
import com.gdj.music.goods.model.vo.GReview;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsCart;
import com.gdj.music.goods.model.vo.MyGoods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.mypage.model.service.MypageService;
import com.gdj.music.pay.model.service.PayService;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Point;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	private GoodsService service;
	private AdminGoodsService service2;
	private MypageService serviceMp;
	private PayService servicePay;

	@Autowired
	public GoodsController(GoodsService service, AdminGoodsService service2, MypageService serviceMp, PayService servicePay) {
		super();
		this.service = service;
		this.service2 = service2;
		this.serviceMp = serviceMp;
		this.servicePay = servicePay;
	}
	
	@RequestMapping("/goodsMain.do")
	public ModelAndView goodsMain(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage,
			HttpSession session, HttpServletResponse response) {

		List<Goods> goods = service.goodsList(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//???????????????
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"goodsMain.do" ));
		
		//?????? ?????????
		mv.addObject("goods", goods);
		mv.addObject("img", service.goodsImg()); //????????? ????????????
		
		
		//???????????? ?????? ??????
		if(session.getAttribute("loginMember") == null) {
			
			mv.addObject("total", 0);
			
		} else {
			Member m = (Member) session.getAttribute("loginMember");
			
			mv.addObject("total", service.countCart(m.getMember_No()));
		}
		
		mv.setViewName("/store/goodsMain");
		
		
		return mv;
	}
	
	//?????? ??????
	@RequestMapping("/goodsView.do")
	public String goodsView(Model m, int gdCode, int memberNo) {
		
		m.addAttribute("goods", service.goodsView(gdCode));
		m.addAttribute("img", service.goodsViewImg(gdCode));
		
		//?????? ??????
		m.addAttribute("mygoods", service.selectMygoods(memberNo));
//		System.out.println(memberNo);
//		System.out.println(service.selectMygoods(memberNo));
		
		//????????? ?????????
		m.addAttribute("review", service.selectReview(gdCode));
		
		//????????? ??????
		m.addAttribute("rCount", service.rCount(gdCode));
		
		//?????? ??????
		m.addAttribute("rAvg", service.rAvg(gdCode));
		
		//??????????????? ?????? ?????? ??????
		m.addAttribute("total", service.countCart(memberNo));
		
		//?????????
		m.addAttribute("perfor", service2.perforList());
		
		return "/store/goodsView";
	}
	
	//????????? ??????
	@RequestMapping("/addReview.do")
	public ModelAndView addReview(ModelAndView mv, int rating, int gdCode, String review, int memberNo) {

		GReview r = GReview.builder()
				.grContent(review)
				.grScore(rating)
				.memberNo(memberNo)
				.gdCode(gdCode)
				.build();
		
		
		int result = service.addReview(r);
		
		if(result > 0) {
			
			mv.addObject("msg", "???????????? ?????????????????????. ???????????????.");
			mv.addObject("loc", "/goods/goodsView.do?gdCode="+gdCode+"&memberNo="+memberNo);
			
		} else {
			
			mv.addObject("msg", "????????? ????????? ??????????????????. ?????? ????????? ?????????.");
			mv.addObject("loc", "/goods/goodsView.do?gdCode="+gdCode+"&memberNo="+memberNo);
			
		}

		
		mv.setViewName("common/msg");
				
		return mv;
		
	}
	
	//????????? ??????
	@RequestMapping("/updateReview.do")
	public void updateReview(HttpServletResponse response, ModelAndView mv, int grNo, String review)
			throws IOException{
		
		System.out.println(grNo+review);
		
		GReview r = new GReview().builder()
				.grNo(grNo)
				.grContent(review)
				.build();
		
		System.out.println(r);
		
		int result = service.updateReview(r);
		
		response.getWriter().print(result);
	}

	
	//????????? ??????
	@RequestMapping("/deleteReview.do")
	public ModelAndView deleteReview(ModelAndView mv, int grNo, int gdCode, int memberNo) {
		
		int result = service.deleteReview(grNo);
		
		mv.addObject("msg",result>0?"???????????? ?????????????????????.":"????????? ??????????????????. ?????? ????????? ?????????.");
		mv.addObject("loc","/goods/goodsView.do?gdCode="+gdCode+"&memberNo="+memberNo);

	  
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	//?????? ?????????
	@RequestMapping("/goodsPay.do")
	public String goodsPay(Model m, int gdCode, @RequestParam("member_no") String memberNo, int gdCount) {
		
//		System.out.println(member_no);
//		System.out.println(gdCount);
		
		m.addAttribute("gc", gdCount);
		m.addAttribute("p", serviceMp.selectPoint(Integer.parseInt(memberNo)));
		m.addAttribute("goods", service.goodsView(gdCode));
		m.addAttribute("img", service.goodsViewImg(gdCode));
		//m.addAttribute("total", service.countCart(Integer.parseInt(memberNo)));
		
		return "/store/goodsPay";
	}
	
	//???????????? ??????
	@RequestMapping("/addCart.do")
	public void addCart(int ctCount, int gdCode, int member_no, HttpServletResponse response) throws IOException {

		int result = 0;
		
		//Map<String,Object> gct = Map.of("memberNo", member_no, "gdCode", gdCode);
		
		GoodsCart cart=GoodsCart.builder().gdCode(gdCode).memberNo(member_no).build();
		
		
		//?????? ??????
		if(service.checkCart(cart) == null) {
			
			GoodsCart ct = GoodsCart.builder()
				.ctCount(ctCount)
				.gdCode(gdCode)
				.memberNo(member_no)
				.build();
			
			result = service.addCart(ct);
			
		}
		
		response.getWriter().print(result);
		
	}
	
	//???????????? ????????? ?????????
	@RequestMapping("/goodsCart.do")
	public ModelAndView goodsCart(ModelAndView mv, int memberNo) {
		
		List<GoodsCart> goods = service.goodsCart(memberNo);
		
		
		mv.addObject("goodsCt", goods);
		mv.addObject("img", service.goodsImg());
	
		mv.setViewName("/store/cart");
		
		return mv;
	}
	
	//???????????? ??????
	@RequestMapping("/deleteCart.do")
	@ResponseBody
	public ModelAndView deleteCart(ModelAndView mv, int gdCode, int memberNo) {
		
		int result = service.deleteCart(gdCode);
		
		mv.addObject("msg",result>0?"?????? ??????":"?????? ??????");
		mv.addObject("loc","/goods/goodsCart.do?memberNo="+memberNo);

	  
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	//?????? ??????
	@RequestMapping("/payEnd.do") 
	public ModelAndView payEnd(String[] info, ModelAndView mv) {
		
		Pay p = Pay.builder().pWay(info[1]).pPrice(Integer.parseInt(info[4]))
				.pUid(info[6]).mUid(info[7]).build();
		
		System.out.println(p);
		
		MyGoods g = MyGoods.builder().memberNo(Integer.parseInt(info[0])).gdCode(Integer.parseInt(info[2]))
				.sbCount(Integer.parseInt(info[3])).sbHall(info[5]).build();
		
		
		//?????? ?????????
		int usedPoint = Integer.parseInt(info[8]);
		//?????? ?????????
		int payPoint = (Integer.parseInt(info[9]))/10;
		//????????? ?????? ?????????
		int mpPoint = serviceMp.selectPoint(Integer.parseInt(info[0]))==null?0:serviceMp.selectPoint(Integer.parseInt(info[0])).getMpPoint();
	
		Point point = Point.builder().mpPrice(usedPoint).mpType("-").memberNo(Integer.parseInt(info[0])).mpHistory("?????? ??? ??????").mpPoint(mpPoint).build();
		
		//?????? ?????? ??????
		int gCount = service.selectgCount(Integer.parseInt(info[2]));
		
		
		//?????? ?????? ??????
		int result = servicePay.goodsPay(p);
		
		int result2 = 0;
		
		if(result > 0) {
			
			//??? ?????? ????????? ??????
			result2 = servicePay.insertMygoods(g);
			
			if(result2 > 0) {
				
				if(usedPoint > 0) {
					
					//????????? ?????? ?????? ??????
					servicePay.insertPoint(point);
					
					Point p1 = serviceMp.selectPoint(Integer.parseInt(info[0]));
					
					//????????? ?????? ??????
					servicePay.minusPoint(p1);
					
				}
				
				//??? ????????? ?????? ??????
				mpPoint = serviceMp.selectPoint(Integer.parseInt(info[0]))==null?0:serviceMp.selectPoint(Integer.parseInt(info[0])).getMpPoint();
				
				//?????? ????????? ?????? ??????
				Point point2 = Point.builder().mpPrice(payPoint).mpType("+").memberNo(Integer.parseInt(info[0])).mpHistory("?????? ?????? ??????").mpPoint(mpPoint).build();
				servicePay.insertPoint(point2);
				
				//?????? ????????? ??????
				Point p2 =  serviceMp.selectPoint(Integer.parseInt(info[0]));
				servicePay.addPoint(p2);
				
				mv.addObject("msg","?????? ????????? ?????????????????????.");
				mv.addObject("info", info);
				mv.addObject("img", service.goodsImg());
				
				Goods goods = service.goodsView(Integer.parseInt(info[2]));
				
				mv.addObject("goods", goods);
				
				service.deleteCart(Integer.parseInt(info[2]));
				
				
				servicePay.updategCount(g);
				
				mv.setViewName("/store/payEnd");
		
				
			}
			return mv;
		}
		
		else {
			mv.addObject("msg","????????? ??????????????? ???????????????. ?????? ??????????????????.");
			mv.addObject("loc","/");
			mv.setViewName("common/msg");
			return mv;
		}
		
	}
	
	//?????? ?????? ?????????
	@RequestMapping("/goodsPayAll.do")
	public String goodsPayAll(Model m, int gdCode, @RequestParam("member_no") String memberNo, int gdCount) {
		
		m.addAttribute("gc", gdCount);
		m.addAttribute("p", serviceMp.selectPoint(Integer.parseInt(memberNo)));
		m.addAttribute("goods", service.goodsView(gdCode));
		m.addAttribute("img", service.goodsViewImg(gdCode));
		//m.addAttribute("total", service.countCart(Integer.parseInt(memberNo)));
		
		return "/store/goodsPayAll";
	}
		
	//?????? ?????? ??? ??????
	@RequestMapping("/payAllEnd.do")
	public ModelAndView payAllEnd(String[] info, ModelAndView mv) {
		
		Pay p = Pay.builder().pWay(info[1]).pPrice(Integer.parseInt(info[4]))
				.pUid(info[6]).mUid(info[7]).build();
		
		System.out.println(p);
		
		MyGoods g = MyGoods.builder().memberNo(Integer.parseInt(info[0])).gdCode(Integer.parseInt(info[2]))
				.sbCount(Integer.parseInt(info[3])).sbHall(info[5]).build();
		
		
		//?????? ?????????
		int usedPoint = Integer.parseInt(info[8]);
		//?????? ?????????
		int payPoint = (Integer.parseInt(info[9]))/10;
		//????????? ?????? ?????????
		int mpPoint = serviceMp.selectPoint(Integer.parseInt(info[0]))==null?0:serviceMp.selectPoint(Integer.parseInt(info[0])).getMpPoint();
	
		Point point = Point.builder().mpPrice(usedPoint).mpType("-").memberNo(Integer.parseInt(info[0])).mpHistory("?????? ??? ??????").mpPoint(mpPoint).build();
		
		//?????? ?????? ??????
		int gCount = service.selectgCount(Integer.parseInt(info[2]));
		
		
		//?????? ?????? ??????
		int result = servicePay.goodsPay(p);
		
		int result2 = 0;
		
		if(result > 0) {
			
			//??? ?????? ????????? ??????
			result2 = servicePay.insertMygoods(g);
			
			if(result2 > 0) {
				
				if(usedPoint > 0) {
					
					//????????? ?????? ?????? ??????
					servicePay.insertPoint(point);
					
					Point p1 = serviceMp.selectPoint(Integer.parseInt(info[0]));
					
					//????????? ?????? ??????
					servicePay.minusPoint(p1);
					
				}
				
				//??? ????????? ?????? ??????
				mpPoint = serviceMp.selectPoint(Integer.parseInt(info[0]))==null?0:serviceMp.selectPoint(Integer.parseInt(info[0])).getMpPoint();
				
				//?????? ????????? ?????? ??????
				Point point2 = Point.builder().mpPrice(payPoint).mpType("+").memberNo(Integer.parseInt(info[0])).mpHistory("?????? ?????? ??????").mpPoint(mpPoint).build();
				servicePay.insertPoint(point2);
				
				//?????? ????????? ??????
				Point p2 =  serviceMp.selectPoint(Integer.parseInt(info[0]));
				servicePay.addPoint(p2);
				
				mv.addObject("msg","?????? ????????? ?????????????????????.");
				mv.addObject("info", info);
				mv.addObject("img", service.goodsImg());
				
				Goods goods = service.goodsView(Integer.parseInt(info[2]));
				
				mv.addObject("goods", goods);
				
				service.deleteCart(Integer.parseInt(info[2]));
				
				
				servicePay.updategCount(g);
				
				mv.setViewName("/store/payEnd");
		
				
			}
			return mv;
		}
		
		else {
			mv.addObject("msg","????????? ??????????????? ???????????????. ?????? ??????????????????.");
			mv.addObject("loc","/");
			mv.setViewName("common/msg");
			return mv;
		}
		
	}
	
	
	//?????? ?????????
	@RequestMapping("goodsLowSort.do")
	public ModelAndView goodsLowSort (ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage,
			HttpSession session, HttpServletResponse response) {

		List<Goods> goods = service.goodsLowSort(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//???????????????
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"goodsMain.do" ));
		
		//?????? ?????????
		mv.addObject("goods", goods);
		mv.addObject("img", service.goodsImg()); //????????? ????????????
		
		System.out.println();
		//???????????? ?????? ??????
		if(session.getAttribute("loginMember") == null) {
			
			mv.addObject("total", 0);
			
		} else {
			Member m = (Member) session.getAttribute("loginMember");
			
			mv.addObject("total", service.countCart(m.getMember_No()));
		}
		
		mv.setViewName("/store/goodsMain");
		
		
		return mv;
	}
	
	//?????? ?????????
	@RequestMapping("goodsHighSort.do") 
	public ModelAndView goodsHighSort (ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage,
			HttpSession session, HttpServletResponse response) {

		List<Goods> goods = service.goodsHighSort(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//???????????????
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"goodsMain.do" ));
		
		//?????? ?????????
		mv.addObject("goods", goods);
		mv.addObject("img", service.goodsImg()); //????????? ????????????
		
		
		//???????????? ?????? ??????
		if(session.getAttribute("loginMember") == null) {
			
			mv.addObject("total", 0);
			
		} else {
			Member m = (Member) session.getAttribute("loginMember");
			
			mv.addObject("total", service.countCart(m.getMember_No()));
		}
		
		mv.setViewName("/store/goodsMain");
		
		
		return mv;
	}
	
	//?????? ??????
	@RequestMapping("/tagSearch.do")
	public ModelAndView tagSearch (ModelAndView mv, String gdTag,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage,
			HttpSession session, HttpServletResponse response) {

		List<Goods> goods = service.tagSearch(gdTag, Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//???????????????
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"goodsMain.do" ));
		
		//?????? ?????????
		mv.addObject("goods", goods);
		mv.addObject("img", service.goodsImg()); //????????? ????????????
		
		
		//???????????? ?????? ??????
		if(session.getAttribute("loginMember") == null) {
			
			mv.addObject("total", 0);
			
		} else {
			Member m = (Member) session.getAttribute("loginMember");
			
			mv.addObject("total", service.countCart(m.getMember_No()));
		}
		
		mv.setViewName("/store/goodsMain");
		
		
		return mv;
	}
	
	@RequestMapping("/goodsRefund.do")
	public String goodsRefund() {
		return "/mypage/shoppingList.do";
	}
}
