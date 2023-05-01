package com.green.university.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.green.university.utils.TimestampUtil;

import lombok.Data;
/**
 * 
 * @author 박성희
 *
 */
@Data
public class NoticeFormDto {
	private Integer id;
	private Integer noticeId;
	private String category;
	@NotEmpty
	@Size(max = 50)
	private String title;
	@NotEmpty
	private String content;
	private Timestamp createdTime;
	private MultipartFile file;	
	private String originFilename;
	private String uuidFilename;
	
	// 검색
	private String keyword;
	
	// 공지 시간 처리
	public String timeFormat() {
		TimestampUtil timestampUtil = new TimestampUtil();
		return timestampUtil.dateTimeToString(createdTime);
	}
	
}
