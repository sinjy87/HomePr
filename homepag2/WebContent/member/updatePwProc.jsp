<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%   
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	boolean flag = dao.updatePw(id,passwd);
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
 
<DIV class="title">비밀번호 변경처리</DIV>

<div class = "content">
<%
if(flag){
	out.print("비밀번호가 변경되었습니다<br>");
	out.print("로그인을 시도하세요");
}else{
	out.print("패스워드 변경에 실패하였습니다.");
}
%>
</div>
  
  <DIV class='bottom'>
  <%if(flag){ %>
    <input type="button" value='로그인' onclick="./loainForm.jsp">
    <%}else{ %>
    <input type="button" value='다시시도' onclick="history.back()">
  	<%} %>
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 