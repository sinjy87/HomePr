<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	boolean flag = adao.delete(no);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

div {
	text-align: center;
	margin-top: 50px;
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
				out.print("삭제되었습니다.");
			} else {
				out.print("실패했습니다.");
			}
		%>
		<br> <br> <input type="button" value="목록으로..."
			onclick="alist()">
	</div>
<jsp:include page="/menu/bottom.jsp"/>


</body>
</html>
