package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.DongArea;
import com.ssafy.happyhouse.model.dto.Lamp;

@Service
public interface LampService {
	List<Lamp> selectAll();
	List<DongArea> CountLamp();
}
