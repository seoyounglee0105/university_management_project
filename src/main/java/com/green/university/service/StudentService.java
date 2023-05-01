package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.university.dto.StudentListForm;
import com.green.university.repository.interfaces.StudentRepository;
import com.green.university.repository.model.Student;

@Service
public class StudentService {
	
	@Autowired
	private StudentRepository studentRepository;
	
	public List<Student> readStudentList(StudentListForm studentListForm){
		
		List<Student> list = null;
		
		if(studentListForm.getStudentId() != null) {
			list = studentRepository.selectByStudentId(studentListForm);
		} else if (studentListForm.getDeptId() != null) {
			list = studentRepository.selectByDepartmentId(studentListForm);
		} else {
			list = studentRepository.selectStudentList(studentListForm);
		}
		
		return list;
	}
	
	public Integer readStudentAmount(StudentListForm studentListForm) {
		
		Integer amount = null;
		if (studentListForm.getDeptId() != null) {
			amount = studentRepository.selectStudentAmountByDeptId(studentListForm.getDeptId());
		} else {
			amount = studentRepository.selectStudentAmount();
		}
		
		return amount;
	}

}
