<%@page import="java.util.List"%>
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
var af = false;
$(document).ready(function(){
	
	$('#btnCheckUid').click(function(){
		$.ajax({
			type:"POST",
	 		url:"idcheck.jsp",
	 		dataType:'text',
	 		data:{"id":$('#id').val()},
	 		success:function(data){
	 			if($.trim(data)=="yes"){
	 				alert("사용가능한 아이디입니다.");
	 				af=true;
	 			}else{
	 				alert("이미 존재하는 아이디입니다.");
	 			}	
	 		}
		});
	});
	

	
});	
//비밀번호 체크
function validate(){
	if($('#pwd').val()!=$('#pwd2').val()){
		alert("비밀번호가 일치하지 않습니다~!@!@~@~!");
		return false;
	}
	

	if(af==false){
		alert("ID 중복확인을 해주세요.");
		return false;
	}
}



</script>		

		
		<div id="main">
			<div class="top-wrapper clear">
				<div id="content">
					<form action="join.do" method="post" onsubmit="return validate()">
						<h2>회원가입</h2>
						<h3 class="hidden">방문페이지 로그</h3>
						<p id="breadscrumb" class="block_hlist clear"><img alt="Step1 개인정보 등록" src="images/step2.png" /></p>
						<h3 class="hidden">회원가입 폼</h3>
						
						<div id="join-form" class="join-form margin-large" >
							<%-- <ul>
								<%if(errors!=null &&errors.size()>0){ %>   <!-- 처음에 실행하면 에러에는 아무것도 없기 때문에 조건을 줘서 뽑아야한다 -->
									<%for(int i=0;i<errors.size();i++){ %>
										<li><%=errors.get(i) %></li>
									<%} %>
								<%} %>
							</ul> --%>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*아이디
								</dt>
								<dd class="join-form-data">
									<div>
										 <input type="text" id="id" name="id" required placeholder="아이디 입력" pattern="[a-zA-Z][a-zA-Z0-9]{3,11}"/><span> 4~12자리 영문자(단 영어로 시작)</span>
										 <input id="btnCheckUid" class="button" type="button" value="중복확인"/>
									</div>
									<div>
										 <input id="idcheck"/>
									</div>	 
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*비밀번호
								</dt>
								<dd class="join-form-data">
									<input type="password" id="pwd" name="pwd" required placeholder="비밀번호 입력"/>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*비밀번호 확인
								</dt>
								<dd class="join-form-data" >
									<input type="password" id="pwd2" name="pwd2" required placeholder="비밀번호 재입력"/>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*프로필사진
								</dt>
								<dd class="join-form-data">
									<input type="text" name="proimg" required placeholder="사진 찾기"/>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*이메일
								</dt>
								<dd class="join-form-data">
									<input type="text" name="email" required placeholder="이메일 입력"/>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*이름
								</dt>
								<dd class="join-form-data">
									<input type="text" name="name" required placeholder="이름입력"/>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									*성별
								</dt>
								<dd class="join-form-data">
									<input type="radio" name="gender" id="male" value="남자" checked />남자
	                                <input type="radio" name="gender" id="female" value="여자" />여자
								</dd>
							</dl>
							
							<dl class="join-form-row">
								<dt class="join-form-title">
									*나이
								</dt>
								<dd class="join-form-data">
									<input type="text" name="age" required placeholder="숫자만 입력"pattern="[0-9]{2,3}" />
								</dd>
							</dl>
							
												
						</div>
						
					<div id="buttonLine">
						<input class="btn-okay button" id="s-button" type="submit" value="가입"/>
					</div>
					</form>
				</div>
				
			</div>
		</div>
		
	</body>
</html>
