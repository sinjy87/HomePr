<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="image.ImageDTO" />

	

<% 
		
	
	String tempDir = application.getRealPath("/teamimage/temp");
	String upDir = application.getRealPath("/teamimage/storage");
	
	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setNo(Integer.parseInt(upload.getParameter("no")));
	
	
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	
	FileItem fileItem = upload.getFileItem("filename");
	String filename = null;
	int size = (int)fileItem.getSize();
	if(size>0){
		UploadSave.deleteFile(upDir, oldfile);
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFilename(filename);
	
	
	
	boolean flag = idao.update(dto);
	
	
	
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


<script type="text/javascript">

	function read(){
		var url = "./read.jsp";
		url += "?col=<%=upload.getParameter("col")%>";
		url += "&word=<%=upload.getParameter("word")%>";
		url += "&nowPage=<%=upload.getParameter("nowPage")%>";
		url += "&no=<%=upload.getParameter("no")%>";
		
		location.href=url;
		
	}


</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">수정 결과</DIV>

<div class="content">
		<%if(!oldfile.equals(filename) ){ 
  
	  			if(flag){
					out.println("수정이 성공적으로 되었습니다.");
				}else{
					out.println("수정이 실패 했습니다.");
				}
  
	  			
  		}else {
  				out.println("같은 이름의 파일입니다.");
  		}
  		%>
</div>
  
  <DIV class='bottom'>
  
  
  
  		<%if(!oldfile.equals(filename) ){ 
  
	  			if(flag){ %>

  					<input type='button' value='확인' onclick="javascript:read()">
  					
  				<%}	else{%>

  					<input type='button' value='다시 시도' onclick="history.back()">
  					<input type='button' value='취소' onclick="javascript:read()">
  				<%}
  
	  			
  		}else {%>
  				
  				<input type='button' value='다시 시도' onclick="history.back()">
					
  		<%}%>
	
  </DIV>


 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
