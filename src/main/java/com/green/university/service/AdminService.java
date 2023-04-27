package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import com.green.university.dto.CollTuitFormDto;
import com.green.university.dto.CollegeFormDto;
import com.green.university.dto.DepartmentFormDto;
import com.green.university.dto.NoticeFormDto;
import com.green.university.dto.RoomFormDto;
import com.green.university.dto.SubjectFormDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.CollTuitRepository;
import com.green.university.repository.interfaces.CollegeRepository;
import com.green.university.repository.interfaces.DepartmentRepository;
import com.green.university.repository.interfaces.NoticeRepository;
import com.green.university.repository.interfaces.RoomRepository;
import com.green.university.repository.interfaces.SubjectRepository;
import com.green.university.repository.interfaces.SyllaBusRepository;
import com.green.university.repository.model.CollTuit;
import com.green.university.repository.model.College;
import com.green.university.repository.model.Department;
import com.green.university.repository.model.Room;
import com.green.university.repository.model.Subject;
import com.green.university.utils.SubjectUtil;

/**
 * 
 * @author 박성희
 *
 */

@Service
public class AdminService {
	@Autowired
	private CollegeRepository collegeRepository;
	@Autowired
	private DepartmentRepository departmentRepository;
	@Autowired
	private CollTuitRepository collTuitRepository;
	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private SubjectRepository subjectRepository;
	@Autowired
	private SyllaBusRepository syllaBusRepository;

	/**
	 * 단과대 입력 서비스
	 */
	@Transactional
	public void insertCollege(@Validated CollegeFormDto collegeFormDto) {
		int resultRowCount = collegeRepository.insert(collegeFormDto);
		if (resultRowCount != 1) {
			System.out.println("단과대 입력 서비스 오류");
		}
	}

	/**
	 * 단과대 조회 서비스
	 */
	@Transactional
	public List<College> findCollege() {
		List<College> collegeList = collegeRepository.findAll();
		return collegeList;
	}

	/**
	 * 단과대 삭제 서비스
	 */
	public int deleteCollege(Integer id) {
		int resultRowCount = collegeRepository.delete(id);
		return resultRowCount;
	}

	/**
	 * 학과 입력 서비스
	 */
	@Transactional
	public void insertDepartment(@Validated DepartmentFormDto departmentFormDto) {
		int resultRowCount = departmentRepository.insert(departmentFormDto);
		if (resultRowCount != 1) {
			System.out.println("학과 입력 서비스 오류");
		}
	}

	/**
	 * 학과 조회 서비스
	 */
	public List<Department> findDepartment() {
		List<Department> departmentList = departmentRepository.findAll();
		return departmentList;
	}

	/**
	 * 학과 삭제 서비스
	 */
	public int deleteDepartment(Integer collegeId) {
		int resultRowCount = departmentRepository.delete(collegeId);
		return resultRowCount;
	}

	/**
	 * 학과 수정 서비스
	 */
	public int updateDepartment(DepartmentFormDto departmentFormDto) {
		int resultRowCount = departmentRepository.update(departmentFormDto);
		if (resultRowCount != 1) {
			System.out.println("학과 수정 서비스 오류");
		}
		return resultRowCount;
	}

	/**
	 * 단과대별 등록금 입력 서비스
	 */
	@Transactional
	public void insertCollTuit(@Validated CollTuitFormDto collTuitFormDto) {
		int resultRowCount = collTuitRepository.insert(collTuitFormDto);
		if (resultRowCount != 1) {
			System.out.println("단과대 등록금 입력 서비스 오류");
		}
	}

	/**
	 * 단과대 등록금 조회 서비스
	 */
	public List<CollTuit> findCollTuit() {
		List<CollTuit> collTuitList = collTuitRepository.findAll();
		return collTuitList;
	}

	/**
	 * 단과대 등록금 삭제 서비스
	 */
	public int deleteCollTuit(Integer collegeId) {
		int resultRowCount = collTuitRepository.delete(collegeId);
		return resultRowCount;
	}

	/**
	 * 단과대 등록금 수정 서비스
	 */
	public int updateCollTuit(CollTuitFormDto collTuitFormDto) {
		int resultRowCount = collTuitRepository.update(collTuitFormDto);
		if (resultRowCount != 1) {
			System.out.println("단과대 등록금 수정 서비스 오류");
		}
		return resultRowCount;
	}

	/**
	 * 강의실 입력 서비스
	 */
	@Transactional
	public void insertRoom(@Validated RoomFormDto roomFormDto) {
		int resultRowCount = roomRepository.insert(roomFormDto);
		if (resultRowCount != 1) {
			System.out.println("강의실 입력 서비스 오류");
		}
	}

	/**
	 * 강의실 조회 서비스
	 */
	public List<Room> findRoom() {
		List<Room> roomList = roomRepository.findAll();
		return roomList;
	}

	/**
	 * 강의실 삭제 서비스
	 */
	public int deleteRoom(String id) {
		int resultRowCount = roomRepository.delete(id);
		return resultRowCount;
	}

	/**
	 * 강의 입력 서비스
	 */
	@Transactional
	public List<Subject> insertSubject(@Validated SubjectFormDto subjectFormDto) {
		// 강의실, 강의시간 중복 검사
		List<Subject> subjectList = subjectRepository.selectByRoomIdAndSubDayAndSubYearAndSemester(subjectFormDto);
		if (subjectList != null) {
			SubjectUtil subjectUtil = new SubjectUtil();
			boolean result = subjectUtil.calculate(subjectFormDto, subjectList);
			if (result == false) {
				throw new CustomRestfullException("해당 시간대는 강의실을 사용중입니다! 다시 선택해주세요", HttpStatus.BAD_REQUEST);
			}
		}
		subjectRepository.insert(subjectFormDto);
		
		// 강의계획서에 강의 ID 저장
		Integer subjectId = subjectRepository.selectIdOrderById(subjectFormDto);
		syllaBusRepository.insertOnlySubId(subjectId);
		return subjectList;
	}

	/**
	 * 강의 조회 서비스
	 */
	public List<Subject> findSubject() {
		List<Subject> subjectList = subjectRepository.findAll();
		return subjectList;
	}

	/**
	 * 강의 중복 강의실,요일 조회 서비스
	 */
	public List<Subject> selectSubjectByRoomIdAndSubDay(@Validated SubjectFormDto subjectFormDto) {
		// 강의실, 강의시간 중복 검사
		List<Subject> subjectList = subjectRepository.selectByRoomIdAndSubDayAndSubYearAndSemester(subjectFormDto);
		if (subjectList != null) {
			SubjectUtil subjectUtil = new SubjectUtil();
			boolean result = subjectUtil.calculate(subjectFormDto, subjectList);
			if (result == false) {
				throw new CustomRestfullException("해당 시간대는 강의실을 사용중입니다! 다시 선택해주세요", HttpStatus.BAD_REQUEST);
			}
		}
		return subjectList;
	}

	/**
	 * 강의 삭제 서비스
	 */
	public int deleteSubject(Integer id) {
		int resultRowCount = subjectRepository.delete(id);
		return resultRowCount;
	}

	/**
	 * 강의 수정 서비스
	 */
	public int updateSubject(SubjectFormDto subjectFormDto) {
		int resultRowCount = subjectRepository.update(subjectFormDto);
		if (resultRowCount != 1) {
			System.out.println("강의 수정 서비스 오류");
		}
		return resultRowCount;
	}

}
