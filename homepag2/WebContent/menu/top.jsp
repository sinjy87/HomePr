<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();

	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%>

<html>
<head>
<style type="text/css">
ul#menu li {
	display: inline;
}

ul#menu li a {
	background-color: black;
	color: white;
	pading: 10px 20px;
	text-decoration: none;
	border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
	background-color: orange;
}
.table{
	width: 100%;
}
.table,.td{
	border-style: none;
}
.img{
	width: 100%;
	height: 100%;
	cursor: pointer;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<div style="background-color: #EEEEEE;">
		<table class="table">
			<tr>
				<td class="td">
				<img class="img" src="<%=root %>/images/sddefault.jpg"
				onclick="location.href='<%=root%>/index.jsp'"
				>
				</td>
			</tr>

			<tr>
				<td class="td">
					<ul id="menu">
						<input type="button"  value="홈" 
						onclick="location.href='<%=root%>/index.jsp'">

   				 <div class="btn-group">
     				 <button type="button"  data-toggle="dropdown">
      					게시판 목록 <span class="caret"></span></button>
      				<ul class="dropdown-menu" role="menu">
        			<li><a href="<%=root%>/memo/list.jsp">자유게시판</a></li>
        			<li><a href="<%=root%>/teamimage/list.jsp">이미지 갤러리</a></li>
        			<li><a href="<%=root%>/address/list.jsp">주소 목록</a></li>
      			</ul>
    		</div>		
    				<div class="btn-group">
     				 <button type="button"  data-toggle="dropdown">
      					자료실 <span class="caret"></span></button>
      				<ul class="dropdown-menu" role="menu">
        			<li><a href="<%=root%>/bbs/list.jsp">업로드 게시판</a></li>
      			</ul>
    		</div>	
					<%if (id==null){ %>	
                        <input type="button" value="회원가입" 
                        onclick="location.href='<%=root%>/member/agreement.jsp'">
                        <input type="button" value="로그인" 
                        onclick="location.href='<%=root%>/member/loginForm.jsp'">
                     <%}else if( id != null && grade.equals("H")){ %> 
                         			<div class="btn-group">
     				 <button type="button"  data-toggle="dropdown">
      					고객센터 <span class="caret"></span></button>
      				<ul class="dropdown-menu" role="menu">
        			<li><a href="<%=root%>/member/read.jsp">나의 정보</a></li>
        			<li><a href="<%=root%>/member/updateForm.jsp">정보 수정</a></li>
        			<li><a href="<%=root%>/member/deleteForm.jsp">회원 탈퇴</a></li>
        			<li><a href="<%=root%>/member/logout.jsp">로그 아웃</a></li>

      			</ul>
    		</div>	
    		<%} %>  
    			<%if(id !=null && grade.equals("A")){ %>
    			<input type="button" value="로그아웃" 
    			onclick="location.href='<%=root%>/member/logout.jsp'">
    			<input type="button" value="회원 목록" 
    			onclick="location.href='<%=root%>/admin/list.jsp'">
    			<%} %>
		</ul>
	</td>
</tr>

		</table>
	</div>
	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 10px;">