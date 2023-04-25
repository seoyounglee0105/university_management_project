package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.SubjectFormDto;
import com.green.university.repository.model.Department;
import com.green.university.repository.model.Subject;

/*
 *  박성희
 *  강의 repository
 */

@Mapper
public interface SubjectRepository {
	public Integer insert(SubjectFormDto subjectFormDto);
	public List<Subject> findAll();
	public int delete(Integer id);
}
