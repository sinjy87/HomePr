<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.readReply(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">답변</DIV>

	<FORM name='frm' method='POST' action='./replyProc.jsp'
	enctype = "multipart/form-data">
	<!-- 답변을 등록하기 위해서 -->
		<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
		<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
		<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
		
		<!-- 페이지와 검색을 유지하기 위해서 -->
		<input name="col" value="<%=request.getParameter("col")%>" type="hidden"> 
		<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
		<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
		
		<!-- 부모글삭제를 막기위해서 -->
		<input name="bbsno" value="<%=request.getParameter("bbsno")%>" type="hidden">
		<TABLE>
			<TR>
				<TH>이름</TH>
				<TD><input type="text" name="wname"></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title"
					value="<%=dto.getTitle()%>의 답변"></TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD><textarea rows="10" cols="50" name="content"></textarea></TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
			<TR>
				<TH>파일명</TH>
				<TD><input type="file" name="filename"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='등록'> <input type="reset"
				value='재입력'> <input type="button" value='취소'
				onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
