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
	$('#insertPblanc').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/pblancboard/pblancboardForm.do');
	});

	$('table tr:gt(0)').click(function(){
		var pblanc_board_code = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/pblancboard/pblancboardView.do?pblanc_board_code='+pblanc_board_code+'&rnum='+rnum);
	})
});

</script>

<section class="content">
	<br />
	<br />
	<div class="row">
		<div class="col-md-12">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">프로젝트 공고</b> <br />
					<br />
				</div>
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin table-hover">
							<thead>
								<tr>
									<th scope="col" width="5%" tex>No.</th>
									<th scope="col" width="40%">제목</th>
									<th scope="col" width="15%">공고기관</th>
									<th scope="col" width="15%">예산</th>
									<th scope="col" width="15%">공고날짜</th>
									<th scope="col" width="10%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pblancboardList}" var="pblancboardList">
									<tr>
										<td><input type="hidden"
											value="${pblancboardList.pblanc_board_code }">${pblancboardList.rnum }</td>
										<td>${pblancboardList.pblanc_board_title }</td>
										<td>${pblancboardList.pblanc_board_com }</td>
										<td>${pblancboardList.pblanc_board_budget }</td>
										<td>${fn:substringBefore(pblancboardList.pblanc_board_com_date, ' ') }</td>
										<td>${pblancboardList.pblanc_board_hit }</td>
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
	
	<form action="${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> 
		<select class="form-control" name="search_keycode">
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="PBLANC">공고기관</option>
		</select>
		<button type="submit" class="btn btn-primary form-control">검색</button>
		<button type="button" id="insertPblanc" class="btn btn-danger form-control">공고 등록</button>
	</form>
	
</section>