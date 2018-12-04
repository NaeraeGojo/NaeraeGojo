<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
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
	
	$('#toggle-one').bootstrapToggle();
	
	$('.infoBtn').click(function(){
		scheduler_code = $(this).parent().parent().find('td:eq(0) input').val();

		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/scheduler/schedulerInfo.do',
            data : {'scheduler_code' : scheduler_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('#info input[name=scheduler_code]').val(json.schedulerInfo.scheduler_code);
            	$('#info input[name=scheduler_writer]').val(json.schedulerInfo.scheduler_writer);
            	
            	$('#info input[name=scheduler_title]').val(json.schedulerInfo.scheduler_title);
            	$('#info input[name=scheduler_keyword]').val(json.schedulerInfo.scheduler_keyword);
            	$('#info input[name=scheduler_time]').val(json.schedulerInfo.scheduler_time);
            	$('#info textarea[name=scheduler_explain]').text(json.schedulerInfo.scheduler_explain);
            	
//             	var data = "";
//             	data += '<button id="updateBtn" type="button" class="btn btn-warning btn_update">수정</button>'
//             	data += '<button id="deleteBtn" type="button" class="btn btn-danger">삭제</button>'
// 	            $('#dddd').append();
            	            	
            }
        });
	});
	
	$('#insertBtn').click(function(){
		var scheduler_title = $('#insertForm input[name=scheduler_title]').val();
		var scheduler_keyword = $('#insertForm input[name=scheduler_keyword]').val();
		var scheduler_time = $('#insertForm input[name=scheduler_time]').val();
		var scheduler_explain = $('#insertForm input[name=scheduler_explain]').text();
		
		var formData = $('#insert').serialize();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/scheduler/insertScheduler.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('#insert input[name=scheduler_code]').val(json.schedulerInfo.scheduler_code);
            	
            	$('#insert tr:eq(0) td:eq(2)').text(scheduler_title);
            	$('#insert tr:eq(1) td:eq(2)').text(scheduler_keyword);
            	$('#insert tr:eq(2) td:eq(2)').text(scheduler_time);
            	$('#insert tr:eq(3) td:eq(2)').text(scheduler_explain);
            	
                $('#insertForm').modal('hide');
            	
                $(location).attr('href', '${pageContext.request.contextPath}/user/scheduler/schedulerList.do');
            }
        });
	});
	
	$('#updateBtn').click(function(){
		var scheduler_title = $('#infoForm input[name=scheduler_title]').val();
		var scheduler_keyword = $('#infoForm input[name=scheduler_keyword]').val();
		var scheduler_time = $('#infoForm input[name=scheduler_time]').val();
		var scheduler_explain = $('#infoForm input[name=scheduler_explain]').text();
		
		var formData = $('#info').serialize();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/scheduler/updateScheduler.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('#info input[name=scheduler_code]').val(json.schedulerInfo.scheduler_code);
            	
            	$('#info tr:eq(0) td:eq(2)').text(scheduler_title);
            	$('#info tr:eq(1) td:eq(2)').text(scheduler_keyword);
            	$('#info tr:eq(2) td:eq(2)').text(scheduler_time);
            	$('#info tr:eq(3) td:eq(2)').text(scheduler_explain);
            	
                $(location).attr('href', '${pageContext.request.contextPath}/user/scheduler/schedulerList.do');
            }
        });
	});
	
	$('#deleteBtn').click(function(){
		scheduler_code = $('#info input[name=scheduler_code]').val();
		$(location).attr('href', '${pageContext.request.contextPath}/user/scheduler/deleteScheduler.do?scheduler_code='+scheduler_code);
	});
	
	$('.onoff').change(function(){
		
		scheduler_code = $(this).parent().parent().parent().find('td:eq(0) input').val();
		var check = $(this).is(":checked");
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/scheduler/changeScheduler.do',
            data : {'scheduler_code' : scheduler_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
				if(check == true){
					alert("스케줄러가 설정 되었습니다.")
				}else{
					alert("스케줄러가 해제 되었습니다.")
				}
	        }
        });
		
	});

});

</script>
<section class="content">
	<br/><br/>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-warning">
				<div class="box-header with-border">
					<b class="box-title">스케줄러</b> <br/><br/>
				</div>
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin table-hover">
							<thead>
								<tr id="trtr">
									<th scope="col" width="5%" tex>No.</th>
									<th scope="col" width="35%">스케줄러명</th>
									<th scope="col" width="10%">키워드</th>
									<th scope="col" width="10%">등록자</th>
									<th scope="col" width="10%">시간</th>
									<th scope="col" width="10%">설정</th>
									<th scope="col" width="10%">정보</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${schedulerList}" var="schedulerList">
									<tr>
										<td>
											<input type="hidden" name="scheduler_code" 
											value="${schedulerList.scheduler_code }">${schedulerList.rnum }
										</td>
										<td>${schedulerList.scheduler_title }</td>
										<td>${schedulerList.scheduler_keyword }</td>
										<td>${schedulerList.scheduler_writer }</td>
										<td>${schedulerList.scheduler_time }</td>
										<td> 
											<input type="checkbox" data-toggle="toggle" data-size="mini" 
											data-onstyle="info" data-offstyle="danger" class="onoff" name="onoff2" id="chkBox"
											<c:if test="${schedulerList.scheduler_status eq 'y'}">checked="checked"</c:if> />
										</td>
										<td> 
											<input value="상세정보" id="infoBtn" type="button" 
											class="btn btn-xs btn-warning infoBtn"
											data-toggle="modal" data-target="#infoForm">
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				${pagingUtil}
			</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/user/scheduler/schedulerList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
			<select class="form-control" name="search_keycode">
			<option value="TOTAL">전체</option>
			<option value="TITLE">스케줄러명</option>
			<option value="KEYWORD">키워드</option>
			<option value="NAME">작성자</option>
		</select>
		<button type="submit" class="btn btn-primary form-control">검색</button>
		<button type="button" id="" class="btn btn-warning form-control"
		data-toggle="modal" data-target="#insertForm">스케줄러 등록</button>
	</form>
</section>

<div class="modal fade" id="insertForm">
	<div class="modal-dialog" style="top: 20%;">
		<div class="modal-content" style="width: 90%">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">스케줄러 등록</h4>
			</div>
			<div class="modal-body">
				<form id="insert" method="post">
					<input type="hidden" name="scheduler_code">
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 명</label></td>
						<td>
							<input name="scheduler_title" id="scheduler_title"
							type="text" class="form-control" placeholder="스케줄러 명"
							style="border-radius: 1em; width: 100%;">
						</td>
					</tr>
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 키워드</label></td>
						<td>
							<input name="scheduler_keyword" id="scheduler_keyword"
							type="text" class="form-control" placeholder="스케줄러 키워드"
							style="border-radius: 1em; width: 100%;">
						</td>
					</tr>
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 시간</label></td>
						<td>
							<input name="scheduler_time" id="scheduler_time"
							type="time" class="form-control" placeholder="스케줄러 시간"
							style="border-radius: 1em; width: 100%;">
						</td>
					</tr>
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 설명</label></td>
						<td>
							<textarea class="form-control" rows="3"
								placeholder="스케줄러 설명" id="scheduler_explain"
								name="scheduler_explain"
								style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
						</td>
					</tr>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
				<button id="insertBtn" type="button" class="btn btn-warning btn_insert">등록</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="infoForm">
	<div class="modal-dialog" style="top: 20%;">
		<div class="modal-content" style="width: 90%">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">내용 상세보기</h4>
			</div>
			<div class="modal-body">
				<form id="info" method="post">
					<input type="hidden" name="scheduler_code">
					<input type="hidden" name="scheduler_writer">
					<input type="hidden" name="empLogin" value="${LOGIN_EMPINFO.emp_code}">
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 명</label></td>
						<td>
							<input name="scheduler_title" id="scheduler_title"
							type="text" class="form-control"
							style="border-radius: 1em; width: 100%;">
						</td>
					</tr>
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 키워드</label></td>
						<td>
							<input name="scheduler_keyword" id="scheduler_keyword"
							type="text" class="form-control"
							style="border-radius: 1em; width: 100%;">
						</td>
					</tr>
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 시간</label></td>
						<td>
							<input name="scheduler_time" id="scheduler_time"
							type="time" class="form-control"
							style="border-radius: 1em; width: 100%;">
						</td>
					</tr>
					<tr>
						<td style="width: 60px;"><label class="control-label">스케줄러 설명</label></td>
						<td>
							<textarea class="form-control" rows="3"
								placeholder="스케줄러 설명" id="scheduler_explain"
								name="scheduler_explain"
								style="border: 1px solid #d2d2d2; border-radius: 1em;">
							</textarea>
						</td>
					</tr>
				</div>
				<div class="modal-footer" id="dddd">
					<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
					<button id="updateBtn"type="button" class="btn btn-warning btn_update">수정</button>
					<button id="deleteBtn" type="button" class="btn btn-danger">삭제</button>
				</div>
			</form>
			
		</div>
	</div>
</div>

