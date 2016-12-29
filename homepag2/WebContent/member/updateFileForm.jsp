<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
function inCheck(f) {
	if(f.fname.value==""){
		alert("사진을 선택하세요.");
		f.fname.focus();
		return false;
	}
	
}
</script>
<style type="text/css">

#A {
	width: "50%";
	height: "40%";
	background-color: white;
	color: black;
	background-color: white;
}

#B {
	border: none;
	background-color: white;
	color: black;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">사진수정</DIV>

	<FORM name='frm' method='POST' action='./updateFileProc.jsp'
		enctype="multipart/form-data"
		onsubmit="return inCheck(this)">
		<input type="hidden" name="id" value="<%=id%>"> <input
			type="hidden" name="oldfile" value="<%=oldfile%>">

		<TABLE>
			<TR>
				<TH>원본파일</TH>
				<th>변경파일</th>
			</TR>
		</table>

		<table>
			<TR>
				<TH width="50%" id="A"><img src="./storage/<%=oldfile%>"><br>
					원본 파일명: <%=oldfile%></TH>

				<th  id="A"><input type="file" name="fname" accept=".jpg,.gif,.png">
				</th>
			</TR>
		</TABLE>



		<DIV class='bottom'>
			<input type='submit' value='변경'> <input type='button'
				value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
