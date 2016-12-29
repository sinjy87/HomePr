<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag = adao.create(dto);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
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
if(flag){
	out.print("팀정보를 등록했습니다.");
}else{
	out.print("정보 등록을 실패했습니다");
}
%>
		<br> <input type="button" value="계속 등록"
			onclick="location.href='./createForm.jsp'"> <input
			type="button" value="목록" onclick="location.href='./list.jsp'">
	</div>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>