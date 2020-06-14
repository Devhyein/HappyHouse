package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.DongArea;
import com.ssafy.happyhouse.model.dto.Lamp;

@Mapper
@Repository
public interface LampDao {
	List<Lamp> selectAll();
	List<DongArea> CountLamp();
}
