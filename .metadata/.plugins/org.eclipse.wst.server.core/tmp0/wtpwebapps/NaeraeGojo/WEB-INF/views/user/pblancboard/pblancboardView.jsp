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

</style>
<script type="text/javascript">
$(function(){
	$('body').on('change','select', function (ev){
	    if($(this).find('option:selected').val() == ""){
	        $(this).css('color','#999');
	        $(this).children().css('color','black');
	    }
	    else {
	        $(this).css('color','black');
	        $(this).children().css('color','black');
	    }
	});
	
	$('#deleteBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/pblancboard/deletePblancboard/${pblancboardInfo.pblanc_board_code}.do')
    });
	
	$('#listBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do')
    });
	
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
	
});
</script>

<section class="content">
	<br/><br/>
	<div class="col-md-11">
		<div class="box box-warning">
			<div class="box-header with-border">
				<b class="box-title">공고 상세 정보</b> <br/><br/>
			</div>
			<div class="box-body">
				<form role="form" class="form-horizontal" enctype="multipart/form-data"  method="post"
				action="${pageContext.request.contextPath}/user/pblancboard/updatePblancboard.do">
					<input type="hidden" name="pblanc_board_code" value="${pblancboardInfo.pblanc_board_code}" />
					<div class="form-group">
						<label for="pblanc_board_title" class="col-sm-2 control-label">공고제목</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목"
								id="pblanc_board_title" name="pblanc_board_title" value="${pblancboardInfo.pblanc_board_title}">
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자">
						</div>
					</div>

					<div class="form-group">
						<label for="pblanc_board_com" class="col-sm-2 control-label">공고기관</label>
						<div class="col-sm-8">
							<input type="text" class="form-control"	style="border-radius: 1em;" placeholder="공고기관"
								id="pblanc_board_com" name="pblanc_board_com" value="${pblancboardInfo.pblanc_board_com}">
						</div>
					</div>

					<div class="form-group">
						<label for="pblanc_board_com_date" class="col-sm-2 control-label">공고일자</label>
						<div class="col-sm-8">
							<input type="date" class="form-control" style="border-radius: 1em;" placeholder="공고일자"
								id="pblanc_board_com_date" name="pblanc_board_com_date" value="${pblancboardInfo.pblanc_board_com_date}">
						</div>
					</div>

					<div class="form-group">
						<label for="pblanc_board_link" class="col-sm-2 control-label">공고링크</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" style="border-radius: 1em; cursor: pointer" placeholder="공고링크"
								id="pblanc_board_link" name="pblanc_board_link" value="${pblancboardInfo.pblanc_board_link}"
								onClick="window.open('${pblancboardInfo.pblanc_board_link}')">
						</div>
					</div>

					<div class="form-group">
						<label for="pblanc_board_budget" class="col-sm-2 control-label">예산</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" style="border-radius: 1em;" placeholder="예산"
							id="pblanc_board_budget" name="pblanc_board_budget" value="${pblancboardInfo.pblanc_board_budget}"></div>
					</div>

					<div class="form-group">
						<label for="pblanc_board_end_proposal" class="col-sm-2 control-label">제안서 마감일자</label>
						<div class="col-sm-8">
							<input type="date" class="form-control" style="border-radius: 1em;" placeholder="제안서 마감일자"
							id="pblanc_board_com" name="pblanc_board_end_proposal" value="${pblancboardInfo.pblanc_board_end_proposal}">
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">첨부 파일</label>
						<div class="col-sm-8">
							<input type="file" id="file01" class="files" style="background-color: transparent; border: 0;">
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">첨부 파일</label>
						<div class="col-sm-8">
							<input type="file" id="file02" class="files" style="background-color: transparent; border: 0;">
						</div>
					</div>
					
					<div class="box-footer clearfix">
						<input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right">
						<input value="삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
						<button type="submit" class="btn btn-sm btn-warning btn-flat pull-right">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
