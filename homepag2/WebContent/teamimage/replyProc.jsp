<%@ page contentType="text/html; charset=UTF-8" %> 
<%@include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="image.ImageDTO"/>

<%
	String upDir = application.getRealPath("/teamimage/storage");	
	String temDir = application.getRealPath("/teamimage/temp");	

	UploadSave upload = new UploadSave(request,-1,-1,temDir);
	//페이징과 검새을 위한 값
	String nowPage = upload.getParameter("nowPage");
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	//답변을 위한 부모의 값
	dto.setGno(Integer.parseInt(upload.getParameter("gno")));
	dto.setIno(Integer.parseInt(upload.getParameter("ino")));
	dto.setAno(Integer.parseInt(upload.getParameter("ano")));
	
	//부모글 삭제를 제한하기 위해서
	dto.setNo(Integer.parseInt(upload.getParameter("no")));
	
	//form의 입력된 값가져오기
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	//filename 가져오기 
	FileItem fileItem = upload.getFileItem("filename");
	int filesize = (int)fileItem.getSize();
	String filename = null;
	if(filesize>0){
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setFilename(filename);
	
	Map map = new HashMap();
	map.put("gno", dto.getGno());
	map.put("ano", dto.getAno());
	idao.upAno(map);
	boolean flag = idao.createReply(dto);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function blist(){
	var url = "list.jsp";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class="title">처리결과</div>
<DIV class="content">
<%
	if(flag){
		out.print("답변이 등록되었습니다.");
	}else{
		out.print("답변 등록에 실패하였습니다.");
	}

%>
<div class="bottom">
<input type="button" value="계속등록" onclick="location.href='./createForm.jsp'">
<input type="button" value="목록" onclick="blist()">
</div>
</DIV>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>