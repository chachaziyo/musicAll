package com.gdj.music.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;

public interface MypageDao {
	List<Point> selectPointListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//포인트리스트 출력
	Point selectPoint(SqlSessionTemplate session,int member_No);//남은포인트 출력
	int selectPointCount(SqlSessionTemplate session,int member_No);//페이징처리
	
	List<Question> selectQsListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//1대1문의내역
	int selectQsCount(SqlSessionTemplate session,int member_No);//1대1문의 페이징처리
	
	List<Map<String,Goods>> selectSpListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//굿즈쇼핑내역
	int selectSpCount(SqlSessionTemplate session,int member_No);//굿즈쇼핑 페이징처리
}
