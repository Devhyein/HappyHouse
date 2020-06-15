package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.crawling.Crawler;
import com.ssafy.happyhouse.model.dto.NewsData;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home(Model m, HttpSession session) throws IOException {
		session.invalidate();
		return "/user/login";
	}
}
