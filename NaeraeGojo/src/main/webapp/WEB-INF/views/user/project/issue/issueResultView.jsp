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
<script type="text/javascript">
$(function(){
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	}
	
	$('#deleteBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/deleteIssueResult/${issueResultInfo.issue_code}.do')
    });
	
	$('#listBtn').click(function(){
		
		var currentPage = '${param.currentPage}';
		
		var query = '?currentPage=' + currentPage;
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
    	
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueResultList.do'+query)
    });
	
	$('#issueResultViewForm').submit(function(){
		if($('input[name=issue_result_day]').val()==""){
			boalert("이슈를 처리한 일자를 선택해 주세요.")
			return false;
	    }
		if($('input[name=emp_code_ir]').val()==""){
			boalert("작성자을 입력해 주세요.")
			return false;
	    }
		if($('#issue_result_content').val()==""){
			boalert("이슈 처리 내용을 입력해 주세요.")
			return false;
	    }
		return true;
	});
	$('#issueChart').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/issue/issueChart.do');
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
					<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/user/project/issue/updateIssueResult.do"
						method="post" id="issueResultViewForm">
						<input type="hidden" name="issue_code" value="${issueInfo.issue_code}" />

						<div class="form-group">
							<label for="issue_name" class="col-sm-2 control-label">이슈제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="이슈제목" 
								id="issue_name" name="issue_name" value="${issueInfo.issue_name}" disabled="disabled">
							</div>
						</div>

						<div class="form-group">
							<label for="emp_code" class="col-sm-2 control-label">작성자</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자" 
								id="emp_code"name="emp_code" value="${issueInfo.emp_code}" disabled="disabled">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">이슈등급</label>
							<div class="col-sm-6">
								<label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='1' disabled="disabled"
									<c:if test = "${issueInfo.issue_level eq '1'}">checked="checked"</c:if> /> 즉시
								</label>
								 
								<label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='2' disabled="disabled"
									<c:if test = "${issueInfo.issue_level eq '2'}">checked="checked"</c:if> /> 긴급
								</label> 
								
								<label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='3' disabled="disabled"
									<c:if test = "${issueInfo.issue_level eq '3'}">checked="checked"</c:if> /> 높음
								</label> 
								
								<label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='4' disabled="disabled"
									<c:if test = "${issueInfo.issue_level eq '4'}">checked="checked"</c:if> /> 보통
								</label> 
								
								<label for="issue_level" class="col-sm-2 control-label">
									<input type='radio' id='issue_level' name='issue_level' value='5' disabled="disabled"
									<c:if test = "${issueInfo.issue_level eq '5'}">checked="checked"</c:if> /> 낮음
								</label>
							</div>
						</div>

						<div class="form-group">
							<label for="issue_event_day" class="col-sm-2 control-label">발생일자</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" style="border-radius: 1em;" 
								id="issue_event_day" name="issue_event_day" value="${issueResultInfo.issue_event_day}" disabled="disabled">
							</div>
						</div>

						<div class="form-group">
							<label for="issue_content" class="col-sm-2 control-label">이슈내용</label>
							<textarea class="col-sm-8" rows="10" style="border: 1px solid #d2d2d2; border-radius: 1em;"
							id="issue_content" name="issue_content" readonly="readonly">${issueResultInfo.issue_content}</textarea>
						</div>


						<div class="form-group">
							<label for="issue_result_content" class="col-sm-2 control-label">이슈결과</label>
							<textarea class="col-sm-8" rows="10" placeholder="이슈결과" style="border: 1px solid #d2d2d2; border-radius: 1em;"
							id="issue_result_content" name="issue_result_content" value="">${issueResultInfo.issue_result_content}</textarea>
						</div>

						<div class="form-group">
							<label for="issue_result_day" class="col-sm-2 control-label">처리일자</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" style="border-radius: 1em;" 
								id="issue_result_day" name="issue_result_day" value="${issueResultInfo.issue_result_day}">
							</div>
							<label for="emp_code_ir" class="col-sm-2 control-label">담당자</label>
							<div class="col-sm-3">
								<input type="hidden" class="form-control" style="border-radius: 1em;"
								id="emp_code_ir" name="emp_code_ir" value="${issueInfo.emp_damdang}"> 
								<input type="text" class="form-control" readonly="readonly" style="border-radius: 1em;"
								value="${issueInfo.emp_damdang}">
							</div>
						</div>

						<div class="box-footer clearfix">
							<input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right"> 
							<input value="결과 삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
							<button type="submit" class="btn btn-sm btn-warning btn-flat pull-right">결과 수정</button>
							<input value="이슈 차트" id="issueChart" type="button" class="btn btn-sm btn-success btn-flat pull-right">
						</div>
					</form>
				</div>
			</div>
		</div>
</section>
