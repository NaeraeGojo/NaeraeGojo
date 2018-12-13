<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.filestyle {
	padding-top: 5px;
}

.row{
	vertical-align: middle;
	text-align: center;
}

.box-title {
	font-size: 30px !important;
}

.freecont{
	width: 100%;
    display: inline-block;
    text-align: initial;
    padding: 0px 15px;
}

.form-control[disabled] {
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
		$(location).attr('href','${pageContext.request.contextPath}/user/project/freeboard/freeboardList.do');
	});

	$('#freeForm').submit(function() {
		var project_code = $('input[name=project_code]').val();
		var freeboard_title = $('input[name=freeboard_title]').val();
		var freeboard_content = $('textarea[name=freeboard_content]').val();
		var emp_code = $('input[name=emp_code]').val();

		if (freeboard_title == '') {
			boalert("제목을 입력해주세요.");
			return false;
		}

		if (freeboard_content == '') {
			boalert("내용을 입력해주세요.");
			return false;
		}

		return true;
	});
	
	
	$('input[name=freeboard_title]').focus();
});


</script>
	<div class="row">
		<div class="freecont">
			<div class="col-md-12">
				<div class="box box-2team">
					<div class="box-header with-border">
						<b class="box-title">자유게시판 등록</b>
    					<br/><br/>
  					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form role="form" id="freeForm" class="form-horizontal" enctype="multipart/form-data" method="post"
						action="${pageContext.request.contextPath }/user/project/freeboard/freeboardInsert.do">
    					<!-- text input -->
							<input type="hidden" name="project_code" value="${project_code}" />
							
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">게시글 제목</label>
								<div class="col-sm-6">
									<input type="text" id="name" name="freeboard_title" class="form-control" placeholder="제목을 입력해주세요" style="border-radius: 1em;">
								</div>     
							</div>
							
							<div class="form-group">
								<label for="writer" class="col-sm-2 control-label">작성자</label>
								<div class="col-sm-3">
									<input type="hidden" name="emp_code" value="${LOGIN_EMPINFO.emp_code}">
									<input type="text" name="emp_nick" class="form-control" style="border-radius: 1em;" value="${LOGIN_EMPINFO.emp_nick }" disabled="disabled">
								</div>
							</div>
	
							<!-- textarea -->
							<div class="form-group">
								<label for="contents" class="col-sm-2 control-label">내용</label>
								<div class="col-sm-8">
									<textarea name="freeboard_content" class="form-control" rows="10" placeholder="내용을 입력해주세요" 
									style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label for="file01" class="col-sm-2 control-label">첨부파일</label>
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
				<!-- /.box -->
				</div>
			</div>
		</div>
	</div>