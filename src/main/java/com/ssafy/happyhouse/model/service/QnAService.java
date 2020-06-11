package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnA;


public interface QnAService {
	List<QnA> selectAllQnA();
	boolean insertQnA(QnA qna);
	boolean updateQnA(QnA qna);
	QnA selectQnA(String qnaTitle);
	boolean deleteQnA(String qnaTitle);
	
}
