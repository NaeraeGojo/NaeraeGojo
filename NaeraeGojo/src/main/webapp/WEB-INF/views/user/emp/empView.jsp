<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<script>
//화면에 파일 띄우기
function readURL(input) {
   if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
         $('#ShowImage').attr('src', e.target.result).width(250).height(250);
      };

      reader.readAsDataURL(input.files[0]);
   }
}
$(function() {

	$('input[name=list]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empList.do');
		//(이전 페이지 이동으로 수정할 예정)
	});
	$('input[value=탈퇴]').click(function(){
		emp_code=$('label[name=emp_code]').text();
		alert("탈퇴되었습니다.");
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/deleteEmp.do?emp_code=' + emp_code);
	});
	$('input[value=수정]').click(function(){
		emp_code=$('label[name=emp_code]').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empUpdate.do?emp_code=' + emp_code);
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
               						 <table>
										<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 400px; text-align: center;">
									    	<div align="center" style="margin-left: 50px;">
									    		<img id="ShowImage" src="/sora/${ufv.user_file_save_name}" style="border-radius: 50%;" width="350" height="350" alt="pic1"/>
									    	</div>
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
			                			<label class="col-sm-3 control-label">닉네임</label>
		                  				<div class="col-sm-6">
		                  					<label name="emp_nick">${empInfo.emp_nick}</label>
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
				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">입사일</label>
				                  		<div class="col-sm-5">
											<label name="emp_encpn">${empInfo.emp_encpn.split(' ')[0]}</label>
											<input type="hidden" name="emp_encpn" value="${empInfo.emp_encpn.split(' ')[0]}" />
			              				</div>
			              			</div>
<!-- 			              			<div class="row"> -->
<!-- 				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">자격증</label> -->
<!-- 				                  		<div class="col-sm-5"> -->
<!-- 				                  			<input type="text" class="form-control" style="font-size:20px; border-radius: 1em;"> -->
<!-- 		               					</div>                 -->
<!-- 			              				<div class="col-sm-3" style="margin-left: -15px !important;"> -->
<!-- 											<input type="button" data-toggle="modal"  data-target="#modal-primary2" class="form-control bg-yellow color-palette" value="자격증내역" style="border-radius: 1em;"> -->
<!-- 										</div> -->
<!-- 			              			</div> -->
			              			<div class="row">
				                		<label class="col-sm-3 control-label" style="margin-top: 5px;">프로젝트 이력</label>
			              				<div class="col-sm-3" style="margin-left: -15px !important;">
											<input type="button" data-toggle="modal"  data-target="#modal-primary" class="form-control bg-yellow color-palette" value="프로젝트 이력" style="border-radius: 1em;">
										</div>
			              			</div>
			              			<input type="hidden" name="emp_delete" value="n" />
	                			</div>
               				</div>
               			</div>
                		<div class="box-footer clearfix">
			            <c:if test="${LOGIN_EMPINFO.emp_role eq 'MANAGER'}"> 
			              <input value="탈퇴" type="button" class="btn btn-sm btn-warning btn-flat pull-right">
			              <input name="list" type="button" value="목록" class="btn btn-sm btn-info btn-flat pull-right">
			            </c:if>  
			              <input value="수정" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
			          	</div>
						</form>
					</div>
					</div>
					
				
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-primary" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="container">
		<div class="modal-dialog" style="width: 800px;">
  			<div class="modal-content">
  				<div class="modal-header">
      				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        			<span aria-hidden="true">&times;</span></button>
      				<h4 class="modal-title">프로젝트 이력관리</h4>
    			</div>
    			<div class="modal-body">
    				<div class="box box-warning">
    					<div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
			                <table class="table no-margin" >
			                  <thead>	
			                  <br/>				
			                  <tr>
			                    <th scope="col" width="10%">No.</th>
			                    <th scope="col" width="20%">프로젝트명</th>
			                    <th scope="col" width="15%">공고기관</th>
			                    <th scope="col" width="15%">수요기관</th>
			                    <th scope="col" width="25%">프로젝트기간</th>
			                    <th scope="col" width="15%">맡은업무</th>
			                  </tr>
			                  </thead>
			                  <tbody>
			                  	<c:forEach items="${historyList}" var="list">
			                  <tr>
			                  	<td><input type="hidden" value="${list.history_code}">${list.rnum }</td>
			                    <td>${list.history_project_name }</td>
			                    <td>${list.history_notice_agency }</td>
			                    <td>${list.history_demand_agency }</td>
			                    <td>${list.history_project_start }</td>
			                    <td>${list.history_business }</td>
			                  </tr>
			                  	</c:forEach>
			                  </tbody>
			                </table>
			        	</div>
   					</div>
				</div>
				<div class="modal-footer">
						<button type="button" style="border-radius: 1em; width: 100px;" class="form-control bg-gray color-palette pull-left" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		</div>
	<!-- /.modal-content -->
	</div>
<!-- /.modal-dialog -->