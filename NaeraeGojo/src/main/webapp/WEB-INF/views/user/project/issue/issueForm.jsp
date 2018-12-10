<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
.btn-sm {
	width : 80px;
	margin-right:5px; 
}
.col-md-11 {
	margin: 10px;
}
#check{
	margin: 10px;
}
.form-control[readonly]{
   background-color: white;
}
.form-control[disabled]{
   background-color: white;
}
</style>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	}

// 	$("#issue_event_day").datepicker({
// 		showButtonPanel: true,
// 		minDate: 0,
// 		changeMonth: true, 
// 		dateFormat: "yy-mm-dd",
// 		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
// 		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
// 		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
// 		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
// 	});
	
	
	$('#listBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueList.do')
    });

	$('#issueForm').submit(function(){
		if($('input[name=issue_name]').val()==""){
			boalert("이슈 제목을 입력해 주세요.")
			return false;
	    }
		if($('input[name=issue_event_day]').val()==""){
			boalert("이슈가 발생한 일자를 선택해 주세요.")
			return false;
	    }
		if($('input[name=emp_code]').val()==""){
			boalert("작성자을 입력해 주세요.")
			return false;
	    }
		if($('#issue_content').val()==""){
			boalert("이슈 내용을 입력해 주세요.")
			return false;
	    }
		
// 		if($("#pwSelBox option:eq(0)")){
// 			boalert("관련 업무를 선택해 주세요.")
// 			return false;
// 		}
		return true;
	});
});
</script>
<section class="content">
	<br /><br />
	<div class="row">
		<div class="col-md-11">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">이슈 등록</b> <br/><br/>
				</div>
				<div class="box-body">
					<form role="form" class="form-horizontal" action="${pageContext.request.contextPath }/user/project/issue/insertIssue.do" method="post" id="issueForm">
						<div class="form-group">
							<label for="pw_code" class="col-sm-2 control-label">관련 업무</label>
							<div class="col-sm-8">
								<select class="form-control" style="border-radius: 0em;" name="pw_code" id="pwSelBox" id="pwSelBox">
<!-- 									<option style="color:gray" >관련 업무를 선택 해주세요</option> -->
									<c:forEach items="${pwList}" var="pwList">
										<option value="${pwList.pw_code}">${pwList.pw_function}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="issue_name">이슈제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control"	style="border-radius: 1em;" placeholder="이슈 제목" 
								id="issue_name" name="issue_name">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="emp_code">작성자</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자"
								id="emp_code" name="emp_code" value="${LOGIN_EMPINFO.emp_name }" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label for="issue_level" class="col-sm-2 control-label">이슈등급</label>
							<div class="col-sm-6">
								<label for="issue_level" class="col-sm-2 control-label">
									<input type="radio" class="minimal" checked id='issue_level' name='issue_level' value='1'>&ensp;즉시
								</label> 
								
								<label for="issue_level" class="col-sm-2 control-label">
									<input type="radio" class="minimal" id='issue_level' name='issue_level' value='2'>&ensp;긴급
								</label> 
								
								<label for="issue_level" class="col-sm-2 control-label">
									<input type="radio" class="minimal" id='issue_level' name='issue_level' value='3'>&ensp;높음
								</label> 
								
								<label for="issue_level" class="col-sm-2 control-label"> 
									<input type="radio" class="minimal" id='issue_level' name='issue_level' value='4'>&ensp;보통
								</label> 
								
								<label for="issue_level" class="col-sm-2 control-label">
									<input type="radio" class="minimal" id='issue_level'name='issue_level' value='5'>&ensp;낮음
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="issue_event_day">발생일자</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" style="border-radius: 1em;" placeholder="발생일자"
								id="issue_event_day" name="issue_event_day" autocomplete="off">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label" for="issue_content">이슈내용</label>
							<textarea class="col-sm-8" rows="10" placeholder="이슈내용" style="border: 1px solid #d2d2d2; border-radius: 1em;"
							id="issue_content" name="issue_content"></textarea>
						</div>

						<div class="form-group">
							<label for="emp_damdang" class="col-sm-2 control-label">담당자</label>
							<div class="col-sm-8">
								<select class="form-control" style="border-radius: 0em;" name="emp_damdang" id="emp_damdang">
<!-- 									<option style="color: white" disabled selected hidden id="damSelBox">담당자 선택</option> -->
									<option style="color: black" value="n">추후 등록</option>
									<c:forEach items="${joinEmpList}" var="joinEmpList">
										<option value="${joinEmpList.emp_code}">${joinEmpList.emp_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="box-footer clearfix">
							<input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right">
							<button type="submit" class="btn btn-sm btn-warning btn-flat pull-right">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
</section>
