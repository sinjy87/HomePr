<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = bdao.checkRefno(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function incheck(f) {
	if(f.passwd.value==""){
		alert("패스워드를 입력하세요.");
		f.passwd.focus();
		return false;
	}
	
}

</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">삭제</DIV>

	<div class="content">
	<%if(flag){
		out.print("답변이 있는 글이므로 삭제 할 수 없습니다.<br>");
		out.print("<input type ='button' value='다시시도' onclick='history.go(-2)'>");
		}else{ %>
	<FORM name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return incheck(this)">
		<input type = "hidden" name = "bbsno" value="<%=bbsno %>">
		<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
		<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
		<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
		<input name="oldfile" value="<%=request.getParameter("oldfile")%>" type="hidden">
		삭제되면 복구할수없습니다.<br><br>
			<TABLE>
				<TR>
					<TH>패스워드</TH>
					<TD><input type="password" name = "passwd"></TD>
				</TR>
			</TABLE>

			<DIV class='bottom'>
				<input type='submit' value='확인'> 
				<input type='button' value='취소' onclick="history.back()">
			</DIV>
		</FORM>
		<%} %>
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
