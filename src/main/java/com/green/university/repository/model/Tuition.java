package com.green.university.repository.model;

import com.green.university.utils.NumberUtil;

import lombok.Data;

/**
 * @author 서영
 *
 */

@Data
public class Tuition {

	private Integer studentId;
	private Integer tuiYear;
	private Integer semester;
	private Integer schType;
	private Integer tuiAmount;
	private Integer schAmount;
	private Boolean status;
	
	/**
	 * @return 금액 형식으로 변환한 등록금
	 */
	public String tuiFormat() {
		return NumberUtil.numberFormat(tuiAmount);
	}
	
	/**
	 * @return 금액 형식으로 변환한 장학금
	 */
	public String schFormat() {
		return NumberUtil.numberFormat(schAmount);
	}
	
	/**
	 * @return 금액 형식으로 변환한 납부금
	 */
	public String paymentFormat() {
		Integer payAmount = tuiAmount - schAmount;
		return NumberUtil.numberFormat(payAmount);
	}
	
}
