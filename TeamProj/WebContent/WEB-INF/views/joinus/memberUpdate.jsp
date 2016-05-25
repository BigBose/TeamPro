<%@page import="com.team.sharemap.dao.MembersDAO"%>
<%@page import="com.team.sharemap.vo.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>index</title>
		<link href="join.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>	
	<script type="text/javascript">
	
	


	</script>	
		
		
		<div id="main">
			<div class="top-wrapper clear">
				<div id="content">
					<form action="memberUpdate.do" method="post" onsubmit="return validate()">
						<h2>회원정보수정</h2>
						<h3 class="hidden">방문페이지 로그</h3>
						<p id="breadscrumb" class="block_hlist clear"><img alt="Step1 개인정보 등록" src="images/step2.png" /></p>
						<h3 class="hidden">회원정보수정 폼</h3>
						
						<div id="join-form" class="join-form margin-large" >
							<ul>
								<%-- <%if(errors!=null &&errors.size()>0){ %>   <!-- 처음에 실행하면 에러에는 아무것도 없기 때문에 조건을 줘서 뽑아야한다 -->
									<%for(int i=0;i<errors.size();i++){ %>
										<li><%=errors.get(i) %></li>
									<%} %>
								<%} %> --%>
							</ul>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*아이디
								</dt>
								<dd class="join-form-data">
									
									${m.id}
									
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*비밀번호
								</dt>
								<dd class="join-form-data">
									<input type="password" name="pwd" value="${m.pwd}" required />
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*비밀번호 확인
								</dt>
								<dd class="join-form-data" >
									<input type="password" name="pwd2" value="${m.pwd}" required placeholder="비밀번호 재입력"/>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*이메일
								</dt>
								<dd class="join-form-data">
								<input type="hidden" name="email" value="${m.email}"></input>
									${m.email}
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*성별
								</dt>
								<dd class="join-form-data">
								<input type="hidden" name="gender" value="${m.gender}"></input>
									${m.gender}
								</dd>
							</dl>
							
							<dl class="join-form-row">
								<dt class="join-form-title">
									*나이
								</dt>
								<dd class="join-form-data">
									<input type="text" name="age" value="${m.age}" pattern[1-9]{3}></input>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*프로필사진
								</dt>
								<dd class="join-form-data">
									<input type="hidden" name="id" value="${m.id}"></input>
									<input type="text" name="proimg" value="${m.proimg}"/><span> 프로필 사진  </span>
								</dd>
							</dl>
												
						</div>
						
					<div id="buttonLine">
						<input class="btn-okay button" type="submit" value="가입"/>
					</div>
					</form>
				</div>
				
			</div>
		</div>
		
	</body>
</html>