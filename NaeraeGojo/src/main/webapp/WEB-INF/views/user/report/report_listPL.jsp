<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.no-margin {
	padding: 10px !important;
}

.box-title {
	font-size: 30px !important;
}

#divdiv {
	height: 700px;
}

.box-header.with-border {
	border-bottom: 1px solid #f4f4f4;
	height: 90px;
}
</style>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-info">
				<div class="box-header with-border">
					</br>
					<h3 class="box-title">PL 보고서 관리</h3>
				</div>
				<div class="nav-tabs-custom" id="divdiv">
					<ul class="nav nav-tabs">
						<li class="active"><a
							href="${pageContext.request.contextPath}/user/report/report_listPL.do">보낸
								보고서함</a></li>
						<li><a
							href="${pageContext.request.contextPath}/user/report/report_listPLRec.do">받은
								보고서함</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_1">
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin" id="sendDelete">
										<thead>
											<tr>
												<th scope="col" width="10%">No.</th>
												<th scope="col" width="10%">결재 여부</th>
												<th scope="col" width="30%">제목</th>
												<th scope="col" width="20%">작성자</th>
												<th scope="col" width="20%">작성날짜</th>
												<th scope="col" width="10%">조회수</th>
											</tr>
										</thead>
										<tbody id="codeId">
										<c:forEach items="${reportListPL }" var="list">
											<tr>
												<td><input type=hidden value="${list.report_code }">${list.rnum }</td>
												<c:if test="${list.report_pl_status eq 'k' && list.report_pm_status eq 'i' }">
												<td><span class="label label-danger">&nbsp;&nbsp;&nbsp;승인중&nbsp;&nbsp;</span></td>
												</c:if>
												<td>${list.report_title }</td>
												<td>${list.emp_name }</td>
												<td>${list.report_day }</td>
												<td>3</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							${pagingHtmls}
						</div>

						<form action="${pageContext.request.contextPath}/user/report/report_listPL.do"
							method="post" class="form-inline pull-right">
							<input id="search_keyword" name="search_keyword" type="text"placeholder="검색어 입력..." class="form-control" /> 
							<select class="form-control" name="search_keycode">
								<!-- 			<option>검색조건</option> -->
								<option value="TOTAL">전체</option>
								<option value="TITLE">제목</option>
								<option value="CONTENT">내용</option>
								<option value="WRITER">작성자</option>
							</select>
							<button type="submit" class="btn btn-primary form-control">검색</button>
							<button type="button" id="btn2" class="btn btn-info form-control">
								+ 보고서 등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 	</section> -->

<script type="text/javascript">
$(function() {
	$('#btn2').click(function() {
		$(location).attr('href','${pageContext.request.contextPath}/user/report/report_sendFormPL.do');
	})

	$('table tr:gt(0)').click(function(){
//     	var rnum = $(this).find('td:eq(0)').text();
    	var report_code = $(this).find('td:eq(0) input').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/report/report_sendDeletePL/'+report_code+'.do');
    });
})
</script>




