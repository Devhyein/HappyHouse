package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Parcel;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public interface ParcelService {
	public List<Parcel> searchAll(int currentPage, int sizePerPage);
	public List<Parcel> searchlist() throws SQLException;
	public Parcel search(int price);
	public List<String> searchList();
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage) throws SQLException;;	
}
