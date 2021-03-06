<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function() {
// 	$('#email_com').click(function(){
// 	});
	
	$('input[name=list]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empList.do');
		//(이전 페이지 이동으로 수정할 예정)
	});
	$('input[value=수정]').click(function(){
		emp_code=$('label[name=emp_code]').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empUpdate.do?emp_code=' + emp_code);
		//(이전 페이지 이동으로 수정할 예정)
	});
	
	
	
	
	// 주소찾기	
	$('#zipCodeBtn').click(function() {
		// 팝업 : 모달 - 해당 팝업이 포커스 점유
		//      모달리스 - 팝업의 포커스 다른 윈도우와 천이
		var url = "${pageContext.request.contextPath}/user/member/zipcodeSearch.do";
		var options = "width = 375, height = 400, scrollbars = no";
		
		window.open(url, "우편번호검색", options);
	});
	
	// 프로필 사진 업로드				
	$('#picUpload').click(function() {
		var url = "${pageContext.request.contextPath}/user/member/idPicFileUpload.do";
		var options = "width = 375, height = 400, scrollbars = no";
	
		window.open(url, "증명사진업로드", options);
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
       			<b class="box-title"><h2>직원 상세정보 조회</h2></b>	
           		<div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
           			<br/>
						<form method="POST" class=form-horizontal">
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
			                  				<label name="emp_code">${empInfo.emp_code}</label>
	               						</div>                
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">이름</label>
		                  				<div class="col-sm-6">
		                  					<label name="emp_name">${empInfo.emp_name}</label>
               							</div>                
               						</div>
			                		<div class="row">
		                				<label class="col-sm-3 control-label">성별</label>
		                  				<div class="col-sm-6">
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
						            			</c:if>
						            			<c:if test="${empInfo.emp_army eq 'n'}">
							            			<label name="emp_army" class="flat-red" >미필</label>
						            			</c:if>
		                  					</c:if>
		                  					<c:if test="${empInfo.emp_gender eq 'w'}">
		                  						<c:if test="${empInfo.emp_army eq 'y'}">
							            			<label name="emp_army" class="flat-red" >해당사항 없음</label>
						            			</c:if>
		                  					</c:if>
						        		</div>          
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">혼인여부</label>
			                  			<div class="col-sm-6">
						        			<c:if test="${empInfo.emp_marriage eq 'y'}">
						            			<label name="emp_marriage" class="flat-red" >기혼</label>
		                  					</c:if>
		                  					<c:if test="${empInfo.emp_marriage eq 'n'}">
		                  						<label name="emp_marriage" class="flat-red" >미혼</label>
		                  					</c:if>
						        		</div>          
               						</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label" style="margin-top: 3px;">전화번호</label>
		                  				<div class="col-sm-6">
		                  					<label name="emp_phone">${empInfo.emp_phone}</label>
			                  			</div>
	                				</div>
			                		<div class="row">
					                	<label class="col-sm-3 control-label" style="margin-top: 3px;">이메일</label>
										<div class="col-sm-6">
					                  		<label name="emp_email">${empInfo.emp_email}</label>
										</div>
			                		</div>
			                		<div class="row">
			                			<label class="col-sm-3 control-label">전공</label>
		                  				<div class="col-sm-6">
		                  					<label name="emp_major">${empInfo.emp_major}</label>
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
				                  			<label name="part_code">${empInfo.part_name}</label>
		               					</div>
		                			</div>
	                				<div class="row">
                						<label class="col-sm-3 control-label" style="margin-top: 3px;">권한</label>
			                  			<div class="col-sm-3">
			                  				<c:if test="${empInfo.emp_role eq 'DEP'}">
				                  				<label name="emp_role">개발자</option>
			                  				</c:if>
			                  				<c:if test="${empInfo.emp_role eq 'PL'}">
				                  				<label name="emp_role">PL</label></option>
			                  				</c:if>
			                  				<c:if test="${empInfo.emp_role eq 'PM'}">
				                  				<label name="emp_role">PM</option>
			                  				</c:if>
			                  				<c:if test="${empInfo.emp_role eq 'MANAGER'}">
				                  				<label name="emp_role">관리자</option>
			                  				</c:if>
		               					</div>
                					</div>
                					<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 3px;">레벨</label>
				                  		<div class="col-sm-3">
				                  			<label name="emp_level">${empInfo.emp_level}</label>
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
			              				</div>
			              			</div>
			              			<input type="hidden" name="emp_delete" value="n" />
	                			</div>
               				</div>
               			</div>
                		<div class="box-footer clearfix">
			              <input value="삭제" type="button" class="btn btn-sm btn-warning btn-flat pull-right">
			              <input name="list" type="button" value="목록" class="btn btn-sm btn-info btn-flat pull-right">
			              <input value="수정" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
			          	</div>
						</form>
					</div>
					</div>
					
				
				</div>
			</div>
		</div>
	</div>