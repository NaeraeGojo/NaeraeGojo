<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>프로필 사진등록</title>
	
	<style type="text/css">
	.img_wrap {
		width: 300px;
		margin-top: 50px;
	}
	.img_wrap img {
		max-width: 100%;
	}
	</style>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js" charset="utf-8"></script>
	<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		var sel_file;
		
		$(document).ready(function(){
			$('#idPic').on("change", handleImgFileSelect);
		});
		
		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f) {
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#img').attr('src', e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		
		var idPicFileName;
		
		function idPicInputChange(fileName) {
			 
			// D:\temp\images\a.png
			var fileInfoArray = fileName.split('\\');
			fileName = fileInfoArray[fileInfoArray.length - 1];

			$('#fileName').val(fileName);

			if (!/\.(jpg|jpeg|gif|png)$/.test(fileName.toLowerCase())) {
				
				alert ('이미지 파일을 선택해주세요.');
				
				return;
			}
			
			var formData = new FormData(); 
			formData.append("file", $("input[name=files]")[0].files[0]);
			
			$.ajax({
		        type : 'post',
		        enctype: 'multipart/form-data',
// 		        processData: false,  // Important!
// 		        contentType: false,
// 		        cache: false,
		        url : '${pageContext.request.contextPath}/history/idFileUpload.do',
		        data : formData,
		        dataType : 'json',
		        error: function(json){
		            alert("에러ㅓ ");
		        },
		        success : function(json){
		        	var idPicFileName = json.user_file_save_name;
					alert(idPicFileName);
					$('#viewTable').html('<img src = "/images/' + idPicFileName + '" width = "200" height = "250" />');
		        	
//		         	$('#'+user_file_code).text(json.user_file_code);
		        	
//		             $('#viewTable').modal('hide');
		        }
		    });
			$('#idPicForm').submit();
			 
		}
		
	</script>
	</head>
	<body>
		<div>
			<h2><b>이미지 미리보기</b></h2>
			<p class="title">이미지 업로드</p>
			<form id="idPicForm" role="form" method="post" enctype="multipart/form-data" >
				<input type="hidden" id="fileName" name="user_file_name"/>
				<input type="file" id="idPic" name="files" onchange = "idPicInputChange(this.value)"/>
			</form>
		</div>
		<div>
			<div class="img_wrap">
				<img id="img" onclick = "popupClose();"/>
			</div>		
		</div>
		
	</body>
	</html>