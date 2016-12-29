<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
String id = request.getParameter("id");
boolean flag = dao.duplicateId(id);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script>
function use() {
	opener.frm.id.value='<%=id%>';
	window.close();
}
</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">아이디 중복확인</DIV>
   <div class ="content">
   입력된 ID = <%=id %><br><br>
   <%
   if(flag){
	   out.print("중복된 아이디 입니다.<br><br>");
   }else{
	   out.print("사용가능한 아이디 입니다.<br><br>");
	   out.print("<input type = 'button' value='아이디 사용' onclick='use()'>");
   }
   %>
   </div>
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='id_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 