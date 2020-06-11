package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.TradeHub;
import com.ssafy.happyhouse.model.service.TradeHubService;
import com.ssafy.happyhouse.model.service.TradeHubServiceImpl;
import com.ssafy.happyhouse.util.KMPFilter;

/**
 * Servlet implementation class TradeHubController
 */
//@WebServlet("/tradehub.do")
@Controller("/tradehub.do")
public class TradeHubController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TradeHubService shopService;
    
	@Autowired
	public void setShopService(TradeHubService shopService) {
		this.shopService = shopService;
	}


	@Override
	public void init() throws ServletException {
		shopService = new TradeHubServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		
		PageInfo pi = null;
		switch (act) {
			case "category" :
				pi = findShopByCategory(request, response);
				break;
			case "dong" :
				pi = findShopByDongName(request, response);
				break;
		}
		
		
		
		
		if(pi.isForward()) {
			request.getRequestDispatcher(pi.getUrl()).forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + pi.getUrl());
		}
	}
	
	
	private PageInfo findShopByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "tradehub/tradeHubList.jsp";
		
		List<String> categorys = null;
		try {
			categorys = shopService.showShopCategorys();
			request.setAttribute("categorys", categorys);
			
		} catch(Exception e) {
			request.setAttribute("msg", "업종 정보 로드 실패");
			path = "/error.jsp";
		}
		
		String selected = request.getParameter("selected");
		
		try {
			List<TradeHub> shops;
			if(selected == null)
				shops = shopService.findShopByCategory(categorys.get(0));
			else {
				shops = shopService.findShopByCategory(selected);
				request.setAttribute("selected", selected);
			}
			request.setAttribute("shops", shops);
			
		} catch(Exception e) {
			request.setAttribute("msg", "업종 정보 로드 실패");
			path = "/error.jsp";
		}
		
		return new PageInfo(true, path);
	}
	
	private PageInfo findShopByDongName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "tradehub/tradeHubList.jsp";
		
		List<String> dongNames = null;
		try {
			dongNames = shopService.showShopDongNames();
			request.setAttribute("dongNames", dongNames);
			
		} catch(Exception e) {
			request.setAttribute("msg", "동 명 로드 실패");
			path = "/error.jsp";
		}
		
		String selected = request.getParameter("selected");
		
		try {
			List<TradeHub> shops;
			KMPFilter filter = new KMPFilter(shopService.loadAllShops());
			if(selected == null) {
				shops = filter.getFilteredList(dongNames.get(0));
			}
			else {
				shops = filter.getFilteredList(selected);
				request.setAttribute("selected", selected);
			}
			request.setAttribute("shops", shops);
			
		} catch(Exception e) {
			request.setAttribute("msg", "업종 정보 로드 실패");
			path = "/error.jsp";
		}
		
		return new PageInfo(true, path);
	}

}
