package com.team.sharemap.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.sharemap.dao.MembersDAO;
import com.team.sharemap.util.CookieSearch;
import com.team.sharemap.vo.Members;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request) {
		return "/WEB-INF/views/mypage/mypage.jsp";

	}
}
