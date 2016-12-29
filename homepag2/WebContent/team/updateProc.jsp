<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="team.TeamDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean flag = tdao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function tlist() {
	var url = "list.jsp";
	url +="?col=<%=request.getParameter("col")%>";
	url +="&word=<%=request.getParameter("word")%>";
	url +="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}
</script>
<style type="text/css">

div {
	text-align: center;
	margin-top: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />

	<div>
		<%
			if (flag) {
				out.print("팀정보를 수정했습니다.");
			} else {
				out.print("수정에 실패했습니다.");
			}
		%>
		<br> <input type="button" value="목록"
			onclick="tlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>