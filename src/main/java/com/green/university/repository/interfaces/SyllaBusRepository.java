package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author 박성희
 */
@Mapper
public interface SyllaBusRepository {

	// 강의 등록 시, 강의 ID만 미리 저장
	public int insertOnlySubId(Integer subjectId);
	
	// 강의 삭제 시, 해당 강의 ID의 계획서 삭제
	public int delete(Integer subjectId);

}
