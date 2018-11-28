<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.no-margin {
	padding: 10px !important;
}

.box-title {
	font-size: 30px !important;
}

.tab-content {
	padding: 30px !important;
}
</style>



<!-- Main content -->
<section class="content">
	<br /> <br />
	<div class="row">
		<div class="col-md-12">
			<!-- Custom Tabs -->
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1" data-toggle="tab">보낸
							보고서함</a></li>
					<li><a href="#tab_2" data-toggle="tab">받은 보고서함</a></li>
					<li class="pull-right"><a href="#" class="text-muted"><i
							class="fa fa-gear"></i></a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<div class="box box-info">
							<div class="box-header with-border">
								<b class="box-title">보낸 보고서함</b> <br /> <br />
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin" id="sendReport">
										<thead>
											<tr>
												<th scope="col" width="10%">No.</th>
												<th scope="col" width="30%">제목</th>
												<th scope="col" width="20%">작성자</th>
												<th scope="col" width="20%">작성날짜</th>
												<th scope="col" width="10%">조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>주간회의 보고서입니다.&nbsp;<span class="label label-warning">임시저장</span></td>
												<td>안창렬</td>
												<td><span>2018-11-11</span></td>
												<td>1</td>
											</tr>
											<tr>
												<td>2</td>
												<td>일일회의 보고서입니다.</td>
												<td>박희태</td>
												<td><span>2018-11-12</span></td>
												<td>3</td>
											</tr>
											<tr>
												<td>3</td>
												<td>IT구축 관련 보고서입니다.</td>
												<td>전현</td>
												<td><span>2018-11-13</span></td>
												<td>4</td>
											</tr>
											<tr>
												<td>4</td>
												<td>정부청사 IT구축 보고서입니다.</td>
												<td>안창렬</td>
												<td>2018-10-30</td>
												<td>4</td>
											</tr>
											<tr>
												<td>5</td>
												<td>수자원공사 DB구축 보고서입니다.</td>
												<td>안창렬</td>
												<td>2018-10-13</td>
												<td>4</td>
											</tr>

										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
								<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
								<ul class="pagination pagination-sm no-margin pull-right">
									<li><a href="#">&laquo;</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
							<!-- /.box-footer -->
							<form action="${pageContext.request.contextPath }/12/main.jsp"
								method="post" class="form-inline pull-right">
								<input id="search_keyword" name="search_keyword" type="text"
									placeholder="검색어 입력..." class="form-control" /> <select
									class="form-control" name="search_keycode">
									<!-- 			<option>검색조건</option> -->
									<option value="TOTAL">전체</option>
									<option value="TITLE">제목</option>
									<option value="CONTENT">내용</option>
									<option value="WRITER">작성자</option>
								</select>
								<button type="submit" class="btn btn-primary form-control">검색</button>
								<button type="button" id="btn1"
									class="btn btn-info form-control">+ 보고서 등록</button>
							</form>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_2">
						<div class="box box-info">
							<div class="box-header with-border">
								<b class="box-title">받은 보고서함</b> <br /> <br />
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin" id="recReport">
										<thead>
											<tr>
												<th scope="col" width="10%">No.</th>
												<th scope="col" width="30%">제목</th>
												<th scope="col" width="20%">작성자</th>
												<th scope="col" width="20%">작성날짜</th>
												<th scope="col" width="10%">조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>일일회의 보고서입니다.</td>
												<td>박희태</td>
												<td>2018-11-11</td>
												<td>2</td>
											</tr>
											<tr>
												<td>2</td>
												<td>주간회의 보고서입니다.</td>
												<td>박희태</td>
												<td>2018-11-11</td>
												<td>3</td>
											</tr>
											<tr>
												<td>3</td>
												<td>이슈관리 보고서입니다.</td>
												<td>최동화</td>
												<td>2018-10-19</td>
												<td>4</td>
											</tr>
											<tr>
												<td>4</td>
												<td>IT보안 보고서입니다.&nbsp;<span class="label label-warning">임시저장</span></td>
												<td>전 현</td>
												<td>2018-10-17</td>
												<td>2</td>
											</tr>
											<tr>
												<td>5</td>
												<td><a href="pages/examples/invoice.html">OR1848</a></td>
												<td>Samsung Smart TV</td>
												<td><span class="label label-warning">Pending</span></td>
												<td>3</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
								<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
								<ul class="pagination pagination-sm no-margin pull-right">
									<li><a href="#">&laquo;</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
							<!-- /.box-footer -->

							<form action="${pageContext.request.contextPath }/12/main.jsp"
								method="post" class="form-inline pull-right">
								<input id="search_keyword" name="search_keyword" type="text"
									placeholder="검색어 입력..." class="form-control" /> <select
									class="form-control" name="search_keycode">
									<!-- 			<option>검색조건</option> -->
									<option value="TOTAL">전체</option>
									<option value="TITLE">제목</option>
									<option value="CONTENT">내용</option>
									<option value="WRITER">작성자</option>
								</select>
								<button type="submit" class="btn btn-primary form-control">검색</button>
								<button type="button" id="btn2"
									class="btn btn-info form-control">+ 보고서 등록</button>
							</form>
						</div>
					</div>
					<!-- /.tab-pane -->


				</div>
				<!-- /.tab-content -->
			</div>
			<!-- nav-tabs-custom -->
</section>

<script type="text/javascript">
	$(function() {
		// 	$('#sendReport tr').click(function(){
		// 				$(location).attr('href','${pageContext.request.contextPath}/user/join/qna_2.do');

		// 	});
		$('#btn1')
				.click(
						function() {
							$(location)
									.attr('href',
											'${pageContext.request.contextPath}/user/report/report_sendInsertPL.do');
						})
		$('#btn2')
				.click(
						function() {
							$(location)
									.attr('href',
											'${pageContext.request.contextPath}/user/report/report_recViewPL.do');
						})

		$('#sendReport tr:gt(0)')
				.click(
						function() {
							//         var bo_no = $(this).find('td:eq(0)').text();
							$(location)
									.attr('href',
											'${pageContext.request.contextPath}/user/report/report_sendDeletePL.do');
						});

		$('#recReport tr:gt(0)')
				.click(
						function() {
							var bo_no = $(this).find('td:eq(0)').text();
							$(location)
									.attr('href',
											'${pageContext.request.contextPath}/user/report/report_recViewPL.do');
						});
	})
</script>