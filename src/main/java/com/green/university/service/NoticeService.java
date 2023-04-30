package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import com.green.university.dto.NoticeFormDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.NoticeRepository;
import com.green.university.repository.model.Notice;

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
		int noticeId = noticeRepository.selectLimit(noticeFormDto);
		noticeFormDto.setNoticeId(noticeId);
		if(noticeFormDto.getOriginFilename() != null) {
			noticeRepository.insertFile(noticeFormDto);
		}
	}
	
	/**
	 * 공지 조회 서비스
	 */
	public List<Notice> findNotice() {
		List<Notice> noticeList = noticeRepository.selectByNoticeDto();
		return noticeList;
	}
	
	
	
	/**
	 * 공지 상세 조회 서비스
	 */
	public Notice findByIdNotice(Integer id) {
		Notice notice = noticeRepository.selectById(id);
		return notice;
	}
	
	/**
	 * 공지 수정 서비스
	 */
	public int updateNotice(NoticeFormDto noticeFormDto) {
		int resultRowCount = noticeRepository.updateByNoticeDto(noticeFormDto);
		if (resultRowCount != 1) {
			System.out.println("공지 수정 서비스 오류");
		}
		return resultRowCount;
	}
	
	/**
	 * 공지 삭제 서비스
	 */
	public int deleteNotice(Integer id) {
		int resultRowCount = noticeRepository.deleteById(id);
		return resultRowCount;
	}
}
