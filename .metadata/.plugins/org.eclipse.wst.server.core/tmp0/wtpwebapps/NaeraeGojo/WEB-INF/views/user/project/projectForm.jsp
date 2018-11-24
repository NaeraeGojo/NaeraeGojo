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
select{
  color: grey;
}
.filefile{
	margin-top: 5px;
}
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
});
</script>
<section class="content">
	<br />
	<br />
	<div class="row">
		<div class="col-md-11">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">프로젝트 등록</b><br/><br/>
				</div>

				<div class="box-body">
					<form role="form" class="form-horizontal">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">제안서</label>
							<div class="col-sm-8">
								<select class="form-control" style="border-radius: 0em;"search_keycode" >
									<option disabled selected hidden>제안서를 선택해주세요</option>
									<option value="1">제안서 제안서 제아아아안서</option>
									<option value="2">제안서 제안서 제안서서서서</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 담당자</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 시작일</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" style="border-radius: 1em;">
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 종료일</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" style="border-radius: 1em;">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 수요기관</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 예산</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">프로젝트 내용</label>
							<textarea class="col-sm-8" rows="10" placeholder="프로젝트 내용" style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">첨부
								파일</label>
							<div class="col-sm-8">
								<input type="file" class="filefile" style="background-color: transparent; border: 0;">
							</div>
						</div>
				</div>

				<div class="box-footer clearfix">
					<input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right"> 
					<input value="목록" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right"> 
					<input value="등록" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
				</div>
				</form>
			</div>
		</div>
	</div>
</section>
