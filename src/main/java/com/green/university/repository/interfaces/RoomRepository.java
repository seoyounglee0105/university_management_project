package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.RoomFormDto;

/*
 *  박성희
 *  강의실 repository
 */

@Mapper
public interface RoomRepository {
	public int insert(RoomFormDto roomFormDto);
}
