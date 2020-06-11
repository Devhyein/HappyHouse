package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseMember;

public interface HouseMemberService {
	public void insert(HouseMember housemember);
	public boolean login(HouseMember housemember) throws SQLException;
	
	public HouseMember search(String id);
	public List<HouseMember> searchAll();
	
	public void update(HouseMember housemember);
	
	public void delete(String id);
	public String findPw(String id, String name);
}
