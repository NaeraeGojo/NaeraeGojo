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
</style>
<script type="text/javascript">
$(function(){
	$('#insert').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/scheduler/schedulerForm.do');
	});
});

$(function() {
    $('#toggle-one').bootstrapToggle();
})
</script>
<section class="content-header">
	<h1>스케줄러 관리</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i>게시판</a></li>
		<li class="active">스케줄러 목록조회</li>
	</ol>
</section>

<section class="content">
	<br/><br/>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">스케줄러</b> <br/><br/>
				</div>
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin">
							<thead>
								<tr id="trtr">
									<th scope="col" width="5%" tex>No.</th>
									<th scope="col" width="35%">스케줄러명</th>
									<th scope="col" width="10%">키워드</th>
									<th scope="col" width="10%">등록자</th>
									<th scope="col" width="10%">시간</th>
									<th scope="col" width="10%">설정</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${schedulerList}" var="schedulerList">
									<tr>
										<td><input type="hidden"
											value="${schedulerList.scheduler_code }">${schedulerList.rnum }</td>
										<td>${schedulerList.scheduler_title }</td>
										<td>${schedulerList.scheduler_keyword }</td>
										<td>${schedulerList.scheduler_writer }</td>
										<td>${schedulerList.scheduler_time }</td>
										<td> 
										<input type="checkbox" checked data-toggle="toggle" data-size="mini" 
										data-onstyle="info" data-offstyle="danger">
										</td>
									</tr>
								</c:forEach>
<!-- 								<tr> -->
<!-- 									<td>2</td> -->
<!-- 									<td>스케줄러</td> -->
<!-- 									<td>키워드</td> -->
<!-- 									<td>전현</td> -->
<!-- 									<td>09:00</td> -->
<!-- 									<td> -->
<!-- 										<input type="checkbox" checked data-toggle="toggle" data-size="mini"  -->
<!-- 										data-onstyle="info" data-offstyle="danger"> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>1</td> -->
<!-- 									<td>스케줄러</td> -->
<!-- 									<td>키워드</td> -->
<!-- 									<td>전현</td> -->
<!-- 									<td>14:00</td> -->
<!-- 									<td> -->
<!-- 										<input type="checkbox" checked data-toggle="toggle"data-size="mini"  -->
<!-- 										data-onstyle="info" data-offstyle="danger"> -->
<!-- 									</td> -->
<!-- 								</tr> -->
							</tbody>
						</table>
					</div>
				</div>
				${pagingUtil}
			</div>
		</div>
	</div>
	<form action="#" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text"
			placeholder="검색어 입력..." class="form-control" /> <select
			class="form-control" name="search_keycode">
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
		<button type="submit" class="btn btn-primary form-control">검색</button>
		<button type="button" id="insert" class="btn btn-danger form-control">스케줄러 등록</button>
	</form>
</section>