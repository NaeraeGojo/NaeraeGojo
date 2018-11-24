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
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/deleteIssue/${issueInfo.issue_code}.do')
    });
	
	$('#listBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueList.do')
    });
});
</script>
    <section class="content">
    <br/><br/>
      <div class="row">
      <div class="col-md-11">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">이슈 상세 조회</b>
              <br/><br/>
            </div>
            
            <div class="box-body">
             <form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/user/project/issue/updateIssue.do" method="post">
              		<input type="hidden" name="issue_code" value="${issueInfo.issue_code}"/>
                
                <div class="form-group">
              		<label for="issue_name" class="col-sm-2 control-label" >이슈제목</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="이슈제목"
	                	id="issue_name" name="issue_name" value="${issueInfo.issue_name}"disabled="disabled" >
	              	</div>
            	</div>
            	
            	<div class="form-group">
              		<label for="emp_code1" class="col-sm-2 control-label" >작성자</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자"
	                	id="emp_code1" name="emp_code1" value="${issueInfo.emp_code}" disabled="disabled">
	              	</div>
            	</div>
            	
            	<div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" >이슈등급</label>
            		<div class="col-sm-6">
	              		<label for="issue_level" class="col-sm-2 control-label">
		                  	<input type='radio' id='issue_level' name='issue_level' value='1' disabled="disabled"
		                  	<c:if test = "${issueInfo.issue_level eq '1'}">checked="checked"</c:if>/> 즉시
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                  <input type='radio' id='issue_level' name='issue_level' value='2' disabled="disabled"
		                  <c:if test = "${issueInfo.issue_level eq '2'}">checked="checked"</c:if>/> 긴급
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                 	<input type='radio' id='issue_level' name='issue_level' value='3' disabled="disabled"
		                  	<c:if test = "${issueInfo.issue_level eq '3'}">checked="checked"</c:if>/> 높음
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                 <input type='radio' id='issue_level' name='issue_level' value='4' disabled="disabled"
		                  	<c:if test = "${issueInfo.issue_level eq '4'}">checked="checked"</c:if>/> 보통
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                 	<input type='radio' id='issue_level' name='issue_level' value='5' disabled="disabled"
		                  	<c:if test = "${issueInfo.issue_level eq '5'}">checked="checked"</c:if>/> 낮음
		                </label>
	              	</div>	
            	</div>
            	
            	<div class="form-group">
              		<label for="issue_event_day" class="col-sm-2 control-label" >발생일자</label>
	              	<div class="col-sm-8">
	                	<input type="date" class="form-control" style="border-radius: 1em;" placeholder="발생일자"
	                	id="issue_event_day" name="issue_event_day" value="${issueInfo.issue_event_day}" disabled="disabled">
	              	</div>
            	</div>
                
				<div class="form-group">
	      			<label for="issue_content" class="col-sm-2 control-label">이슈내용</label>
	      			<textarea class="col-sm-8" rows="10" style="border: 1px solid #d2d2d2; border-radius: 1em;"
	      			id="issue_content" name="issue_content" readonly="readonly">${issueInfo.issue_content}</textarea>
	   			</div>
				
				
				
				
				<div class="form-group">
	      			<label for="issue_result_content" class="col-sm-2 control-label">이슈결과</label>
	      			<textarea class="col-sm-8" rows="10" placeholder="이슈결과" style="border: 1px solid #d2d2d2; border-radius: 1em;"
	      			id="issue_result_content" name="issue_result_content" value=""></textarea>
	   			</div>
	   			
	   			<div class="form-group">
	              	<label for="issue_result_day" class="col-sm-2 control-label" >처리일자</label>
	              	<div class="col-sm-3">
	                	<input type="date" class="form-control" style="border-radius: 1em;"
	                	id="issue_result_day" name="issue_result_day" value="">
	              	</div>
	              	<label for="issue_result_status" class="col-sm-2 control-label" >처리 상태</label>
	              	<div class="col-sm-3">
	                	<select class="form-control" style="border-radius: 0em;" name="issue_result_status" id="issue_result_status">
							<option style="color:white" disabled selected hidden >처리상태</option>
							<option value="n" <c:if test="${issueInfo.issue_result_status eq 'n'}">selected</c:if>/>미처리</option>
							<option value="y" <c:if test="${issueInfo.issue_result_status eq 'y'}">selected</c:if>/>처리</option>
				  		</select>
	              	</div>
            	</div>
				
				<div class="form-group">
              		<label for="emp_code_ir" class="col-sm-2 control-label" >담당자</label>
	              	<div class="col-sm-3">
	                	<input type="hidden" class="form-control" style="border-radius: 1em;" placeholder="담당자"
	                	id="emp_code_ir" name="emp_code_ir" value="">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="담당자"
	                	value="" >
	              	</div>
	              	<label for="inputEmail3" class="col-sm-2 control-label" >이슈알림</label>
	              	<div class="col-sm-3">
	                	<input type="checkbox" id="check">
	              	</div>
            	</div>
            	
            	
            <div class="box-footer clearfix">
              <input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right">
              <input value="삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
          	  <button type="submit" class="btn btn-sm btn-warning btn-flat pull-right">수정</button>
          	</div>
            </form>
        </div>
        </div>
      </div>
	</section>
