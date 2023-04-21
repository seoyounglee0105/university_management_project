package com.green.university.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

// Timestamp 타입 관련 유틸
public class TimestampUtil {

	/**
	 * @author 서영
	 * Timestamp 타입을 날짜 + 시간으로 변환함
	 */
	public static String dateTimeToString(Timestamp timestamp) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(timestamp);
	}
	
}
