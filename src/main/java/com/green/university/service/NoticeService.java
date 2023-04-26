package com.green.university.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import com.green.university.dto.NoticeFormDto;
import com.green.university.repository.interfaces.NoticeRepository;

/**
 * 
 * @author 박성희 notice 관련 서비스
 *
 */

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;

	/**
	 * 공지 입력 서비스
	 */
	public void insertNotice(@Validated NoticeFormDto noticeFormDto) {
		int resultRowCount = noticeRepository.insert(noticeFormDto);
		if (resultRowCount != 1) {
			System.out.println("공지 입력 서비스 오류");
		}
	}
}
