<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.perful {
	width: 100%
}

.filestyle {
	padding-top: 5px;
}

.inqrycont {
	margin-left: 160px;
	margin-right: 160px;
	width: 80%;
	display: inline-block;
	text-align: initial;
}
.row {
	vertical-align: middle;
	text-align: center;
}

.box-title {
	font-size: 30px !important;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.form-control[readonly] {
	background-color: white;
}

.btn-flat {
	margin-left: 5px;
}

.view_form[type=text],.view_form[type=date] {
	border-radius: initial;
	border: none;
	border-bottom: 2px solid gray;
}

.box-footer .btn {
	width: 80px;
}

.a_files {
	cursor: pointer;
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
	refresh = function(){
// 		var project_code = '${fbv.project_code}';
		var doc_code = '${ibv.inqry_board_code}';
		var doc_class = '3';
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/allfile/allfileList.do'
			, data : {doc_code:doc_code
						,doc_class:doc_class}
			, type : 'post'
			, dataType : 'json'
			, error: function(xhr, status, error){
                alert(error);
            }
			, success : function(json){
				var tag_file = '';
				$.each(json.pfl, function(i,v){
					tag_file += '<tr>';
					tag_file += '<td style="width:200px;">';
					tag_file += '<a id="'+v.project_all_file_code+'" class="a_files" title="'+v.project_all_file_name+'">';
					if(v.project_all_file_name.length > 16){
						var subName = v.project_all_file_name.substring(0,16) + '...';
						tag_file += subName;
					}else{
						tag_file += v.project_all_file_name;
					}
					tag_file += '</a></td>';
					tag_file += '<td>';
					tag_file += '<input type="button" class="btn_refile up_form btn btn-default"  data-toggle="modal" data-target="#fileUpForm"';
					tag_file += 'code="'+v.project_all_file_code+'" value="수정"></td>';
					tag_file += '<td>';
					tag_file += '<input type="button" class="btn_delfile up_form btn btn-danger"';
					tag_file += 'code="'+v.project_all_file_code+'" value="삭제">';
					tag_file += '</td></tr>';
				});
				$('#table_files').empty();
				$('#table_files').append(tag_file);
				
				var dp = $('.up_form').css('display');
				
				if(dp == 'none'){
					$('.up_form').hide();
				}
            }
		});
	}
	
	$('.view_form').attr('readonly',true);
	$('.up_form').hide();

	$("#btn_upForm").click(function(){
		$('.view_form').hide();
		$('.up_form').show();
		
		$('.table_files').attr('sytle','border-collapse:separate; border-spacing:10px;');
		
	});
	
	$('#btn_cancle').click(function(){
		$('.up_form').hide();
		$('.view_form').show();
	});
	
	$('#btn_del').click(function(){
		var inqry_board_code = '${ibv.inqry_board_code}';
		
		var query = '?inqry_board_code=' + inqry_board_code;
		
		$(location).attr('href','${pageContext.request.contextPath}/user/inqryboard/inqryDelete.do'+query);
	});

	$('#btn_back').click(function() {
		var currentPage = '${param.currentPage}';
		
		var query = '?currentPage=' + currentPage;
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
		
		
		$(location).attr('href','${pageContext.request.contextPath}/user/inqryboard/inqryList.do' + query);
	});
	

	$('#inqryUpForm').submit(function() {
		var inqry_board_code = $('input[name=inqry_board_code]').val();
		var inqry_board_title = $('input[name=inqry_board_title]').val();
		var emp_code = $('input[name=emp_code]').val();
		var emp_nick = $('input[name=emp_nick]').val();
		var inqry_board_content = $('textarea[name=inqry_board_content]').val();

		if (inqry_board_title == '') {
			boalert("제목을 입력해주세요.");
			return false;
		}

		if (inqry_board_content == '') {
			boalert("내용을 입력해주세요.");
			return false;
		}

		return true;
	});
	
	refresh();
	
	$('input[name=inqry_board_title]').val('${ibv.inqry_board_title}');
	$('input[name=emp_code]').val('${ibv.emp_code}');
	$('input[name=emp_nick]').val('${ibv.emp_nick}');

	$('input[name=inqry_board_title_view]').val('${ibv.inqry_board_title}');
});
</script>
    <br/><br/>
      <div class="row">
      	<div class="inqrycont">
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">${ibv.rnum }</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <form id="inqryUpForm" class="form-horizontal" enctype="multipart/form-data" method="post"
            	action="${pageContext.request.contextPath }/user/inqryboard/inqryUpdate.do">
            	<input type="hidden" name="inqry_board_code" value="${ibv.inqry_board_code}" />
                
                <!-- text input -->
                <div class="form-group">
                  <label for="name" class="col-sm-2 control-label">게시글 제목</label>
                  	<div class="col-sm-6">
                  		<input id="name" type="text" name="inqry_board_title_view" class="form-control view_form">
                  		<input id="name" type="text" name="inqry_board_title" class="form-control up_form" style="border-radius: 1em;">
                  	</div>
                </div>
                <div class="form-group">
                  <label for="writer" class="col-sm-2 control-label">작성자</label>
                  <div class="col-sm-3">
                  	<input type="hidden" name="emp_code">
					<input type="text" name="emp_nick" class="form-control" style="border: none; 
						border-bottom: 2px solid gray;" readonly="readonly" >
               	  </div>
                </div>
                
                <!-- textarea -->
                <div class="form-group">
                  <label for="contents" class="col-sm-2 control-label">내용</label>
                  <div class="col-sm-8">
                  	<textarea name="inqry_board_content_view" class="form-control view_form" rows="10"
						style="border: 1px solid #d2d2d2; border-radius: 1em;">${ibv.inqry_board_content}</textarea>
					<textarea name="inqry_board_content" class="form-control up_form" rows="10"
						style="border: 1px solid #d2d2d2; border-radius: 1em;">${ibv.inqry_board_content}</textarea>
                  </div>	
                </div>
                <div class="form-group">
							<label for="file01" class="col-sm-2 control-label">파일 첨부</label>
							<div class="col-sm-10">
								<div>
									<div style="display: inline-block;">
										<table id="table_files" style="border-collapse:separate; border-spacing:10px;">
										</table>
									</div>
								</div>
								
								<div class="up_form" style="width: 50%; border: 1px solid lightgray; border-radius: 8px; padding: 10px;">
									<div id="div_files" style="display: inline-block;">
										<input type="file"name="files" style="display: none;">
									</div>
									
									<div style="width: 10%; display: inline-block;">
										<input id="btn_plus_file" type="button" class="bg-teal btn form-control btn-sm" value="추가"
											style="border-radius: 1em; width: 60px;">
									</div>
								</div>
							</div>
						</div>
						<div class="box-footer clearfix">
							<input value="등록" type="submit" style="width:80px;" class="btn btn-warning btn-flat pull-right up_form ">
			              	<input id="btn_cancle" value="취소" type="button" class="btn btn-default btn-flat pull-right up_form">
			              	<c:if test="${LOGIN_EMPINFO.emp_code == ibv.emp_code }">
			              		<input id="btn_del" value="삭제" type="button" class="btn btn-danger btn-flat pull-right">
			              		<input id="btn_upForm" value="수정" type="button" class="btn btn-warning btn-flat pull-right view_form">
			              	</c:if>
			              	<input id="btn_back" value="목록" type="button"  class="btn btn-info btn-flat pull-right">
			              	<input id="btn_reply" value="댓글" type="button"  class="btn bg-green btn-flat pull-right">
						</div>
		       </form>
				</div>
          		</div>
          <!-- /.box -->
        </div>
       </div>
      </div>