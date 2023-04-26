package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.NoticeFormDto;
import com.green.university.repository.model.Notice;

/*
 *  박성희
 *  공지 repository
 */

@Mapper
public interface NoticeRepository {
	public int insert(NoticeFormDto noticeFormDto);
	public List<Notice> findAll();
	public Notice findById(Integer id);
	public int update(NoticeFormDto noticeFormDto);
	public int delete(Integer id);
}
