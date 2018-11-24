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
	$('#issueForm').submit(function(){
		$('input:radio[name="issue_level"]:checked').val();

		true;
	}
});
</script>
    <!-- Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
      <div class="col-md-11">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">이슈 등록</b>
              <br/><br/>
            </div>
            
            <div class="box-body">
             <form role="form" class="form-horizontal" action="${pageContext.request.contextPath }/user/project/issue/insertIssue.do" 
             method="post" id="issueForm">
                
                <div class="form-group">
	              	<label for="pw_code" class="col-sm-2 control-label" >관련 업무</label>
	              	<div class="col-sm-8">
	                	<select class="form-control" style="border-radius: 0em;" name="pw_code" id="pw_code">
							<option style="color:white">관련 업무를 선택</option>
							<c:forEach items="${pwList}" var="pwList">
								<option value="${pwList.pw_code}" >${pwList.pw_function}</option>
							</c:forEach>
				  		</select>
	              	</div>
            	</div>
                
                <div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" for="issue_name" >이슈제목</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목"
	                	id="issue_name" name="issue_name">
	              	</div>
            	</div>
            	
            	<div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" for="emp_code" >작성자</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자"
	                	id="emp_code" name="emp_code" value="${LOGIN_EMPINFO.emp_name }">
	              	</div>
            	</div>
            	
            	<div class="form-group">
              		<label for="issue_level" class="col-sm-2 control-label">이슈등급</label>
            		<div class="col-sm-6">
	              		<label for="issue_level" class="col-sm-2 control-label">
		                  <input type="radio" class="minimal" checked
		                  id='issue_level' name='issue_level' value='1'>&ensp;즉시
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                  <input type="radio" class="minimal"
		                  id='issue_level' name='issue_level' value='2'>&ensp;긴급
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                  <input type="radio" class="minimal"
		                  id='issue_level' name='issue_level' value='3'>&ensp;높음
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                  <input type="radio" class="minimal"
		                  id='issue_level' name='issue_level' value='4'>&ensp;보통
		                </label>
		                <label for="issue_level" class="col-sm-2 control-label">
		                  <input type="radio" class="minimal"
		                  id='issue_level' name='issue_level' value='5'>&ensp;낮음
		                </label>
	              	</div>	
            	</div>
            	
            	<div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" for="issue_event_day">발생일자</label>
	              	<div class="col-sm-8">
	                	<input type="date" class="form-control" style="border-radius: 1em;" placeholder="발생일자"
	                	id="issue_event_day" name="issue_event_day">
	              	</div>
            	</div>
                
				<div class="form-group">
	      			<label for="inputEmail3" class="col-sm-2 control-label" for="issue_content">이슈내용</label>
	      			<textarea class="col-sm-8" rows="10" placeholder="이슈내용" style="border: 1px solid #d2d2d2; border-radius: 1em;"
	      			id="issue_content" name="issue_content"></textarea>
	   			</div>
            	
	            <div class="box-footer clearfix">
					<input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right">
              		<input value="삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
          	  		<button type="submit" class="btn btn-sm btn-warning btn-flat pull-right">등록</button>
	          	</div>
            </form>
        </div>
        </div>
      </div>
	</section>
