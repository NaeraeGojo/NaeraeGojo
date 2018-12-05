<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
#myChart{
	height: 100px;
	width: 250px;
	display: inline-table;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
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

$(function () {
	
	var complete = ${totalComplete}
	var ing = ${totalIng}
	var totalnew = ${totalNew}
	
	new Chart(document.getElementById("myChart"), {
		animation:true,
		type: 'doughnut',
		data: {
// 			labels: ["진행", "완료", "신규"],
			labels: ["완료", "진행", "신규"],
				datasets: [
				{
					backgroundColor: ["#f56954", "#00a65a","#f39c12"],
					data: [complete,ing,totalnew]
				}
			]
		},
		options: {
		    legend: {
		      position: 'right',
		      labels: {
	                fontSize: 16,
	                padding: 15
	          }
		    },
// 		    title: {
// 		        display: true,
// 		        text: 'ㅠㅠ'
// 		    }
		}
	});
	
})


</script>
<section class="content">
	<div class="row">
		<section class="col-lg-7 connectedSortable">

			<div class="row">
				<div class="col-md-12">
					<div class="nav-tabs-custom">
						<div class="box box-2team" style="height:480px">
							
							<div class="box-header with-border">
								<ul class="nav nav-tabs">
									<li ><a href="#tab_1" data-toggle="tab"><font size="2">업무 목록</font></a></li>
									<li class="active"><a href="#tab_2" data-toggle="tab"><font size="2">진행 현황</font></a></li>
								</ul>
							</div>
							
							<div class="tab-content">
								<div  class="tab-pane box-body"  id="tab_1">
									<div class="table-responsive">
										<table id="modal1" class="table no-margin table-hover">
											<thead>
												<tr>
													<th>No.</th>
													<th>업무</th>
													<th>업무</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>업무</td>
													<td>업무</td>
													<td>업무</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

								<div class="tab-pane active box-body" id="tab_2">
									<div class="row">
										<div class="col-md-8">
											<div class="chart-responsive">
												<canvas id="myChart"></canvas> 
											</div>
										</div>
									</div>

									<div class="box-footer no-padding" >
										<ul class="nav nav-pills nav-stacked">
<!-- 											<li> -->
<!-- 												<a href="#"> 전체 업무  -->
<!-- 													<span class="pull-right text-red"> -->
<%-- 														${totalComplete+totalIng+totalNew} 개 --%>
<!-- 													</span> -->
<!-- 												</a> -->
<!-- 											</li> -->
											<li>
												<a href="#"> 완료
													<span class="pull-right text-red">
														<fmt:formatNumber value="${totalComplete/(totalComplete+totalIng+totalNew)*100}"
 														pattern=""/> % 
													</span>
												</a>
											</li>
											<li>
												<a href="#"> 진행중 
													<span class="pull-right text-green">
														<fmt:formatNumber value="${totalIng/(totalComplete+totalIng+totalNew)*100}"
 														pattern=""/> % 
													</span>
												</a>
											</li>
											<li>
												<a href="#"> 신규
													<span class="pull-right text-yellow">
														<fmt:formatNumber value="${totalNew/(totalComplete+totalIng+totalNew)*100}"
														pattern=""/> %
													</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								
							</div>
							<div class="box-footer clearfix"></div>
						</div>
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
						<dt>프로젝트 진척도</dt>      <dd>${projectInfo.pw_percent } %</dd>
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


