package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public interface HouseService {
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를 검색해서 반환.
	 * 
	 * @param sizePerPage
	 * @param currentPage
	 * @param bean        검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, boolean[] allB);

	public List<HouseDeal> search_apt(int currentPage, int sizePerPage, boolean[] allB, String aptName);

	public List<HouseDeal> search_dong(int currentPage, int sizePerPage, boolean[] allB, String dong);

	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환.
	 * 
	 * @param no 검색할 아파트 식별 번호
	 * @return 아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no);
	public HouseDeal searchByInfo(int no);

	// 구현한 부분 코드
	// 입력
	/*
	 * public void insertHouseInfo(String dong, String aptName, int code, int
	 * buildYear, String jibun, String lat, String lng, String img); //모든 houseInfo
	 * 조회 public List<HouseInfo> searchAllHouseInfo();
	 * 
	 * public HouseDeal addHouseDeal(String dong, String aptName, int code, String
	 * dealAmount, int buildYear, int dealYear, int dealMonth, int dealDay, double
	 * area, int floor, String jibun, String type, String rentMoney);
	 * 
	 * public List<HouseDeal> searchByDong(String dong);
	 * 
	 * public List<HouseDeal> searchByBuildYear(int buildYear);
	 * 
	 * public List<HouseDeal> searchByDealYear(int dealYear);
	 * 
	 * public List<HouseDeal> searchByAreaScope(Integer min, Integer max);
	 */
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean) throws SQLException;

	public List<String> searchDongList();
	public List<String> searchAptNameList();

	public HouseInfo searchInfo(HouseDeal deal);
	//현재 지도에 표시된 집 근처 집들도 표시
	public List<HouseInfo> searchNearHouse(HouseInfo info);

	public List<HashMap<Double, Integer>> search_groupbyMonth();

}
