<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
  <input type="file" name="uploadFile" multiple="multiple">
</div>
<button id="uploadBtn">Upload</button>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	// p 506 파일의 확장자나 크기의 사전 처리
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;	// 5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	// p 520 <input type="file">의 초기화
	// input type='file'은 readonly라서 안쪽의 내용을 수정할 수 없음. 
	// 별도의 방법으로 초기화시켜야 또다른 첨부파일 추가 가능
	var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click", function(e){
		// FormData 객체 : 가상의 form 태그. 필요한 파라미터를 담아서 전송하는 데 사용
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		for (var i = 0; i < files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			// 첨부파일 데이터를 formData에 추가
			formData.append("uploadFile", files[i]);
		}
		
		// formData 자체를 전송
		// processData, contentType은 반드시 false로 지정해야 함.
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			datatype: 'json',
			success: function(result){
				console.log(result);
				// 첨부파일 다시 추가할 수 있도록 수정
				$(".uploadDiv").html(cloneObj.html());
			}
		});	// ajax
	});
});
</script>
</body>
</html>