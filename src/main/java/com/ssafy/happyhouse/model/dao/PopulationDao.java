package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Population;

@Mapper
@Repository
public interface PopulationDao {

	List<Population> getPopulation(int code, int time);

}
