package com.gdj.music.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;

public interface MypageDao {
	
	Member checkPwd(SqlSessionTemplate session,Member m);//비번체크
	Member updateMember(SqlSessionTemplate session,int member_No);//회원정보수정 위한 데이터확인
	
	int updateMemberEnd(SqlSessionTemplate session,Member m);//회원정보수정
	
	List<Map<String,Object>> selectReservationList(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//예매정보 확인
	int selectReservationCount(SqlSessionTemplate session,int member_No);//예매정보 페이징처리
	
	Map<String, Reservation> selectRvView(SqlSessionTemplate session,Map<String,Integer> r);//예매세부내역상단
	Map<String, Reservation> selectRsview(SqlSessionTemplate session,Map<String,Integer> r);//예매세부내역하단
	
	Map<String,Goods> selectGoodsView(SqlSessionTemplate session,Map<String,Integer>r);//굿즈세부내역
	
	Map<String,Object> selectGoods(SqlSessionTemplate session,Map<String,Integer> r);//굿즈 환불정보 가져오기
	int updateSbcount(SqlSessionTemplate session,Map<String,Integer> r);//굿즈 수량 원상복구
	
	Pay getPcode(SqlSessionTemplate session,String imp_uid);//주문번호로 pay에서 pCode가져오기
	
	Map<String,Object> selectSeat(SqlSessionTemplate session,Pay pay);// pCode로 r_seat,r_date,r_time 가져오기
	int deleteSeat(SqlSessionTemplate session,Map<String,Object> seat);//좌석삭제하기
	int insertRefund(SqlSessionTemplate session,Pay pay);//pCode로 환불기록 넣기
	
	List<Point> selectPointListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//포인트리스트 출력
	Point selectPoint(SqlSessionTemplate session,int member_No);//남은포인트 출력
	int selectPointCount(SqlSessionTemplate session,int member_No);//페이징처리
	
	
	List<Map<String,Mlike>> selectMlikeList(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//관심공연 리스트출력
	int selectMlikeCount(SqlSessionTemplate session,int member_No);//관심공연 페이징처리
	
	
	int deleteMlike(SqlSessionTemplate session,Map<String,Mlike> ml);//관심공연 삭제
	
	
	List<Question> selectQsListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//1대1문의내역
	int selectQsCount(SqlSessionTemplate session,int member_No);//1대1문의 페이징처리
	
	List<Question> searchQs(SqlSessionTemplate session,Map<String,Integer> search,Map<String,Integer> param);//1대1문의 검색
	int searchQsCount(SqlSessionTemplate session,Map<String,Integer> param);//1대1문의 검색결과 페이징처리
	
	
	List<Map<String,Review>> selectRvListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//한줄평내역
	int selectRvCount(SqlSessionTemplate session,int member_No);//한줄평 페이징처리
	
	List<Map<String,Review>> orderReview(SqlSessionTemplate session,Map<String,Integer> order,Map<String,Integer> param);//한줄평 정렬
	int orderReviewCount(SqlSessionTemplate session,Map<String,Integer> order);//한줄평 정렬 페이징처리
	
	
	List<Map<String,Goods>> selectSpListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//굿즈쇼핑내역
	int selectSpCount(SqlSessionTemplate session,int member_No);//굿즈쇼핑 페이징처리
	
}
