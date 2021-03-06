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
			<div class="box box-info">
				<div class="box-header with-border">
              <b class="box-title" style="margin-top: 19px;">PM 받은 보고서함</b>	
              <br/><br/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin table-hover" >
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
										<c:forEach items="${reportListPM }" var="list">
											<tr>
												<td><input type=hidden value="${list.report_code }">${list.rnum }</td>
												<c:if test="${list.report_pl_status eq 'k' && list.report_pm_status eq 'i' }">
												<td><span class="label label-danger">&nbsp;&nbsp;&nbsp;승인중&nbsp;&nbsp;</span></td>
												</c:if>
												<c:if test="${list.report_pl_status eq 'k' && list.report_pm_status eq 'k' }">
												<td><span class="label label-success">승인 완료</span></td>
												</c:if>
												<c:if test="${list.report_pl_status eq 'x' || list.report_pm_status eq 'x' }">
												<td><span class="label label-warning">&nbsp;&emsp;반려&emsp;</span></td>
												</c:if>
												<td>${list.report_title }</td>
												<td>${list.emp_name }</td>
												<td>${list.report_day }</td>
												<td>${list.report_hit }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							${pagingHtmls}
						<div>
						<form action="${pageContext.request.contextPath}/user/report/report_listPM.do"
							method="post" class="form-inline pull-right">
							<br>
							<input id="search_keyword" name="search_keyword" type="text"placeholder="검색어 입력..." class="form-control" /> 
							<select class="form-control" name="search_keycode">
								<!-- 			<option>검색조건</option> -->
								<option value="TOTAL">전체</option>
								<option value="TITLE">제목</option>
								<option value="CONTENT">내용</option>
								<option value="WRITER">작성자</option>
							</select>
							<button type="submit" class="btn btn-primary form-control">검색</button>
						</form>
						</div>
			</div>
</section>
<!-- 	</section> -->

<script type="text/javascript">
$(function() {
	$('table tr:gt(0)').click(function(){
//     	var rnum = $(this).find('td:eq(0)').text();
    	var report_code = $(this).find('td:eq(0) input').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/report/report_recViewPM/'+report_code+'.do');
    });
})
</script>




