<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %> 
<%    
	String id = request.getParameter("id");
	String passwd= request.getParameter("passwd");
	
	boolean flag = dao.loginCheck(id,passwd);
	String grade = null;//회원등급
	if(flag){//회원인경우
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		
		// ---------------------------------------------- 
	    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
	    // ---------------------------------------------- 
	    Cookie cookie = null; 
	       
	    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
	       
	    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
	      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록 
	   
	      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록  
	         
	    }else{ 
	      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	         
	      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	    } 
	    // ---------------------------------------------
	}
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">로그인처리</DIV>
 
<div class = "content">
<% if(flag){
	out.print("로그인 되었습니다.<br><br>");	%>
	    <input type="button" value='홈으로' onclick ="location.href='../index.jsp'">
<%}else{
	out.print("아이디/비밀번호가 일치하지 않습니다.<br><br>");%>
    <input type="button" value='회원가입' onclick ="location.href='agreement.jsp'">
        <input type='button' value='다시시도' onclick="history.back()">
<%} %>


</div>
  

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 