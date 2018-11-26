
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>




$(function(){
	
	
	   boalert = function(mes){
	        BootstrapDialog.show({
	            title: '알림',
	            message: mes
	        });
	    };
//     $('#modal1 tr:gt(0)').click(function(){
    	
//         $('#exampleModal').modal('show');
//     });
    
    
    $('#issuetable tr:gt(0)').click(function(){
    	
    	$.ajax({
    		type :"POST"
    		, url : "${pageContext.request.contextPath}/user/bell/issueAlarm.do"
    		, data : {issue_code : $(this).find('td:eq(0) input').val()}
    		, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
    		, error : function(request, status, error) {
                     alert("error : " + request.status );
              }
    		, success : function(dd){
    			
		    	var issue_code = $(this).find('td:eq(0) input').val();
		        var rnum = $(this).find('td:eq(0)').text();
		        $(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/issueView.do?issue_code='+issue_code+'&rnum='+rnum);
    		}
    	})
    	
    	
    });
    
    
    $('#modal1 tr:gt(0)').click(function(){
	   	var feedback_code = $(this).find('td:eq(0) input').val();
        
    	
        $.ajax({
            type :"POST"
            , url : "${pageContext.request.contextPath}/user/feedback/receivefeedback.do"
            , data : {feedback_code : feedback_code}
            , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
            , error : function(request, status, error) {
                     alert("error : " + request.status );
              }
            , success : function(result){
//                 alert(result.receiveInfo.pw_function);
                $('#receivemodal').modal('show');
                $('input[name=project_name]').val(result.receiveInfo.project_name);
                $('input[name=pw_function]').val(result.receiveInfo.pw_function);
                $('textarea[name=feedback_content]').val(result.receiveInfo.feedback_content);
                
                $('#receivebtn').empty();
                $('#status').empty();
                
                if(result.receiveInfo.feedback_alarm == 'n'){
                	$('#receivebtn').append('<input type="button" class="btn btn-primary" onclick="btnclick('+ feedback_code +');" value="확인">');
                	$('#receivebtn').append(' <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>');
                	
                }
                if(result.receiveInfo.feedback_alarm == 'y'){
                	$('#receivebtn').append(' <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>');
                	$('#receivebtn').append('  <span id="status">'+result.receiveInfo.feedback_rt+'  읽음</span>');
                }
                
            }
        });
        
    });
    $('#modal2 tr:gt(0)').click(function(){
	   	var feedback_code = $(this).find('td:eq(0) input').val();
        
    	
        $.ajax({
            type :"POST"
            , url : "${pageContext.request.contextPath}/user/feedback/receivefeedback.do"
            , data : {feedback_code : feedback_code}
            , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
            , error : function(request, status, error) {
                     alert("error : " + request.status );
              }
            , success : function(result){
//                 alert(result.receiveInfo.pw_function);
                $('#sendmodal').modal('show');
                $('input[name=project_name2]').val(result.receiveInfo.project_name);
                $('input[name=pw_function2]').val(result.receiveInfo.pw_function);
                $('textarea[name=feedback_content2]').val(result.receiveInfo.feedback_content);
                
                $('#sendbtn').empty();
                
                if(result.receiveInfo.feedback_alarm == 'n'){
                	$('#sendbtn').append(' <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>');
                	$('#sendbtn').append(' <span  id="status">읽지않음</span>');
                	
                }
                if(result.receiveInfo.feedback_alarm == 'y'){
                	$('#sendbtn').append(' <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>');
                	$('#sendbtn').append(' <span id="status">'+result.receiveInfo.feedback_rt+'  읽음</span>');
                    
                }
                
            }
        });
        
    });
    
   
});

function btnclick(feedback_code) {
	
    $.ajax({
        type :"POST"
        , url : "${pageContext.request.contextPath}/user/feedback/feedbackCheck.do"
        , data : {feedback_code : feedback_code}
        , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
        , error : function(request, status, error) {
                 alert("error : " + request.status );
          }
        , success : function(dd){
        	$(location).attr('href', '${pageContext.request.contextPath}/user/bell/bellList.do');
        }
    });
}
</script>    
    
    
<style>
label{
	margin : 5px;
}
input[type="text"].form-control1 {
	height: 35px;
    margin: 5px;
    padding: 0 20px;
    vertical-align: middle;
    background: #fff;
    border: 2px solid #888;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 35px;
    color: #888;
    -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
    -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
    -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
}
textarea.form-control1 {
	height: 100px;
	margin: 5px;
    padding: 0 20px;
    vertical-align: middle;
    background: #fff;
    border: 2px solid #888;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 35px;
    color: #888;
    -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
    -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
    -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
}
   .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
    
.box-body{
    overflow-y: scroll; 
    height:150px;
    
}
table th,td{
    text-align: center;

}
</style>



<!-- 이슈 알림 -->
    
      <div class="row">
      <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
            <div class="box-header with-border">
             <h3 class="box-title">이슈 알림
              <span class="label label-warning pull-right">${listCnt }</span></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover " id="issuetable">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>프로젝트명</th>
                    <th>발생 이슈</th>
                    <th>작성자</th>
                    <th>이슈단계</th>
                    <th>작성날짜</th>
                  </tr>
                  </thead>
                  <tbody>
                 
                  <c:if test="${empty issueList}">
                   <tr >
                    <td onclick='event.cancelBubble=true;' colspan="6" >등록된 이슈가 없슈</td>
                  </tr>
                  </c:if>
                  
                  <c:if test="${!empty issueList}">
                  <c:forEach items="${issueList}" var="issueInfo">
                  <tr>
                    <td><input type="hidden" name="issue_code" value="${issueInfo.issue_code}">${issueInfo.rnum }</td>
                    <td>${issueInfo.project_name }</td>
                    <td>${issueInfo.issue_name }</td>
                    <td>${issueInfo.emp_name }</td>
                    <td>${issueInfo.islev_name }</td>
                    <td>${issueInfo.issue_event_day}</td>
                  </tr>
                  </c:forEach>
                  </c:if>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        </div>
      
      
      
      <!-- 피드백 알림 -->
      <div class="row">
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
  		<div class="nav-tabs-custom">
          <div class="box box-2team">
            <div class="box-header with-border">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab"><font size="4.5">받은 피드백
              <c:if test="${!empty receivefbList}">
                <span class="label label-warning pull-right">${receivefeedCnt }</span>
              </c:if>
              <c:if test="${empty receivefbList}">
                <span class="label label-warning pull-right">0</span>
              </c:if>              
              </font></a></li>
              
              <li><a href="#tab_2" data-toggle="tab"><font size="4.5">보낸 피드백
              <c:if test="${!empty sendfbList}">
              <span class="label label-warning pull-right">${sendfeedCnt }</span>
              </c:if>
              <c:if test="${empty sendfbList}">
              <span class="label label-warning pull-right">0</span>
              </c:if>              
              </font></a></li>
              
            </ul>
<!--              <h3 class="box-title">피드백 알림 -->
<!--               <span class="label label-warning pull-right">2</span></h3> -->
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            
            <div class="tab-content">
            <div class="tab-pane active box-body" id="tab_1">
            <!-- /.box-header -->
              <div class="table-responsive">
                <table id="modal1" class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>프로젝트명</th>
                    <th>관련 업무</th>
                    <th>보낸 사람</th>
                    <th>받은 날짜</th>
                    <th>상태</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty receivefbList}">
                   <tr >
                    <td onclick='event.cancelBubble=true;' colspan="6" >받은 피드백이 없슈</td>
                  </tr>
                  </c:if>
                  
                  <c:if test="${!empty receivefbList}">                  
                  <c:forEach items="${receivefbList }" var="receiveInfo">
                  <tr>
                    <td><input type="hidden" name="feedback_code" value="${receiveInfo.feedback_code}">${receiveInfo.rnum}</td>
                    <td>${receiveInfo.project_name}</td>
                    <td>${receiveInfo.pw_function }</td>
                    <td>${receiveInfo.emp_name }</td>
                    <td>${receiveInfo.feedback_st }</td>
                    <c:if test="${receiveInfo.feedback_alarm=='n' }">
                       <td>미확인</td>
                    </c:if>
                    <c:if test="${receiveInfo.feedback_alarm=='y' }">
                       <td>확인</td>
                    </c:if>
                  </tr>
                  </c:forEach>
                   </c:if>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            
            
            <div class="tab-pane box-body" id="tab_2">            
              <div class="table-responsive">
                <table id="modal2" class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>프로젝트명</th>
                    <th>관련 업무</th>
                    <th>보낸 사람</th>
                    <th>받은 날짜</th>
                    <th>상태</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty sendfbList}">
                   <tr >
                    <td onclick='event.cancelBubble=true;' colspan="6" >보낸 피드백이 없슈</td>
                  </tr>
                  </c:if>
                  
                  <c:if test="${!empty sendfbList}">                       
                  <c:forEach items="${sendfbList}" var="sendInfo">
                  <tr>
                    <td><input type="hidden" name="feedback_code" value="${sendInfo.feedback_code}">${sendInfo.rnum }</td>
                    <td>${sendInfo.project_name}</td>
                    <td>${sendInfo.pw_function }</td>
                    <td>${sendInfo.emp_name }</td>
                    <td>${sendInfo.feedback_st }</td>
                    <c:if test="${sendInfo.feedback_alarm=='n' }">
                       <td>미확인</td>
                    </c:if>
                    <c:if test="${sendInfo.feedback_alarm=='y' }">
                       <td>확인</td>
                    </c:if>                    
                  </tr>
                  </c:forEach>
                  </c:if>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            </div>
            
            <!-- /.box-body -->
            <div class="box-footer clearfix">
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        </div>
        </div>
        
        <!-- 화상회의 초대 알림 -->
        
        <div class="row">
        <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
            <div class="box-header with-border">
              <h3 class="box-title">화상회의 초대
              <span class="label label-warning pull-right">2</span></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" >
              <div class="table-responsive">
                <table  class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>채팅방 이름</th>
                    <th>초대자</th>
                    <th>초대날짜</th>
                    <th>참여여부</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                  	<td>1</td>
                    <td>OR9842</td>
                    <td>Call of Duty IV</td>
                    <td>2018-11-14</td>
                    <td>
                     <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  <tr>
                  	<td>2</td>
                    <td>OR1848</td>
                    <td>Samsung Smart TV</td>
                    <td>2018-11-14</td>
                    <td>
                     <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
             </div>
              </div>
              </div>
            
<!-- 프로젝트 초대 알림 -->
        
        <div class="row">
        <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
            <div class="box-header with-border">
              <h3 class="box-title">프로젝트 초대 알림
              <span class="label label-warning pull-right">2</span></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>프로젝트명</th>
                    <th>초대자</th>
                    <th>초대날짜</th>
                    <th>참여여부</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>1</td>
                    <td>OR9842</td>
                    <td>Call of Duty IV</td>
                    <td>2018-11-14</td>
                    <td>
                      <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>OR1848</td>
                    <td>Samsung Smart TV</td>
                    <td>2018-11-14</td>
                    <td>
                      <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>            

          <div class="box-footer clearfix">
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
          </div>
          <!-- /.box-footer -->
        </div>
        <!-- /.box -->
      </div>
      </div>
      <!-- /.col -->
      
 <!-- 받은 피드백 알림 -->                    
    <div class="modal fade" id="receivemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="container">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="exampleModalLabel">받은피드백 상세내용</h4>
          </div>
          <div class="modal-body">
             <div class="row">
                <label class="form-control1 col-md-2" style="margin">프로젝트명</label>
                <input type="text" class="form-control1 col-md-8" name="project_name">
             </div>
              <div class="row">
                <label class="form-control1 col-md-2">관련업무</label>
                <input type="text" class="form-control1 col-md-8" name="pw_function">
             </div>
              <div class="row">
                <label  class="form-control1 col-md-2">내용</label>
                <textarea class="form-control1 col-md-8" name="feedback_content">
                </textarea>
             </div>
             <br/>
             <div style="text-align: center;">
	             <div class="row" id="receivebtn" style="margin-left: auto; margin-right: auto;">
	               
	               
	             </div>
	         </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
      </div>
    </div>     
    
      
 <!-- 보낸  피드백 알림 -->                    
    <div class="modal fade" id="sendmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="container">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="exampleModalLabel">보낸피드백 상세내용</h4>
          </div>
          <div class="modal-body">
             <div class="row">
                <label class="form-control1 col-md-2" style="margin">프로젝트명</label>
                <input type="text" class="form-control1 col-md-8" name="project_name2">
             </div>
              <div class="row">
                <label class="form-control1 col-md-2">관련업무</label>
                <input type="text" class="form-control1 col-md-8" name="pw_function2">
             </div>
              <div class="row">
                <label  class="form-control1 col-md-2">내용</label>
                <textarea class="form-control1 col-md-8" name="feedback_content2">
                </textarea>
             </div>
             <br/>
             <div style="text-align: center;">
                <div class="row" id="sendbtn" style="margin-left: auto; margin-right: auto;">
	                
	             </div>
	         </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
      </div>
    </div>   