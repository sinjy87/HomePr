<%@page import="oracle.net.aso.b"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
int no = Integer.parseInt(request.getParameter("no"));
String passwd= request.getParameter("passwd");
String oldfile=request.getParameter("filename");
String updir=application.getRealPath("/teamimage/storage");

	String col =request.getParameter("col");
	String word =request.getParameter("word");
	String nowPage =request.getParameter("nowPage");
	
	Map map= new HashMap();
	map.put("no",no);
	map.put("passwd",passwd);
	
	boolean pflag=idao.passwd(map);
	boolean flag= false;
	
	if(pflag){
		flag=idao.delete(no);
	UploadSave.deleteFile(updir, oldfile);
	
}


%>
  
 
<!DOCTYPE html> 
 
<html> 
 
<head> 
 
<meta charset="UTF-8"> 
 
<title></title> 
 

 <script type="text/javascript">
 function b() {
		var url="list.jsp";
		
		url+="?col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href=url;
		
				}

 </script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
 
 
<DIV class="title">삭제확인</DIV>
 
 
<div class="content">
<%if(pflag==false){ 
out.print("비밀번호가 같지 않습니다");
%>  <DIV class='bottom'>
   <input type="button" value='다시시도' onclick="history.back()">
 
    <input type='button' value='목록' onclick="b()">
  </DIV> 


<%}else if(flag){ 
   out.print("삭제 성공하였습니다");
%>
  <DIV class='bottom'>
      <input type='button' value='목록' onclick="b()">
  </DIV>
 
 

<%}else{ 
  out.print("삭제 실패하였습니다");%>
    <DIV class='bottom'>
     
 
     <input type="button" value='다시시도' onclick="history.back()">
 
    <input type='button' value='목록' onclick="b()">
  </DIV>

<%} %>
</div>

  

 

 


<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>

<!-- *********************************************** -->
 
</html> 
 