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
	
	// 학사일정 조회 (디테일)
	public Schedule readScheduleById(Integer id) {
		Schedule schedule = scheuleRepository.selectScheduleById(id);
		return schedule;
	}
	
	// 학사일정 추가
	@Transactional
	public void createSchedule(Integer staffId, ScheduleFormDto dto) {
		Schedule schedule = new Schedule();
		schedule.setStaffId(staffId);
		schedule.setTitle(dto.getTitle());
		schedule.setStartDay(dto.getStartDay());
		schedule.setEndDay(dto.getEndDay());
		schedule.setContent(dto.getContent());
		
		int resultRowCount = scheuleRepository.insertSchoeduleFormDto(schedule);
	}
	
	// 학사일정 업데이트
	@Transactional
	public int updateSchedule(Integer staffId, String title, String content) {
		ScheduleFormDto scheduleFormDto = new ScheduleFormDto();
		scheduleFormDto.setId(staffId);
		scheduleFormDto.setTitle(title);
		scheduleFormDto.setContent(content);
		
		int resultRowCount = scheuleRepository.updateSchoeduleFormDtoBycontent(scheduleFormDto);
		 
		return resultRowCount;
	}
	
	//학사일정 삭제
	
	@Transactional
	public int deleteSchedule(Integer id) {
		
		int resultRowCount = scheuleRepository.deleteSchoeduleFormDtoByStaffIdAndId(id);
		
		return resultRowCount;
	}
	
	// 학사일정 월에 있는 일정 조회
	
	@Transactional
	public List<ScheduleDto> readScheduleDto(){
		
		List<ScheduleDto> scheduleDto = scheuleRepository.selectSchoduleMouth();
		return scheduleDto;
	}
}
