<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));

	ImageDTO dto = idao.read(no);
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word")) ;
	String nowPage = request.getParameter("nowPage");
	
	idao.upViewcnt(no);
	
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	function read(no) {
		var url = "./read.jsp";
		url += "?no="+no;
		url +="&col=<%=col%>";
		url +="&word=<%=word%>";
		url +="&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
	function ilist() {
		var url ="list.jsp";
		
		url +="?col=<%=col%>";
		url +="&word=<%=word%>";
		url +="&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
	function update() {
		var url ="updateForm.jsp";
		
		url += "?no=<%=no%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
	function idelete() {
		var url ="deleteForm.jsp";
		
		url +="?col=<%=col%>";
		url +="&word=<%=word%>";
		url +="&nowPage=<%=nowPage%>";
		url +="&no=<%=no%>";
		url +="&filename=<%=dto.getFilename()%>"
		
		location.href = url;
	}
	function reply() {
		var url ="replyForm.jsp";
		
		url +="?col=<%=col%>";
		url +="&word=<%=word%>";
		url +="&nowPage=<%=nowPage%>";
		url +="&no=<%=no%>";
		
		location.href = url;
	}

	
</script>


<style type="text/css">
.curImg{
	margin-right:0;
	border-style:solid;
	border-width: 3px;
	border-color: red;
}
.td_padding{
	padding:5px 5px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
	<!-- *********************************************** -->

	<DIV class="title">조회</DIV>

	<TABLE>

		<TR>
			<TD colspan="2">
			<img src="./storage/<%=dto.getFilename()%>" style=" width: 80%">
			</TD>
		</TR>

	</TABLE>

	<br>

	<TABLE>
		<TR>
			<TD>번호 : <%=dto.getNo() %></TD>
		</TR>

		<TR>
			<TD>이름 : <%=dto.getName() %></TD>
		</TR>

	</TABLE>

	<br>

	<table>
		<TR>
			<TH width="30%">내용</TH>
			<td><%=dto.getContent() %></td>
		</TR>
	</table>
	<div class="bottom">
	<input type="button" value="수정" onclick="update()">
	<input type="button" value="삭제" onclick="idelete()">
	<input type="button" value="목록" onclick="ilist()">
	<input type="button" value="답변" onclick="reply()">
	</div>

	<table>
	<tr>
	<%
	List list = idao.sumnail(no);
	String[] files = (String[])list.get(0);
	int[] noArr = (int[])list.get(1);
	for(int i=0; i<5; i++){
		if(files[i]==null){
		%>
		<td><img src = "./storage/1.png" width="90px" ></td>
		<%
		}else{
			if(noArr[i]==no){
				%>
				<td class="td_padding">
				<a href="javascript:read('<%=noArr[i] %>')">
				<img class = "curImg" src = "./storage/<%=files[i]%>" width="90px" border="0">
				</a></td>
				<%
			}else{
				%>
				<td class="td_padding">
				<a href ="javascript:read('<%=noArr[i] %>')">
				<img src="./storage/<%=files[i] %>" width="80px" border="0">
				</a></td>
				<%
			}
		}
	}
	
	%>
	</tr>
	</table>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>
