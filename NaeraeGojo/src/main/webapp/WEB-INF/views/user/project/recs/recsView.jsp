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

.view_form[type=text], .view_form[type=date]{
 	border-radius: initial;
 	border: none;
    border-bottom: 2px solid gray;
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
	

	$('.view_form').attr('readonly',true);
	$('.up_form').hide();

	$("#btn_upForm").click(function(){
		$('.view_form').hide();
		$('.up_form').show();
	});
	
	$('#btn_cancle').click(function(){
		$('.up_form').hide();
		$('.view_form').show();
	});

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
	
	$('input[name=recsroom_title]').val('${rrv.recsroom_title}');
	$('textarea[name=recsroom_content]').val('${rrv.recsroom_content}');
	$('input[name=emp_nick]').val('${rrv.emp_nick}');

	$('input[name=recsroom_title_view]').val('${rrv.recsroom_title}');
	$('textarea[name=recsroom_content_view]').val('${rrv.recsroom_content}');
});
</script>

<div class="row">
	<div class="pwcont">
		<div class="col-md-12">
			<div class="box box-2team">

				<div class="box-header with-border">
					<b class="box-title">${rrv.rnum }</b> <br> <br>
				</div>

				<!-- /.box-header -->
				<div class="box-body">
					<form role="form" id="recsForm" class="form-horizontal"
						enctype="multipart/form-data" method="post"
						action="${pageContext.request.contextPath }/user/project/recs/recsInsert.do">
						
						<input type="hidden" name="project_code" value="${rrv.project_code}" />
						<input type="hidden" name="recsroom_code" value="${rrv.recsroom_code}" />

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-6">
								<input id="name" type="text" name="recsroom_title_view"
								class="form-control view_form">
								<input id="name" type="text" name="recsroom_title"
								class="form-control up_form" style="border-radius: 1em;">
							</div>
						</div>

						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">작성자</label>
							<div class="col-sm-3">
								<input type="hidden" name="recsroom_writer">
								<input type="text" name="emp_nick" class="form-control" style="border: none;
		    					border-bottom: 2px solid gray;" readonly="readonly" >
							</div>
						</div>

						<div class="form-group">
							<label for="contents" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-8">
								<textarea name="recsroom_content_view" class="form-control view_form" rows="10"
									style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>

								<textarea name="recsroom_content" class="form-control up_form" rows="10"
									style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
							</div>
						</div>


						<div class="form-group">
							<label for="file01" class="col-sm-2 control-label">파일 첨부</label>
							<div class="col-sm-10">
								<div class="up_form">
									<div id="div_files" style="display: inline-block;" class="">
										<input type="file" class="filestyle" name="files" data-buttonName="btn-primary">
									</div>
									
									<div style="width: 10%; display: inline-block;">
										<input id="btn_plus_file" type="button"
											class="bg-teal btn form-control btn-sm" value="추가"
											style="border-radius: 1em;">
									</div>
								</div>
								
								<div class="view_form">
									<div style="display: inline-block;" class="">
										<c:if test="${!empty nfl }">
										<c:forEach items="${nfl }" var="item">
											<a id="${item.project_all_file_code }" class="a_files" 
											href="${pageContext.request.contextPath }/user/profile/profileDownload.do?project_all_file_code=${item.project_all_file_code}">
												${item.project_all_file_name }</a>
											<input type="button" class="btn_refile upForm"  data-toggle="modal" data-target="#fileUpForm"
			 	 							name="${item.project_all_file_code }" value="수정">
										</c:forEach>
										</c:if>
									</div>
									
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