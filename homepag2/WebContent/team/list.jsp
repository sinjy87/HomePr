
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")){
		word="";
	}
	
	int nowPage = 1; //현재페이지 ,변경가능
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;// 한페이지당 보여줄 레코드 갯수
	
	int total = tdao.total(col,word);
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	List<TeamDTO> list = tdao.list(map);
	Iterator<TeamDTO> iter = list.iterator();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

div {
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
}

table {
	width: 60%;
	margin: auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}

a:LINK {
	color: #000000;
	text-decoration: none;
}

a:VISITED {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: #ff0000;
	text-decoration: none;
}

a:ACTIVE {
	color: #ff0000;
	text-decoration: none;
}
img{
width: 200px;
height: 200px;
}
</style>
<script type="text/javascript">
	function read(no) {
		var url = "read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function update(no) {
		var url = "updateForm.jsp";
		url+= "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
	function del(no,oldfile) {
		if(confirm("정말삭제하시겠습니까?")){
			var url = "delete.jsp";
			url += "?no="+no;
			url += "&col=<%=col%>";
			url += "&word=<%=word%>";
			url += "&nowPage=<%=nowPage%>";
			url += "&oldfile="+oldfile;
			location.href=url;
		}
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div>팀목록</div>
	<div class="search">
	<form method="post" action="./list.jsp">
	<select name = "col">
	
	<option value="name"
	<%if(col.equals("name")) out.print("selected='selected'"); %>
	>이름</option>
	
	<option value="phone"
	<%if(col.equals("phone")) out.print("selected='selected'"); %>
	>전화번호</option>
	
	<option value="skill"
	<%if(col.equals("skill")) out.print("selected='selected'"); %>
	>보유기술</option>
	
	<option value="total">전체</option>
	
	</select>
	<input type = "text" name = "word" value="<%=word%>">
	<input type = "submit" value = "검색">
	<input type = "button" value = "등록" onclick="location.href='createForm.jsp'">
	</form>
	</div>
	
	
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>보유기술</th>
			<th>사진</th>
			<th>수정/삭제</th>

		</tr>

		<%
			if (list.size()==0) {
		%>
		<tr>
			<td colspan="6">등록된 팀정보가 없습니다.</td>
		</tr>
		<%
			} else {
				while(iter.hasNext()) {
					TeamDTO dto = iter.next();
		%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><a href="javascript:read('<%=dto.getNo()%>')"> <%=dto.getName()%></a></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getSkillstr()%></td>
			<td><img src="./storage/<%=dto.getFilename()%>"></td>
			<td><a href="javascript:update('<%=dto.getNo()%>')">수정</a> /<a
				href="javascript:del('<%=dto.getNo()%>','<%=dto.getFilename()%>')">삭제</a></td>
		</tr>
		<%
			}
			}
		%>

	</table>
	<div>
	<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
	</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
