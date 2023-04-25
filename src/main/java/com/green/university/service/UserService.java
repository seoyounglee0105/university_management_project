package com.green.university.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.ChangePasswordDto;
import com.green.university.dto.CreateProfessorDto;
import com.green.university.dto.CreateStaffDto;
import com.green.university.dto.CreateStudentDto;
import com.green.university.dto.LoginDto;
import com.green.university.dto.UserUpdateDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.dto.response.UserInfoForUpdateDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.ProfessorRepository;
import com.green.university.repository.interfaces.StaffRepository;
import com.green.university.repository.interfaces.StudentRepository;
import com.green.university.repository.interfaces.UserRepository;
import com.green.university.repository.model.User;
import com.green.university.utils.Define;

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
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private StuStatService stuStatService;
	
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
			throw new CustomRestfullException(Define.CREATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		Integer staffId = staffRepository.selectIdByCreateStaffDto(createStaffDto);
		User user = new User();
		
		user.setId(staffId);
		// user.setPassword(passwordEncoder.encode(staffId + ""));
		user.setPassword(staffId + ""); // 삭제 예정
		user.setUserRole("staff");
		
		resultCountRow = userRepository.insertToUser(user);
		if(resultCountRow != 1) {
			throw new CustomRestfullException(Define.CREATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
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
			throw new CustomRestfullException(Define.CREATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		Integer professorId = professorRepository.selectIdByCreateProfessorDto(createProfessorDto);
		
		User user = new User();
		user.setId(professorId);
		// user.setPassword(passwordEncoder.encode(professorId + ""));
		user.setPassword(professorId + ""); // 삭제 예정
		user.setUserRole("professor");
		
		resultCountRow = userRepository.insertToUser(user);
		if(resultCountRow != 1) {
			throw new CustomRestfullException(Define.CREATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
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
			throw new CustomRestfullException(Define.CREATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		Integer studentId = studentRepository.selectIdByCreateStudentDto(createStudentDto);
		
		// 학적 상태 생성 (재학)
		stuStatService.createFirstStatus(studentId);
		
		User user = new User();
		user.setId(studentId);
		//user.setPassword(passwordEncoder.encode(studentId + ""));
		user.setPassword(studentId + ""); // 삭제 예정
		user.setUserRole("student");
		
		resultCountRow = userRepository.insertToUser(user);
		if(resultCountRow != 1) {
			throw new CustomRestfullException(Define.CREATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	@Transactional
	public PrincipalDto login(LoginDto loginDto) {
		PrincipalDto userEntity = userRepository.selectById(loginDto.getId());
		
		if(userEntity == null) {
			throw new CustomRestfullException(Define.NOT_FOUND_ID , HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
//		if(!passwordEncoder.matches(loginDto.getPassword(), userEntity.getPassword())) {
//			throw new CustomRestfullException(Define.WRONG_PASSWORD , HttpStatus.BAD_REQUEST);
//		}
		
		if(!loginDto.getPassword().equals(userEntity.getPassword())) {
			throw new CustomRestfullException(Define.WRONG_PASSWORD , HttpStatus.BAD_REQUEST);
		}
		
		
		
		return userEntity;
	}
	
	/**
	 * 학생 수정 대상 정보 불러오기
	 * @param userId
	 * @return 수정 대상 정보
	 */
	public UserInfoForUpdateDto readStudentInfo(Integer userId) {
		
		UserInfoForUpdateDto userInfoForUpdateDto = studentRepository.selectByUserId(userId);
		
		return userInfoForUpdateDto;
	}
	/**
	 * 직원 수정 대상 정보 불러오기
	 * @param userId
	 * @return 수정 대상 정보
	 */
	public UserInfoForUpdateDto readStaffInfo(Integer userId) {
		
		UserInfoForUpdateDto userInfoForUpdateDto = staffRepository.selectByUserId(userId);
		
		return userInfoForUpdateDto;
	}
	/**
	 * 교수 수정 대상 정보 불러오기
	 * @param userId
	 * @return 수정 대상 정보
	 */
	public UserInfoForUpdateDto readProfessorInfo(Integer userId) {
		
		UserInfoForUpdateDto userInfoForUpdateDto = professorRepository.selectByUserId(userId);
		
		return userInfoForUpdateDto;
	}
	
	/**
	 * 학생 정보 수정
	 * @param updateDto
	 */
	@Transactional
	public void updateStudent(UserUpdateDto updateDto) {
		
		int resultCountRaw = studentRepository.updateStudent(updateDto);
		if(resultCountRaw != 1) {
			throw new CustomRestfullException(Define.UPDATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	/**
	 * 직원 정보 수정
	 * @param updateDto
	 */
	@Transactional
	public void updateStaff(UserUpdateDto updateDto) {
		
		int resultCountRaw = staffRepository.updateStaff(updateDto);
		if(resultCountRaw != 1) {
			throw new CustomRestfullException(Define.UPDATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	/**
	 * 교수 정보 수정
	 * @param updateDto
	 */
	@Transactional
	public void updateProfessor(UserUpdateDto updateDto) {
		
		int resultCountRaw = professorRepository.updateProfessor(updateDto);
		if(resultCountRaw != 1) {
			throw new CustomRestfullException(Define.UPDATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	@Transactional
	public void updatePassword(ChangePasswordDto changePasswordDto) {
		int resultCountRaw = userRepository.updatePassword(changePasswordDto);
		if(resultCountRaw != 1) {
			throw new CustomRestfullException(Define.UPDATE_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	

}
