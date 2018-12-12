<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.no-margin {
	padding: 10px !important;
}

.box-title {
	font-size: 30px !important;
}
#searchForm2{
	margin-top: 35px;
}
.issueresultcont{
	width: 100%;
    display: inline-block;
    text-align: initial;
    padding: 0px 15px;
}
.btn_pw_upper{
	color:white; 
	background-color:#8cd636; 
	border:1px outset; 
	width : fit-content; 
	margin-bottom:14px;
	margin-left: 10px;
	border-radius: 1em;
}
</style>
<script type="text/javascript">
$(function(){
	
	$('#listBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/project_manage.do')
    });
	
	$('#insertIssue').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/issue/issueForm.do');
	});
	
	$('#issueResult tr:gt(0)').click(function(){
		var issue_code = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		
		var currentPage = '${param.currentPage}';
		
		var query = '?issue_code='+issue_code+'&rnum='+rnum;
		
		if(currentPage != null && currentPage != ''){
			query += '&currentPage=' + currentPage;
		}
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
		
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueResultView.do'+query);
	})
	
	$('#issueChart').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/issue/issueChart.do');
	});
	
});
</script>

<div class="row">
	<div class="issueresultcont">
		<div class="col-md-4 pull-left" style="width: auto;">
			<input id="issueChart" value="이슈 차트 조회" type="button" 
				class="btn btn-lg btn_pw_upper" style="background-color: #6884c1;"
				data-toggle="modal" data-target="#modal-default">
		</div>
		<div class="col-md-4 pull-right" style="width: auto;">
			<input id="listBtn" value="프로젝트 목록" type="button" class="btn btn-lg btn_pw_upper"
			style="background-color: #f39c12;">
		</div>
	</div>
	
	<div class="issueresultcont">
	<div class="col-md-12">
		<!-- Custom Tabs -->
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<li><a href="${pageContext.request.contextPath}/user/project/issue/issueList.do">프로젝트 이슈</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/user/project/issue/issueResultList.do">이슈 결과</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
					<div class="box box-info">
						<div class="box-header with-border">
							<b class="box-title">이슈 결과</b> <br />
							<br />
						</div>

						<div class="box-body">
							<div class="table-responsive">
								<table class="table no-margin table-hover" id="issueResult">
									<thead>
										<tr>
											<th scope="col" width="5%" tex>No.</th>
											<th scope="col" width="30%">이슈명</th>
											<th scope="col" width="10%">발생일자</th>
											<th scope="col" width="10%">이슈등급</th>
											<th scope="col" width="10%">상태</th>
											<th scope="col" width="10%">담당자</th>
											<th scope="col" width="5%">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty issueResultList }">
											<tr>
												<td colspan="12" onclick="event.cancelBubble=true;" align="center"><font color="red">등록된 이슈가 없습니다.</font></td>
											</tr>
										</c:if>		
										<c:forEach items="${issueResultList}" var="issueResultList">
											<tr>
												<td><input type="hidden" value="${issueResultList.issue_code }">${issueResultList.rnum }</td>
												<td>${issueResultList.issue_name }</td>
												<td>${fn:substringBefore(issueResultList.issue_event_day, ' ') }</td>
												<td>${issueResultList.issue_level }</td>
												<td>
													<c:if test="${issueResultList.issue_result_status ne 'y' }">
														<span class="label label-danger">미처리</span>
													</c:if> 
													<c:if test="${issueResultList.issue_result_status eq 'y'}">
														<span class="label label-primary">처리</span>
													</c:if>
												</td>
												<td>${issueResultList.emp_damdang }</td>
												<td>${issueResultList.issue_result_hit }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						${pagingUtil}
					</div>

					<form action="${pageContext.request.contextPath}/user/project/issue/issueResultList.do" method="post" class="form-inline pull-right" id="searchForm2">
						<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> 
						<select	class="form-control" name="search_keycode">
							<option value="TOTAL">전체</option>
							<option value="ISSUE">제목</option>
							<option value="NAME">작성자</option>
							<option value="LEVEL">등급</option>
						</select>
						<button type="submit" class="btn btn-primary form-control">검색</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>