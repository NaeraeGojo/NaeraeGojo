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
</style>
<script type="text/javascript">
$(function() {
	$('#listBtn1').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/project_manage.do')
    });
	
	$('table tr:gt(0)').click(
		function() {
			var issue_result_code = $(this).find('td:eq(0) input').val();
			var rnum = $(this).find('td:eq(0)').text();
			$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/riskView.do?issue_result_code='+issue_result_code+'&rnum='+rnum);
	});
});
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">프로젝트 리스크</b>
					<br /> <br />
				</div>
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin table-hover">
							<thead>
								<tr>
									<th scope="col" width="5%" tex>No.</th>
									<th scope="col" width="30%">리스크명</th>
									<th scope="col" width="10%">발생일자</th>
									<th scope="col" width="10%">처리일자</th>
									<th scope="col" width="10%">이슈등급</th>
									<th scope="col" width="10%">처리담당자</th>
									<th scope="col" width="5%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${riskList}" var="riskList">
									<tr>
										<td><input type="hidden" value="${riskList.issue_result_code }">${riskList.rnum }</td>
										<td>${riskList.issue_name }</td>
										<td>${fn:substringBefore(riskList.issue_event_day, ' ') }</td>
										<td>${fn:substringBefore(riskList.issue_result_day, ' ') }</td>
										<td>${riskList.issue_level }</td>
										<td>${riskList.emp_code_ir }</td>
										<td>${riskList.risk_hit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				${pagingUtil}
			</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/user/project/issue/riskList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode">
			<option value="TOTAL">전체</option>
			<option value="ISSUE">제목</option>
			<option value="NAME">작성자</option>
			<option value="LEVEL">등급</option>
		</select>
		<button type="submit" class="btn btn-primary form-control">검색</button>
		<button type="button" id="listBtn1" class="btn btn-info form-control">프로젝트 목록</button>
	</form>
</section>