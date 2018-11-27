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
	
	$('.upForm').hide();
	
	$('#updateBtn').click(function(){
		$('#updateBtn').hide();
		$('#commitBtn').attr('style','display:inline-block');
		$('.upForm').show();
	});
	
	$('.btn_update').click(function(){
		project_code = $(this).attr('name');
		$('#updateForm input[name=project_code]').val(project_code);
	});
	
	$('.btn_Upda').click(function(){
		
		var project_code = $('input[name=project_code]').val();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/mp/getMp.do',
            data : {'project_code' : project_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=project_code]').val(json.mp.mp_code);
            	
            	$('#updateForm input[name=project_code]').val(json.projectInfo.project_code);
//             	$('#updateForm input[name=mp_inter]').val(json.mp.mp_inter);
//             	$('#updateForm input[name=mp_high]').val(json.mp.mp_high);
//             	$('#updateForm input[name=mp_spec]').val(json.mp.mp_spec);
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
					<dl class="dl-horizontal">
						<dt>프로젝트명</dt>         
						<dd>
							${projectInfo.project_name }
							<input type="button" class="btn btn-light btn-xs btn_update upForm"  data-toggle="modal" data-target="#updateForm"
							name="project_name" value="수정">
						</dd>
						<dt>프로젝트 시작일</dt> 
						<dd>
							${projectInfo.project_start }
<!-- 							<input type="button" class="btn btn-light btn-xs btn_update upForm"  data-toggle="modal" data-target="#updateForm" -->
<!-- 							name="project_start" value="수정"> -->
						</dd>
				        <dt>프로젝트 예상 종료일</dt>  
				        <dd>
				        	${projectInfo.project_end }
<!-- 				        	<input type="button" class="btn btn-light btn-xs btn_update upForm"  data-toggle="modal" data-target="#updateForm" -->
<!-- 							name="project_end" value="수정"> -->
				        </dd>
						<dt>프로젝트 진척도</dt>      <dd></dd>
						<dt>프로젝트 예산</dt>       <dd>${projectInfo.suggest_cost }</dd>
						<dt>프로젝트 수요기관</dt>    <dd>${projectInfo.rqpps_notice_agency}</dd>
						<input value="삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
						<input value="수정" id="updateBtn" type="button" class="btn btn-sm btn-warning btn-flat pull-right">
						<input value="등록" id="commitBtn" type="submit" class="btn btn-sm btn-warning btn-flat pull-right"
						type="submit" href="${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do" style="display:none;">
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
							<input type="checkbox" value=""><span class="text">${joinList.emp_name }</span> 
							<div class="tools"><i class="fa fa-remove"></i></div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="box-footer clearfix no-border">
					<button type="button" class="btn btn-default pull-right">
						<i class="fa fa-plus"></i> 인원 초대
					</button>
				</div>
			</div>
		</section>
	
<div class="modal fade" id="updateForm">
	<div class="modal-dialog" style="top: 50%;">
		<div class="modal-content" style="width: 60%">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">내용 수정</h4>
			</div>
			<div class="modal-body">
				<form id="update" method="post">
					<input type="hidden" name="project_code"> 
					<input type="text" class="" id="project_name" name="project_name" data-buttonName="btn-primary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-warning btn_Upda">수정</button>
			</div>
		</div>
	</div>
</div>
	
	
	
	</div>
</section>


