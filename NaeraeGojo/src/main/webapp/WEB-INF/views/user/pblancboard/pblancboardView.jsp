<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
#filefile{
	margin-top: 5px;
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
	
	$('.btn_refile').click(function(){
		all_file_code = $(this).attr('name');
		$('#fileUpForm input[name=all_file_code]').val(all_file_code);
	});
	
	$('.btn_fileUp').click(function(){
		var file01 = $('#file01').val();
		
		if(file01 == ''){
			boalert("파일을 선택해 주세요.")
			return false;
		}
		
		var formData = new FormData(); 
		formData.append("all_file_code", all_file_code); 
		formData.append("file", $("input[name=files]")[0].files[0]);
		
		$.ajax({
            type : 'post',
            enctype: 'multipart/form-data',
            processData: false,  // Important!
            contentType: false,
            cache: false,
            url : '${pageContext.request.contextPath}/user/allfile/allFileUpdate.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('#'+all_file_code).text(json.all_file_name);
            	
                $('#fileUpForm').modal('hide');
            }
        });
	});
	
	$('#btn_upForm').click(function(){
		$('#btn_upForm').hide();
		$('#btn_update').attr('style','display:inline-block');
		$('.upForm').show();
		
	});
	
	$('#deleteBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/pblancboard/deletePblancboard/${pblancboardInfo.pblanc_board_code}.do')
    });
	
	$('#listBtn').click(function(){
		
		var currentPage = '${param.currentPage}';
		
		var query = '?currentPage=' + currentPage;
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
		
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do'+query)
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
		<div class="box box-2team">
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
							<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자"
							id="emp_code" name="emp_code" value="${pblancboardInfo.emp_name}">
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

		            <c:forEach items="${pblancboardInfo.items }" var="allFileItem" varStatus="stat">
						<div class="form-group">
							<label for="file01" class="col-sm-2 control-label">첨부 파일</label>
							<div class="col-sm-8" id="filefile" >
								<a id="${allFileItem.all_file_code }" href="${pageContext.request.contextPath }/user/allfile/allFileDownload.do?all_file_code=${allFileItem.all_file_code}">
								${allFileItem.all_file_name }</a>
								<input type="button" class="btn_refile upForm"  data-toggle="modal" data-target="#fileUpForm"
								name="${allFileItem.all_file_code }" value="수정">
							</div>
						</div>
					</c:forEach>	

					<div class="box-footer clearfix">
						<input value="목록" id="listBtn" type="button" class="btn btn-sm btn-info btn-flat pull-right">
						<c:if test="${LOGIN_EMPINFO.emp_code == pblancboardInfo.emp_code }">
						<input value="수정" id="btn_upForm" type="button" class="btn btn-sm btn-warning btn-flat pull-right">
						<button type="submit" id="deleteBtn" class="btn btn-sm btn-danger btn-flat pull-right">삭제</button>
						</c:if>						
						<input id="btn_update" value="등록" type="submit" class="btn btn-sm btn-warning btn-flat pull-right"
						type="submit" href="${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do" style="display:none;">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="fileUpForm">
		<div class="modal-dialog" style="top: 50%;">
			<div class="modal-content" style="width: 60%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">파일 변경</h4>
				</div>
				<div class="modal-body">
					<form id="refileForm" enctype="multipart/form-data" method="post">
						<input type="hidden" name="all_file_code"> 
						<input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary btn_fileUp">수정</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	
</section>
