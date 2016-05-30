package com.team.sharemap.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import com.team.sharemap.dao.TripsDAO;
import com.team.sharemap.vo.TripsList;


@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	private TripsDAO tripsDAO;

	@Autowired
	public void setMemberDAO(TripsDAO tripsDAO) {
		this.tripsDAO = tripsDAO;
	}

	@RequestMapping(value={"mypage.do"},method=RequestMethod.GET)
	public String mypage(HttpServletRequest request, Model model) {
		//상품 목록 정보 취득
		System.out.println("test");
		List<TripsList> itemList = this.tripsDAO.getTripsList();
		model.addAttribute("itemList",itemList);
		return "/WEB-INF/views/mypage/mypage.jsp";
	}

	@RequestMapping(value={"mypage.do"},method=RequestMethod.POST)
	public String mypage(TripsList t,HttpServletRequest request){
		
		
		int af = tripsDAO.addTrips(t);
		if(af==1){
			//request.getSession().setAttribute("id",m.getId());
			return "redirect:mypage.do?id="+t.getCid();
		}else{
			return "redirect:mypage.do";
		}
	}  
	
	@RequestMapping("tripslistDel.do")
	public String TripsListDel(TripsList t,HttpServletRequest request){
		 int af = tripsDAO.tripslistDelete(t);		  
		  if(af == 1){
			 return "redirect:mypage.do?id="+t.getCid();
		  }else{
			 return null;
		  }
	}
}


