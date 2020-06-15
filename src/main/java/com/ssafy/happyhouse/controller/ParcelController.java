package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Parcel;
import com.ssafy.happyhouse.model.service.ParcelService;
import com.ssafy.happyhouse.util.PageNavigation;

@RequestMapping("/parcel.do")
@Controller
public class ParcelController {
	
	private ParcelService service;
	
	@Autowired	
	public void setService(ParcelService service) {
		this.service = service;
	}

	@PostMapping("/parcelinfo")
	public String showHouseInfo(int price, Model model) {
		Parcel parcel = service.search(price);
		model.addAttribute("bunyang", parcel);
		return "house/bunyangInfo";
	}
	
	@GetMapping("/main")
	public String showMainView(int pg, Model model) {
		int currentPage = pg;
		int sizePerPage = 10;
		List<String> searchList = service.searchList();
		List<Parcel> parcelList = service.searchAll(currentPage, sizePerPage);
		try {
			PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage);			
			model.addAttribute("bunyang", parcelList);	
			model.addAttribute("searchList", searchList);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			model.addAttribute("msg", "정보 로드 실패");
			return "error";
		}

		return "house/bunyanginfo";
	}
	
	@PostMapping("/search")
	public String searchDeals(int pg, Model model, HttpSession session) {
		int currentPage = pg;
		int sizePerPage = 10;
		List<Parcel> dealList = service.searchAll(currentPage, sizePerPage);

		try {
			PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage);
			model.addAttribute("dealList", dealList);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			model.addAttribute("msg", "정보 로드 실패");
			return "error";
		}
		
		return "house/bunyanginfo";
	}
}
