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
//		if(noticeFormDto != null) {
//			Notice notice = noticeRepository.findById(noticeFormDto.getId());
//			// 공지 제목 중복 확인
//			if(notice.getTitle() == noticeFormDto.getTitle()) {
//				throw new CustomRestfullException("중복된 내용이 이미 등록되어 있습니다. 확인해보세요", HttpStatus.BAD_REQUEST);
//			}			
//		}
		int resultRowCount = noticeRepository.insert(noticeFormDto);
		if (resultRowCount != 1) {
			System.out.println("공지 입력 서비스 오류");
		}
		int noticeId = noticeRepository.findByLimit(noticeFormDto);
		noticeFormDto.setNoticeId(noticeId);
		System.out.println(noticeFormDto);
		noticeRepository.insertFile(noticeFormDto);
	}
	
	/**
	 * 공지 조회 서비스
	 */
	public List<Notice> findNotice() {
		List<Notice> noticeList = noticeRepository.findAll();
		return noticeList;
	}
	
	
	
	/**
	 * 공지 상세 조회 서비스
	 */
	public Notice findByIdNotice(Integer id) {
		Notice notice = noticeRepository.findById(id);
		return notice;
	}
	
	/**
	 * 공지 수정 서비스
	 */
	public int updateNotice(NoticeFormDto noticeFormDto) {
		int resultRowCount = noticeRepository.update(noticeFormDto);
		if (resultRowCount != 1) {
			System.out.println("공지 수정 서비스 오류");
		}
		return resultRowCount;
	}
	
	/**
	 * 공지 삭제 서비스
	 */
	public int deleteNotice(Integer id) {
		int resultRowCount = noticeRepository.delete(id);
		return resultRowCount;
	}
}
