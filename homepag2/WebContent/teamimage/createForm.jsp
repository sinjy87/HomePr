<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원</title>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false"/>
	<!-- *********************************************** -->

	<DIV class="title">글생성</DIV>

	<FORM name='frm' method='POST' action='./createProc.jsp'
		enctype="multipart/form-data">
		<TABLE>
			<TR>
				<TH>아름</TH>
				<TD><input type="text" name="name"></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title"></TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD><textarea name="content"></textarea></TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
			<TR>
				<TH>사진</TH>
				<TD><input type="file" name="filename" accept=".jpg , .gif, .png"></TD><!-- 액셉트 -->
			</TR>
		</TABLE>
		`

		<DIV class='bottom'>
			<input type='submit' value='작성하기'> 
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>
