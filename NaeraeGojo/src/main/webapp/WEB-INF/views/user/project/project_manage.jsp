<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<style>
.procont {
	margin-left: 160px;
	margin-right: 160px;
	width: 80%;
	display: inline-block;
	text-align: initial;
}
.proname{
	color: #3a94c1;
	text-decoration: none;
}

</style>

<script type="text/javascript">
$(function(){
	$('#insertProject').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/projectForm.do');
	});
	
	$('.aa').click(function(){
		var project_code =$(this).attr('name');
		var currentPage = '${param.currentPage}';
		var query = '?project_code='+project_code;
		
		if (currentPage != null && currentPage != '') {
			query += '&currentPage=' + currentPage;
		}

		var search_keyword = '${param.search_keyword}';
		var search_keycode = '${param.search_keycode}';

		if (search_keyword != null && search_keyword != '') {
			query += '&search_keycode=' + encodeURI(search_keycode)
					+ '&search_keyword='
					+ encodeURI(search_keyword);
		}
		
		$(this).attr('href', '${pageContext.request.contextPath}/user/project/pro/project_manage_see.do' + query)

	})
});


</script>
<br/>
<br/>

<div class="row">

	<div class="procont">
		<div class="col-md-1" style="float: right;">
			<input id="insertProject" value="+ 프로젝트 등록" type="button" class="btn btn-block bg-yellow btn-lg "
			style="float: right; background-color: #c8c8c8; border: 1px outset; width: 200px; margin-bottom: 14px;">
		</div>
	</div>

	<section>
		<div class="procont">
			<c:forEach items="${projectList}" var="projectList">
				<div class="col-md-6">
					<div class="box box-solid">
						<div class="box-header with-border">
							<a class="aa" name="${projectList.project_code }" id="${projectList.project_code }"> 
								<c:if test="${projectList.pw_percent eq 100}">
									<span class="label label-success">완료</span>
								</c:if> 
								<c:if test="${projectList.pw_percent >= 80 && projectList.pw_percent <= 99}">
									<span class="label label-info">완료임박</span>
								</c:if>
								<c:if test="${projectList.pw_percent >= 0 && projectList.pw_percent <= 79}">
									<span class="label label-warning">진행중</span>
								</c:if>

								<h2 title="${projectList.project_name }">
									<c:if test="${ projectList.project_name.length() <= 12}">
				              		${projectList.project_name }
				              	</c:if>
									<c:if test="${ projectList.project_name.length() > 12}">
				              		${fn:substring(projectList.project_name,0,11) }...
				              	</c:if>
								</h2>
							</a>
						</div>
						<div class="box-body proname">
							<h4>
								프로젝트 기간 : &nbsp;<i style="font-size: 20px;">${projectList.project_start}-${projectList.project_end}</i>
							</h4>
							<h2>
								<sup style="font-size: 15px">진척률 &nbsp; </sup>${projectList.pw_percent}%
							</h2>
							<div class="progress">
								<div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar"
								aria-valuenow="${projectList.pw_percent}" aria-valuemin="0" aria-valuemax="100" 
								style="width: ${projectList.pw_percent}%"></div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
	</section>
	${pagingUtil}
	
	<div class="procont">
		<form action="${pageContext.request.contextPath }/12/main.jsp" method="post" class="form-inline pull-right">
			<input id="search_keyword" name="search_keyword" type="text"placeholder="검색어 입력..." class="form-control" />
			 <select class="form-control" name="search_keycode">
				<option value="TOTAL">전체</option>
				<option value="TITLE">프로젝트 명</option>
				<option value="CONTENT">내용</option>
				<option value="WRITER">진척률</option>
			</select>
			<button type="submit" class="btn btn-primary form-control">검색</button>
		</form>
	</div>

</div>
