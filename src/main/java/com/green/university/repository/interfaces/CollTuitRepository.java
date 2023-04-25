package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.CollTuitFormDto;
import com.green.university.repository.model.CollTuit;
import com.green.university.repository.model.College;

/*
 *  박성희
 *  단과대별 등록금 repository
 */

@Mapper
public interface CollTuitRepository {
	public int insert(CollTuitFormDto collTuitFormDto);
	public List<CollTuit> findAll();
	public int delete(Integer collegeId);
	public int update(CollTuitFormDto collTuitFormDto);
}
