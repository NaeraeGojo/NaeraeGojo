<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
//화면에 파일 띄우기
function readURL(input) {
   	pathpoint = input.value.lastIndexOf('.');
   	filepoint = input.value.substring(pathpoint+1, input.length);
   	filetype = filepoint.toLowerCase();
   	if(filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='jpeg'){
		if (input.files && input.files[0]) {
	      	var reader = new FileReader();
	      	
	      	reader.onload = function(e) {
	        	$('#ShowImage').attr('src', e.target.result).width(235).height(315);
	     	};
	      	reader.readAsDataURL(input.files[0]);
	   }
   	}
   	else{
   		alert('이미지 파일만 선택할 수 있습니다.');
   		parentObj = input.parentNode;
   		node = parentObj.replaceChild(input.cloneNode(true), input);
   		return false;
   	}
}

$(function() {
	document.getElementById('now_date').valueAsDate = new Date();
	
	$('.insertbtn').click(function() {
		email = $('input[name=emp_email1]').val() + '@' + $('label[name=emp_email2]').text();
		if (!email.validationMAIL()) {
			alert("이메일을 바르게 입력해주세요.");
			return false;
		}
		$('input[name=emp_email]').val(email);

		if (!$('input[name=emp_name]').val().validationNM()) {
			alert("성명을 바르게 입력해주세요. 2-4자리 한글로 입력해주세요.");
			return false;
		}
		phone = $('select[name=emp_phone1]').val() + '-' + $('input[name=emp_phone2]').val() + '-' + $('input[name=emp_phone3]').val(); 
		if (!phone.validationPHONE()) {
			alert("전화번호를 바르게 입력해주세요.");
			return false;
		}
		$('input[name=emp_phone]').val(phone);
					

		$('input[name=emailId]').val($('input[name=emp_email1]').val());
			
		if (!$('input[name=emp_encpn]').val().validationENCPN()) {
			alert("입사일을 입력해주세요.");
			return false;
		}
		if ($('input[name=emp_major]').val() == ""){
			alert("전공을 입력해주세요.");
			return false;
		}
		$('select[name=part_code]').val();
		
		var nick =$('#part option:selected').text()+"_"+$('input[name=emp_name]').val();
		var nickname = nick.replace(/\s/gi, "");
		$('input[name=emp_nick]').val(nickname);
		
		var email00 = $('input[name=emp_email]').val();
		
		$.ajax({
			 url : '${pageContext.request.contextPath}/user/emp/mailCheck.do',
			 type : 'post',
			 data : { emp_email : email00 },
			 dataType : 'json',
			 success : function(json) {
				 alert("해당 이메일을 사용할 수 있습니다.");
				 $('#form_emp').submit();
			}
			 ,
			 error : function(result) {
				 alert("중복된 이메일로 사용할 수 없습니다.");
			}
		});
		
	});	
	
	$('input[name=list]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empList.do');
		//(이전 페이지 이동으로 수정할 예정)
	});
	
});
			

$(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-red',
      radioClass   : 'iradio_flat-red'
    })
  })
</script>
<style>
	.fieldName {text-align: center; background-color: #f4f4f4;}
	.tLine {background-color: #d2d2d2; height: 1px;}
	.btnGroup { text-align: right; }
	td {text-align: left; }
	.row{margin-bottom:10px;}
	.control-label{
		font-size: 18px;
		margin-right: -20px;
	}
	  .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }
	
    .example-modal .modal {
      background: transparent !important;
    }
 
</style>
	<br/>
<div class="row">
	<br/>
	<div class="col-md-11" style="margin-left: 40px;">
		<div class="box box-info">		<!-- 테이블을 넣을 박스 기본설정 warning일 경우 진한 노랑색 (수정해도 됨)-->
           	<div class="box-header with-border">	<!-- 테이블 위에 header부분(기본설정) -->
       			<b class="box-title"><h2>직원등록</h2></b>	
           		<div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
           			<br/>
           			<div class=form-horizontal">
						<form id="form_emp" method="POST" action="${pageContext.request.contextPath}/user/emp/insertEmp.do" enctype="multipart/form-data">
						<div class="form-group">
               				<div class="row">
               					<div class="col-md-4" style="margin: 10px;">
               						<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border: none;">
										<tr><td class="tLine" colspan="2"></td></tr>
										<tr>
											<td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
									        	<div align="center">
									        	<img id="ShowImage" src="" />
									        	</div>
									        	<div style="width: 100%" align="center">
									        	<br/>
									            	<label class="btn btn-primary btn-file">
									                    	프로필 사진 추가 <input type="file" class="form-control" name="files" accept="image/gif, image/jpeg, image/png" style="display: none;" onchange="readURL(this);">
									             	</label>
									            	size : 235x315 이하
									         	</div>
										</tr>
									</table>
               					</div>
               					<div class="col-md-7">
			                  				<input type="hidden" name="emailId" class="form-control">
			                		<div class="row">
			                			<label class="col-sm-3 control-label">이름</label>
		                  				<div class="col-sm-6">
		                  					<input type="text" name="emp_name" class="form-control" placeholder="이름을 입력해주세요" style="border-radius: 1em;">
               							</div>                
               						</div>
		                  					<input type="hidden" name="emp_nick" class="form-control" placeholder="닉네임을 입력해주세요.   ex)부서명_이름" style="border-radius: 1em;">
		                  					<input type="hidden" name="emp_pass" class="form-control" value="${password }" style="border-radius: 1em;">
<!-- 			                		<div class="row"> -->
<!-- 			                			<label class="col-sm-3 control-label">비밀번호 확인</label> -->
<!-- 		                  				<div class="col-sm-6"> -->
<!-- 		                  					<input type="password" name="emp_pass_confirm" class="form-control" placeholder="비밀번호를 다시 입력해주세요" style="border-radius: 1em;"> -->
<!--                							</div>                 -->
<!--                						</div> -->
			                		<div class="row">
		                				<label class="col-sm-3 control-label">성별</label>
		                  				<div class="col-sm-6">
						        			<label>
						            			남&nbsp;	
						            			<input type="radio" name="emp_gender" value="m" class="flat-red" checked>
						            		</label>
						            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
						            		<label>
						              			여&nbsp;	
						               			<input type="radio" name="emp_gender" value="w" class="flat-red">
						            		</label>
						        		</div>
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label" style="margin-top: 3px;">병역여부</label>
			                  			<div class="col-sm-6" style="margin-top: 3px;">
						        			<label>
						            			군필&nbsp;	
						            			<input type="radio" name="emp_army" value="y" class="flat-red" checked>
						            		</label>
						            		&nbsp;&nbsp;&nbsp;		
						            		<label>
						              			미필&nbsp;	
						               			<input type="radio" name="emp_army" value="n" class="flat-red">
						            		</label>
						        		</div>          
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">혼인여부</label>
			                  			<div class="col-sm-6" style="margin-top: 3px;">
						        			<label>
						            			미혼&nbsp;	
						            			<input type="radio" name="emp_marriage" value="n" class="flat-red" checked>
						            		</label>
						            		&nbsp;&nbsp;&nbsp;		
						            		<label>
						              			기혼&nbsp;	
						               			<input type="radio" name="emp_marriage" value="y" class="flat-red">
						            		</label>
						        		</div>          
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label" style="margin-top: 3px;">전화번호</label>
		                  				<div class="col-sm-2">
		                  					<input type="hidden" name="emp_phone" value="" />
			                  				<select class="form-control" style="border-radius: 1em;" name="emp_phone1">
			                  					<option value="010" selected="selected">010</option>
			                  					<option value="011">011</option>
			                  					<option value="016">016</option>
			                  					<option value="017">017</option>
			                  					<option value="019">019</option>
			                  				</select> 
		                  				</div>
		                  				<div class="col-sm-1" style="margin: -10px; margin-right: -30px;">
			                  				<b style="font-size: 30px;">-</b>
		                  				</div>
										<div class="col-sm-2">
			                  				<input type="text" name="emp_phone2" class="form-control" style="border-radius: 1em;">
										</div>
										<div class="col-sm-1" style="margin:-10px; margin-right: -30px;">
			                  				<b style="font-size: 30px;">-</b>
			                  			</div>
			                  			<div class="col-sm-2">
				                  			<input type="text" name="emp_phone3" class="form-control" style="border-radius: 1em;">
				                  		</div>
	                				</div>
			                		<div class="row">
					                	<label class="col-sm-3 control-label" style="margin-top: 3px;">이메일</label>
										<div class="col-sm-3">
					                		<input type="hidden" id="emailtext" name="emp_email" value="" />
					                  		<input type="text" name="emp_email1" class="form-control" style="border-radius: 1em;">
										</div>
				                  		<div class="col-sm-1">
					                  		<b style="font-size: 20px; margin-right: -50px;">@</b>
				                  		</div>
					                  	<div class="col-sm-3" style="margin-left: -15px !important;">
				                  			<label class="form-control" name="emp_email2" style="border-radius: 1em;">naver.com</label>
										</div>
			                		</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">전공</label>
		                  				<div class="col-sm-6">
		                  					<input type="text" name="emp_major" class="form-control" placeholder="전공을 입력해주세요" value="" style="border-radius: 1em;">
               							</div>                
               						</div>
		                			<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 3px;">부서</label>
				                  		<div class="col-sm-3">
				                  			<select name="part_code" id="part" class="form-control" style="border-radius: 1em;">
				                  				<c:forEach items="${partList }" var="list">
				                  					<option value="${list.part_code}">
				                  					${list.part_name }
				                  					</option>
				                  				</c:forEach>
				                  			</select>
		               					</div>
		                			</div>
	                				<div class="row" hidden="true">
                						<label class="col-sm-3 control-label" style="margin-top: 3px;">권한</label>
			                  			<div class="col-sm-3">
				                  			<input type="text" name="emp_role" value="DEP"></option>
		               					</div>
                					</div>
<!-- 		                			<div class="row"> -->
<!-- 	                					<label class="col-sm-3 control-label" style="margin-top: 3px;">직책</label> -->
<!-- 				                  		<div class="col-sm-3"> -->
<!-- 			                  			<select class="form-control" style="border-radius: 1em;"> -->
<!-- 			                  				<option selected="selected">직책을 선택해주세요</option> -->
<%-- 				                  			<c:forEach items="${pList}" var="plist">
 			                  					<option value="${plist.position_code}">${plist.position_name}</option> 
				                  			</c:forEach> --%>
<!-- 			                  			</select> -->
<!-- 	               						</div> -->
<!--                 					</div> -->
                					<div class="row" hidden="true">
				                		<label class="col-sm-3 control-label" style="margin-top: 3px;">레벨</label>
				                  		<div class="col-sm-3">
				                  			<input type="text" name="emp_level" value="초급"></option>
		               					</div>
                					</div>
                					<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">입사일</label>
				                  		<div class="col-sm-5">
											<input type="date" name="emp_encpn" id="now_date" class="form-control" style="border-radius: 1em;"/>
			              				</div>
			              			</div>
			              				<input type="hidden" name="emp_delete" value="w" />
								</div>
               				</div>
               			</div>
                		<div class="box-footer clearfix">
			              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
			              <input name="list" value="목록" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right">
			              <input value="등록" type="button" class="insertbtn btn btn-sm btn-danger btn-flat pull-right">
			          	</div>
					</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
   