<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%    
String upDir = "member/storage";
String tempDir = "/member/temp";

upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);

UploadSave upload = new UploadSave(request,-1,-1,tempDir);

//form의 값을 받는다.
String id = UploadSave.encode(upload.getParameter("id"));
String email = upload.getParameter("email");
String str = "";
if(dao.duplicateId(id)){
	str="중복된 아이디 입니다. 아이디중복 확인을 하세요";
}else if(dao.duplicateEmail(email)){
	str = "중복된 이메일 입니다. 이메일중복 확인을 하세요";
}else{
	request.setAttribute("upload", upload);
	//createProc.jsp로 이동
%> 
	
	<jsp:forward page="/member/createProc.jsp"/>
	
<%	return;
	}
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
 
<DIV class="title">아이디및 이메일 중복확인</DIV>
 

<div class = "content">
  <%=
  str
  %>
  </div>
  <DIV class='bottom'>
    <input type='button' value='다시시도'onclick="history.back()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 