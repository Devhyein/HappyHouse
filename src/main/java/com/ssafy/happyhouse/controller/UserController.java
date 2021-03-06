package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.crawling.Crawler;
import com.ssafy.happyhouse.model.dto.HouseMember;
import com.ssafy.happyhouse.model.dto.NewsData;
import com.ssafy.happyhouse.model.service.HouseMemberService;
import com.ssafy.happyhouse.model.service.HouseMemberServiceImpl;

/**
 * Servlet implementation class UserController
 */
//@WebServlet("/user.do")
@RequestMapping("/user.do")
@Controller
public class UserController {
	
	private HouseMemberService houseMemberService;

	@Autowired
	public void setHouseMemberService(HouseMemberService houseMemberService) {
		this.houseMemberService = houseMemberService;
	}

	@PostMapping("/login.do")
	public String login(HouseMember user, HttpSession session) throws SQLException, IOException {
		boolean result = houseMemberService.login(user);
		Crawler c = new Crawler(); 
		List<NewsData> nl = c.getNewsData();
		if(result) {
			session.setAttribute("id", user.getId());
			session.setAttribute("newsinfo", nl);
			return "redirect:/index.jsp";
		}else{
			return "redirect:/index.jsp";
		}

	}

	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/user/login";
	}

	@GetMapping("/registform")
	public String registForm() {
		return "/user/join";
	}

	@GetMapping("loginform")
	public String loginForm() {
		return "/user/login";
	}

	@PostMapping("/insert.do")
	public String register(HouseMember housemember) {
		houseMemberService.insert(housemember);
		return "redirect:/index.jsp";
	}
	
	@GetMapping("/userinfoform")
	public String detail(HttpSession session,Model model) {
		String id = (String) session.getAttribute("id");
		HouseMember housemember = houseMemberService.search(id);
		model.addAttribute("housemember", housemember);
		return "/user/userInfo";
	}
	
	@GetMapping("/remove.do")
	public String remove(HttpSession session) {
		String id = (String) session.getAttribute("id");
		houseMemberService.delete(id);
		logout(session);
		return "redirect:/index.jsp";
	}
	@GetMapping("/updateform.do")
	public String updateFormBook(HttpSession session,Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("housemember", houseMemberService.search(id));
		return "/user/modify";
	}
	@PostMapping("/update.do")
	public String update(HouseMember housemember) {
		houseMemberService.update(housemember);
		return "redirect:/index.jsp";
	}
	@GetMapping("/findpwform.do")
	public String findpwform() {
		return "/user/findPw";
	}
	@GetMapping("/index.do")
	public String index() {
		return "redirect:/index.jsp";
	}
	
}