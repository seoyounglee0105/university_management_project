package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.SubjectFormDto;

/*
 *  박성희
 *  강의 repository
 */

@Mapper
public interface SubjectRepository {
	public int insert(SubjectFormDto subjectFormDto);
}
