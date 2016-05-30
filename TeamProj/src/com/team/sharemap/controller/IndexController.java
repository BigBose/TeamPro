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
@RequestMapping("/joinus/*")
public class IndexController {

	private MembersDAO membersDAO;

	@Autowired
	public void setMemberDAO(MembersDAO membersDAO) {
		this.membersDAO = membersDAO;
	}

	@RequestMapping("index.do")
	public String index() {
		return "/WEB-INF/views/index.jsp";
	}
	
	@RequestMapping(value = { "login.do" }, method = RequestMethod.GET)
	public String login(String error, HttpServletRequest request, Model model) {

		// String error = (String)request.getAttribute("error");
		Cookie[] coos = request.getCookies();
		String cookieMid = CookieSearch.getCookie(coos, "id");
		String cookiePwd = CookieSearch.getCookie(coos, "pwd");
		if (cookieMid != null && !cookieMid.equals("") && cookiePwd != null && !cookiePwd.equals("")) {
			cookieMid = CookieSearch.getCookie(coos, "id");
			model.addAttribute("cookieMid", cookieMid);
		}
		System.out.println("cookieMid = " + cookieMid);
		if (error != null && !error.equals("")) {
			if (error.equals("IDx")) {
				error = "�������� �ʴ� ���̵��Դϴ�.";
			} else {
				error = "��й�ȣ��? ��ġ���� �ʽ��ϴ�.";
			}
			// request.setAttribute("error",error);
			model.addAttribute("error", error);
		}
		// mv.setViewName("/WEB-INF/views/joinus/login.jsp");
		return "/WEB-INF/views/joinus/login.jsp";
	}

	@RequestMapping(value = { "login.do" }, method = RequestMethod.POST)
	public String login(String id, String pwd, String checkBoxMid, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		System.out.println("checkBoxMid= " + checkBoxMid);
		Cookie coo = null;

		// MemberDao dao = new MemberDao();
		Members m = membersDAO.getMember(id);

		String error = null;

		if (m == null) {

			model.addAttribute("error", error);
			return "redirect:../joinus/login.do?error=IDx";
		} else if (!pwd.equals(m.getPwd())) {

			model.addAttribute("error", error);
			return "redirect:../joinus/login.do?error=PWDx";
		} else {
			request.getSession().setAttribute("id", id);
			String returnURL = (String) request.getSession().getAttribute("returnURL");
			System.out.println("returnURL = " + returnURL);
			if (checkBoxMid != null && !checkBoxMid.equals("")) {
				coo = new Cookie("id", id);
				coo.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(coo);
				coo = new Cookie("pwd", pwd);
				coo.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(coo);
				System.out.println("��Ű����");
				// üũ�ڽ��� üũ�������� ��Ű����
			} else {
				coo = new Cookie("id", null);
				coo.setMaxAge(0);
				response.addCookie(coo);
				coo = new Cookie("pwd", null);
				coo.setMaxAge(0);
				response.addCookie(coo);
				System.out.println("��Ű����");
				// üũ �ȵǾ������� ��Ű ����
			}

			if (returnURL != null && !returnURL.equals("")) { // �Խ��ǿ��� �� �����?
				String ctName = request.getContextPath();

				return "redirect:" + returnURL;

			} else {

				return "welcomelogin.do?id=" + id;
			}
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletResponse response, HttpServletRequest request) {
		Cookie coo = new Cookie("id", null);
		coo.setMaxAge(0);
		response.addCookie(coo);
		coo = new Cookie("pwd", null);
		coo.setMaxAge(0);
		response.addCookie(coo);
		System.out.println("��Ű����");

		request.getSession().invalidate(); // session �ʱ�ȭ
		return "redirect:../customer/notice.do";
	}

	@RequestMapping("welcomelogin.do")
	public String welcomelogin(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		// mv.setViewName("/WEB-INF/views/joinus/welcomelogin.jsp");
		return "/WEB-INF/views/joinus/welcomelogin.jsp";

	}
	
	@RequestMapping(value={"join.do"},method=RequestMethod.GET)
	public String join(HttpServletRequest request){
		List<String> errors = (List)request.getAttribute("errors");
		//mv.setViewName("/WEB-INF/views/joinus/join.jsp");
		return "/WEB-INF/views/joinus/join.jsp";
	}
	
	@RequestMapping(value={"join.do"},method=RequestMethod.POST)
	public String join(Members m, HttpServletRequest request){
		
		 int af = membersDAO.addMember(m);
		  if(af==1){
			request.getSession().setAttribute("id",m.getId());
			return "redirect:welcomelogin.do?id="+m.getId();
		  }else{
			  
		  	System.out.println("���� �� �����߻�");
			  return "redirect:join.do";
	}
		  
		  
		  
	}
	@RequestMapping(value={"memberUpdate.do"},method=RequestMethod.GET)
	public String memberUpdate(String id,HttpServletRequest request,Model model){
		
		if(request.getSession().getAttribute("id")==null){   //�����ִ� mid���� ���� = �α��εǾ����� �ʴ�.��α�����������? �̵�
			
			return "redirect:../joinus/login.jsp";
		}else{
			id=(String)request.getSession().getAttribute("id");
		
		}
		Members m = new Members();
		
		m = membersDAO.getMember(id);
		model.addAttribute("m",m);
		
		return "/WEB-INF/views/joinus/memberUpdate.jsp?id="+m.getId();
	}
	
	
	@RequestMapping(value={"memberUpdate.do"},method=RequestMethod.POST)
	public String memberUpdate(Members m,String pwd, String pwd2,HttpServletRequest request){
		

		String id=(String)request.getSession().getAttribute("id");
		
		if(!pwd.equals(pwd2)){
			
			return "redirect:/WEB-INF/views/joinus/memberUpdate.jsp";
		}
		
		 m.setId(id);
		 int af= membersDAO.updateMember(m);
		 if(af==1){
			
			 return "redirect:welcomelogin.do";
			 
			 
		 }
		 return null;
	}
	
	@RequestMapping("memberDel.do")
	public String memberDel(HttpServletRequest request,HttpServletResponse response){
		String id=(String)request.getSession().getAttribute("id");
	  		Cookie coo=null;
		  //MemberDao dao = new MemberDao();
		  
		  int af = membersDAO.memberDelete(id);
		  
		  if(af == 1){
			  coo=new Cookie("id",null);
			  coo.setMaxAge(0);
			  response.addCookie(coo);
			  System.out.println("��Ű����");
			 return "redirect:../index.jsp";
		  }else{
			  System.out.println("ȸ��Ż�� ��  DelProc ���� ����");
			  return null;
		  }
	}
}
