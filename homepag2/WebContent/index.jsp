<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();
%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>MY Homepag</title>
  <meta charset="utf-8">
<style type="text/css">

img{

	width: 150px;
	height: 150px;
	cursor: pointer;
}
</style>

  <link href="css/style.css" rel="stylesheet"> 
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">자유 게시판</div>
        <div class="panel-body">
        <img src="./images/file.jpg" class="img-responsive" alt="클릭하세요"
        onclick="location.href='<%=root%>/memo/list.jsp'"
        >
        </div>
        
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">이미지 갤러리</div>
        <div class="panel-body">
        <img src="./images/imggedd.gif" class="img-responsive" alt="Image"
        onclick="location.href='<%=root%>/teamimage/list.jsp'"
        >
        </div>
       
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-success">
        <div class="panel-heading">주소 목록</div>
        <div class="panel-body"><img src="./images/address.jpg" class="img-responsive" alt="Image"
        onclick="location.href='<%=root%>/address/list.jsp'"
        ></div>
        
      </div>
    </div>
        <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">업로드 게시판</div>
        <div class="panel-body">
        <img src="./images/bbs.jpg" class="img-responsive" alt="Image"
        onclick="location.href='<%=root%>/bbs/list.jsp'"
        >
        </div>
      
      </div>
    </div>
  </div>
</div>

<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>

