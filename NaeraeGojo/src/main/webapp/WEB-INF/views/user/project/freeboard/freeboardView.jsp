<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.perful {
	width: 100%
}

.filestyle {
	padding-top: 5px;
}

.row,.table_pwc,.table_pw>thead>tr>th,.table_pwc>thead>tr>th {
	vertical-align: middle;
	text-align: center;
}

.table_pwc>tbody>tr>td {
	vertical-align: middle;
}

.no-margin {
	padding: 10px !important;
}

.box-title {
	font-size: 30px !important;
}

.cont_pwc .box-title {
	font-size: 20px !important;
}

.pwcont {
	margin-left: 160px;
	margin-right: 160px;
	width: 80%;
	display: inline-block;
	text-align: initial;
}

.input_foot {
	display: inline-block;
	width: 100%;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.text_hideUp {
	border: none;
	border-bottom: 1px solid gray;
}

.form-control[readonly] {
	background-color: white;
}

.btn-flat {
	margin-left: 5px;
}

.view_form[type=text],.view_form[type=date] {
	border-radius: initial;
	border: none;
	border-bottom: 2px solid gray;
}

.box-footer .btn {
	width: 80px;
}

.a_files {
	cursor: pointer;
}
</style>
<script>
	$(function() {
		$('#updateFB')
				.click(
						function() {
							$(location)
									.attr('href',
											'${pageContext.request.contextPath}/user/freeboard/freeboardUpdate.do');
						});
	});
</script>
<div class="row">
	<div class="pwcont">
		<div class="col-md-12">
			<!-- TABLE: LATEST ORDERS -->
			<div class="box box-2team">
				<div class="box-header with-border">
					<b class="box-title">${fbv.rnum }</b> <br />
					<br />
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<form role="form" id="freeViewForm" class="form-horizontal"
						enctype="multipart/form-data" method="post"
						action="${pageContext.request.contextPath }/user/project/freeboard/freeboardUpdate.do">
						<input type="hidden" name="project_code"
							value="${fbv.project_code}" /> <input type="hidden"
							name="freeboard_code" value="${fbv.freeboard_code}" />

						<!-- text input -->
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" disabled=""style="border-radius: 1em;">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 코드</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" disabled=""
									style="border-radius: 1em;">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" disabled=""
									style="border-radius: 1em;">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">글
								비밀번호</label>
							<div class="col-sm-8">
								<input type="password" class="form-control"
									style="border-radius: 1em;">
							</div>
						</div>
						<!-- textarea -->
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="10" disabled=""
									style="border-radius: 1em;"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label"
								for="bo_content">첨부파일:</label>
							<div class="col-sm-8">
								<div id="myCarousel" class="carousel slide" data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
										<li data-target="#myCarousel" data-slide-to="1"></li>
									</ol>
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox"
										style="height: 200px;">
										<c:forEach items="${freeboardInfo.items }" var="fileItemInfo"
											varStatus="stat">
											<c:if test="${stat.first }">
												<div class="item active">
											</c:if>
											<c:if test="${stat.last }">
												<div class="item">
											</c:if>
											<img src="/image/${fileItemInfo.file_save_name }" alt="pic1"
												onclick="javascript:location.href='${pageContext.request.contextPath}/12/fileDownload.jsp?file_seq=${fileItemInfo.file_seq }';">
									</div>
									</c:forEach>
								</div>
							</div>
							<!-- Left and right controls -->
							<a class="carousel-control left" href="#myCarousel"
								data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
								href="#myCarousel" data-slide="next">&rsaquo;</a>
						</div>
					</form>
					<div class="box-footer clearfix">
						<input value="삭제" type="button" href="javascript:void(0)"
							class="btn btn-sm btn-warning btn-flat pull-right"> <input
							value="목록" type="button" href="javascript:void(0)"
							class="btn btn-sm btn-info btn-flat pull-right"> <input
							value="수정" type="button" id="updateFB"
							class="btn btn-sm btn-danger btn-flat pull-right"> <input
							value="댓글" type="button" id="updateFB"
							class="btn btn-sm bg-maroon color-palette btn-flat pull-right">
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>
	</div>
</div>