package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.PopulationDao;
import com.ssafy.happyhouse.model.dto.Population;

@Service
public class PopulationServiceImpl implements PopulationService {
	private PopulationDao dao;

	@Autowired
	public void setDao(PopulationDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Population> getPopulation(int code) {
		return dao.getPopulation(code);
	}
	
	
}
