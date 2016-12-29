<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	
	
	int no = Integer.parseInt(request.getParameter("no"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	
	ImageDTO dto = idao.read(no);
	
	
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


<script type="text/javascript">




function checkInput(f){
	
	if(f.filename.value==""){
		alert("파일을 변경되지 않았습니다. 변경해주세요");
		f.filename.focus();
		return false;
	}
	
}


</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">정보 수정</DIV>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype="multipart/form-data" onsubmit="return checkInput(this)">
 		 <input type= "hidden" name="col" value =<%=col %>>
		<input type= "hidden" name="word" value =<%=word %>>
		<input type= "hidden" name="nowPage" value =<%=nowPage %>>
		<input type= "hidden" name="no" value =<%=no %>>
		<input type= "hidden" name="oldfile" value =<%=dto.getFilename() %>>
  <TABLE>
  
    <TR>
      <TH>변경전 파일</TH>
      <TD><img src="./storage/<%=dto.getFilename()%>" ></TD>
    </TR>
  
  
    <TR>
      <TH>변경 파일</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
  
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
