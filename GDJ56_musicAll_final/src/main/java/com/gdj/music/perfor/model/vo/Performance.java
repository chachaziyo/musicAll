package com.gdj.music.perfor.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Performance {
	private int mCode;
	private String mTitle;//공연제목
	private int mAge;//공연관람연령
	//private int vipPrice;//vip석가격
	//private int rPrice;//r석가격
	//private int sPrice;//s석가격
	private int mPrice;
	private String mType;//공연타입
	private Date mPeriod;//시작날짜
	private Date mPeriodEnd;//종료날짜
	

	
}