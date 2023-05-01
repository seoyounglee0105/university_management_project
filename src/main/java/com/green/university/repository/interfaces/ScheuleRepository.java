package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.university.dto.ScheduleDto;
import com.green.university.dto.ScheduleFormDto;
import com.green.university.repository.model.Schedule;

@Mapper
public interface ScheuleRepository {
	
public int insertSchoeduleFormDto(Schedule schedule);
public ScheduleFormDto updateSchoeduleFormDtoByStaffId(Integer staffId);
public ScheduleFormDto deleteSchoeduleFormDtoByStaffIdAndId(Integer id);
public List<Schedule> selectSchodule();
public List<ScheduleDto> selectSchoduleMouth();
}
