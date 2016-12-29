<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	TeamDTO dto = tdao.read(no);
	
	
	
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
	location.href=url;
}
function imgUpdate() {
	var url = "UpdateFileForm.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	url += "&no=<%=no%>";
	url += "&oldfile=<%=dto.getFilename()%>";
	location.href=url;
}

</script>
<style type="text/css">

div{
text-align: center;
margin-top: 20px;
margin-bottom: 20px;
}
table{
width: 60%;
margin: auto;
}
table,th,td{
border: 1px solid black;
border-collapse: collapse;
}

img{
width: 500px;
height: 500px;
}
#ftd{
	text-align: center;
}
</style>

</head>
<body>
	<div>조회</div>
	<table>
		<tr>
			<td colspan="2" id ="ftd"><img
				src='./storage/<%=dto.getFilename()%>'></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=dto.getName()%></td>
		</tr>

		<tr>
			<td>성별</td>
			<td><%=dto.getGender()%></td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td><%=dto.getPhone()%></td>
		</tr>

		<tr>
			<td>주소</td>
			<td><%=dto.getAddress1()%> <br>
				<%=dto.getAddress2()%>
				(<%=dto.getZipcode()%>)
				</td>
		</tr>

		<tr>
			<td>보유기술</td>
			<td><%=dto.getSkillstr()%></td>
		</tr>

		<tr>
			<td>취미</td>
			<td><%=dto.getHobby()%></td>
		</tr>



	</table>
	<div>
	<input type="button" value="생성" onclick="location.href='./createForm.jsp'">
	<input type="button" value="목록" onclick="tlist()">
	<input type="button" value="사진변경" onclick="imgUpdate()">
	<input type="button" value="다운로드" onclick="location.href='<%=root%>/download?dir=/team/storage&filename=<%=dto.getFilename()%>'">
	
</div>
	 <div>
		<% int i = 0;
			
		
		%>
		<img style=" width: 200px ;height:200px;cursor:pointer" src="./storage/member.jpg" onclick="tlist()">
		<img style=" width: 200px;height:200px;cursor:pointer" src="./storage/member.jpg">
		<img src='./storage/<%=dto.getFilename()%>' style=" cursor: pointer; width: 200px;height:200px;">
		<img src='./storage/<%=dto.getFilename() %>' style=" width: 200px ;height:200px;cursor:pointer" >
		<img style=" width: 200px ;height:200px;cursor:pointer" src="./storage/member.jpg">

  	</div>
</body>
</html>
