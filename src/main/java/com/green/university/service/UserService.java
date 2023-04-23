package com.green.university.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.CreateProfessorDto;
import com.green.university.dto.CreateStaffDto;
import com.green.university.dto.CreateStudentDto;
import com.green.university.repository.interfaces.ProfessorRepository;
import com.green.university.repository.interfaces.StaffRepository;
import com.green.university.repository.interfaces.StudentRepository;
import com.green.university.repository.model.User;

/**
 * 유저 서비스
 * @author 김지현
 */
@Service
public class UserService {
	
	@Autowired
	private StaffRepository staffRepository;
	@Autowired
	private ProfessorRepository professorRepository;
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	/**
	 * staff 생성 서비스로
	 * 먼저 staff_tb에 insert한 후 staff_tb에 생긴 id를 끌고와
	 * user_tb에 생성함 
	 * @param createStaffDto
	 */
	@Transactional
	public void createStaffToStaffAndUser(CreateStaffDto createStaffDto) {
		
		int resultCountRow = staffRepository.insertToStaff(createStaffDto);
		if(resultCountRow != 1) {
			// 던지기
		}
		Integer staffId = staffRepository.selectIdByCreateStaffDto(createStaffDto);
		User user = new User();
		
		user.setId(staffId);
		user.setPassword(passwordEncoder.encode(staffId + ""));
		user.setUserRole("staff");
		
		resultCountRow = staffRepository.insertToUser(user);
		if(resultCountRow != 1) {
			//던지기
		}
		
	}
	
	/**
	 * professor 생성 서비스
	 * 먼저 professor_tb에 insert한 후 professor_tb에 생긴 id를 끌고와
	 * user_tb에 생성함 
	 * @param createStaffDto
	 */
	@Transactional
	public void createProfessorToProfessorAndUser(CreateProfessorDto createProfessorDto) {
		
		int resultCountRow = professorRepository.insertToProfessor(createProfessorDto);
		
		if(resultCountRow != 1) {
			// 던지기
		}
		Integer professorId = professorRepository.selectIdByCreateProfessorDto(createProfessorDto);
		
		User user = new User();
		user.setId(professorId);
		user.setPassword(passwordEncoder.encode(professorId + ""));
		user.setUserRole("professor");
		
		resultCountRow = professorRepository.insertToUser(user);
		if(resultCountRow != 1) {
			//던지기
		}
		
	}
	
	/**
	 * professor 생성 서비스
	 * 먼저 professor_tb에 insert한 후 professor_tb에 생긴 id를 끌고와
	 * user_tb에 생성함 
	 * @param createStaffDto
	 */
	@Transactional
	public void createStudentToStudentAndUser(CreateStudentDto createStudentDto) {
		int resultCountRow = studentRepository.insertToStudent(createStudentDto);
		
		if(resultCountRow != 1) {
			// 던지기
		}
		Integer studentId = studentRepository.selectIdByCreateStudentDto(createStudentDto);
		
		User user = new User();
		user.setId(studentId);
		user.setPassword(passwordEncoder.encode(studentId + ""));
		user.setUserRole("student");
		
		resultCountRow = studentRepository.insertToUser(user);
		if(resultCountRow != 1) {
			//던지기
		}
		
	}

	

}
