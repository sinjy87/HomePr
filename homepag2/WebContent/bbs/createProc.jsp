<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />

<%
	String upDir = "bbs/storage";
	String tempDir = "/bbs/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename = null;
	if(size>0){
	filename = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setFilesize(size);
	dto.setFilename(filename);
	
	boolean flag = bdao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
	function blist() {
		var url = "list.jsp"

		location.href = url;
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">등록</div>
	<DIV class="content">
		<%
			if (flag) {
				out.print("글이 등록되었습니다.");
			} else {
				out.print("글 등록에 실패했습니다.");
			}
		%>
	</DIV>
	<div class="bottom">
		<input type="button" value="계속등록"
			onclick="location.href='createForm.jsp'"> <input
			type="button" value="목록" onclick="blist()">

	</div>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
