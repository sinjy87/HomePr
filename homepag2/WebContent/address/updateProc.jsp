<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag = adao.update(dto);
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
<script type="text/javascript">
function alist() {
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

	<div>
		<%
			if (flag) {
				out.print("정보를 수정했습니다.");
			} else {
				out.print("수정에 실패했습니다.");
			}
		%>
		<br> <input type="button" value="목록"
			onclick="alist()">
	</div>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>