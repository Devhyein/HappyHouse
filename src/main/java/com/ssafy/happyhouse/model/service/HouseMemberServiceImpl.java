package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseMemberDao;
import com.ssafy.happyhouse.model.dto.HouseMember;

@Service
public class HouseMemberServiceImpl implements HouseMemberService {
	private HouseMemberDao dao;
	
	@Autowired
	public void setDao(HouseMemberDao dao) {
		this.dao = dao;
	}

	@Override
	public void insert(HouseMember housemember) {
		try {
			dao.insert(housemember);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public HouseMember search(String id) {
		try {
			return dao.search(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<HouseMember> searchAll() {
		try {
			return dao.searchAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public void update(HouseMember housemember) {
		try {
			dao.update(housemember);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String id) {
		try {
			dao.delete(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public boolean login(HouseMember housemember) throws SQLException {
		return dao.login(housemember) != null;
	}

	@Override
	public String findPw(String id, String name) {
		try {
			return dao.findPw(id, name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
