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
         		$('#ShowImage').attr('src', e.target.result).width(350).height(350);
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
$(function(){
	$('#form').submit(function(){
		if (!$('input[name=emp_pass]').val().validationPASS()) {
			alert("비밀번호를 바르게 입력해주세요.");
			return false;
		}
		if (($('input[name=emp_pass]').val()) != ($('input[name=emp_pass_confirm]').val())) {
			alert("비밀번호와 동일하게 입력해주세요.");
			return false;
		}
		if ($('input[name=emp_nick]').val() == ""){
			alert("닉네임을 바르게 입력해주세요.");
			return false;
		}
		phone = $('select[name=emp_ph1]').val() + '-' + $('input[name=emp_ph2]').val() + '-' + $('input[name=emp_ph3]').val(); 
		if (!phone.validationPHONE()) {
			alert("전화번호를 바르게 입력해주세요.");
			return false;
		}
		$('input[name=emp_phone]').val(phone);
	
		email = $('input[name=emp_email1]').val() + '@' + $('label[name=emp_email2]').text();
		if (!email.validationMAIL()) {
			alert("이메일을 바르게 입력해주세요.");
			return false;
		}
		$('input[name=emp_email]').val(email);
		$('input[name=emailId]').val($('input[name=emp_email1]').val());
			
		$('select[name=part_code]').val();
		
		var depart = $('#part option:selected').text();
		var dp = depart.replace(/\s/gi, "");
		$('input[name=emp_department]').val(dp);
			
		alert("수정이 완료되었습니다.");
		return true;
	});	

	$('input[value=이력관리]').click(function(){
		var emp_code= $('input[name=emp_code]').val();
		var url =  "${pageContext.request.contextPath}/history/historyList.do?emp_code="+emp_code;
		var options = "width = 900, height = 500, scrollbars = yes";

		window.open(url, "이력관리", options );
	});
	
	$('input[name=part_code]').val('${empInfo.part_code}');
	$('input[name=part_name]').val('${empInfo.part_name}');
	$('input[name=emp_phone]').val('${empInfo.emp_phone}');
	$('select[name=emp_ph1]').val('${empInfo.emp_phone.split('-')[0]}');
	$('input[name=emp_ph2]').val('${empInfo.emp_phone.split('-')[1]}');
	$('input[name=emp_ph3]').val('${empInfo.emp_phone.split('-')[2]}');
	$('input[name=emp_email]').val('${empInfo.emp_email}');
	$('input[name=emp_email1]').val('${empInfo.emp_email.split('@')[0]}');
	$('input[name=emp_email2]').val('${empInfo.emp_email.split('@')[1]}');
	$('input[name=emp_pass]').val('${empInfo.emp_pass}');
	$('input[name=emp_pass_confirm]').val('${empInfo.emp_pass}');
	
	$('input[name=list]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empList.do');
	});
	
    //Initialize Select2 Elements
    $('.select2').select2()

    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-red',
      radioClass   : 'iradio_flat-red'
    });
});
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
	label{
		font-size: 15px;
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
       			<b class="box-title"><h2>직원정보 수정</h2></b>	
           		<div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
           			<br/>
						<form id="form" method="POST" class=form-horizontal" action="${pageContext.request.contextPath}/user/emp/updateEmp.do" enctype="multipart/form-data">
						<div class="form-group">
               				<div class="row">
               					<div class="col-md-4" style="margin: 10px;">
               						<table>
										<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 400px; text-align: center;">
									    	<div align="center" style="margin-left: 50px;">
									    		<img id="ShowImage" src="/img_user/${ufv.user_file_save_name}" style="border-radius: 50%;" width="400" height="400" alt="pic1"/>
									    	</div>
									    	<br/>
									    	<div style="width: 100%" align="center">
												<label class="btn btn-primary btn-file">
											     	사진수정 <input type="file" class="form-control" name="files" style="display: none;" onchange="readURL(this);">
											    </label>
<!-- 												<label class="btn btn-primary btn-file"> -->
<!-- 											     	사진삭제 <input type="button" class="form-control" name="PhotoDelete" style="display: none;"> -->
<!-- 											    </label> -->
											</div>
										</tr>
									</table>
               					</div>
               					<div class="col-md-7">
			                		<div class="row">
			                			<label class="col-sm-3 control-label">사원번호</label>
			                  			<div class="col-sm-6">
			                  				<input type="hidden" name="emp_code" value="${empInfo.emp_code}" />
			                  				<label name="emp_code">${empInfo.emp_code}</label>
	               						</div>                
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">이름</label>
		                  				<div class="col-sm-6">
		                  					<input type="hidden" name="emp_name" value="${empInfo.emp_name}" />
		                  					<label name="emp_name">${empInfo.emp_name}</label>
               							</div>                
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">닉네임</label>
		                  				<div class="col-sm-4">
		                  					<input type="text" name="emp_nick" value="${empInfo.emp_nick}" class="form-control" style="border-radius: 1em;"/>
               							</div>                
               						</div>
               						<c:if test="${LOGIN_EMPINFO.emp_code eq empInfo.emp_code}"> 
               						<div class="row">
			                			<label class="col-sm-3 control-label">비밀번호</label>
		                  				<div class="col-sm-5">
		                  					<input type="password" name="emp_pass" class="form-control" placeholder="비밀번호를 입력해주세요" style="border-radius: 1em;">
               							</div>                
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">비밀번호 확인</label>
		                  				<div class="col-sm-5">
		                  					<input type="password" name="emp_pass_confirm" class="form-control" placeholder="비밀번호를 다시 입력해주세요" style="border-radius: 1em;">
               							</div>                
               						</div>
               						</c:if>
               						<c:if test="${LOGIN_EMPINFO.emp_code != empInfo.emp_code}"> 
		                  					<input type="hidden" name="emp_pass" class="form-control" style="border-radius: 1em;">
		                  					<input type="hidden" name="emp_pass_confirm" class="form-control" style="border-radius: 1em;">
               						</c:if>
			                		<div class="row">
		                				<label class="col-sm-3 control-label">성별</label>
		                  				<div class="col-sm-6">
		                  					<input type="hidden" name="emp_gender" value="${empInfo.emp_gender}" />
		                  					<c:if test="${empInfo.emp_gender eq 'm'}">
						            			<label name="emp_gender" class="flat-red" >남성</label>
		                  					</c:if>
		                  					<c:if test="${empInfo.emp_gender eq 'w'}">
		                  						<label name="emp_gender" class="flat-red" >여성</label>
		                  					</c:if>
						        		</div>
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label" style="margin-top: 3px;">병역여부</label>
			                  			<div class="col-sm-6">
			                  				<c:if test="${empInfo.emp_gender eq 'm'}">
						            			<c:if test="${empInfo.emp_army eq 'y'}">
							            			<label name="emp_army" class="flat-red" >군필</label>
							            			<input type="hidden" name="emp_army" value="y"/>
						            			</c:if>
						            			<c:if test="${empInfo.emp_army eq 'n'}">
							            			<label>
							            				군필&nbsp;
							            				<input type="radio" name="emp_army" value="y" class="flat-red">
							            			</label>
							            			&nbsp;&nbsp;&nbsp;		
						            				<label>
						              					미필&nbsp;	
						               					<input type="radio" name="emp_army" value="n" class="flat-red" checked>
						            				</label>
						            			</c:if>
		                  					</c:if>
		                  					<c:if test="${empInfo.emp_gender eq 'w'}">
		                  						<c:if test="${empInfo.emp_army eq 'y'}">
							            			<label name="emp_army" class="flat-red" >해당사항 없음</label>
							            			<input type="hidden" name="emp_army" value="y" />
						            			</c:if>
		                  					</c:if>
						        		</div>          
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">혼인여부</label>
			                  			<div class="col-sm-6">
						        			<c:if test="${empInfo.emp_marriage eq 'y'}">
						            			<label name="emp_marriage" class="flat-red" >기혼</label>
						            			<input type="hidden" name="emp_marriage" value="y"/>
		                  					</c:if>
		                  					<c:if test="${empInfo.emp_marriage eq 'n'}">
		                  						<label>
							            			미혼&nbsp;
							            			<input type="radio" name="emp_marriage" value="n" class="flat-red" checked>
							            		</label>
							            			&nbsp;&nbsp;&nbsp;		
						            			<label>
						              				기혼&nbsp;	
						               				<input type="radio" name="emp_marriage" value="y" class="flat-red">
						            			</label>
		                  					</c:if>
						        		</div>          
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label" style="margin-top: 3px;">전화번호</label>
		                  				<div class="col-sm-2">
		                  					<input type="hidden" name="emp_phone" />
		                  					<select class="form-control" style="border-radius: 1em;" name="emp_ph1">
		                  						<option value="010" <c:if test = "${empInfo.emp_phone.split('-')[0] eq '010'}">selected </c:if>>010</option>
		                  						<option value="011" <c:if test = "${empInfo.emp_phone.split('-')[0] eq '011'}">selected </c:if>>011</option>
												<option value="016" <c:if test = "${empInfo.emp_phone.split('-')[0] eq '016'}">selected </c:if>>016</option>				        	
												<option value="017" <c:if test = "${empInfo.emp_phone.split('-')[0] eq '017'}">selected </c:if>>017</option>				        	
												<option value="019" <c:if test = "${empInfo.emp_phone.split('-')[0] eq '019'}">selected </c:if>>019</option>				        	
		                  					</select>
			                  			</div>
		                  				<div class="col-sm-1" style="margin: -10px; margin-right: -30px;">
			                  				<b style="font-size: 30px;">-</b>
		                  				</div>
		                  				<div class="col-sm-2">
			                  				<input type="text" name="emp_ph2" class="form-control" style="border-radius: 1em;" >
										</div>
										<div class="col-sm-1" style="margin:-10px; margin-right: -30px;">
			                  				<b style="font-size: 30px;">-</b>
			                  			</div>
			                  			<div class="col-sm-2">
				                  			<input type="text" name="emp_ph3" class="form-control" style="border-radius: 1em;" >
				                  		</div>
		                  			</div>
			                		<div class="row">
					                	<label class="col-sm-3 control-label" style="margin-top: 3px;">이메일</label>
					                		<input type="hidden" name="emp_email" />
										<div class="col-sm-3">
					                  		<input type="text" name="emp_email1" class="form-control" style="border-radius: 1em;">
										</div>
				                  		<div class="col-sm-1">
					                  		<b style="font-size: 20px; margin-right: -50px;">@</b>
				                  		</div>
					                  	<div class="col-sm-3" style="margin-left: -15px !important;">
				                  			<label class="form-control" name="emp_email2" style="border-radius: 1em;" >naver.com</label>
				                  			<input type="hidden" name="emp_email2" value="${empInfo.emp_email.split('@')[1]}"/>
				                  		</div>
			                		</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">전공</label>
		                  				<div class="col-sm-4">
		                  					<input type="type" name="emp_major" value="${empInfo.emp_major}" class="form-control" style="border-radius: 1em;"/>
               							</div>                
               						</div>
		                			<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 3px;">부서</label>
				                  		<div class="col-sm-3">
				                  			<select name="part_code" class="form-control" style="border-radius: 1em;">
				                  				<c:forEach items="${partList }" var="list">
						                  			<option value="${list.part_code}" <c:if test = "${empInfo.part_code eq list.part_code}">selected </c:if>>${list.part_name }</option>
				                  				</c:forEach>
				                  			</select>
		               					</div>
		                			</div>
	                				<div class="row">
                						<label class="col-sm-3 control-label" style="margin-top: 3px;">권한</label>
			                  			<div class="col-sm-3">
<!-- 				                  			<input type="hidden" name="emp_role" /> -->
				                  			<select name="emp_role" class="form-control" style="border-radius: 1em;">
					                  			<option value="DEP" <c:if test = "${empInfo.emp_role eq 'DEP'}">selected </c:if>>개발자</option>
					                  			<option value="MANAGER" <c:if test = "${empInfo.emp_role eq 'MANAGER'}">selected </c:if>>관리자</option>
					                  			<option value="PL" <c:if test = "${empInfo.emp_role eq 'PL'}">selected </c:if>>PL</option>
					                  			<option value="PM" <c:if test = "${empInfo.emp_role eq 'PM'}">selected </c:if>>PM</option>
				                  			</select>
		               					</div>
                					</div>
                					<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 3px;">레벨</label>
				                  		<div class="col-sm-3">
<%-- 				                  			<input type="hidden" name="emp_level" value="${empInfo.emp_level}" /> --%>
				                  			<select name="emp_level" class="form-control" style="border-radius: 1em;">
					                  			<option value="특급" <c:if test = "${empInfo.emp_level eq '특급'}">selected </c:if>>특급</option>
					                  			<option value="고급" <c:if test = "${empInfo.emp_level eq '고급'}">selected </c:if>>고급</option>
					                  			<option value="중급" <c:if test = "${empInfo.emp_level eq '중급'}">selected </c:if>>중급</option>
					                  			<option value="초급" <c:if test = "${empInfo.emp_level eq '초급'}">selected </c:if>>초급</option>
				                  			</select>
		               					</div>
                					</div>
			              			<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">입사일</label>
				                  		<div class="col-sm-5">
											<label name="emp_encpn">${empInfo.emp_encpn.split(' ')[0]}</label>
											<input type="hidden" name="emp_encpn" value="${empInfo.emp_encpn.split(' ')[0]}" />
											<input type="hidden" name="emp_department" />
			              				</div>
			              			</div>
			              			<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">프로젝트 이력</label>
			              				<div class="col-sm-3" style="margin-left: -15px !important;">
											<input type="button" class="form-control bg-yellow color-palette" value="이력관리" style="border-radius: 1em;">
										</div>
			              			</div>
	                			</div>
               				</div>
               			</div>
                		<div class="box-footer clearfix">
			              <input value="취소" type="reset" class="btn btn-sm btn-warning btn-flat pull-right">
			              <c:if test="${LOGIN_EMPINFO.emp_role eq 'MANAGER'}"> 
			              	<input name="list" type="button" value="목록" class="btn btn-sm btn-info btn-flat pull-right">
			              </c:if>
			              <input value="확인" type="submit" class="btn btn-sm btn-danger btn-flat pull-right">
			          	</div>
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	