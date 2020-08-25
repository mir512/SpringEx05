<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h3>uploadForm.jsp</h3>
<!-- form 방식으로 첨부파일 처리 -->
<form action="uploadFormAction" method="post" enctype="multipart/form-data">
  <!-- multiple 속성 : 하나의 input 태그로 여러 개의 파일을 업로드 할 수 있음. -->
  <input type="file" name="uploadFile" multiple="multiple">
  <button>Submit</button>
</form>
</body>
</html>