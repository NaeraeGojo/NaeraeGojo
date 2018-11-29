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
              <b class="box-title" style="margin-top: 19px;">개발자 보낸 보고서함</b>	
              <br/><br/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin" id="sendDelete">
										<thead>
											<tr>
												<th scope="col" width="10%">No.</th>
												<th scope="col" width="10%">확인 여부</th>
												<th scope="col" width="30%">제목</th>
												<th scope="col" width="20%">작성자</th>
												<th scope="col" width="20%">작성날짜</th>
												<th scope="col" width="10%">조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>일일회의 보고서입니다.</td>
												<td>박희태</td>
												<td>2018-11-11</td>
												<td>3</td>
											</tr>
											<tr>
												<td>2</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>주간회의 보고서입니다.</td>
												<td>박희태</td>
												<td>2018-11-11</td>
												<td>3</td>
											</tr>
											<tr>
												<td>3</td>
												<td><span class="label label-warning">&nbsp;&emsp;반려&emsp;</span></td>
												<td>이슈관리 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-19</td>
												<td>4</td>
											</tr>
											<tr>
												<td>4</td>
												<td><span class="label label-danger">&nbsp;&nbsp;&nbsp;승인
														중&nbsp;&nbsp;</span></td>
												<td>IT보안 보고서입니다.&nbsp;<span class="label label-warning">임시저장</span></td>
												<td>전 현</td>
												<td>2018-10-17</td>
												<td>5</td>
											</tr>
											<tr>
												<td>5</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>통계청 IT구축 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-11</td>
												<td>4</td>
											</tr>
											<tr>
												<td>5</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>통계청 IT구축 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-11</td>
												<td>4</td>
											</tr>
											<tr>
												<td>5</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>통계청 IT구축 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-11</td>
												<td>4</td>
											</tr>
											<tr>
												<td>5</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>통계청 IT구축 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-11</td>
												<td>4</td>
											</tr>
											<tr>
												<td>5</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>통계청 IT구축 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-11</td>
												<td>4</td>
											</tr>
											<tr>
												<td>5</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>통계청 IT구축 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-11</td>
												<td>4</td>
											</tr>
											<tr>
												<td>5</td>
												<td><span class="label label-success">승인 완료</span></td>
												<td>통계청 IT구축 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-11</td>
												<td>4</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							${pagingUtil}
						<div>
						<form action="${pageContext.request.contextPath}/user/report/report_listDev.do"
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
							<button type="button" id="btn2" class="btn btn-info form-control">
								+ 보고서 등록</button>
						</form>
						</div>
			</div>
</section>
<!-- 	</section> -->

<script type="text/javascript">
$(function() {
	$('#btn2').click(function() {
		$(location).attr('href','${pageContext.request.contextPath}/user/report/report_sendFormDev.do');
	})

	$('#sendDelete tr:gt(0)').click(function() {
		$(location).attr('href','${pageContext.request.contextPath}/user/report/report_sendDeleteDev.do');
	});
})
</script>




