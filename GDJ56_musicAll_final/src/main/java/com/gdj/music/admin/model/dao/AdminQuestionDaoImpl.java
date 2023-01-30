package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.question.model.vo.Question;

@Repository
public class AdminQuestionDaoImpl implements AdminQuestionDao {

	@Override
	public int totalData(SqlSessionTemplate session) {
		return session.selectOne("adminQ.totalData"); 
	}

	@Override
	public List<Question> questionList(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("adminQ.questionList",null,new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}

	
	
	
}