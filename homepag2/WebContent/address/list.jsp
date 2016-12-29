<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")){
		word="";
	}
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 5;
	
	int total = adao.total(col, word);
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	Map map  = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<AddressDTO> list1 = adao.list(map);
	Iterator<AddressDTO> iter = list1.iterator();
%>

<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.title{
  font-size: 28px;
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #00ffff; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 30%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

.content{
  font-size: 24px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}

.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style>

<script type="text/javascript">
	function read(no) {
		var url = "read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		location.href = url;
	}
	function update(no) {
		var url = "updateForm.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		location.href = url;
	}
	function del(no) {
		if (confirm("정말삭제하시겠습니까?")) {
			var url = "delete.jsp";
			url += "?no=" + no;
			url += "&col=<%=col%>";
			url += "&word=<%=word%>";
			location.href = url;
		}
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>

	<div class="container">
	<form method="post" action="./list.jsp">
	<select name = "col">
	
	<option value="name"
	<%if(col.equals("name")) out.print("selected='selected'"); %>
	>이름</option>
	
	<option value="phone"
	<%if(col.equals("phone")) out.print("selected='selected'"); %>
	>전화번호</option>
	
	<option value="total">전체</option>
	
	</select>
	<input type = "text" name = "word" value="<%=word%>">
	<input type = "submit" value = "검색">
	<input type = "button" value = "등록">
	</form>
	</div>
	<div class="container">
		<div class="title">주소 목록</div>
	<table class="table table-condensed">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>입력날짜</th>
			<th>수정/삭제</th>
		</tr>
 		<% 
			if (list1.size()==0) {
 		%> 

		<tr> 
			<td colspan="8">등록된 정보가 없습니다.</td> 
 		</tr> 
 		<%
   			} else {
			 	while(iter.hasNext()) {
					AddressDTO dto = iter.next();
		%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><a href="javascript:read('<%=dto.getNo()%>')"> <%=dto.getName()%></a></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getWdate()%></td>
			<td><a href="javascript:update('<%=dto.getNo()%>')">수정</a><br>
				/<a href="javascript:del('<%=dto.getNo()%>')">삭제</a></td>
		</tr>
		<%
			 	}
			}
		%>

	</table>
	</div>
	<div>
	<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
	</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>