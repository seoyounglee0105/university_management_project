package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.CollTuitFormDto;

/*
 *  박성희
 *  단과대별 등록금 repository
 */

@Mapper
public interface CollTuitRepository {
	public int insert(CollTuitFormDto collTuitFormDto);
}
