package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.ParcelDao;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Parcel;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class ParcelServiceImpl implements ParcelService {
	
	private ParcelDao dao;
	
	@Autowired	
	public void setDao(ParcelDao dao) {
		this.dao = dao;
	}



	@Override
	public Parcel search(int price) {
		// TODO Auto-generated method stub
		try {
			Parcel parcel = dao.search(price);
			if(parcel == null) {
				throw new HappyHouseException(String.format("정보가 존재하지 않습니다.", price));
			}
			return parcel;
		} catch (SQLException e) {
			throw new HappyHouseException("조회 중 오류 발생");
		}
	}



	@Override
	public List<Parcel> searchAll(int currentPage, int sizePerPage){
		// TODO Auto-generated method stub
		try {
			return dao.searchAll(currentPage, sizePerPage);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public PageNavigation makePageNavigation(int currentPage, int sizePerPage) throws SQLException {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; //밑에 한번에 눌러서 갈 수 있는 페이지개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
//		int totalCount = dao.getTotalCount(); //총 게시글 수
		int totalCount = 100;
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount-1)/sizePerPage+1; //전체 페이지 수 계산
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage<=naviSize; //true면 이전 버튼 못누름
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount-1)/naviSize*naviSize<currentPage; //true면 다음 버튼 못누름
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}



	@Override
	public List<String> searchList() {
		// TODO Auto-generated method stub
		return dao.searchList();
	}



	@Override
	public List<Parcel> searchlist() throws SQLException {
		// TODO Auto-generated method stub
		return dao.searchlist();
	}



}
