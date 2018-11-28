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
/* label { */
/* 	font-size: 20px !important; */
/* } */
.col-md-11 {
	margin: 10px;
}
select{
  color: grey;
}
.filefile{
	margin-top: 5px;
}
.form-control[readonly]{
   background-color: white;
}
</style>
<script type="text/javascript">
$(function(){
	
	$("#suggest_code").change(function() {
		var suggest_code = $(this).val();
		var suggest_title = $(this).children("option:selected").text();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/project/suggestInfo.do',
            data : {'suggest_code' : suggest_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=suggest_code]').val(json.suggestInfo.suggest_code);
            	
            	$('input[name=rqpps_notice_agency]').val(json.suggestInfo.rqpps_notice_agency);
            	$('input[name=suggest_start_date]').val(json.suggestInfo.suggest_start_date);
            	$('input[name=suggest_end_date]').val(json.suggestInfo.suggest_end_date);
            	$('input[name=suggest_cost]').val(json.suggestInfo.suggest_cost);
            	$('textarea[name=suggest_content]').text(json.suggestInfo.suggest_content);
            }
        });
	});
});
</script>
<section class="content">
	<br />
	<br />
	<div class="row">
		<div class="col-md-11">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">프로젝트 등록</b><br/><br/>
				</div>

				<div class="box-body">
					<form role="form" action="${pageContext.request.contextPath }/user/project/insertProject.do"
					class="form-horizontal" id="projectForm">
						<input type="hidden" name="suggest_code" value=""> 
						<div class="form-group">
							<label for="suggest_code" class="col-sm-2 control-label">제안서</label>
							<div class="col-sm-8">
								<select class="form-control" style="border-radius: 0em;" name="suggest_code" id="suggest_code">
									<option disabled selected hidden>제안서를 선택해주세요</option>
									<c:forEach items="${suggestList}" var="suggestList">
										<option value="${suggestList.suggest_code}">${suggestList.suggest_title}</option>
									</c:forEach>>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="project_name" class="col-sm-2 control-label">프로젝트 제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="프로젝트 제목"
								id="project_name" name="project_name">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="emp_code">담당자</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="담당자"
								id="emp_code" name="emp_code" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label for="suggest_start_date" class="col-sm-2 control-label">제안서 요청 일자</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" style="border-radius: 1em;"
								id="suggest_start_date" name="suggest_start_date" readonly="readonly">
							</div>
							<label for="suggest_end_date" class="col-sm-2 control-label">제안서 마감 일자</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" style="border-radius: 1em;"
								id="suggest_end_date" name="suggest_end_date" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label for="project_start" class="col-sm-2 control-label">프로젝트 시작일</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" style="border-radius: 1em;"
								id="project_start" name="project_start">
							</div>
							<label for="project_end" class="col-sm-2 control-label">프로젝트 예상 종료일</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" style="border-radius: 1em;"
								id="project_end" name="project_end">
							</div>
						</div>

						<div class="form-group">
							<label for="rqpps_notice_agency" class="col-sm-2 control-label">프로젝트 수요기관</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="프로젝트 수요기관"
								id="rqpps_notice_agency" name="rqpps_notice_agency" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label for="suggest_cost" class="col-sm-2 control-label">프로젝트 예산</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="프로젝트 예산"
								id="suggest_cost" name="suggest_cost" readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label for="suggest_content" class="col-sm-2 control-label">제안서 내용</label>
							<textarea class="col-sm-8" rows="10" placeholder="제안서 내용" style="border: 1px solid #d2d2d2; border-radius: 1em;"
							id="suggest_content" name="suggest_content" readonly="readonly"></textarea>
						</div>

				</div>

				<div class="box-footer clearfix">
					<input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right"> 
					<input value="목록" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right"> 
					<input value="등록" type="submit" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
				</div>
				</form>
			</div>
		</div>
	</div>
</section>
