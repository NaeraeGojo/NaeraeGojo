<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.todo-list{
	background-color: white;
}
#updateBtn, #commitBtn{
	margin-right: 5px;
}
.upForm{
	margin-left: 15px;
}

</style>

<script type="text/javascript">
$(function(){
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	}
	
	$('.btn_update').click(function(){
		project_code = $(this).attr('name');
		$('#updateForm input[name=project_code]').val(project_code);
	});
	
	$('#updateBtn').click(function(){
		
		var project_code = $('input[name=project_code]').val();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/project/pro/projectInfo.do',
            data : {'project_code' : project_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=project_code]').val(json.projectInfo.project_code);
            	
            	$('#updateForm input[name=project_name]').val(json.projectInfo.project_name);
            	$('#updateForm input[name=project_start]').val(json.projectInfo.project_start);
            	$('#updateForm input[name=project_end]').val(json.projectInfo.project_end);
            }
        });
	});
	
	$('#commitBtn').click(function(){
		var project_name = $('#updateForm input[name=project_name]').val();
		var project_start = $('#updateForm input[name=project_start]').val();
		var project_end = $('#updateForm input[name=project_end]').val();
		
// 		if(project_name.val()==""){
// 			boalert("프로젝트 제목을 입력해 주세요.")
// 			return false;
// 	    }
// 		if(project_start.val()==""){
// 			boalert("프로젝트 시작 일자를 선택해 주세요.")
// 			return false;
// 	    }
// 		if(project_end.val()==""){
// 			boalert("예상 종료일자를 입력해 주세요.")
// 			return false;
// 	    }

		var formData = $('#update').serialize();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/project/pro/updateProject.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=project_code]').val(json.projectInfo.project_code);
            	
            	$('#update tr:eq(0) td:eq(2)').text(project_name);
            	$('#update tr:eq(1) td:eq(2)').text(project_start);
            	$('#update tr:eq(2) td:eq(2)').text(project_end);
            	
            	
                $('#updateForm').modal('hide');
                $(location).attr('href', '${pageContext.request.contextPath}/user/project/pro/project_manage_see.do?project_code='+${projectInfo.project_code });
            }
        });
	});
	
	$('#deleteBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/pro/deleteProject/${projectInfo.project_code}.do')
	});
});

</script>
<section class="content">
	<div class="row">
		
		<section class="col-lg-7 connectedSortable">
			<div class="box box-2team">
				<div class="box-header with-border">
					<h3 class="box-title">Bar Chart</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body">
					<div class="chart">
						<canvas id="barChart" style="height: 400px"></canvas>
					</div>
				</div>
			</div>
			
			
			<div class="box box-2team">
				<div class="box-header with-border">
					<h3 class="box-title">프로젝트</h3>
				</div>
				<div class="box-body">
					<input type="hidden" name="project_code" value="${projectInfo.project_code }"> 
					<dl class="dl-horizontal">
						<dt>프로젝트명</dt>          <dd>${projectInfo.project_name }</dd>
						<dt>프로젝트 시작일</dt>      <dd>${projectInfo.project_start }</dd>
				        <dt>프로젝트 예상 종료일</dt>  <dd>${projectInfo.project_end }</dd>
						<dt>프로젝트 진척도</dt>      <dd></dd>
						<dt>프로젝트 예산</dt>        <dd>${projectInfo.suggest_cost }</dd>
						<dt>프로젝트 수요기관</dt>     <dd>${projectInfo.rqpps_notice_agency}</dd>
						<input value="삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
						<input value="수정" id="updateBtn" type="button" class="btn btn-sm btn-warning btn-flat pull-right"
						data-toggle="modal" data-target="#updateForm">
					</dl>
				</div>
			</div>
		</section>
		
		<section class="col-lg-5 connectedSortable">
			<div class="box box-2team">
				<div class="box-header">
					<i class="fa fa-users"></i>
					<h3 class="box-title">참여 인원</h3>
					${pagingUtil}
				</div>
				<div class="box-body" style="height: 607px">
					<ul class="todo-list">
						<c:forEach items="${joinList}" var="joinList">
						<li>
							<span class="handle"> <i class="fa fa-user"></i></span>
							<span class="text">${joinList.emp_name }</span> 
							<div class="tools"><i class="fa fa-remove"></i></div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="box-footer clearfix no-border">
					<button type="button" class="btn btn-default pull-right">
						<i class="fa fa-plus"></i> 인원 추가
					</button>
				</div>
			</div>
		</section>
	
		<div class="modal fade" id="updateForm">
			<div class="modal-dialog" style="top: 20%;">
				<div class="modal-content" style="width: 90%">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">내용 수정</h4>
					</div>
					<div class="modal-body">
						<form id="update" method="post">
							<input type="hidden" name="project_code"> 
							<tr>
		              			<td style="width:60px;"><label class="control-label">프로젝트 명</label></td>
		              			<td>
		              				<input name="project_name" type="text" class="form-control" style="border-radius: 1em; width: 100%;">
		              			</td>
              				</tr>
              				<tr>
		              			<td style="width:60px;"><label class="control-label">프로젝트 시작일</label></td>
		              			<td>
		              				<input name="project_start" type="date" class="form-control" style="border-radius: 1em; width: 100%;">
		              			</td>
              				</tr>
              				<tr>
		              			<td style="width:60px;"><label class="control-label">프로젝트 예상종료일</label></td>
		              			<td>
		              				<input name="project_end" type="date" class="form-control" style="border-radius: 1em; width: 100%;">
		              			</td>
              				</tr>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
						<button id="commitBtn" type="button" class="btn btn-warning btn_Upda">수정</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>
</section>


