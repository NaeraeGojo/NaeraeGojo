<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
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
</style>
<script type="text/javascript">
	$(function() {

		boalert = function(mes) {
			BootstrapDialog.show({
				title : '알림',
				message : mes
			});
		};

		$('#btn_plus_file').click(function(){
			var length = $('input[name=files]').length;
			
			if(length<5){
				var file_tag = '<input type="file" class="filestyle" name="files" data-buttonName="btn-primary">';
				$('#div_files').append(file_tag);
			}else{
				boalert('파일은 5개까지 추가 가능합니다.');
			}
			
		});
		
		$('#btn_back').click(function() {
			$(location).attr('href','${pageContext.request.contextPath}/user/project/pw/pwList.do');
		});

		$('#recsForm').submit(function() {
			var project_code = $('input[name=project_code]').val();
			var recsroom_title = $('input[name=recsroom_title]').val();
			var recsroom_writer = $('input[name=recsroom_writer]').val();
			var recsroom_content = $('textarea[name=recsroom_content]').val();
			var emp_nick = $('input[name=emp_nick]').val();

			if (recsroom_title == '') {
				boalert("제목을 입력해주세요.");
				return false;
			}

			if (recsroom_content == '') {
				boalert("내용을 입력해주세요.");
				return false;
			}

			return true;
		});
		
		
		$('input[name=recsroom_title]').focus();
	});
	
	
</script>

<div class="row">
	<div class="pwcont">
		<div class="col-md-12">
			<div class="box box-2team">

				<div class="box-header with-border">
					<b class="box-title">게시글 등록</b> <br> <br>
				</div>

				<!-- /.box-header -->
				<div class="box-body">
					<form role="form" id="recsForm" class="form-horizontal"
						enctype="multipart/form-data" method="post"
						action="${pageContext.request.contextPath }/user/project/recs/recsInsert.do">
						
						<input type="hidden" name="project_code" value="${project_code}" />

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-6">
								<input id="name" type="text" name="recsroom_title"
									class="form-control" style="border-radius: 1em;"
									placeholder="게시글 제목" >
							</div>
						</div>

						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">작성자</label>
							<div class="col-sm-3">
								<input type="hidden" name="recsroom_writer"	value="${LOGIN_EMPINFO.emp_code }">
								<input type="text" name="emp_nick" class="form-control"
									style="border-radius: 1em;" value="${LOGIN_EMPINFO.emp_nick}"
									readonly="readonly">
							</div>
						</div>

						<div class="form-group">
							<label for="contents" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-8">
								<textarea name="recsroom_content" class="form-control" rows="10"
									placeholder="게시글 내용"
									style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
							</div>
						</div>


						<div class="form-group">
							<label for="file01" class="col-sm-2 control-label">파일 첨부</label>
							<div class="col-sm-10">
								<div id="div_files" style="display: inline-block;">
									<input type="file" class="filestyle" name="files" data-buttonName="btn-primary">
								</div>
								
								<div style="width: 10%; display: inline-block;">
									<input id="btn_plus_file" type="button"
										class="bg-teal btn form-control btn-sm" value="추가"
										style="border-radius: 1em;">
								</div>
							</div>
							
						</div>
						
						<div class="box-footer clearfix">
							<input value="등록" type="submit"
								style="width: 80px;" class="btn btn-warning btn-flat pull-right">
							<input id="btn_back" value="목록" type="button" style="width: 80px;"
								class="btn btn-info btn-flat pull-right">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



</html>