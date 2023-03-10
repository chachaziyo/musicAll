package com.gdj.music.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminGoodsService;
import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.goods.model.service.GoodsService;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.Schedule;

@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController {
	
	private AdminGoodsService service;
	private GoodsService serviceGoods;

	@Autowired
	public AdminGoodsController(AdminGoodsService service, GoodsService serviceGoods) {
		super();
		this.service = service;
		this.serviceGoods = serviceGoods;
	}
	
	//관리자 굿즈 메인
	@RequestMapping("/adgMain.do")
	public ModelAndView goodsList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {
		
		List<Goods> goods = service.goodsList(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//페이징처리
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"adgMain.do" ));
		
		//굿즈 리스트
		mv.addObject("goods", goods);
		mv.addObject("img", service.goodsImg()); //이미지 가져오기
		mv.setViewName("/admin/store/adminGoodsList");
		
		
		return mv;
	}
	
	
	//굿즈 등록 페이지
	@RequestMapping("/goodsInsert.do")
	public ModelAndView goodsInsert(ModelAndView mv) {
		
		List<Performance2> p = service.perforList();
		
		mv.addObject("perfor", p); //이미지 가져오기
		mv.setViewName("/admin/store/goodsInsert");
		
		return mv;
	}
	
	//굿즈 등록 기능
	@RequestMapping("/insertEnd.do")
	@ResponseBody
	public boolean insertGoodsEnd(HttpSession session, MultipartFile upFile, 
							MultipartFile upFile2,
							Goods goods, HttpServletResponse response) throws Exception {

		//파일 업로드처리하기
		String path=session.getServletContext().getRealPath("/resources/upload/goods/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<GoodsImg> files=new ArrayList();
		
		System.out.println(upFile);
		System.out.println(upFile2);
		System.out.println(goods);
		
		//썸네일 
		//리네임드규칙을 생성하기
		if(!upFile.isEmpty()) {
			String originalFileName=upFile.getOriginalFilename();
			String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
			//중복되지않는 이름 설정하는 값지정하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*10000)+1;
			String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
			//파일 업로드하기
			try {
				upFile.transferTo(new File(path+renameFile));
				files.add(
					GoodsImg.builder()
					.sumImage("ok")
					.imName(renameFile)
					.build());
			}catch(IOException e) {
				e.printStackTrace();
			}
		}			
		//일반사진
		//리네임드규칙을 생성하기
		if(!upFile2.isEmpty()) {
			String originalFileName2=upFile2.getOriginalFilename();
			String ext2=originalFileName2.substring(originalFileName2.lastIndexOf("."));
			//중복되지않는 이름 설정하는 값지정하기
			SimpleDateFormat sdf2=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd2=(int)(Math.random()*10000)+1;
			String renameFile2=sdf2.format(System.currentTimeMillis())+"_"+rnd2+ext2;
			//파일 업로드하기
			try {
				upFile2.transferTo(new File(path+renameFile2));
				files.add(
						GoodsImg.builder()
						.imName(renameFile2)
						.build());
				}catch(IOException e) {
						e.printStackTrace();
				}					
		}
		
		Goods g = Goods.builder()
				.gdName(goods.getGdName())
				.gdPrice(goods.getGdPrice())
				.gdContent(goods.getGdContent())
				.gdCom(goods.getGdCom())
				.gdCount(goods.getGdCount())
				.gdTag(goods.getGdTag())
				.mCode(goods.getMCode())
				.build();
		
	
	
		int result = service.insertGoods(g, files);		
		
		
		return result > 0;
	}
	
	//굿즈 상세 페이지
	@RequestMapping("/adminGoodsView.do")
	public String adminGoodsView(Model m, int gdCode) {
		
		m.addAttribute("goods", serviceGoods.goodsView(gdCode));
		m.addAttribute("img", serviceGoods.goodsViewImg(gdCode));
		
		List<Performance2> p = service.perforList();
		
		m.addAttribute("perfor", p); //이미지 가져오기
		
		
		return "/admin/store/adminGoodsView";
		
	}
	
	//굿즈 수정
	@RequestMapping("/updateGoods.do")
	@ResponseBody
	public int updateGoods(HttpSession session, MultipartFile upFile, int gdCode,
			MultipartFile upFile2,
			Goods goods, HttpServletResponse response) throws Exception {
		
		//파일 업로드처리하기
		String path=session.getServletContext().getRealPath("/resources/upload/goods/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<GoodsImg> files=new ArrayList();
		
		System.out.println(upFile);
		System.out.println(upFile2);
		System.out.println(goods);
		
		//썸네일 
		//리네임드규칙을 생성하기
		if(upFile!=null&&!upFile.isEmpty()) {
			String originalFileName=upFile.getOriginalFilename();
			String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
			//중복되지않는 이름 설정하는 값지정하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*10000)+1;
			String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
			//파일 업로드하기
			try {
				upFile.transferTo(new File(path+renameFile));
				files.add(
					GoodsImg.builder()
					.sumImage("ok")
					.imName(renameFile)
					.gdCode(gdCode)
					.build());
			}catch(IOException e) {
				e.printStackTrace();
			}
		}			
		//일반사진
		//리네임드규칙을 생성하기
		if(upFile2!=null&&!upFile2.isEmpty()) {
			String originalFileName2=upFile2.getOriginalFilename();
			String ext2=originalFileName2.substring(originalFileName2.lastIndexOf("."));
			//중복되지않는 이름 설정하는 값지정하기
			SimpleDateFormat sdf2=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd2=(int)(Math.random()*10000)+1;
			String renameFile2=sdf2.format(System.currentTimeMillis())+"_"+rnd2+ext2;
			//파일 업로드하기
			try {
				upFile2.transferTo(new File(path+renameFile2));
				files.add(
						GoodsImg.builder()
						.imName(renameFile2)
						.gdCode(gdCode)
						.build());
				}catch(IOException e) {
						e.printStackTrace();
				}					
		}
		
		Goods g = Goods.builder()
				.gdCode(gdCode)
				.gdName(goods.getGdName())
				.gdPrice(goods.getGdPrice())
				.gdContent(goods.getGdContent())
				.gdCom(goods.getGdCom())
				.gdCount(goods.getGdCount())
				.gdTag(goods.getGdTag())
				.mCode(goods.getMCode())
				.build();


		int result = service.updateGoods(g, files);
		System.out.println(result);
		
		return result;
	}
	
	//굿즈 삭제
	@RequestMapping("/deleteGoods.do")
	public ModelAndView deleteGoods(ModelAndView mv, int gdCode) {
	  
		int result = service.deleteGoods(gdCode);
		mv.addObject("msg" ,result>0?"삭제가 완료되었습니다.":"실패");
		mv.addObject("loc", "/adminGoods/adgMain.do");
		  
		mv.setViewName("common/msg");
		return mv;
	  
	}
	

}
