<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.todo-list{
	background-color: white;
	
}

</style>

<script type="text/javascript">

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
						<dt>프로젝트명</dt>          <dd>${projectInfo.project_name }</dd>
						<dt>프로젝트 진척도</dt>      <dd></dd>
						<dt>프로젝트 시작일</dt>      <dd>${projectInfo.project_start }</dd>
				        <dt>프로젝트 예상 종료일</dt>  <dd>${projectInfo.project_end }</dd>
						<dt>프로젝트 예산</dt>       <dd>${projectInfo.suggest_cost }</dd>
						<dt>프로젝트 수요기관</dt>    <dd>${projectInfo.rqpps_notice_agency}</dd>
						<input value="수정" type="button" class="btn btn-sm btn-warrning btn-flat pull-right">
					</dl>
				</div>
			</div>
		</section>
		
		
		<section class="col-lg-5 connectedSortable">
			<div class="box box-2team">
				<div class="box-header">
					<i class="fa fa-users"></i>
					<h3 class="box-title">참여 인원</h3>
<!-- 					<div class="box-tools pull-right"> -->
<!-- 						<ul class="pagination pagination-sm inline"> -->
<!-- 							<li><a href="#">&laquo;</a></li> -->
<!-- 							<li><a href="#">1</a></li> -->
<!-- 							<li><a href="#">2</a></li> -->
<!-- 							<li><a href="#">3</a></li> -->
<!-- 							<li><a href="#">&raquo;</a></li> -->
<!-- 						</ul> -->
						${pagingUtil}
<!-- 					</div> -->
				</div>
				<div class="box-body" style="height: 607px">
					<ul class="todo-list">
						<c:forEach items="${joinList}" var="joinList">
						<li>
							<span class="handle"> <i class="fa fa-user"></i></span>
							<input type="checkbox" value=""><span class="text">${joinList.rnum } ${joinList.emp_name }</span> 
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
	
	</div>
</section>