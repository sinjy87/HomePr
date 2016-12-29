<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="memono" name="dto"/>

<%
	request.setCharacterEncoding("utf-8");
	int memono = Integer.parseInt(request.getParameter("memono"));


	boolean flag = mdao.delete(memono);

	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

div{
text-align: center;
margin-top: 100px;
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
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

	<div>
		<%
			if (flag) {
				out.print("삭제가 완료 되었습니다.");
			} else {
				out.print("실패했습니다.");
			}
		%>
		<br> <input type="button" value="삭제완료 목록으로"
			onclick="mlist()">
	</div>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>