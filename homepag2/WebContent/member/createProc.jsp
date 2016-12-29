<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="member.MemberDTO" />
<%
	String upDir = "member/storage";
	String tempDir = "/member/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = (UploadSave)request.getAttribute("upload");
	
	//form의 값을 받는다.
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setEmail(upload.getParameter("email"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setJob(upload.getParameter("job"));
	
	//form의 선택한 파일 받기
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	String fname = null;
	if(size>0){
		fname = UploadSave.saveFile(fileItem, upDir);
	}else{
		fname = "member.jpg";
	}
	boolean flag = dao.create(dto);
	
	dto.setFname(fname);

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
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">회원가입 처리</DIV>

	

	<DIV class='content'>
<%if(flag){ %>
	<%="아이디를 생성했습니다." %><br><br>
	<input type='submit' value='로그인' onclick = "location.href='loginForm.jsp'"> <input type='button' value='홈'
		onclick="location.href='../index.jsp'">
<%}else{ %>
	<%="아이디 생성에 실패했습니다." %><br><br>
	<input type='submit' value='다시시도' onclick = "history.back"> <input type='button' value='홈'
		onclick="location.href='../index.jsp'">
<%} %>
</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
