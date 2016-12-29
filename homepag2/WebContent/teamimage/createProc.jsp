<%@include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="image.ImageDTO"></jsp:useBean>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String upDir = application.getRealPath("/teamimage/storage");
	String tempDir = application.getRealPath("/teamimage/temp");

	UploadSave upload = new UploadSave(request,-1,-1,tempDir);

	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setFilename(UploadSave.encode(upload.getParameter("filename")));
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int) fileItem.getSize();
	String filename = null;
	if (size > 0) {
		filename = UploadSave.saveFile(fileItem, upDir);

	} else {
		filename = "image.jpg";
	}

	dto.setFilename(filename);

	boolean flag = idao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function ilist() {
	var url = "list.jsp"
	
	location.href = url;
	
}

</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
	<!-- *********************************************** -->

	<DIV class="title">작성 확인</DIV>

	<FORM name='frm' method='POST' action='./.do'>
	
	<div class=content>	<%
			if (flag) {
				out.print("작성 성공!");
		%>
		<%
			} else {
				out.print("작성 실패!");
			}
		%>
</div>

		<DIV class='bottom'>
			<input type="button" value='계속등록' onclick="location.href='createForm.jsp'" > 
			<input type='button' value='목록' onclick="ilist()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>
