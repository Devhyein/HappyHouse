package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.QnA;

@Mapper
@Repository
public interface QnADao {
	List<QnA> selectAllQnA();
	int insertQnA(QnA qna);
	int updateQnA(QnA qna);
	QnA selectQnA(String qnaTitle);
	int deleteQnA(String qnaTitle);
}
