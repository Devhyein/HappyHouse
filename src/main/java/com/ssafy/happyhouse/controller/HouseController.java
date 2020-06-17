package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.DongArea;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Lamp;
import com.ssafy.happyhouse.model.dto.Population;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.LampService;
import com.ssafy.happyhouse.model.service.PopulationService;
import com.ssafy.happyhouse.util.PageNavigation;

/**
 * Servlet implementation class HouseController
 */
@RequestMapping("/house.do")
@Controller
public class HouseController extends HttpServlet {

	private HouseService service;
	private LampService lampService;
	private PopulationService popService;
//	TradeHubService shopService;

	@Autowired
	public void setService(HouseService service) {
		this.service = service;
	}

	@Autowired
	public void setLampService(LampService lampService) {
		this.lampService = lampService;
	}

	@Autowired
	public void setPopService(PopulationService popService) {
		this.popService = popService;
	}
	
	@GetMapping("/main")
	public String showMainView(String group, int pg, Model model) {
		int currentPage = pg;
		HousePageBean bean = new HousePageBean();
		int sizePerPage = 20;
		List<HouseDeal> dealList = null;
		switch (group) {
		case "all":
			boolean[] allB = { true, true, true, true };
			bean.setSearchType(allB);
			dealList = service.searchAll(currentPage, sizePerPage, allB);
			break;
		case "apt":
			boolean[] aptB = { true, true, false, false };
			bean.setSearchType(aptB);
			dealList = service.searchAll(currentPage, sizePerPage, aptB);
			break;
		case "house":
			boolean[] houseB = { false, false, true, true };
			bean.setSearchType(houseB);
			dealList = service.searchAll(currentPage, sizePerPage, houseB);
			break;
		}

		try {
			PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, bean);
			model.addAttribute("dealList", dealList);
			model.addAttribute("group", group);
			model.addAttribute("navigation", pageNavigation);

		} catch (Exception e) {
			model.addAttribute("msg", "거래 정보 로드 실패");
			return "error";
		}

		return "house/dealList";
	}

	
	@PostMapping("/search_deals")
	public String searchDeals(String category, String group, String search, int pg, Model model,HousePageBean bean, HttpSession session) {
		int currentPage = pg;
		int sizePerPage = 20;
		bean = new HousePageBean();
		List<HouseDeal> dealList = null;
		switch (group) {
		case "all":
			boolean[] allB = { true, true, true, true };
			bean.setSearchType(allB);
			if(category.equals("apt")) {
				dealList = service.search_apt(currentPage, sizePerPage, allB, search);
			}
			else if(category.equals("dong"))
				dealList = service.search_dong(currentPage, sizePerPage, allB, search);
			break;
		case "apt":
			boolean[] aptB = { true, true, false, false };
			bean.setSearchType(aptB);
			if(category.equals("apt"))
				dealList = service.search_apt(currentPage, sizePerPage, aptB, search);
			else if(category.equals("dong"))
				dealList = service.search_dong(currentPage, sizePerPage, aptB, search);
			break;
		case "house":
			boolean[] houseB = { false, false, true, true };
			bean.setSearchType(houseB);
			if(category.equals("apt"))
				dealList = service.search_apt(currentPage, sizePerPage, houseB, search);
			else if(category.equals("dong"))
				dealList = service.search_dong(currentPage, sizePerPage, houseB, search);;
			break;
		}
		try {
			PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, bean);
			model.addAttribute("dealList", dealList);
			model.addAttribute("navigation", pageNavigation);
			model.addAttribute("group", group);
		} catch (Exception e) {
			model.addAttribute("msg", "거래 정보 로드 실패");
			return "error";
		}
		
		return "house/dealList";
	}
	
	@PostMapping("house_info")
	public String showHouseInfo(int no, Model model) {
		HouseDeal deal = service.search(no);
		HouseInfo info = service.searchInfo(deal);
		List<HouseInfo> near = service.searchNearHouse(info);
		List<HashMap<Double, Integer>> groupByMonth = service.search_groupbyMonth();
		
		
		//법정동 코드로 인구수 받아오기
		List<Population> population = popService.getPopulation(deal.getCode(), 12);
		
		
		model.addAttribute("deal", deal);
		model.addAttribute("info", info);
		model.addAttribute("near", near);
		model.addAttribute("selected", 12);
		model.addAttribute("population", population);
		model.addAttribute("groupByMonth", groupByMonth);
		return "house/houseInfo";
	}
	
	@PostMapping("population_chart_byTime")
	public String showHouseInfo(int no, int time, Model model) {
		System.out.println("**********called**********");
		HouseDeal deal = service.search(no);
		HouseInfo info = service.searchInfo(deal);
		List<HouseInfo> near = service.searchNearHouse(info);
		List<HashMap<Double, Integer>> groupByMonth = service.search_groupbyMonth();
		
		//법정동 코드로 인구수 받아오기
		List<Population> population = popService.getPopulation(deal.getCode(), time);
		
		
		model.addAttribute("deal", deal);
		model.addAttribute("info", info);
		model.addAttribute("near", near);
		model.addAttribute("selected", time);
		model.addAttribute("population", population);
		model.addAttribute("groupByMonth", groupByMonth);
		return "house/houseInfo";
	}
	
	@PostMapping("house_info2")
	public String showHouseInfo2(int no, Model model) {
		HouseDeal deal = service.searchByInfo(no);
		HouseInfo info = service.searchInfo(deal);
		List<HouseInfo> near = service.searchNearHouse(info);
		List<HashMap<Double, Integer>> groupByMonth = service.search_groupbyMonth();
		
		//법정동 코드로 인구수 받아오기
		List<Population> population = popService.getPopulation(deal.getCode(), 12);
				
		model.addAttribute("deal", deal);
		model.addAttribute("info", info);
		model.addAttribute("near", near);
		model.addAttribute("selected", 12);
		model.addAttribute("population", population);
		model.addAttribute("groupByMonth", groupByMonth);
		return "house/houseInfo";
	}
	
	// 지도 관련 추가
	@GetMapping("/streetlamp")
	public String showLampMap(Model model) {
		//데이터 가져오기
		return "lampMap";
	}
	

	
	
}
