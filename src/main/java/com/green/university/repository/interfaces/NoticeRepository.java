package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.NoticeFormDto;
import com.green.university.dto.NoticePageFormDto;
import com.green.university.repository.model.Notice;

/*
 *  박성희
 *  공지 repository
 */

@Mapper
public interface NoticeRepository {
	public int insert(NoticeFormDto noticeFormDto);
	public List<Notice> selectByNoticeDto(NoticePageFormDto noticePageFormDto);
	public Notice selectById(Integer id);
	public int updateByNoticeDto(NoticeFormDto noticeFormDto);
	public int deleteById(Integer id);
	
	// 파일
	public int insertFile(NoticeFormDto noticeFormDto);
	public int selectLimit(NoticeFormDto noticeFormDto);
	
	// 페이징
	public List<Notice> selectByNoticeDtoOrderBy();
	public Integer selectNoticeCount(NoticePageFormDto noticePageFormDto);
	
	// 검색
	public List<Notice> selectNoticeByKeyword(String keyword);
}
