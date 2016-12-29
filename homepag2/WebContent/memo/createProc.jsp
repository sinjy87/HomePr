<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class = "memo.MemoDTO"/>
<jsp:setProperty property ="*" name = "dto"/>
<%
	
	boolean flag = mdao.create(dto);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

div {
	text-align: center;
	margin-top: 100px;
}
</style>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

	<div>
		<%
			if (flag) {
				out.print("메모 등록");
			} else {
				out.print("등록 실패");
			}
		%>
		<br> <input type="button" value="계속 등록"
			onclick="location.href='./createForm.jsp'"> <input
			type="button" value="목록" onclick="location.href='./list.jsp'">
	</div>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>