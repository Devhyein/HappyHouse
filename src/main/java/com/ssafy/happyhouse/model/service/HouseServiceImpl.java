package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.HouseDao;
import com.ssafy.happyhouse.model.dao.HouseInfoDao;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService{
	//
	private HouseDao dao;
	private HouseInfoDao infoDao;

	@Autowired
	public void setDao(HouseDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	public void setInfoDao(HouseInfoDao infoDao) {
		this.infoDao = infoDao;
	}

	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, boolean[] allB){
		try {
			int cnt=0;
			String[] type;
			for(boolean b:allB) {
				if(b) cnt++;
			}
			type = new String[cnt];
			cnt=0;
			for(int i=0;i<allB.length;i++) {
				if(allB[i]) {
					type[cnt++] = Integer.toString(i+1);
				}
			}
			return dao.searchAll(currentPage, sizePerPage, type);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	public List<HouseDeal> search_apt(int currentPage, int sizePerPage, boolean[] allB, String aptName) {
		int cnt=0;
		String[] type;
		for(boolean b:allB) {
			if(b) cnt++;
		}
		type = new String[cnt];
		cnt=0;
		for(int i=0;i<allB.length;i++) {
			if(allB[i]) {
				type[cnt++] = Integer.toString(i+1);
			}
		}
		return dao.searchApt(currentPage, sizePerPage, type, aptName);
	}

	@Override
	public List<HouseDeal> search_dong(int currentPage, int sizePerPage, boolean[] allB, String dong) {
		int cnt=0;
		String[] type;
		for(boolean b:allB) {
			if(b) cnt++;
		}
		type = new String[cnt];
		cnt=0;
		for(int i=0;i<allB.length;i++) {
			if(allB[i]) {
				type[cnt++] = Integer.toString(i+1);
			}
		}
		return dao.searchDong(currentPage, sizePerPage, type, dong);
	}
	
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) {
		try {
			HouseDeal deal = dao.search(no);
			
			if(deal == null) {
				throw new HappyHouseException(String.format("거래번호 %d번에 해당하는 주택거래 정보가 존재하지 않습니다.", no));
			}
			return deal;
		} catch (SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
	
	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean) throws SQLException {
		PageNavigation pageNavigation = new PageNavigation();
//		int naviSize = 10; //밑에 한번에 눌러서 갈 수 있는 페이지개수
//		pageNavigation.setCurrentPage(currentPage);
//		pageNavigation.setNaviSize(naviSize);
//		int totalCount = dao.getTotalCount(bean); //총 게시글 수
//		pageNavigation.setTotalCount(totalCount);
//		int totalPageCount = (totalCount-1)/sizePerPage+1; //전체 페이지 수 계산
//		pageNavigation.setTotalPageCount(totalPageCount);
//		boolean startRange = currentPage<=naviSize; //true면 이전 버튼 못누름
//		pageNavigation.setStartRange(startRange);
//		boolean endRange = (totalPageCount-1)/naviSize*naviSize<currentPage; //true면 다음 버튼 못누름
//		pageNavigation.setEndRange(endRange);
//		pageNavigation.makeNavigator();
		return pageNavigation;
	}

//	@Override
//	public void insertHouseInfo(String dong, String aptName, int code, int buildYear, String jibun, String lat,
//			String lng, String img) {
//		try {
//			infoDao.insertHouseInfo(dong, aptName, code, buildYear, jibun, lat, lng, img);
//		} catch (Exception e) {
//			throw new HappyHouseException("주택 정보 입력 중 오류 발생");
//		}
//	}
//	
//
//	@Override
//	public HouseDeal addHouseDeal(String dong, String aptName, int code, String dealAmount, int buildYear, int dealYear,
//			int dealMonth, int dealDay, double area, int floor, String jibun, String type, String rentMoney) {
////		try {
////			int n = dao.addHouseDeal(dong, aptName, code, dealAmount, buildYear, dealYear, dealMonth, dealDay, area, floor, jibun, type, rentMoney);
////			if(n ==1) {
////				HouseDeal hd = new HouseDeal();
////				hd.setDong(dong);
////				hd.setAptName(aptName);
////				hd.setCode(code);
////				hd.setDealAmount(dealAmount);
////				hd.setBuildYear(buildYear);
////				hd.setDealYear(dealYear);
////				hd.setDealMonth(dealMonth);
////				hd.setDealDay(dealDay);
////				hd.setArea(area);
////				hd.setFloor(floor);
////				hd.setJibun(jibun);
////				hd.setType(type);
////				hd.setRentMoney(rentMoney);
////				
////				return hd;
////			}
////		} catch(SQLException e) {
////			throw new HappyHouseException("거래 정보 추가 중 오류 발생");
////		}
//		return null;
//		
//	}
//	
//	@Override
//	public List<HouseDeal> searchByDong(String dong) {
//		try {
//			return dao.searchByDong(dong);
//		} catch(SQLException e) {
//			throw new HappyHouseException("동으로 검색 중 오류 발생");
//		}
//	}
//	
//	@Override
//	public List<HouseDeal> searchByBuildYear(int buildYear) {
//		try {
//			return dao.searchByBuildYear(buildYear);
//		} catch(SQLException e) {
//			throw new HappyHouseException("건설연도로 검색 중 오류 발생");
//		}
//	}
//	
//	@Override
//	public List<HouseDeal> searchByDealYear(int dealYear) {
//		try {
//			return dao.searchByDealYear(dealYear);
//		} catch(SQLException e) {
//			throw new HappyHouseException("검색연도로 검색 중 오류 발생");
//		}
//	}
//	
//	@Override
//	public List<HouseDeal> searchByAreaScope(Integer min, Integer max) {
////		try {
////			return dao.searchByAreaScope(min, max);
////		} catch(SQLException e) {
////			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
////		}
//		return null;
//	}
	




}




