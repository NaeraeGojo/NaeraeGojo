<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
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
</style>
<script type="text/javascript">
$(function(){
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	}
	
	$('body').on('change','select', function (ev){
	    if($(this).find('option:selected').val() == ""){
	        $(this).css('color','#999');
	        $(this).children().css('color','black');
	    }
	    else {
	        $(this).css('color','black');
	        $(this).children().css('color','black');
	    }
	});
	$('#deleteBtn').click(function(){
		var status = '${issueInfo.issue_status}';
		if(status == 'y'){
			boalert("결과가 등록되어 삭제할 수 없습니다.")
			return false;
		}
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/deleteIssue/${issueInfo.issue_code}.do')
    });
	
	$('#listBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueList.do')
    });
	$('#insertBtn').click(function(){
		var status = '${issueInfo.issue_status}';
		if(status == 'y'){
			boalert("이미 결과가 등록된 이슈입니다.")
			return false;
		}
		$(location).attr('href','${pageContext.request.contextPath}/user/project/issue/issueResultForm/${issueInfo.issue_code}.do');
	});
	$('#issueViewForm').submit(function(){
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
		return true;
	});
});
</script>
<section class="content">
	<br/><br/>
	<div class="row">
		<div class="col-md-11">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">이슈 상세 조회</b> <br/><br/>
				</div>

				<div class="box-body">
					<form role="form" action="${pageContext.request.contextPath}/user/project/issue/updateIssue.do"
						id="issueViewForm" class="form-horizontal" method="post">
						<input type="hidden" name="issue_code" value="${issueInfo.issue_code}" />
						<input type="hidden" name="issue_status" value="${issueInfo.issue_status}" />

						<div class="form-group">
							<label for="pw_code" class="col-sm-2 control-label">관련 업무</label>
							<div class="col-sm-8">
								<select class="form-control" style="border-radius: 0em;" name="pw_code" id="pw_code">
									<c:forEach items="${pwList}" var="pwList">
										<option value="${pwList.pw_code}"
											<c:if test="${pwList.pw_code eq issueInfo.pw_code}">selected</c:if> />${pwList.pw_function}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="issue_name" class="col-sm-2 control-label">이슈제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="이슈제목" 
								id="issue_name" name="issue_name" value="${issueInfo.issue_name}">
							</div>
						</div>

						<div class="form-group">
							<label for="emp_code1" class="col-sm-2 control-label">작성자</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자" 
								id="emp_code1" name="emp_code1" value="${issueInfo.emp_code}" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">이슈등급</label>
							<div class="col-sm-6">
								<label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='1'
									<c:if test = "${issueInfo.issue_level eq '1'}">checked="checked"</c:if> /> 즉시
								</label> <label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='2'
									<c:if test = "${issueInfo.issue_level eq '2'}">checked="checked"</c:if> /> 긴급
								</label> <label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='3'
									<c:if test = "${issueInfo.issue_level eq '3'}">checked="checked"</c:if> /> 높음
								</label> <label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='4'
									<c:if test = "${issueInfo.issue_level eq '4'}">checked="checked"</c:if> /> 보통
								</label> <label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='5'
									<c:if test = "${issueInfo.issue_level eq '5'}">checked="checked"</c:if> /> 낮음
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="issue_event_day" class="col-sm-2 control-label">발생일자</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" style="border-radius: 1em;" placeholder="발생일자"
								id="issue_event_day" name="issue_event_day" value="${issueInfo.issue_event_day}">
							</div>
						</div>

						<div class="form-group">
							<label for="issue_content" class="col-sm-2 control-label">이슈내용</label>
							<textarea class="col-sm-8" rows="10" style="border: 1px solid #d2d2d2; border-radius: 1em;"
							id="issue_content" name="issue_content" value="${issueInfo.issue_status}">${issueInfo.issue_content}</textarea>
						</div>

						<div class="form-group">
							<label for="emp_damdang" class="col-sm-2 control-label">담당자</label>
							<div class="col-sm-8">
								<select class="form-control" style="border-radius: 0em;" name="emp_damdang" id="emp_damdang">
									<c:forEach items="${joinEmpList}" var="joinEmpList">
										<option value="${joinEmpList.emp_code}"
											<c:if test="${joinEmpList.emp_name eq issueInfo.emp_damdang}">selected</c:if> />${joinEmpList.emp_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="box-footer clearfix">
							<input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right"> 
							<input value="삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
							<button type="submit" class="btn btn-sm btn-warning btn-flat pull-right">수정</button>
							<button type="button" id="insertBtn" class="btn btn-sm btn-primary btn-flat pull-right">이슈 처리</button>
						</div>
					</form>
				</div>
			</div>
		</div>
</section>
