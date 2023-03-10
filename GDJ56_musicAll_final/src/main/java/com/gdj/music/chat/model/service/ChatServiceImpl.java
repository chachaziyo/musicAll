package com.gdj.music.chat.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.chat.model.dao.ChatDao;
import com.gdj.music.chat.model.vo.ChatHistory;
import com.gdj.music.chat.model.vo.ChatListVo;
import com.gdj.music.chat.model.vo.ChatMessage;
import com.gdj.music.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {

	private ChatDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public ChatServiceImpl(ChatDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}



	@Override
	public int insertMsg(ChatMessage cmsg) {
		return dao.insertMsg(cmsg, session);
	}



	@Override
	public List<ChatListVo> chatRoom(Member m) {
		return dao.chatRoom(m,session);
	}



	@Override
	public List<ChatHistory> chatHistory(int chatNo) {
		return dao.chatHistory(chatNo, session);
	}



	@Override
	public ChatListVo chatImg(String roomNo) {
		return dao.chatImg(roomNo,session);
	}
	
	
	
	

	
}
