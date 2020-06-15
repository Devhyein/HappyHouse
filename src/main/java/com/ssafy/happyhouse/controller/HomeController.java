package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.crawling.Crawler;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home(Model m, HttpSession session) throws IOException {
		Crawler c = new Crawler(); 
		m.addAttribute("newsinfo", c);
		session.invalidate();
		/*
		 * for (int i = 0; i < 6; i++) { System.out.println(c.getHeadText()[i]);
		 * System.out.println(c.getHeadUrl()[i]);
		 * System.out.println(c.getContentUrl()[i]);
		 * System.out.println(c.getContentText()[i]);
		 * System.out.println(c.getImage()[i]); }
		 */
		return "/user/login";
	}
}
