<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")){
		word="";
	}
	//페이징관련---------------------------
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage=5;
	
	//DB에서 가져올 순번 --------------------
	int sno = ((nowPage-1) * recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	int total=dao.total(col, word);
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int totalRecode = bdao.total(col,word);
	List<BbsDTO> list = bdao.list(map);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
img{
	width: 20px;
	height: 20px; 
}
/* 제목 */
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
 
/* 내용 */
.content{
  font-size: 24px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}
 
/* 하단 메뉴 */
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}

</style>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>" ;
		url += "&word=<%=word%>" ;
		location.href = url;
	}	
	function read(bbsno) {
		var url = "read.jsp";
		url += "?bbsno=" + bbsno;
		url += "&col=<%=col%>" ;
		url += "&word=<%=word%>" ;
		url += "&nowPage=<%=nowPage%>" ;
		location.href = url;
	}
	function down(filename) {
		var url="<%=root%>/download";
		url += "?dir=/bbs/storage";
		url += "&filename="+filename;
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->


	<div class="container">
		<form method="post" action="./list.jsp">
			<select name="col">
				<!-- 검색할 컬럼 -->
				<option value="wname"
				<%if(col.equals("wname")) out.print("selected='selected'");%>
				>이름</option>
				<option value="title"
				<%if(col.equals("title")) out.print("selected='selected'");%>
				>제목</option>
				<option value="content"
				<%if(col.equals("content")) out.print("selected='selected'");%>
				>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<!-- 검색어 -->
			<input type="submit" value="검색"> <input type='button'
				value='계속등록' onclick="location.href='./createForm.jsp'">

		</form>
	</div>
	
	<div class="container">
	<DIV class="title">게시판 목록</DIV>
	<table class="table table-hover">
		<TR>
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>이름</TH>
			<TH>조회수</TH>
			<TH>등록일</TH>
			<th>파일명</th>
		</TR>

		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="8">등록된 글이 없습니다.</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					BbsDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getBbsno()%></td>
			<td>
				<%
					for (int j = 0; j < dto.getIndent(); j++) {
								out.print("&nbsp;&nbsp;");
							}
							if (dto.getIndent() > 0) {
				%> <img src="<%=root %>/images/re.jpg" > <%
 	}
 %> <a href="javascript:read('<%=dto.getBbsno()%>')"> <%=dto.getTitle()%>
			</a>
			<%if(Utility.compareDay(dto.getWdate())){ %>
			
			<img src = "<%=root %>/images/new1.gif">
			<%} %>
			</td>
			<td><%=dto.getWname()%></td>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getWdate()%></td>
			<td>
			<% if(dto.getFilename()==null){
				out.print("파일 없음");
			}else{ %>
			
				<a href='javascript:down("<%=dto.getFilename()%>")'>
				<span class='glyphicon glyphicon-file'></span>
				</a>
				
			<%}%>
			
			
			</td>
			
		</tr>
		<%
			}
			}
		%>

	</TABLE>
</div>

	<DIV class='bottom'>
		<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
	</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
