<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	AddressDTO dto = adao.read(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
	function read(no) {
		var url = "updateForm.jsp";
		url += "?no=" + no;
		location.href = url;
	}
	function alist() {
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		location.href=url;
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>



	<div class="title">조회</div>
	<table>
		<tr>
			<td>이름</td>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=dto.getPhone()%></td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><%=dto.getZipcode()%></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=dto.getAddress1()%></td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td><%=dto.getAddress2()%></td>
		</tr>
		<tr>
			<td>입력날짜</td>
			<td><%=dto.getWdate()%></td>
		</tr>


	</table>
	<div class="bottom">
		<input type="button" value="수정" onclick="read('<%=no%>')"> 
		<input type="button" value="목록" onclick="alist()">
	</div>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>