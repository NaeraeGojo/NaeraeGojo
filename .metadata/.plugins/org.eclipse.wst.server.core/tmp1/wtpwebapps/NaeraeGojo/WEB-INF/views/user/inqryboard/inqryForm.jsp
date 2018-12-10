<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
.inqrycont {
	margin-left: 160px;
	margin-right: 160px;
	width: 80%;
	display: inline-block;
	text-align: initial;
}
.btn-sm {
	width : 80px;
	margin-right:5px; 
}
.form-control[disabled] {
	background-color: white;
}

label {
	font-size: 20px !important;
}
</style>
<script type="text/javascript">
$(function(){
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
		$(location).attr('href','${pageContext.request.contextPath}/user/inqryboard/inqryList.do');
	});

	$('#inqryForm').submit(function() {
		var inqry_board_title = $('input[name=inqry_board_title]').val();
		var inqry_board_content = $('textarea[name=inqry_board_content]').val();
		var emp_code = $('input[name=emp_code]').val();

		if (inqry_board_title == '') {
			boalert("제목을 입력해주세요.");
			return false;
		}

		if (inqry_board_content == '') {
			boalert("내용을 입력해주세요.");
			return false;
		}

		return true;
	});
	
	
	$('input[name=inqry_board_title]').focus();
});

</script>

	<div class="row">
		<div class="inqrycont">
			<div class="col-md-12">
				<!-- TABLE: LATEST ORDERS -->
          		<div class="box box-warning">
            		<div class="box-header with-border">
              			<b class="box-title">문의 등록</b>
              			<br/><br/>
            		</div>
            		<!-- /.box-header -->
            		<div class="box-body">
            			<form role="form" id="inqryForm" class="form-horizontal" enctype="multipart/form-data" method="post"
           				action="${pageContext.request.contextPath }/user/inqryboard/inqryInsert.do">
                		<!-- text input -->
			                <div class="form-group">
			                  <label for="name" class="col-sm-2 control-label">게시글 제목</label>
			                  	<div class="col-sm-6">
			                  		<input type="text" id="name" name="inqry_board_title" class="form-control" placeholder="제목을 입력해주세요" style="border-radius: 1em;">
			                	</div>                
			                </div>
			                
                			<div class="form-group">
		                  		<label for="writer" class="col-sm-2 control-label">작성자</label>
		                  		<div class="col-sm-3">
		                  			<input type="hidden" name="emp_code" value="${LOGIN_EMPINFO.emp_code }">
		                  			<input type="text" name="emp_nick" class="form-control" value="${LOGIN_EMPINFO.emp_nick }" style="border-radius: 1em;" disabled="disabled">
		 	              		</div>
		                	</div>
		                
		                	<!-- textarea -->
		                	<div class="form-group">
		                		<label for="contents" class="col-sm-2 control-label">내용</label>
		                  		<div class="col-sm-8">
		                  			<textarea name="inqry_board_content" class="form-control" rows="10" placeholder="내용을 입력해주세요" style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
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
