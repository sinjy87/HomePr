<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<jsp:useBean id="dto" class="team.TeamDTO" />
<%
	String upDir = application.getRealPath("/team/storage");
	String tempDir = application.getRealPath("/team/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	//from의 값을 가져옴.
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setGender(UploadSave.encode(upload.getParameter("gender")));
	dto.setPhone(upload.getParameter("phone"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setHobby(UploadSave.encode(upload.getParameter("hobby")));
	dto.setSkill(UploadSave.encode2(upload.getParameterValues(("skill"))));
	
	//filename 가져오기
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename = null;
	if(size>0){
		filename = UploadSave.saveFile(fileItem, upDir);
	}else{
		filename = "member.jpg";
	}
	dto.setFilename(filename);

	boolean flag = tdao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">


div {
	text-align: center;
	margin-top: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div>
		<%
			if (flag) {
				out.print("팀정보를 등록했습니다.");
			} else {
				out.print("정보 등록을 실패했습니다");
			}
		%>
		<br> <input type="button" value="계속 등록"
			onclick="location.href='./createForm.html'"> <input
			type="button" value="목록" onclick="location.href='./list.jsp'">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>




