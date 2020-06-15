package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.Population;

@Service
public interface PopulationService {

	List<Population> getPopulation(int code);

}
