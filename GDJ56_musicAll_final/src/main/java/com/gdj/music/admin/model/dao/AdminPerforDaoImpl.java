package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;

@Repository
public class AdminPerforDaoImpl implements AdminPerforDao {
	
	@Override
	public int insertPerformance(SqlSessionTemplate session,Performance2 p) {
		return session.insert("musical.insertPerformance",p);
	}
	@Override
	public int insertSchedule(SqlSessionTemplate session, Schedule s) {
		return session.insert("p_schedule.insertSchedule",s);
	}
	@Override
	public int insertHall(SqlSessionTemplate session,String perPlace ) {
		return session.insert("hall.insertHall",perPlace);
	}

	@Override
	public int insertPhoto(SqlSessionTemplate session, PerformancePhoto pp) {
		return session.insert("img.insertPhoto",pp);
	}
	@Override
	public List<Map<String, PerformancePhoto>> selectPerforList(SqlSessionTemplate session) {
		return session.selectList("img.selectPerforList");
	}
	@Override
	public Performance2 selectPerformanceView(SqlSessionTemplate session,int mCode) {
		return session.selectOne("musical.selectPerformanceView",mCode);
	}
	@Override
	public List<PerformancePhoto> selectPhoto(SqlSessionTemplate session,int mCode) {
		return session.selectList("img.selectPhoto",mCode);
	}
	@Override
	public List<Map<String, Schedule>> selectSchedule(SqlSessionTemplate session,int mCode) {
		return session.selectList("p_schedule.selectSchedule",mCode);
	}
	@Override
	public int deletePerformance(SqlSessionTemplate session, int mCode) {
		return session.delete("musical.deletePerformance",mCode);
	}
	@Override
	public List<Schedule> selectSchedule2(SqlSessionTemplate session, int mCode) {
		return session.selectList("p_schedule.selectSchedule2",mCode);
	}
	@Override
	public int updatePerformance(SqlSessionTemplate session,Performance2 p) {
		return session.update("musical.updatePerformance",p);
	}
	@Override
	public int updatePhoto(SqlSessionTemplate session, PerformancePhoto photo2) {
		return session.insert("img.updatePhoto",photo2);
	}
	@Override
	public int updateSchedule(SqlSessionTemplate session, Schedule sch2) {
		return session.insert("p_schedule.updateSchedule",sch2);
	}
	@Override
	public int deletePhoto(SqlSessionTemplate session, int mCode) {
		return session.delete("img.deletePhoto",mCode);
	}
	@Override
	public int deleteSchedule(SqlSessionTemplate session, int mCode) {
		return session.delete("p_schedule.deleteSchedule",mCode);
	}
	@Override
	public List<Map<String, Review>> selectComment(SqlSessionTemplate session, int mCode) {
		return session.selectList("review.selectComment",mCode);
	}
	@Override
	public int selectAverage(SqlSessionTemplate session, int mCode) {
		return session.selectOne("review.selectAverage",mCode);
	}
	@Override
	public int deleteComment(SqlSessionTemplate session, int reviewNo) {
		return session.delete("review.deleteComment",reviewNo);
	}
	@Override
	public List<Map<String, PerformancePhoto>> orderbyRecent(SqlSessionTemplate session) {
		return session.selectList("img.orderbyRecent");
	}
	@Override
	public List<Map<String, PerformancePhoto>> orderbyEnd(SqlSessionTemplate session) {
		return session.selectList("img.orderbyEnd");
	}
	@Override
	public List<Map<String, PerformancePhoto>> searchForType(SqlSessionTemplate session, String mType1) {
		return session.selectList("img.searchForType",mType1);
	}
	@Override
	public List<Map<String, PerformancePhoto>> searchForTitle(SqlSessionTemplate session, Map<String, Object> map) {
		return session.selectList("img.searchForTitle",map);
	}
	@Override
	public List<Map<String, PerformancePhoto>> orderbyBest(SqlSessionTemplate session) {
		return session.selectList("img.orderbyBest");
	}
}
