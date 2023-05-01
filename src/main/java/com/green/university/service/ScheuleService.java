package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.ScheduleDto;
import com.green.university.dto.ScheduleFormDto;
import com.green.university.repository.interfaces.ScheuleRepository;
import com.green.university.repository.model.Schedule;


@Service
public class ScheuleService {

	@Autowired
	private ScheuleRepository scheuleRepository;
	
	
	// 학사일정 조회
	public List<Schedule> readSchedule() {
		List<Schedule> schedule = scheuleRepository.selectSchodule();
		return schedule;
	}
	// 학사일정 추가
	@Transactional
	public ScheduleFormDto createSchedule(ScheduleFormDto dto) {
		
		ScheduleFormDto schedule = scheuleRepository.insertSchoeduleFormDto(dto);
		
		return schedule;
	}
	
	// 학사일정 업데이트
	@Transactional
	public ScheduleFormDto updateSchedule(Integer staffId) {
		
		ScheduleFormDto schedule = scheuleRepository.updateSchoeduleFormDtoByStaffId(staffId);
		return schedule;
	}
	
	//학사일정 삭제
	@Transactional
	public ScheduleFormDto deleteSchedule(Integer id) {
		
		ScheduleFormDto schedule = scheuleRepository.deleteSchoeduleFormDtoByStaffIdAndId(id);
		return schedule;
	}
	
	// 학사일정 월에 있는 일정 조회
	
	@Transactional
	public List<ScheduleDto> readScheduleDto(){
		
		List<ScheduleDto> scheduleDto = scheuleRepository.selectSchoduleMouth();
		return scheduleDto;
	}
}
