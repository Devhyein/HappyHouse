package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.crawling.Crawler;
import com.ssafy.happyhouse.model.dto.DongArea;
import com.ssafy.happyhouse.model.dto.Lamp;
import com.ssafy.happyhouse.model.dto.NewsData;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.LampService;

@Controller
public class HomeController {
	private HouseService service;
	private LampService lampService;
	
	@Autowired
	public void setService(HouseService service) {
		this.service = service;
	}
	
	@Autowired
	public void setLampService(LampService lampService) {
		this.lampService = lampService;
	}
	
	@RequestMapping("/")
	public String home(Model m, HttpSession session) throws IOException {
		session.removeAttribute("id");
		session.removeAttribute("newsinfo");
		
		if (session.getAttribute("searchList") == null) {
			List<String> searchList = service.searchDongList();
			searchList.addAll(service.searchAptNameList());
			session.setAttribute("searchList", searchList);
		}
		
		if(session.getAttribute("lamp")==null) {
			List<Lamp> lamp = lampService.selectAll();
			List<DongArea> graph = lampService.CountLamp();
			for (DongArea dongArea : graph) {
				dongArea.setSize(dongArea.getLampCnt()/dongArea.getArea());
				if(dongArea.getSize()<10)
					dongArea.setSize(20);
			}
			session.setAttribute("lamp", lamp);
			session.setAttribute("graph", graph);
		}
		return "/user/login";
	}
}
