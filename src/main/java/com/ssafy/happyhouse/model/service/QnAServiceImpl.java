package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.QnADao;
import com.ssafy.happyhouse.model.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService {

	private QnADao dao;

	@Autowired
	public void setDao(QnADao dao) {
		this.dao = dao;
	}

	@Override
	public List<QnA> selectAllQnA() {
		// TODO Auto-generated method stub
		return dao.selectAllQnA();
	}

	@Override
	public boolean insertQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.insertQnA(qna)==1;
	}

	@Override
	public boolean updateQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.updateQnA(qna)==1;
	}

	@Override
	public QnA selectQnA(String qnaTitle) {
		// TODO Auto-generated method stub
		return dao.selectQnA(qnaTitle);
	}

	@Override
	public boolean deleteQnA(String qnaTitle) {
		// TODO Auto-generated method stub
		return dao.deleteQnA(qnaTitle)==1;
	}



}
