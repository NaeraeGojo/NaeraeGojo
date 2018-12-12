<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<style>
.fieldName {
	text-align: center;
	background-color: #f4f4f4;
}

.tLine {
	background-color: #d2d2d2;
	height: 1px;
}

.btnGroup {
	text-align: right;
}

td {
	text-align: left;
}

.row {
	margin-bottom: 10px;
}

.control-label {
	font-size: 18px;
	margin-right: -20px;
}

.no-margin {
	padding: 10px !important;
}

.box-title {
	font-size: 30px !important;
}

.btn-sm {
	width: 80px;
	margin-right: 5px;
}

label {
	font-size: 20px !important;
}

.col-md-11 {
	margin: 10px;
}

.test1 {
	width: 47%;
	margin: 5px;
}

.box-title {
	font-size: 40px !important;
}

.form-horizontal .control-label {
	padding-top: 3px;
	margin-bottom: 0;
	text-align: right;
	padding-right: 30px;
}
</style>
<!--     Main content -->
<section class="content">
	<br />
	<br />
	<div class="row">
		<div class="col-md-12">
			<!--           Horizontal Form -->
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">보고서</h3>
				</div>
				<!--             /.box-header -->
				<!--             form start -->
			<div class="box-body">
				<form role="form" id="reportForm" class="form-horizontal" 
         			method="post" action="" enctype="multipart/form-data">

						<!--                 <div class="form-group"> -->
						<!--                   <label for="inputEmail3" class="col-sm-2 control-label" >보고서 분류</label> -->

						<!--                   <div class="col-sm-9"> -->
						<!--                   	<input value="주간" type="button" href="javascript:void(0)" class="test1 bg-green disabled color-palette"> -->
						<!--                   	<input value="월간" type="button" href="javascript:void(0)" class="test1 bg-aqua disabled color-palette"> -->
						<!--                   </div> -->
						<!--                 </div> -->
						<div class="row">
							<label class="col-sm-2 control-label" style="padding-top: 10px;">보고서 분류</label>
							<div class="col-sm-7">
								<label style="margin-top: 7px; margin-left: 15px;">
								<input type="radio" name="raReport" value="w" class="flat-red" checked> 주간 </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<label><input type="radio" name="raReport" value="m" class="flat-red"> 월간 </label>
								<input type="hidden" name="report_date" value="">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">관련 프로젝트</label>

							<div class="col-sm-9">
								<!-- select -->
								<select class="form-control" onchange="change(this.value);" >
			                    <option>선택해주세요</option>
				                   <c:forEach items="${proName }" var="proName1">
				                    	<option value="${proName1.project_code}">${proName1.project_name}</option>
				                   </c:forEach>
			                   </select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">관련 프로젝트 업무</label>

							<div class="col-sm-9">
								<!-- select -->
								<select class="form-control" id="pwList1" name="pw_code" >
									
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword2" class="col-sm-2 control-label">보낼
								사람</label>
							<div class="col-sm-9">
								<table class="table no-margin" id="mView">
									<thead>
										<tr>
											<th scope="col" width="25%">소속부서</th>
											<th scope="col" width="25%">레벨</th>
											<th scope="col" width="25%">이름</th>
											<th scope="col" width="25%">권한</th>
										</tr>
									</thead>
									<tbody id="bodytable" >
										<!-- 아작스 부분 -->
									</tbody>
								</table>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword2" class="col-sm-2 control-label">제목</label>

							<div class="col-sm-9">
								<input type="text" class="form-control" id="title" name="report_title"
									placeholder="제목을 입력해주세요">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword1" class="col-sm-2 control-label">내용</label>

							<div class="col-sm-9">
								<textarea rows="10" type="text" class="form-control"
									id="contents" name="report_content"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="exampleInputFile" class="col-sm-2 control-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">파일 첨부</font></font></label>
							<div class="col-sm-10 control-label">
								<input type="file" id="file01" name="files">
							</div>
						</div>


					</div>
					<div class="box-footer clearfix">
						<input value="목록" type="reset" class="btn btn-sm btn-warning btn-flat pull-right"> 
						<input value="임시저장" type="button" id="saveInsert" class="btn btn-sm btn-info btn-flat pull-right"> 
						<input value="등록" type="button" id="insertAll" class="btn btn-sm btn-danger btn-flat pull-right">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2()

		//iCheck for checkbox and radio inputs
		$('input[type="checkbox"].minimal, input[type="radio"].minimal')
				.iCheck({
					checkboxClass : 'icheckbox_minimal-blue',
					radioClass : 'iradio_minimal-blue'
				})
		//Red color scheme for iCheck
		$('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
				.iCheck({
					checkboxClass : 'icheckbox_minimal-red',
					radioClass : 'iradio_minimal-red'
				})
		//Flat red color scheme for iCheck
		$('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
				.iCheck({
					checkboxClass : 'icheckbox_flat-red',
					radioClass : 'iradio_flat-red'
				})
				
		$('#insertAll').click(function(){
			var report_title = $('input[name=report_title]').val();
			var report_content = $('#contents').val();
// 			var file1 = $('#file01').val();
// 			var pw_code = $("#pwList1 option:selected").val();
			var report_date = $("input:radio[name=raReport]:checked").val();
			$('input[name=report_date]').val(report_date);
			
			var len = $('#bodytable tr').length;
	    	var insertNm=""; 
	    	
	    	for(var i=0; i< len; i++){ 
	    	   var str = $('#bodytable tr:eq('+i+')').find('input[name=test]').val();//<f로 준이유
               insertNm += str+"/";
            }
			if(report_content == '' || report_title == ''){ 
				alert("빈 항목이 존재합니다.");
				return false;
			}
			
			
			var file1 = $('#file01').val();
			if(file1 == ''){
				alert("파일을 등록 선택해 주세요.");
				return false;
		    }
			

			$('#reportForm').attr('action','${pageContext.request.contextPath }/user/report/report_FinalInsert.do');
			$('#reportForm').submit();
			return true;
		});
		
		$('#saveInsert').click(function(){
			var report_title = $('input[name=report_title]').val();
			var report_content = $('#contents').val();
// 			var file1 = $('#file01').val();
// 			var pw_code = $("#pwList1 option:selected").val();
			var report_date = $("input:radio[name=raReport]:checked").val();
			$('input[name=report_date]').val(report_date);
			
			var len = $('#bodytable tr').length;
	    	var insertNm=""; 
	    	
	    	for(var i=0; i< len; i++){ 
	    	   var str = $('#bodytable tr:eq('+i+')').find('input[name=test]').val();//<f로 준이유
               insertNm += str+"/";
            }
			if(report_content == '' || report_title == '' || report_content ){ 
				alert("빈 항목이 존재합니다.");
				return false;
			}
			
			
			var file1 = $('#file01').val();
			if(file1 == ''){
				alert("파일을 등록 선택해 주세요.");
				return false;
		    }

			$('#reportForm').attr('action','${pageContext.request.contextPath }/user/report/report_FinalInsertSave.do');
			$('#reportForm').submit();
			return true;
		});

	})
	
	function change(value){
			alert(value);
			$.ajax({
				url : '${pageContext.request.contextPath}/user/report/report_pw_people.do?project_code='+ value,
				dataType: 'json',
				success : function(data){
					console.log(data);
					info = data.pwName;
					var code ='';
					$('#pwList1').empty();
					code = '<option>'+"선택해주세요"+'</option>';
					for (var i = 0; i < info.length; i++) {
						code += '<option value="'+info[i].pw_code+'">'+info[i].pw_function+'</option>';
					}
					$('#pwList1').append(code);
				},
				error : function(res){
					alert(res.status);
				}
			});
			
			$.ajax({
				url : '${pageContext.request.contextPath}/user/report/report_pw_people12.do?project_code='+ value,
				dataType: 'json',
				success : function(data){
					console.log(data);
					info = data.proPeople;
					var code ='';
					$('#bodytable').empty();
					for (var i = 0; i < info.length; i++) {
						code += '<tr>';
						code += '<input type="hidden" name="emp_code" value="'+ info[i].emp_code+'">';
						code += '<td>'+info[i].emp_department+'</td>';
						code += '<td>'+info[i].emp_level+'</td>';
						code += '<td>'+info[i].emp_name+'</td>';
						code += '<td>'+info[i].position_name+'</td>';
						code += '</tr>';
					}
					$('#bodytable').append(code);
				},
				error : function(res){
					alert(res.status);
				}
			});
	};	
	
// 	function people(value){
// 			alert(value);
// 			$.ajax({
// 				url : '${pageContext.request.contextPath}/user/report/report_pw_people12.do?project_code='+ value,
// 				dataType: 'json',
// 				success : function(data){
// 					console.log(data);
// 					info = data.proPeople;
// 					var code ='';
// 					$('#bodytable').empty();
// 					for (var i = 0; i < info.length; i++) {
// 						code += '<tr>';
// 						code += '<input type="hidden" value="'+ info[i].emp_code+'">';
// 						code += '<td>'+info[i].emp_department+'</td>';
// 						code += '<td>'+info[i].emp_level+'</td>';
// 						code += '<td>'+info[i].emp_name+'</td>';
// 						code += '<td>'+info[i].position_name+'</td>';
// 						code += '</tr>';
// 					}
// 					$('#bodytable').append(code);
// 				},
// 				error : function(res){
// 					alert(res.status);
// 				}
// 			});
// 	};	
</script>
