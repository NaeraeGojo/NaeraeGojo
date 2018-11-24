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

#divdiv{
	height: 3000px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#insertIssue').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/issue/issueForm.do');
	});
	
	$('#issue tr:gt(0)').click(function(){
		var issue_code = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueView.do?issue_code='+issue_code+'&rnum='+rnum);
	})
	
	$('#issueResult tr:gt(0)').click(function(){
		var issue_code = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueResultView.do?issue_code='+issue_code+'&rnum='+rnum);
	})
});
</script>
    
    <!-- Main content -->
<!--     <section class="content"> -->
<!--     <br/><br/> -->
      <div class="row">
      <div class="col-md-12">
      	  <!-- Custom Tabs -->
          <div class="nav-tabs-custom" id="divdiv">
	            <ul class="nav nav-tabs">
	              <li class="active"><a href="#tab_1" data-toggle="tab">프로젝트 이슈</a></li>
	              <li><a href="#tab_2" data-toggle="tab">이슈 결과</a></li>
	            </ul>
            <div class="tab-content">
            <div class="tab-pane active" id="tab_1">
            <div class="box box-info">
            <div class="box-header with-border">
            <b class="box-title">프로젝트 이슈</b>	
            <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover" id="issue" >
                  <thead>
                  <tr id="trtr">
                    <th scope="col" width="5%" tex>No.</th>
                    <th scope="col" width="30%">이슈명</th>
                    <th scope="col" width="10%">발생일자</th>
                    <th scope="col" width="10%">이슈등급</th>
                    <th scope="col" width="10%">상태</th>
                    <th scope="col" width="10%">등록자</th>
                    <th scope="col" width="5%">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${issueList}" var="issueList">
		                  <tr>
       						<td><input type="hidden" value="${issueList.issue_code }">${issueList.rnum }</td>
		                    <td>${issueList.issue_name }</td>
		                    <td>${fn:substringBefore(issueList.issue_event_day, ' ') }</td>
		                    <td>${issueList.issue_level }</td>
		                    <td>
			                    <c:if test="${issueList.issue_status == 'n'}">
			                    	<span class="label label-danger">미처리</span>
								</c:if>
								<c:if test="${issueList.issue_status == 'y'}">
			                    	<span class="label label-primary">처리</span>
								</c:if>
							</td>
		                    <td>${issueList.emp_code }</td>
		                    <td>${issueList.issue_hit }</td>
		                  </tr>
	                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            ${pagingUtil}
            </div>
              
            <form action="${pageContext.request.contextPath}/user/issue/issueList.do" method="post" class="form-inline pull-right">
			<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
				<select class="form-control" name="search_keycode" >
					<option value="TOTAL">전체</option>
					<option value="NAME">제목</option>
					<option value="LEVEL">내용</option>
				</select>
		    <button type="submit" class="btn btn-primary form-control">검색</button>
		    <button type="button" id="" class="btn btn-info form-control">이슈 차트</button>
		    <button type="button" id="insertIssue" class="btn btn-danger form-control">이슈 등록</button>
		</form>
		</div>
         
         
              <!-- /.tab-pane -->
        <div class="tab-pane" id="tab_2">
        <div class="box box-info">
            <div class="box-header with-border">
              <b class="box-title">이슈 결과</b>	
              <br/><br/>
            </div>
          
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover" id="issueResult">
                  <thead>
                  <tr id="trtr">
                    <th scope="col" width="5%" tex>No.</th>
                    <th scope="col" width="30%">이슈명</th>
                    <th scope="col" width="10%">발생일자</th>
                    <th scope="col" width="10%">이슈등급</th>
                    <th scope="col" width="10%">상태</th>
                    <th scope="col" width="10%">등록자</th>
                    <th scope="col" width="5%">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
				  	 <c:forEach items="${issueStatusList}" var="issueStatusList">		                  
				  	 	<tr>
       						<td><input type="hidden" value="${issueStatusList.issue_code }">${issueStatusList.rnum }</td>
		                    <td>${issueStatusList.issue_name }</td>
		                    <td>${fn:substringBefore(issueStatusList.issue_event_day, ' ') }</td>
		                    <td>${issueStatusList.issue_level }</td>
		                    <td>
			                    <c:if test="${issueStatusList.issue_status == 'n'}">
			                    	<span class="label label-danger">미처리</span>
								</c:if>
								<c:if test="${issueStatusList.issue_status == 'y'}">
			                    	<span class="label label-primary">처리</span>
								</c:if>
							</td>
		                    <td>${issueStatusList.emp_code }</td>
		                    <td>${issueStatusList.issue_hit }</td>
		                  </tr>
	                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            ${pagingUtil}
            </div>
	        <form action="${pageContext.request.contextPath }/12/main.jsp" method="post" class="form-inline pull-right">
			<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
			<select class="form-control" name="search_keycode" >
				<option value="TOTAL">전체</option>
				<option value="TITLE">제목</option>
				<option value="CONTENT">내용</option>
				<option value="WRITER">작성자</option>
			</select>
		    <button type="submit" class="btn btn-primary form-control">검색</button>
		    <button type="button" id="btn2" class="btn btn-info form-control"> + 보고서 등록</button>
			</form>
          </div>
        </div>
              <!-- /.tab-pane -->
      </div>
            <!-- /.tab-content -->
    </div>
          <!-- nav-tabs-custom -->
<!-- 	</section> -->
	
