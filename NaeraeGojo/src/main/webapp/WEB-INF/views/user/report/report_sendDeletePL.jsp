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
				<form class="form-horizontal">
					<div class="box-body">

						<!--                 <div class="form-group"> -->
						<!--                   <label for="inputEmail3" class="col-sm-2 control-label" >보고서 분류</label> -->

						<!--                   <div class="col-sm-9"> -->
						<!--                   	<input value="주간" type="button" href="javascript:void(0)" class="test1 bg-green disabled color-palette"> -->
						<!--                   	<input value="월간" type="button" href="javascript:void(0)" class="test1 bg-aqua disabled color-palette"> -->
						<!--                   </div> -->
						<!--                 </div> -->
						<div class="row">
							<label class="col-sm-2 control-label" style="padding-top: 10px;">보고서
								분류</label>
							<div class="col-sm-7">
								<label style="margin-top: 7px; margin-left: 15px;"> <input
									type="radio" name="report_date" class="flat-red" checked>
									주간
								</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
									type="radio" name="report_date" class="flat-red"> 월간
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword2" class="col-sm-2 control-label">관련 프로젝트</label>

							<div class="col-sm-9">
								<input type="text" class="form-control" id="project_name" name="project_name">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword2" class="col-sm-2 control-label">관련 프로젝트 업무</label>

							<div class="col-sm-9">
								<input type="text" class="form-control" id="pw_function" name="pw_function">
							</div>
						</div>
						
						<div class="form-group">
							<label for="inputPassword2" class="col-sm-2 control-label">작성자</label>

							<div class="col-sm-9">
								<input type="text" class="form-control" id="emp_name" name="emp_name">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword2" class="col-sm-2 control-label">보낼
								사람</label>
							<div class="col-sm-9">
								<table class="table no-margin" id="mView">
									<thead>
										<tr>
											<th scope="col" width="20%">소속부서</th>
											<th scope="col" width="20%">레벨</th>
											<th scope="col" width="20%">이름</th>
											<th scope="col" width="20%">권한</th>
											<th scope="col" width="20%">결재</th>
										</tr>
									</thead>
									<tbody id="bodytable">
									<c:forEach items="${stList }" var="list">
										<tr>
											<td>${list.emp_department }</td>
											<td>${list.emp_level }</td>
											<td>${list.emp_name }</td>
											<td>${list.position_name }</td>
											<c:if test="${list.report_pl_status eq 'k' && list.report_pm_status eq 'i' }">
												<td><span class="label label-danger">&nbsp;&nbsp;&nbsp;승인중&nbsp;&nbsp;</span></td>
											</c:if>
											<c:if test="${list.report_pl_status eq 'i' && list.report_pm_status eq 'i' }">
												<td><span class="label label-danger">&nbsp;&nbsp;&nbsp;승인중&nbsp;&nbsp;</span></td>
											</c:if>
											<c:if test="${list.report_pl_status eq 'x' || list.report_pm_status eq 'x' }">
												<td><span class="label label-warning">&nbsp;&emsp;반려&emsp;</span></td>
											</c:if>
											<c:if test="${list.report_pl_status eq 'k' && list.report_pm_status eq 'k' }">
												<td><span class="label label-success">승인 완료</span></td>
											</c:if>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword2" class="col-sm-2 control-label">제목</label>

							<div class="col-sm-9">
								<input type="text" class="form-control" id="report_title" name="report_title">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword1" class="col-sm-2 control-label">내용</label>

							<div class="col-sm-9">
								<textarea rows="10" type="text" class="form-control" id="report_content" name="report_content"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="exampleInputFile" class="col-sm-2 control-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">파일 첨부</font></font></label>
							<div class="col-sm-10 control-label">
								<input type="file" id="exampleInputFile">
							</div>
						</div>


					</div>
					<div class="box-footer clearfix">
						<input value="목록" type="reset" class="btn btn-sm btn-warning btn-flat pull-right"> 
						<input value="삭제" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
						<input value="피드백 보기" type="button" class="btn btn-sm btn-info btn-flat pull-right"> 
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
				
		$('input[name=report_date]').val('${vo.report_date}');
	    $('input[name=project_name]').val('${vo.project_name}');
		$('input[name=pw_function]').val('${vo.pw_function}');
		$('input[name=emp_name]').val('${vo.emp_name}');
		$('input[name=report_title]').val('${vo.report_title}');
	    $('textarea[name=report_content]').val('${vo.report_content}');
		
		

	})
</script>
