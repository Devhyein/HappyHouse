package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseMember;

@Mapper
@Repository
public interface HouseMemberDao {
	// 회원 가입
	public void insert(HouseMember housemember) throws SQLException;
	
	// 로그인
	public String login(HouseMember housemember) throws SQLException;

	// 회원 정보 조회
	public HouseMember search(String id) throws SQLException;
	public List<HouseMember> searchAll() throws SQLException;

	// 회원 정보 수정
	public void update(HouseMember housemember) throws SQLException;

	// 회원 정보 삭제
	public void delete(String id) throws SQLException;

	public String findPw(String id, String name) throws SQLException;
}
