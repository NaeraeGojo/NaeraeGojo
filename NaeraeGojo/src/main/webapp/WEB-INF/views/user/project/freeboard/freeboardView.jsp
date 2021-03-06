<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.filestyle {
	padding-top: 5px;
}

.row {
	vertical-align: middle;
	text-align: center;
}

.box-title {
	font-size: 30px !important;
}

.freecont{
	width: 100%;
    display: inline-block;
    text-align: initial;
    padding: 0px 15px;
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
		var project_code = '${fbv.project_code}';
		var doc_code = '${fbv.freeboard_code}';
		var doc_class = '2';
		
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
<div class="row">
	<div class="freecont">
		<div class="col-md-12">
			<!-- TABLE: LATEST ORDERS -->
			<div class="box box-2team">
				<div class="box-header with-border">
					<b class="box-title">${fbv.rnum }</b> <br />
					<br />
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<form role="form" id="freeUpForm" class="form-horizontal"
						enctype="multipart/form-data" method="post"
						action="${pageContext.request.contextPath }/user/project/freeboard/freeboardUpdate.do">
						<input type="hidden" name="project_code" value="${fbv.project_code}" /> 
						<input type="hidden" name="freeboard_code" value="${fbv.freeboard_code}" />

						<!-- text input -->
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-6">
								<input id="name" type="text" name="freeboard_title_view" class="form-control view_form">
								<input id="name" type="text" name="freeboard_title" class="form-control up_form" style="border-radius: 1em;">
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
								<textarea name="freeboard_content_view" class="form-control view_form" rows="10"
									style="border: 1px solid #d2d2d2; border-radius: 1em;">${fbv.freeboard_content}</textarea>
								<textarea name="freeboard_content" class="form-control up_form" rows="10"
									style="border: 1px solid #d2d2d2; border-radius: 1em;">${fbv.freeboard_content}</textarea>
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
			              	<c:if test="${LOGIN_EMPINFO.emp_code == fbv.emp_code }">
			              		<input id="btn_del" value="삭제" type="button" class="btn btn-danger btn-flat pull-right">
			              		<input id="btn_upForm" value="수정" type="button" class="btn btn-warning btn-flat pull-right view_form">
			              	</c:if>
			              	<input id="btn_back" value="목록" type="button"  class="btn btn-info btn-flat pull-right">
						</div>
					</form>
				</div>				
			</div>
<!-- 		/.box  -->
		</div>
	</div>
</div>
 <!-- 파일 업로드 모달 창 --> 
<div class="modal fade" id="fileUpForm">
  <div class="modal-dialog" style="top:50%;">
    <div class="modal-content center" style="width: 60%">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">파일 변경</h4>
      </div>
      <div class="modal-body">
      <form id="refileForm" enctype="multipart/form-data" method="post">
      <input type="hidden" name="project_all_file_code">
       <input type="file" class="filestyle" id="file01" name="refiles" data-buttonName="btn-primary">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary btn_fileUp">수정</button>
      </div>
    </div>
    </form>
<!--     /.modal-content -->
  </div>
<!-- /.modal-dialog  -->
</div>
<!-- /.modal 
 
<!-- 				<div class="container-fluid"> -->
<!--                 Start Page Content -->
<!--                 <div class="card"> -->
<!--                 	<div class="card-body"> -->
<!--                         Tab panes -->
<!--                         <div class="tab-content tabcontent-border"> -->
<!--                             <div class="tab-pane p-20 active" role="tabpanel"> -->
<!--                             	<form class="form-horizontal" method="POST" enctype="multipart/form-data"> -->
<!--                             		<table class="table" id="zero_config"> -->
<%-- 	                               		<colgroup> --%>
<%-- 			            				   <col style="width: 0%;"/> --%>
<%-- 			            				   <col style="width: 0%;"/> --%>
<%-- 			            				   <col style="width: 0%;"/> --%>
<%-- 			            				   <col style="width: 3%;"/> --%>
<%-- 			            				   <col style="width: 54%;"/> --%>
<%-- 							               <col style="width: 10%;"/> --%>
<%-- 							               <col style="width: 10%;"/> --%>
<%-- 							               <col style="width: 3%;"/> --%>
<%-- 							               <col style="width: 3%;"/> --%>
<%-- 							               <col style="width: 3%;"/> --%>
<%-- 							               <col style="width: 14%;"/> --%>
<%-- 			         					</colgroup> --%>
<!-- 		                                <tbody id="append" class="customtable"> -->
<%-- 		                                	<c:forEach items="${replyList}" var="reply"> --%>
<!-- 		                                    <tr> -->
<%-- 		                                        <td class="center"><input type="hidden" value="${fbv.freeboard_code}" name="freeboard_code"></td> --%>
<%-- 		                                        <td><input type="hidden" value="${reply.}" name="rpy_depth"></td> --%>
<%-- 		                                        <td><input type="hidden" value="${replyInfo.rpy_seq}" name="rpy_seq"></td> --%>
<!-- 		                                        <td> -->
<%-- 							                     <c:forEach begin="1" end="${replyInfo.rpy_depth }" varStatus="stat"> --%>
<!-- 												 	&nbsp;&nbsp;&nbsp; -->
<%-- 													<c:if test="${stat.last}"> --%>
<%-- 														<img alt="" src="${pageContext.request.contextPath }/images/ico_reply.gif" >				 --%>
<%-- 													</c:if> --%>
<%-- 												 </c:forEach> --%>
<!-- 							                     </td> -->
<%-- 		                                        <td><input type="hidden" value="${rpy_writer}" name="rpy_writer">${replyInfo.rpy_content}</td> --%>
<%-- 		                                        <td><input type="hidden" value="${bo_no}" name="rpy_group">${replyInfo.rpy_writer}</td> --%>
<%-- 		                                        <td><input type="hidden" value="${replyInfo.rpy_code}" name="rpy_code">${replyInfo.rpy_date}</td> --%>
<%-- 		                                        <td><input type="hidden" value="${rnum}" name="rpy_rnum"></td> --%>
<!-- 		                                        <td> -->
<!-- 													<input type="button" class="btn btn-success insReply" value="댓글"></button> -->
<!-- 		                                        </td> -->
<!-- 		                                        <td> -->
<%-- 		                                        <c:if test="${LOGIN_EMPINFO.emp_code == replyInfo.rpy_writer}"> --%>
<!-- 		                                      		<input type="button" class="btn btn-primary udpReply" data-toggle='modal' data-target='#modifyModal' value="수정"></button> -->
<%-- 		                                        </c:if> --%>
<!-- 		                                        </td> -->
<!-- 		                                        <td> -->
<%-- 		                                        <c:if test="${LOGIN_EMPINFO.emp_code == replyInfo.rpy_writer}"> --%>
<!-- 		                                       		<input type="button" class="btn btn-danger delReply" id="delReply" value="삭제"></button> -->
<%-- 		                                        </c:if> --%>
<!-- 		                                        </td> -->
<!-- 		                                    </tr> -->
<%-- 		                                    </c:forEach> --%>
<!-- 		                                </tbody> -->
<!-- 		                            </table> -->
<!-- 									<hr /> -->
<!-- 									<div class="form-group row"> -->
<!-- 										<label for="fname" class="col-sm-1 control-label col-form-label">댓글입력</label> -->
<!-- 										<div class="col-lg-6"> -->
<!-- 											<input type="hidden" class="form-control" id="rpy_code" name="rpy_code" /> -->
<!-- 											<input type="hidden" class="form-control" id="rpy_date" name="rpy_date" /> -->
<%-- 											<input type="hidden" class="form-control" id="rpy_group" name="rpy_group" value="${bo_no}" /> --%>
<%-- 											<input type="hidden" class="form-control" id="rpy_writer" name="rpy_writer" value="${rpy_writer}"/> --%>
<!-- 											<input type="text" class="form-control" id="rpy_content" name="rpy_content" /> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-3"> -->
<!-- 											<button type="button" class="btn btn-success" id="insert">댓글등록</button> -->
<!-- 										</div>	 -->
<!-- 									</div> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!--                    		</div> -->
<!-- 	                </div> -->
<!--          		</div> -->
<!--                 // End Page Content -->
<!--        		</div> -->
<!--             // End Container fluid  -->
<!-- 	                </div> -->
<!--          		</div> -->
<!--                 // End Page Content -->
<!--        		</div> -->
<!--             // End Container fluid  -->