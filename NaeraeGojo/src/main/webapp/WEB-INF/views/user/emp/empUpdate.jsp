<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function() {
	$('input[name=list]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empList.do');
		//(이전 페이지 이동으로 수정할 예정)
	});
	
	$('form').submit(function(){
		if (!$('input[name=emp_pass]').val().validationPASS()) {
			alert("비밀번호를 바르게 입력해주세요.");
			return false;
		}
		if (($('input[name=emp_pass]').val()) != ($('input[name=emp_pass_confirm]').val())) {
			alert("비밀번호와 동일하게 입력해주세요.");
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
			
		alert("수정이 완료되었습니다.");
		return true;
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
	
	// 주소찾기	
// 	$('#zipCodeBtn').click(function() {
// 		// 팝업 : 모달 - 해당 팝업이 포커스 점유
// 		//      모달리스 - 팝업의 포커스 다른 윈도우와 천이
// 		var url = "${pageContext.request.contextPath}/user/member/zipcodeSearch.do";
// 		var options = "width = 375, height = 400, scrollbars = no";
		
// 		window.open(url, "우편번호검색", options);
// 	});
	
	// 프로필 사진 업로드				
// 	$('#picUpload').click(function() {
// 		var url = "${pageContext.request.contextPath}/user/member/idPicFileUpload.do";
// 		var options = "width = 375, height = 400, scrollbars = no";
	
// 		window.open(url, "증명사진업로드", options);
// 	});
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
						<form method="POST" class=form-horizontal" action="${pageContext.request.contextPath}/user/emp/updateEmp.do">
						<div class="form-group">
               				<div class="row">
               					<div class="col-md-4" style="margin: 10px;">
               						<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border: none;">
										<tr><td class="tLine" colspan="2"></td></tr>
										<tr>
											<td class="pic" style="vertical-align: bottom; width: 150px; height: 300px; text-align: center;">
												<div id = "idPicViewDiv" >
													<img src = "/image/${facePictureFileName}" width="235" height="315">
												</div>
<%-- 												<img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" id = "picUpload" title="인적사항에 올릴 증명을 검색합니다." style="cursor: pointer;"/><br/> --%>
<!-- 												<div style="width: 100%" align="center"> -->
<!-- 													size : 235x315 이하 -->
<!-- 												</div> -->
											</td>
										</tr>
									</table>
               					</div>
               					<div class="col-md-7">
			                		<div class="row">
			                			<label class="col-sm-3 control-label">사원번호</label>
			                  			<div class="col-sm-6">
			                  				<input type="hidden" name="emp_code" value="${empInfo.emp_code}" />
			                  				<label name="emp_code2">${empInfo.emp_code}</label>
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
			                			<label class="col-sm-3 control-label">비밀번호</label>
		                  				<div class="col-sm-6">
		                  					<input type="password" name="emp_pass" class="form-control" placeholder="비밀번호를 입력해주세요" style="border-radius: 1em;">
               							</div>                
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">비밀번호 확인</label>
		                  				<div class="col-sm-6">
		                  					<input type="password" name="emp_pass_confirm" class="form-control" placeholder="비밀번호를 다시 입력해주세요" style="border-radius: 1em;">
               							</div>                
               						</div>
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
					                  		<input type="text" name="emp_email1" class="form-control" style="border-radius: 1em;" value="">
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
		                  				<div class="col-sm-6">
		                  					<label name="emp_major">${empInfo.emp_major}</label>
		                  					<input type="hidden" name="emp_major" value="${empInfo.emp_major}" />
               							</div>                
               						</div>
			                		<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 3px;">프로젝트 이력</label>
				                  		<div class="col-sm-6">
			                  				<input type="text" class="form-control" placeholder="프로젝트 이력을 입력해주세요" style="border-radius: 1em;">
		               					</div>                
		               					<div class="col-sm-2" style="margin-left: -15px !important;">
		               						<input type="button" class="form-control bg-light-blue color-palette" value="프로젝트 이력" style="border-radius: 1em;">
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
				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">자격증</label>
				                  		<div class="col-sm-5">
				                  			<select class="form-control" style="border-radius: 1em;">
				                  			</select>
		               					</div>                
			              			</div>
			              			<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">입사일</label>
				                  		<div class="col-sm-5">
											<label name="emp_encpn">${empInfo.emp_encpn}</label>
											<input type="hidden" name="emp_encpn" value="${empInfo.emp_encpn}" />
			              				</div>
			              			</div>
			              			<input type="hidden" name="emp_delete" value="n" />
	                			</div>
               				</div>
               			</div>
                		<div class="box-footer clearfix">
			              <input value="취소" type="reset" class="btn btn-sm btn-warning btn-flat pull-right">
			              <input name="list" type="button" value="목록" class="btn btn-sm btn-info btn-flat pull-right">
			              <input value="확인" type="submit" class="btn btn-sm btn-danger btn-flat pull-right">
			          	</div>
						</form>
					</div>
					</div>
					
				
				</div>
			</div>
		</div>
	</div>