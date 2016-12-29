<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class = "memo.MemoDTO"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<jsp:setProperty property="memono" name="dto"/>
<%-- <jsp:setProperty property="*" name="dto"/> --%>

<%

	
	boolean flag = mdao.update(dto);
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

div {
	text-align: center;
	margin-top: 20px;
}
</style>
<script type="text/javascript">
function mlist() {
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}

</script>>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

	<div>
		<%
			if (flag) {
				out.print("메모를 수정하였습니다.");
			} else {
				out.print("수정에 실패하였습니다");
			}
		%>
		<br> <input type="button" value="목록" onclick="mlist()">
	</div>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>