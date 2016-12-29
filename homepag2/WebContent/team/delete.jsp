<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	
	int no = Integer.parseInt(request.getParameter("no"));
	String oldfile = request.getParameter("oldfile");

	boolean flag = tdao.delete(no);
	if(flag){
		String upDir = application.getRealPath("/team/storage");
		UploadSave.deleteFile(upDir, oldfile);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function tlist() {
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
</script>
<style type="text/css">


div {
	text-align: center;
	margin-top: 50px;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div>
		<%
			if (flag) {
				out.print("삭제되었습니다.");
			} else {
				out.print("실패했습니다.");
			}
		%>
		<br> <br> <input type="button" value="목록으로..."
			onclick="tlist()">
	</div>

	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>