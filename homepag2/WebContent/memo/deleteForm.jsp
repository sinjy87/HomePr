<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int memono = Integer.parseInt(request.getParameter("memono"));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

div{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

</style>
<script type="text/javascript">
	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

<div>삭제확인</div>
	<form method="post" action="delectProc.jsp">
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name = "col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name = "word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name = "nowPage" value="<%=request.getParameter("nowPage")%>">
		<div>
			삭제하면 복구할수없습니다.<br> <br> 삭제하시려면 "삭제"버튼을 클릭하세요<br> <br>
			취소는 "목록" 버튼을 누르세요 <br> <br> 
			<input type="submit" value="삭제"> 
				<input type="button" value="목록"  onclick="mlist();">
		</div>
	</form>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>