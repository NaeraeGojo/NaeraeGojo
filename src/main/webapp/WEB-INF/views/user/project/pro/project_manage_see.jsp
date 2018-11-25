<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="content">
	<div class="row">
		<!-- Left col -->
		<section class="col-lg-7 connectedSortable">
			<div class="box box-success">
				<div class="box-header with-border">
					<h3 class="box-title">Bar Chart</h3>

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
				<div class="box-body">
					<div class="chart">
						<canvas id="barChart" style="height: 400px"></canvas>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">프로젝트</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<dl class="dl-horizontal">
						<dt>프로젝트명</dt>
						<dd>프로젝트 매니지먼트 시스템</dd>
						<dt>프로젝트 진척도</dt>
						<dd>막대그래프</dd>
						<dt>프로젝트 기간</dt>
						<dd>2018 11 11</dd>
						<dt>프로젝트 예산</dt>
						<dd>111,111,111</dd>
						<dt>프로젝트 수요기관</dt>
						<dd>대덕인재</dd>
            			<input value="수정" type="button" class="btn btn-sm btn-info btn-flat pull-right">
					</dl>
				</div>
				
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</section>
		<!-- /.Left col -->
		<!-- right col (We are only adding the ID to make the widgets sortable)-->
		<section class="col-lg-5 connectedSortable" >
			<!-- TO DO List -->
			<div class="box box-primary">
				<div class="box-header">
					<i class="fa fa-users"></i>
					<h3 class="box-title">참여 인원</h3>
					<div class="box-tools pull-right">
						<ul class="pagination pagination-sm inline">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body" style="height: 590px">
					<!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
					<ul class="todo-list">
						<li>
							<span class="handle"> 
								<i class="fa fa-user"></i> 
						    </span> <!-- checkbox --> 
						    <input type="checkbox" value=""> <!-- todo text -->
							<span class="text">박희태</span> <!-- Emphasis label --> 
							<div class="tools">
								<i class="fa fa-remove"></i>
							</div>
						</li>
					</ul>
				</div>
				<!-- /.box-body -->
				<div class="box-footer clearfix no-border">
					<button type="button" class="btn btn-default pull-right">
						<i class="fa fa-plus"></i> 인원 초대
					</button>
				</div>
			</div>
		</section>
		<!-- right col -->
	</div>
	<!-- /.row (main row) -->
</section>