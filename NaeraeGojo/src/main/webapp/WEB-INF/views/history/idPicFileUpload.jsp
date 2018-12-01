<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}

#hiddenFileInput{
	position : relative;
	width : 80px; 
	height:30px; 
	overflow:hidden; 
	cursor:pointer; 
	background-image:url('${pageContext.request.contextPath}/image/bt_search.gif');
	background-repeat: no-repeat;
}

#idPic{
	width:80px; 
	height:30px; 
	filter:alpha(opacity=0); 
	opacity:0; 
	-moz-opacity:0; 
	cursor:pointer;
	vertical-align: middle;
}
.bar {
    height: 18px;
    background: green;
}

</style>

<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.js"></script>

<!-- 

	★ ajax form 기반 파일 전송 ★
	1. http://malsup.com/jquery/form/#download 접속
	2. jquery.form.js 눌러서 D:\C_Lib\ajaxform 에 다운로드
	3. js 폴더에 import 시키기

 -->
 
<script type = "text/javascript" src = "${ pageContext.request.contextPath }/js/jquery.form.js"></script>
<script type = "text/javascript">
 
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
        processData: false,  // Important!
        contentType: false,
        cache: false,
        url : '${pageContext.request.contextPath}/history/idFileUpload.do',
        data : formData,
        dataType : 'json',
        error: function(xhr, status, error){
            alert("에러ㅓㅓcv     " + xhr.status);
        },
        success : function(json){
        	alert("아무거나");
        	var idPicFileName = json.user_file_save_name;
			alert(idPicFileName);
			$('#viewTable').html('<img src = "/images/' + idPicFileName + '" width = "200" height = "250" />');
        	
//         	$('#'+user_file_code).text(json.user_file_code);
        	
//             $('#viewTable').modal('hide');
        }
    });
	
	// ajaxForm 은 jquery.form.js 가 있어서 쓸 수 있다.
// 	$('#idPicForm').ajaxForm({
// 		type : 'POST',
// 		dataType : 'json',
// 		error : function(request, status, error) {
// 		             //통신 에러 발생시 처리
// 		             alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
// 		},
		
// 		success : function(result) {
			
// 			// a.png
			
// 			// 이미지 업로드
// 			// 1. Doc. Base - D:\temp\images
// 			// 2. Path      - \image
// 			idPicFileName = result.fileName;
// 			alert(idPicFileName);
// 			$('#viewTable').html('<img src = "/images/' + idPicFileName + '" width = "200" height = "250" onclick = "popupClose();"/>');
			
// 		}
	
// 	});
	
	$('#idPicForm').submit();
 
}
 
function popupClose() {
	 
	// 부모
	$(opener.document).find('#idPicViewDiv').html('<img src = "/images/' + idPicFileName + '" width = "150" height = "200"/>');
	
	self.close();
	 
	 
}
 
</script>
 
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30" style="text-align: center;"><font color="red" size="5">증명 사진 업로드</font></td>
		</tr>
		<tr>
			<td><img src="${pageContext.request.contextPath }/image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="${pageContext.request.contextPath }/image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="${pageContext.request.contextPath }/image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25">
							<div align="center">등록하려는 사진(gif | jpg | jpeg | png)를 선택해주세요.</div>
						</td>
					</tr>
					<tr>
						<td height="38" background="${pageContext.request.contextPath }/image/open_tt.gif" align="center">
							<form id="idPicForm" role="form" method="post" enctype="multipart/form-data" >
								<input type="text" id="fileName" name="user_file_name"/>
								<span id="hiddenFileInput">
	    							<input type="file" id="idPic" name="files" onchange = "idPicInputChange(this.value)"/>
								</span>
							</form>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="${pageContext.request.contextPath }/image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>