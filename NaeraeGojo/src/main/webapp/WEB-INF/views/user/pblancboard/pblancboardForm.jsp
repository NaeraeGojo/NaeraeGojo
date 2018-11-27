<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
.btn-sm {
	width : 80px;
	margin-right:5px; 
}
/* label { */
/* 	font-size: 20px !important; */
/* } */
.col-md-11 {
	margin: 10px;
}
.filefile{
	margin-top: 5px;
}
.form-control[readonly]{
   background-color: white;
}
.form-control[disabled]{
   background-color: white;
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
	
	$("#pblanc_board_com_date, #pblanc_board_end_proposal").datepicker({
		showButtonPanel: true,
		minDate: 0,
		changeMonth: true, 
		dateFormat: "yy-mm-dd",
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$('#listBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do')
    });

	$('#pblancForm').submit(function(){
		if($('input[name=pblanc_board_title]').val()==""){
			boalert("공고 제목을 입력해 주세요.")
			return false;
	    }
		if($('input[name=emp_code]').val()==""){
			boalert("작성자를 입력해 주세요.")
			return false;
	    }
		if($('input[name=pblanc_board_com]').val()==""){
			boalert("공고기관을 입력해 주세요.")
			return false;
	    }
		if($('input[name=pblanc_board_com_date]').val()==""){
			boalert("공고 일자를 선택해 주세요.")
			return false;
	    }
		if($('input[name=pblanc_board_link]').val()==""){
			boalert("공고 링크를 입력해 주세요.")
			return false;
	    }
		if($('input[name=pblanc_board_budget]').val()==""){
			boalert("예산을 입력해 주세요.")
			return false;
	    }
		if($('input[name=pblanc_board_end_proposal]').val()==""){
			boalert("제안서 마감 일자를 선택해 주세요.")
			return false;
	    }
		return true;
	});
});
</script>
<section class="content">
	<br /><br />
	<div class="row">
		<div class="col-md-11">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">공고 등록</b><br/><br/>
				</div>
				<div class="box-body">
					<form role="form" id="pblancForm" class="form-horizontal" enctype="multipart/form-data"  method="post" 
					action="${pageContext.request.contextPath }/user/pblancboard/insertPblancboard.do">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">공고제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목"
								id="pblanc_board_title" name="pblanc_board_title">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자"
								id="emp_code" name="emp_code" value="${LOGIN_EMPINFO.emp_name }" readonly="readonly">
							</div>
						</div>
						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">공고기관</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고기관"
								id="pblanc_board_com" name="pblanc_board_com">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">공고일자</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" style="border-radius: 1em;" placeholder="공고일자"
								id="pblanc_board_com_date" name="pblanc_board_com_date">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">공고링크</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고링크"
								id="pblanc_board_link" name="pblanc_board_link">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">예산</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="예산"
								id="pblanc_board_budget" name="pblanc_board_budget">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">제안서 마감일자</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" style="border-radius: 1em;" placeholder="공고일자"
								id="pblanc_board_end_proposal" name="pblanc_board_end_proposal">
							</div>
						</div>
						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">첨부 파일</label>
							<div class="col-sm-8">
								<input type="file" id="file01" class="files" name="files" style="background-color: transparent; border: 0;">
							</div>
						</div>

<!-- 						<div class="form-group"> -->
<!-- 							<label for="inputEmail3" class="col-sm-2 control-label">첨부 파일</label> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<input type="file" id="file02" class="files" name="files" style="background-color: transparent; border: 0;"> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
						<div class="box-footer clearfix">
							<input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right">
							<button type="submit" class="btn btn-sm btn-warning btn-flat pull-right">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
