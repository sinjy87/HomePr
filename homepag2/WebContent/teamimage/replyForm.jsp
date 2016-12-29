<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	ImageDTO dto = idao.readReply(no);
	String nowPage = request.getParameter("nowPage");
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">답변</DIV>
 
<FORM name='frm'
	  method='POST' 
	  action='./replyProc.jsp' 
	  enctype="multipart/form-data">
<!-- 답변을 등록하기 위해서  -->
<input type="hidden" name="gno" value="<%=dto.getGno()%>">
<input type="hidden" name="ino" value="<%=dto.getIno()%>">
<input type="hidden" name="ano" value="<%=dto.getAno()%>">

<!-- 페이지와 검색 유지를 위해서  -->
<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">

<!-- 부모글 삭제를 막기 위해서 -->
<input name="no" value="<%=no%>" type="hidden">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="name"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="45" name="content"></textarea></TD>
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
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>