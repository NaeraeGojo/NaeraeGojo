<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
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
		var doc_code = '${ibv.inqry_board_code}';
		var doc_class = '3';
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/profile/profileList.do'
			, data : {project_code:project_code
						,doc_code:doc_code
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
				
				$('.btn_refile').click(function(){
					var project_all_file_code = $(this).attr('code');
					$('input[name=project_all_file_code]').val(project_all_file_code);
				});
				
				$('.btn_delfile').click(function(){
					var project_all_file_code = $(this).attr('code');
					
					$.ajax({
						url : '${pageContext.request.contextPath}/user/profile/profileDelete.do'
						, type : 'post'
						, data : {project_all_file_code:project_all_file_code}
						, dataType : 'json'
						, error : function(xhr, status, error){
							boalert(error);
						}
						, success : function(json){
							refresh();
						}
					});
				});
				
				// 파일 다운로드(a태그 클릭했을 때)
				$('.a_files').click(function(){

					var code = $(this).attr('id');
					var query = '?project_all_file_code=' + code;
					
					var href = '${pageContext.request.contextPath }/user/profile/profileDownload.do'+query;
					
					$(location).attr('href',href);
				})
            }
		});
	}
	
	$('.btn_fileUp').click(function(){
		var file01 = $('#file01').val();
		
		if(file01 == ''){
			boalert("파일을 선택해 주세요.")
			return false;
		}
		
		var project_all_file_code = $('input[name=project_all_file_code]').val();
		var project_code = $('input[name=project_code]').val();
		var doc_code = $('input[name=freeboard_code]').val();
		var doc_class = '2';
		
		var formData = new FormData(); 
		formData.append("project_all_file_code", project_all_file_code);
		formData.append("project_code", project_code); 
		formData.append("doc_code", doc_code); 
		formData.append("doc_class", doc_class);
		
		formData.append("file", $("input[name=refiles]")[0].files[0]);
		
		$.ajax({
            type : 'post',
            enctype: 'multipart/form-data',
            processData: false,  // Important!
            contentType: false,
            cache: false,
            url : '${pageContext.request.contextPath}/user/profile/profileUpdate.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	refresh();
                $('#fileUpForm').modal('hide');
            }
        });
		
	});

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

	$('#btn_plus_file').click(function(){
		var length = $('input[name=files]').length;
		var a_leng = $('.a_files').length;
		
		var total = length + a_leng;
		
		if(total<6){
			var file_tag = '<input type="file" class="filestyle" name="files" data-buttonName="btn-primary">';
			$('#div_files').append(file_tag);
		}else{
			boalert('파일은 5개까지 추가 가능합니다.');
		}
		
	});
	
	$('#btn_del').click(function(){
		var freeboard_code = '${fbv.freeboard_code}';
		
		var query = '?freeboard_code=' + freeboard_code;
		
		$(location).attr('href','${pageContext.request.contextPath}/user/project/freeboard/freeboardDelete.do'+query)
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
		
		
		$(location).attr('href','${pageContext.request.contextPath}/user/project/freeboard/freeboardList.do' + query);
	});
	

	$('#freeUpForm').submit(function() {
		var project_code = $('input[name=project_code]').val();
		var freeboard_code = $('input[name=freeboard_code]').val();
		var freeboard_title = $('input[name=freeboard_title]').val();
		var emp_code = $('input[name=emp_code]').val();
		var emp_nick = $('input[name=emp_nick]').val();
		var freeboard_content = $('textarea[name=freeboard_content]').val();

		if (freeboard_title == '') {
			boalert("제목을 입력해주세요.");
			return false;
		}

		if (freeboard_content == '') {
			boalert("내용을 입력해주세요.");
			return false;
		}

		return true;
	});
	
	refresh();
	
	
	$('input[name=freeboard_title]').val('${fbv.freeboard_title}');
	$('input[name=emp_code]').val('${fbv.emp_code}');
	$('input[name=emp_nick]').val('${fbv.emp_nick}');

	$('input[name=freeboard_title_view]').val('${fbv.freeboard_title}');
});
</script>
    <br/><br/>
      <div class="row">
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">문의게시글 조회</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <form id="Qview" class="form-horizontal">
                <!-- text input -->
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">게시글 제목</label>
                  	<div class="col-sm-8">
                  		<input type="text" class="form-control" disabled="" style="border-radius: 1em;">
                  	</div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
                  <div class="col-sm-8">
					<input type="text" class="form-control" disabled="" style="border-radius: 1em;">
               	  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">글 비밀번호</label>
                  <div class="col-sm-8">
                  	<input type="text" class="form-control" style="border-radius: 1em;">
				  </div>
                </div>
                <!-- textarea -->
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">내용</label>
                  <div class="col-sm-8">
                  	<textarea class="form-control" rows="10" disabled="" style="border-radius: 1em;"></textarea>
                  </div>	
                </div>
                <div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label" for="bo_content">첨부파일:</label>
					<div class="col-sm-8">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
						</ol>
			<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" style="height: 200px;">
							<c:forEach items="${freeboardInfo.items }" var="fileItemInfo" varStatus="stat">
								<c:if test="${stat.first }">
									<div class="item active">
								</c:if>
								<c:if test="${stat.last }">
									<div class="item">
								</c:if>
							<img src="/image/${fileItemInfo.file_save_name }" alt="pic1"
						 onclick="javascript:location.href='${pageContext.request.contextPath}/12/fileDownload.jsp?file_seq=${fileItemInfo.file_seq }';">
						</div>
							</c:forEach>
					</div>
					</div>
			<!-- Left and right controls -->
						<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div>
		       </form>
				<div class="box-footer clearfix">
              	<input value="삭제" type="button" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              	<input value="목록" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right">
              	<input value="수정" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
            	</div>
          		</div>
          		</div>
          <!-- /.box -->
        </div>
      </div>