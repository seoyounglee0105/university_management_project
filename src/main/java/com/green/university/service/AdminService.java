package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.green.university.repository.model.Department;
import com.green.university.repository.model.Notice;
import com.green.university.repository.model.Room;
import com.green.university.repository.model.Subject;

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
	public void insertCollege(CollegeFormDto collegeFormDto) {
		int resultRowCount = collegeRepository.insert(collegeFormDto);
		if (resultRowCount != 1) {
			System.out.println("단과대 입력 서비스 오류");
		}
	}

	/**
	 * 단과대 조회 서비스
	 */
	public List<College> findCollege() {
		List<College> collegeList = collegeRepository.findAll();
		return collegeList;
	}

	/**
	 * 학과 입력 서비스
	 */
	public void insertDepartment(DepartmentFormDto departmentFormDto) {
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
	 * 단과대별 등록금 입력 서비스
	 */
	public void insertCollTuit(CollTuitFormDto collTuitFormDto) {
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
	 * 강의실 입력 서비스
	 */
	public void insertRoom(RoomFormDto roomFormDto) {
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
	 * 강의 입력 서비스
	 */
	public void insertSubject(SubjectFormDto subjectFormDto) {
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
	 * 공지 입력 서비스
	 */
	public void insertNotice(NoticeFormDto noticeFormDto) {
		int resultRowCount = noticeRepository.insert(noticeFormDto);
		if (resultRowCount != 1) {
			System.out.println("공지 입력 서비스 오류");
		}
	}
}
