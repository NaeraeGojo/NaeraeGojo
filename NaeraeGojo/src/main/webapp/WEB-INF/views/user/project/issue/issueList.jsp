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
	height: 700px;
}
</style>
<script type="text/javascript">
$(function(){
	
	$('#listBtn1').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/project_manage.do')
    });
	
	$('#insertIssue').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/issue/issueForm.do');
	});
	
	$('#issue tr:gt(0)').click(function(){
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
		
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueView.do'+query);
	})
	
	$('#issueResult tr:gt(0)').click(function(){
		var issue_code = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueResultView.do?issue_code='+issue_code+'&rnum='+rnum);
	})
	
	$('#tab2').click(function(){
		$(this).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueList2.do');
	})
	
	$('#issueChart').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/issue/issueChart.do');
	});
	
});
</script>
    
<div class="row">
	<div class="col-md-12">
		<div class="nav-tabs-custom" id="divdiv">
			<ul class="nav nav-tabs">
				<li class="active"><a href="${pageContext.request.contextPath}/user/project/issue/issueList.do">프로젝트 이슈</a></li>
				<li><a href="${pageContext.request.contextPath}/user/project/issue/issueResultList.do">이슈 결과</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
					<div class="box box-info">
						<div class="box-header with-border">
							<b class="box-title">프로젝트 이슈</b> <br />
							<br />
						</div>
						<div class="box-body">
							<div class="table-responsive">
								<table class="table no-margin table-hover" id="issue">
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
													</c:if></td>
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

					<form action="${pageContext.request.contextPath}/user/project/issue/issueList.do" method="post" class="form-inline pull-right">
						<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> 
						<select	class="form-control" name="search_keycode">
							<option value="TOTAL">전체</option>
							<option value="ISSUE">제목</option>
							<option value="NAME">작성자</option>
							<option value="LEVEL">등급</option>
						</select>
						<button type="submit" class="btn btn-primary form-control">검색</button>
						<button type="button" id="issueChart" class="btn btn-warning form-control">이슈 차트</button>
						<button type="button" id="insertIssue" class="btn btn-danger form-control">이슈 등록</button>
						<button type="button" id="listBtn1" class="btn btn-info form-control">프로젝트 목록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 	</section> -->
	
