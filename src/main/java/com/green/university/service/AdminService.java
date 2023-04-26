package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
<<<<<<< HEAD
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestParam;
=======
import org.springframework.transaction.annotation.Transactional;
>>>>>>> feature/professor

import com.green.university.dto.CollTuitFormDto;
import com.green.university.dto.CollegeFormDto;
import com.green.university.dto.DepartmentFormDto;
import com.green.university.dto.NoticeFormDto;
import com.green.university.dto.RoomFormDto;
import com.green.university.dto.SubjectFormDto;
import com.green.university.repository.interfaces.CollTuitRepository;
import com.green.university.repository.interfaces.CollegeRepository;
import com.green.university.repository.interfaces.DepartmentRepository;
import com.green.university.repository.interfaces.NoticeRepository;
import com.green.university.repository.interfaces.RoomRepository;
import com.green.university.repository.interfaces.SubjectRepository;
import com.green.university.repository.model.CollTuit;
import com.green.university.repository.model.College;
<<<<<<< HEAD
import com.green.university.repository.model.Department;
import com.green.university.repository.model.Notice;
import com.green.university.repository.model.Room;
import com.green.university.repository.model.Subject;
=======
>>>>>>> feature/professor

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
	private NoticeRepository noticeRepository;

	/**
	 * 단과대 입력 서비스
	 */
<<<<<<< HEAD
	public void insertCollege(@Validated CollegeFormDto collegeFormDto) {
=======
	@Transactional
	public void insertCollege(CollegeFormDto collegeFormDto) {
>>>>>>> feature/professor
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
<<<<<<< HEAD
	public void insertDepartment(@Validated DepartmentFormDto departmentFormDto) {
=======
	@Transactional
	public void insertDepartment(DepartmentFormDto departmentFormDto) {
		System.out.println(departmentFormDto);
		int collegeId = collegeRepository.findByName(departmentFormDto.getCollegeName());
		departmentFormDto.setCollegeId(collegeId);
>>>>>>> feature/professor
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
<<<<<<< HEAD
	public void insertCollTuit(@Validated CollTuitFormDto collTuitFormDto) {
=======
	@Transactional
	public void insertCollTuit(CollTuitFormDto collTuitFormDto) {
>>>>>>> feature/professor
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
<<<<<<< HEAD
	public void insertRoom(@Validated RoomFormDto roomFormDto) {
=======
	@Transactional
	public void insertRoom(RoomFormDto roomFormDto) {
>>>>>>> feature/professor
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
<<<<<<< HEAD
	public void insertSubject(@Validated SubjectFormDto subjectFormDto) {
=======
	@Transactional
	public void insertSubject(SubjectFormDto subjectFormDto) {
>>>>>>> feature/professor
		int resultRowCount = subjectRepository.insert(subjectFormDto);
		if (resultRowCount != 1) {
			System.out.println("강의 입력 서비스 오류");
		}
	}

	/**
	 * 강의 조회 서비스
	 */
	public List<Subject> findSubject() {
		List<Subject> subjectList = subjectRepository.findAll();
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

	/**
	 * 공지 입력 서비스
	 */
<<<<<<< HEAD
	public void insertNotice(@Validated NoticeFormDto noticeFormDto) {
=======
	@Transactional
	public void insertNotice(NoticeFormDto noticeFormDto) {
>>>>>>> feature/professor
		int resultRowCount = noticeRepository.insert(noticeFormDto);
		if (resultRowCount != 1) {
			System.out.println("공지 입력 서비스 오류");
		}
	}
}
