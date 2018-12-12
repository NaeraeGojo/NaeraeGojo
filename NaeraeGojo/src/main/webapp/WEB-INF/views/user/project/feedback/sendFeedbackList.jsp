<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    



<script>

$(function(){
	boalert = function(mes){
        BootstrapDialog.show({
            title: '알림',
            message: mes
        });
    };
	
	$('#feedbackList2 tr:gt(0)').click(function(){
		
		$('#hiddenDiv').show();
		
	    var feedback_code = $(this).find('td:eq(0) input').val();
	    
		 $.ajax({
		    
		    type : "POST"
		        , url : "${pageContext.request.contextPath}/user/feedback/feedbackInfo2.do"
		        , dataType : "json"
		        , data : {feedback_code : feedback_code}
		        , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		        , error : function(request, status, error) {
		               alert("error : " + request.status );
		        }
		        , success : function(result) {
		        	
		        	
		            $('input[name=project_name]').val(result.sendInfo2.project_name);
		            $('input[name=receive_emp]').val(result.sendInfo2.emp_name);
		            $('input[name=feedback_st]').val(result.sendInfo2.feedback_st);
		            $('input[name=pw_function]').val(result.sendInfo2.pw_function);
		            $('textarea[name=feedback_content]').val(result.sendInfo2.feedback_content);
		            
		            var btn = "";
		            if(result.sendInfo2.feedback_alarm == 'n'){
		            	
		            	btn += '<button value="'+ feedback_code + '" type="button" id="deleteBtn" '
		            	        +'style="width: 80px; margin: 2px;" class="btn btn-danger btn-flat pull-right">삭제</button>';
		            	btn += '<label>읽지않음</label>';
		            	$('#footerBtn').empty().append(btn);
		            }
		            
		            if(result.sendInfo2.feedback_alarm == 'y'){
		            	
		            	btn += '<button value="'+ feedback_code +'" type="button" id="deleteBtn" '
		            	    +' style="width: 80px; margin: 2px;"class="btn btn-danger btn-flat pull-right">삭제</button>';
		            	btn += '<label>'+result.sendInfo2.feedback_rt +'</label>에 확인';
		            	$('#footerBtn').empty().append(btn);
		            }
		       }
		});
	});
	
		
// 	$(document).on('click', '#ConfirmBtn', function() {	
		
// 		var feedback_code2 = $(this).attr('value');
		
// 	    $.ajax({
            
//             type : "POST"
//                 , url : "${pageContext.request.contextPath}/user/feedback/feedbackConfirm.do"
//                 , dataType : "json"
//                 , data : {feedback_code : feedback_code2}
//                 , async : false
//                 , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
//                 , error : function(request, status, error) {
//                        alert("error : " + request.status );
//                 }
//                 , success : function(result) {
//                 	boalert('읽음표시로 변경되었습니다.');
                	
//                 	setTimeout(function(){
//                 		$(location).attr('href', '${pageContext.request.contextPath}/user/feedback/feedbackList.do');
//                 	},1500);
                    
//                }
//         });
// 	});
	
	
	$(document).on('click', '#deleteBtn', function() {   
// 		$('#deleteModal').modal('show');
		
		BootstrapDialog.show({
            message: '받은 피드백을 삭제하시겠습니까?',
            buttons: [{
                label: '삭제',
                cssClass: 'btn-danger',
                action: function(){
            		var feedback_code3 = $('#deleteBtn').attr('value');
//             		$('#deleteModal').modal('hide');
            		
            	    $.ajax({
                        
                        type : "POST"
                            , url : "${pageContext.request.contextPath}/user/feedback/deleteSend.do"
                            , dataType : "json"
                            , data : {feedback_code : feedback_code3}
                            , async : false
                            , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
                            , error : function(request, status, error) {
                                   alert("error : " + request.status );
                            }
                            , success : function(result) {
                            	
                                boalert('보낸 피드백이 삭제되었습니다.');
                                
                                setTimeout(function(){
                                    $(location).attr('href', '${pageContext.request.contextPath}/user/feedback/feedbackList2.do');
                                },2000);
                           }
                    });
                }
            }, {
                label: 'Close',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }]
        });
// 		var feedback_code = $(this).attr('value');
	});
	
});

</script>

<style>

.form-control[readonly]{
   background-color: white;
}

</style>

<div class="row">
    <div class="col-md-12" >
    
        <!-- 첫번째 div -->
		<div class="nav-tabs-custom" id="divdiv" style="width: 47%; float: left; margin-right: 20px; height: 680px !important;">
			<ul class="nav nav-tabs">
				<li ><a href="${pageContext.request.contextPath}/user/feedback/feedbackList1.do">받은피드백</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/user/feedback/feedbackList2.do">보낸피드백</a></li>
			</ul>
			<div class="tab-content">
				
				<!--보낸 피드백  -->
				<div class="tab-pane active" id="tab_2">
					<div class="box box-2team">
						<div class="box-body">
							<div class="table-responsive">
								<table class="table no-margin table-hover" id="feedbackList2">
									<thead>
										<tr>
											<th scope="col" width="3%" tex>No.</th>
											<th scope="col" width="20%"></th>
											<th scope="col" width="7%">보낸날짜</th>
											<th scope="col" width="5%">상태</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${empty sendfbList}">
											<tr>
												<td onclick='event.cancelBubble=true;' colspan="6">
													보낸 피드백이 없습니다.</td>
											</tr>
										</c:if>

										<c:if test="${!empty sendfbList}">
											<c:forEach items="${sendfbList }" var="sendInfo">
												<tr>
													<td><input type="hidden" name="feedback_code"
														value="${sendInfo.feedback_code}">${sendInfo.rnum}</td>
													<td><label>${sendInfo.emp_name }</label> 님께 피드백을
														보냈습니다.</td>
													<td>${sendInfo.feedback_st }</td>
													<c:if test="${sendInfo.feedback_alarm=='n'}">
														<td>미확인</td>
													</c:if>
													<c:if test="${sendInfo.feedback_alarm=='y'}">
														<td>확인</td>
													</c:if>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
							</div>
						</div>
						${paging2}
					</div>

					<form action="${pageContext.request.contextPath}/user/feedback/feedbackList2.do"
						method="post" class="form-inline pull-right">
						<select class="form-control" name="search_keycode">
							<!--                             <option value="TOTAL">전체</option> -->
							<option value="RECEIVE">받은사람</option>
						</select> <input id="search_keyword" name="search_keyword" type="text"
							placeholder="검색어 입력" class="form-control" />
						<button type="submit" class="btn btn-primary form-control" >검색</button>
					</form>
				</div>
			</div>
		</div>


		<!-- 두번째 div -->
		<div class="nav-tabs-custom" id="hiddenDiv" style="width: 50%; float: left; display: none; height: 680px !important;">
			<ul class="nav nav-tabs">
				<li><a> </a></li>
				<li><a> </a></li>
			</ul>
			<div class="tab-content">
				<form role="form" class="form-horizontal" enctype="multipart/form-data" method="post"
                    action="${pageContext.request.contextPath }/user/rfp/rfpInsert.do">
					<br />
					<div class="box box-2team">
						<div class="box-header with-border">
							<b class="box-title">보낸 피드백 상세내용</b><br /> <br />
						</div>
						<div class="box-body">

							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">관련 프로젝트</label>
								<div class="col-sm-8">
									<input id="name" type="text" name="project_name"
										class="form-control" style="border-radius: 1em;" readonly="readonly"> 
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">받은사람</label>
								<div class="col-sm-8">
									<input id="name" type="text" name="receive_emp"
										class="form-control" style="border-radius: 1em;" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">보낸날짜</label>
								<div class="col-sm-8">
									<input id="name" type="text" name="feedback_st"
										class="form-control" style="border-radius: 1em;" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label for="writer" class="col-sm-2 control-label">관련업무</label>
								<div class="col-sm-8">
									<input id="writer" type="text" name="pw_function"
										class="form-control" style="border-radius: 1em;" value=""
										readonly="readonly" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label for="contents" class="col-sm-2 control-label">피드백내용</label>
								<textarea id="contents" name="feedback_content"
									class="col-sm-10" rows="10"
									style="width: 68%; border: 1px solid #d2d2d2; border-radius: 1em;" readonly="readonly"></textarea>
							</div>

							<!-- /.box -->
						</div>
					</div>
					<div class="box-footer clearfix" id="footerBtn">
<!-- 						<input value="삭제" type="button" id="deleteBtn" style="width: 80px; margin: 2px;"class="btn btn-danger btn-flat pull-right">  -->
<!-- 						<input value="읽음" type="button" id="ConfirmBtn" style="width: 80px; margin: 2px;"class="btn btn-warning btn-flat pull-right"> -->
					</div>
				</form>
			</div>
		</div>
	</div>
    </div>
</div>


