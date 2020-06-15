package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Parcel;
@Mapper
@Repository
public interface ParcelDao {

	List<Parcel> searchAll(int currentPage, int sizePerPage)  throws SQLException;

	Parcel search(int price)  throws SQLException;

	int getTotalCount();

	List<String> searchList();

}
