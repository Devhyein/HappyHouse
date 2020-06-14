package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.LampDao;
import com.ssafy.happyhouse.model.dto.DongArea;
import com.ssafy.happyhouse.model.dto.Lamp;

@Service
public class LampServiceImpl implements LampService {
	private LampDao dao;
	
	@Autowired
	public void setDao(LampDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Lamp> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<DongArea> CountLamp() {
		return dao.CountLamp();
	}

}
