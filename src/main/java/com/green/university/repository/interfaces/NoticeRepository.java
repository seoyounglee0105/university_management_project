package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.NoticeFormDto;

/*
 *  박성희
 *  공지 repository
 */

@Mapper
public interface NoticeRepository {
	public int insert(NoticeFormDto noticeFormDto);
}
