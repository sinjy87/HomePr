<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	
	
	bdao.upViewcnt(bbsno); //조회수 증가
	BbsDTO dto = bdao.read(bbsno);// 한건의 데이터 읽어오기
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";		
		url += "&nowPage=<%=nowPage%>";		
		location.href = url;
	}
	function bupdate() {
		var url = "updateForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";	
		url += "&nowPage=<%=nowPage%>";		
		location.href = url;
	}
	function bdelete() {
		var url = "deleteForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";	
		url += "&nowPage=<%=nowPage%>";		
		url += "&oldfile=<%=dto.getFilename()%>";				
		location.href = url;
	}
	function breply() {
		var url = "replyForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";		
		location.href = url;
	}
	function down(filename) {
		var url="<%=root%>/download";
		url += "?dir=/bbs/storage";
		url += "&filename="+filename;
		location.href = url;
	}
</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">조회</DIV>

	<TABLE style="width: 40%">
		<TR>
			<TH>번호</TH>
			<td><%=dto.getBbsno()%></td>
		</TR>
		<TR>
			<TH>이름</TH>
			<td><%=dto.getWname()%></td>
		</TR>
		<TR>
			<TH>제목</TH>
			<td><%=dto.getTitle()%></td>
		</TR>
		<TR>
			<TH>내용</TH>
			<td><%=dto.getContent()%></td>
		</TR>
		<TR>
			<TH>입력날짜</TH>
			<td><%=dto.getWdate()%></td>
		</TR>
		<TR>
			<TH>조회수</TH>
			<td><%=dto.getViewcnt()%></td>
		</TR>
		<TR>
			<TH>파일명</TH>
			<td>
				<%if(dto.getFilename()==null) {
				out.print("파일없음");
			}else{ %> 
			<%=dto.getFilename()%>(<%=dto.getFilesize()/1024 %>KB) 
			
				<a href = "javascript:down('<%=dto.getFilename()%>')">
				<span class='glyphicon glyphicon-file'></span>
				</a>
				
				<%} %>
			</td>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='등록'
			onclick="location.href='createForm.jsp'"> <input
			type="button" value='목록' onclick="blist()"> <input
			type="button" value='수정' onclick="bupdate()"> <input
			type="button" value='삭제' onclick="bdelete()"> <input
			type="button" value='답변' onclick="breply()">
	</DIV>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
