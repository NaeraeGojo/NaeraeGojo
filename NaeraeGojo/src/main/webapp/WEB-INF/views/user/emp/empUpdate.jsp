<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
//화면에 파일 띄우기
function readURL(input) {
   if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
         $('#ShowImage').attr('src', e.target.result).width(350).height(350);
      };

      reader.readAsDataURL(input.files[0]);
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

	$('input[value=이력관리]').click(function(){
		var emp_code= $('input[name=emp_code]').val();
		var url =  "${pageContext.request.contextPath}/history/historyList.do?emp_code="+emp_code;
		var options = "width = 800, height = 400, scrollbars = yes";

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
	
	//이력등록
	$('#insert').click(function(){
		if(eval('${!empty param.emp_code}')){
			var emp_code = '${param.emp_code}';
			var history_notice_agency = $('input[name=history_notice_agency]').val();
			var history_demand_agency = $('input[name=history_demand_agency]').val();
			var history_project_start = $('input[name=history_project_start]').val();
			var history_project_end = $('input[name=history_project_end]').val();
			var history_project_name = $('input[name=history_project_name]').val();
			var history_business = $('select[name=history_business]').val();
			var history_delete = $('input[name=history_delete]').val();
			
			var allData = { "emp_code" : emp_code , "history_notice_agency" : history_notice_agency , "history_demand_agency" : history_demand_agency,
					"history_project_start" : history_project_start, "history_project_end" : history_project_end, 
					"history_project_name" : history_project_name, "history_business" : history_business, "history_delete" : history_delete};
			if(history_project_name == ""||history_project_start == ""||history_project_end==""||history_notice_agency == "" || history_demand_agency== "" ||history_business==""){
					alert("누락된 정보가 있습니다. 다시 입력해주세요.");
					return false;
			 }else{
			$.ajax({
				type : 'POST',
				 url : '${pageContext.request.contextPath}/history/insertHistory.do',
				 data : allData,
				 dataType : 'json',
				 success : function(json) {
					alert("이력이 등록되었습니다.");
				}
				 ,
				 error : function(json) {
					alert("이력등록이 완료되었습니다.");
				}
			});
			}
		}
	});
	
	$('input[name=list]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empList.do');
	});
	$('#delete').click(function(){
		var history_code = $('input[name=history_code]').val();
		
		alert("해당 이력을 삭제합니다.");
		$.ajax({
			type : 'POST',
			 url : '${pageContext.request.contextPath}/history/deleteHistory.do',
			 data : { history_code : history_code },
			 dataType : 'json',
			 success : function(json) {
			}
			 ,
			 error : function(json) {
			}
		});
	});
	//이력 View (수정/삭제 창)
	$('#projectTable tr:gt(0)').click(function(){
		var history_code = $(this).find('td:eq(0) input').val();
		
		$.ajax({
			type : 'POST',
			 url : '${pageContext.request.contextPath}/history/historyView.do',
			 data : { history_code : history_code },
			 dataType : 'json',
			 success : function(json) {
				$('#orderModal').modal();
				$('input[name=history_code]').val(json.historyInfo.history_code);
				$('input[name=history_project_name]').val(json.historyInfo.history_project_name);
				$('input[name=history_notice_agency]').val(json.historyInfo.history_notice_agency);
				$('input[name=history_demand_agency]').val(json.historyInfo.history_demand_agency);
				$('input[name=history_project_start]').val(json.historyInfo.history_project_start.split(' ')[0]);
				$('input[name=history_project_end]').val(json.historyInfo.history_project_end.split(' ')[0]);
				$('select[name=history_business]').val(json.historyInfo.history_business);
				$('input[name=history_delete]').val(json.historyInfo.history_delete);
			}
			 ,
			 error : function(json) {
				 
			}
		});
		
		
	});
		
	$('#update').click(function(){
		var history_code = $('input[name=history_code]').val();
		var history_project_name = $('input[name=history_project_name]').val();
		var history_notice_agency = $('input[name=history_notice_agency]').val();
		var history_demand_agency = $('input[name=history_demand_agency]').val();
		var history_project_start = $('input[name=history_project_start]').val();
		var history_project_end = $('input[name=history_project_end]').val();
		var history_business = $('select[name=history_business]').val();
		
		allData = { "history_notice_agency" : history_notice_agency , "history_demand_agency" : history_demand_agency,
				"history_project_start" : history_project_start, "history_project_end" : history_project_end, 
				"history_project_name" : history_project_name, "history_business" : history_business};
		if(history_project_name == ""||history_project_start == ""||history_project_end==""||history_notice_agency == "" || history_demand_agency== "" ||history_business==""){
				alert("누락된 정보가 있습니다. 다시 수정해주세요.");
				return false;
		 }else{
		$.ajax({
			type : 'POST',
			 url : '${pageContext.request.contextPath}/history/updateHistory.do',
			 data : allData,
			 dataType : 'json',
			 success : function(json) {
				 
				alert("이력이 수정되었습니다.");
			}
			 ,
			 error : function(json) {
				alert("이력수정이 완료되었습니다.");
			}
		});
		}
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
									    		<img id="ShowImage" src="/img/${ufv.user_file_save_name}" style="border-radius: 50%;" width="400" height="400" alt="pic1"/>
									    	</div>
									    	<br/>
									    	<div style="width: 100%" align="center">
												<label class="btn btn-primary btn-file">
											     	사진수정 <input type="file" class="form-control" name="files" style="display: none;" onchange="readURL(this);">
											    </label>
												<label class="btn btn-primary btn-file">
											     	사진삭제 <input type="button" class="form-control" name="PhotoDelete" style="display: none;">
											    </label>
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
		                  				<div class="col-sm-6">
		                  					<label name="emp_major">${empInfo.emp_major}</label>
		                  					<input type="hidden" name="emp_major" value="${empInfo.emp_major}" />
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
											<label name="emp_encpn">${empInfo.emp_encpn}</label>
											<input type="hidden" name="emp_encpn" value="${empInfo.emp_encpn}" />
			              				</div>
			              			</div>
<!-- 			              			<input type="hidden" name="emp_delete" value="n" /> -->
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
				                  		<div class="col-sm-4">
				                  			<select class="form-control" name="projectCode" style="border-radius: 1em;">
				                  				<c:forEach items="${historyList }" var="list">
						                  			<option value="${list.history_code}">${list.history_project_name }</option>
				                  				</c:forEach>
				                  			</select>
		               					</div>                
			              				<div class="col-sm-3" style="margin-left: -15px !important;">
											<input type="button" class="form-control bg-yellow color-palette" value="이력관리" style="border-radius: 1em;">
										</div>
			              			</div>
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
	
	<div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="container">
		<div class="modal-dialog" >
  			<div class="modal-content">
  				<div class="modal-header">
      				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        			<span aria-hidden="true">&times;</span></button>
      				<h4 class="modal-title">프로젝트 이력수정/삭제</h4>
    			</div>
   				<form id="historyInsert" method="POST">
    			<div class="modal-body">
    				<div class="box box-warning">
    				<br/>
    				<br/>
    					<div class="row">
               				<label class="col-sm-3 control-label">프로젝트 명</label>
                			<div class="col-sm-7">
                				<input type="hidden" name="history_code" >
                				<input type="text" name="history_project_name" class="form-control" style="border-radius: 1em;">
           					</div>                
           				</div>
    					<div class="row">
               				<label class="col-sm-3 control-label">공고기관</label>
                			<div class="col-sm-7">
                				<input type="text" name="history_notice_agency" class="form-control" style="border-radius: 1em;">
           					</div>                
           				</div>
    					<div class="row">
               				<label class="col-sm-3 control-label">수요기관</label>
                			<div class="col-sm-7">
                				<input type="text" name="history_demand_agency" class="form-control" style="border-radius: 1em;">
           					</div>                
           				</div>
    					<div class="row">
							<div class="form-group">
						          <label for="edate" class="col-sm-3 control-label">프로젝트 기간</label>
						          <div class="col-md-10" style="margin-left: 100px;">
						          <table class="date_table">
						          	<tr>
						           		<td>
						           			<input type="date" name="history_project_start" class="form-control upForm" style="border-radius: 1em;">
						           		</td>
						              	<td style=" text-align: center; width: 20%; font-size: 1.5em;">~</td>
						              	<td>
						              		<input type="date" name="history_project_end" class="form-control upForm" style="border-radius: 1em;">
						              	</td>
						           	</tr>
						           </table>
						           </div> 
						     </div>
						</div>
    					<div class="row">
               				<label class="col-sm-3 control-label">맡은업무</label>
                			<div class="col-sm-4">
                				<select class="form-control" name="history_business" style="border-radius: 1em;">
                					<option value="PM">PM</option>
                					<option value="PL">PL</option>
                					<option value="TA">TA</option>
                					<option value="DA">DA</option>
                					<option value="AA">AA</option>
                					<option value="UA">UA</option>
                				</select>
           					</div> 
           					<input type="hidden" name="history_delete" class="form-control upForm" style="border-radius: 1em;" value="n">               
           				</div>
           				<br/>
           				<br/>
           					<button id="delete" style="border-radius: 1em; width: 70px;" class="form-control btn-danger btn-flat pull-right">삭제</button>
           					<button id="update" style="border-radius: 1em; width: 70px;" class="form-control btn-danger btn-flat pull-right">수정</button>
   					</div>
				</div>
   				</form>
				<div class="modal-footer">
						<button style="border-radius: 1em; width: 100px;" class="form-control bg-gray color-palette pull-left" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		</div>
	<!-- /.modal-content -->
	</div>
<!-- /.modal-dialog -->