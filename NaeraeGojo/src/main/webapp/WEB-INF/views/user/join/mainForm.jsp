<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 요청주소 : http://localhost/ng/user/join/mainForm.do 
    	화면 : 개발자 로그인 시 화면
    -->
    
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/fullcalendar.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar.js"></script>    
<script>
$(document).ready(function() {
    $.ajax({
     
       type : "POST"
       , url : "${pageContext.request.contextPath}/user/main/fullcalendar.do"
       , dataType : "json"
       , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
       , error : function(request, status, error) {
              alert("error : " + request.status );
       }
       , success : function(data) {
//         alert("success : " + data.data);
           setCalendar(data.data);
      }
     });
});
   
function setCalendar(data){


  $('#calendar').fullCalendar({
    
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    displayEventTime: false,
//     type : 'post',
    defaultDate: '2018-12-12',
    navLinks: true, 
    selectable: true,
    selectHelper: true,
//     select: function(start, end) {
//       var title = prompt('Event Title:');
//       var eventData;
//       if (title) {
//         eventData = {
//           title: title,
//           start: start,
//           end: end
//         };
//         $('#calendar').fullCalendar('renderEvent', eventData, true);
//       }
//       $('#calendar').fullCalendar('unselect');
//     },
    editable: true,
    eventLimit: true, 
    events: eval(data),
    
//     eventClick: function(data) {
//     	var aa = $(this).attr('id');
//     	alert(aa);
//     	$('#myModal').modal('show');
//      },

//      loading: function(bool) {
//        $('#loading').toggle(bool);
//      }
      
  });
  
  toCntMain = function(){
		
		var emp_code = '${LOGIN_EMPINFO.emp_code}'
		
		var listCnt	= '${listCnt}'
		var receivefeedCnt = '${receivefeedCnt}'
		var sendfeedCnt = '${sendfeedCnt}'
		var videoChatCnt = '${videoChatCnt}'
		var issueDamdangCnt = '${issueDamdangCnt}'
		var projectAlarmCnt = '${projectAlarmCnt}'
		
		$.ajax({
          type : 'post',
          url : '${pageContext.request.contextPath}/user/bell/totCnt.do',
          data : {'emp_code' : emp_code},
          dataType : 'json',
          error: function(xhr, status, error){
              alert(error);
          },
          success : function(json){
          
			var data = "";
			var listCnt = parseInt(json.listCnt);
			var receivefeedCnt = parseInt(json.receivefeedCnt);
			var sendfeedCnt = parseInt(json.sendfeedCnt);
			var videoChatCnt = parseInt(json.videoChatCnt);
			var issueDamdangCnt = parseInt(json.issueDamdangCnt);
			var projectAlarmCnt = parseInt(json.projectAlarmCnt);
			
			var totalCnt = listCnt+receivefeedCnt+sendfeedCnt+videoChatCnt+issueDamdangCnt+projectAlarmCnt;
			
			if(totalCnt > 0){
				data +=	'<h3>'+ totalCnt +'<h3>'
				data += '<p>알림</p>'
				$('#cntcnt').append(data);
			} else {
				data +=	'<h3>0<h3>'
				data += '<p>알림</p>'
				$('#cntcnt').append(data);
			}
          }
      });
	}
  	toCntMain();
  	
    toProjectCnt = function(){
		
		var emp_code = '${LOGIN_EMPINFO.emp_code}'
		
		var totalCountMain	= '${totalCountMain}'
		
		$.ajax({
          type : 'post',
          url : '${pageContext.request.contextPath}/user/project/totalCntMain.do',
          data : {'emp_code' : emp_code},
          dataType : 'json',
          error: function(xhr, status, error){
              alert(error);
          },
          success : function(json){
          
			var data = "";
			var totalProCnt = parseInt(json.totalCountMain);
			
			if(totalProCnt > 0){
				data +=	'<h3>'+ totalProCnt +'<h3>'
				data += '<p style="font-size: 15px;">참여중 프로젝트 수</p>'
				$('#procnt').append(data);
			} else {
				data +=	'<h3>0<h3>'
				data += '<p style="font-size: 15px;">참여중 프로젝트 수</p>'
				$('#procnt').append(data);
			}
          }
      });
	}
	toProjectCnt();
	
	$('#table_todo').DataTable();
	
};
</script>    
    
<style>
p {
	font-size: 20px !important;
}


#calendar {
  max-width: 900px;
  margin: 0 auto;
}

#loading {
  display: none;
  position: absolute;
  top: 10px;
  right: 10px;
}

</style>




      <!-- Small boxes (Stat box) -->
<div class="row">
	
	<div class="col-lg-3 col-xs-6">
		<!-- small box -->
		<div class="small-box bg-aqua">
			<div class="inner" id="procnt">
<!-- 				<h3>3</h3> -->
<!-- 				<p style="font-size: 15px;">참여중 프로젝트 수</p> -->
			</div>
			<div class="icon">
				<i class="ion ion-android-desktop"></i>
			</div>
<!-- 			<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a> -->
		</div>
	</div>

	<!-- ./col -->
	<div class="col-lg-3 col-xs-6">
		<!-- small box -->
		<div class="small-box bg-green">
			<div class="inner">
				<h3>
					${apwl.size() }<sup style="font-size: 20px">개</sup>
				</h3>
				<h3><p>오늘의 업무</p></h3>
				
			</div>
			<div class="icon">
				<i class="ion ion-stats-bars"></i>
			</div>
<!-- 			<a href="#" class="small-box-footer">More info <i -->
<!-- 				class="fa fa-arrow-circle-right"></i></a> -->
		</div>
	</div>

	<!-- 알림 -->
	<div class="col-lg-3 col-xs-6">
		<div class="small-box bg-yellow">
			<div class="inner" id="cntcnt">
<%-- 				<h3>${projectAlarmCnt}</h3> --%>
<!-- 				<p>알림</p> -->
			</div>
			<div class="icon">
				<i class="ion ion-android-alarm-clock"></i>
			</div>
		</div>
	</div>


	<!-- 총 업무 진척률 -->
	<div class="col-lg-3 col-xs-6">
		<!-- small box -->
		<div class="small-box bg-red">
			<div class="inner">
				<h3>
					${aper }<sup style="font-size: 20px">%</sup>
				</h3>
				<h3><p>총 업무 진척률</p></h3>
			</div>
			<div class="icon">
				<i class="ion ion-pie-graph"></i>
			</div>
		</div>
	</div>

</div>
<!-- /.row -->
      
      <!-- Main row -->
<div class="row">
	<section class="col-lg-6 connectedSortable">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs pull-right">
				<li class="pull-left header"><i class="fa fa-inbox"></i> 내가 참여하는 프로젝트</li>
			</ul>
			<div class="tab-content no-padding">
				<div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;">
					<table class="table no-margin table-hover plist">
						<thead>
							<tr>
								<th scope="col" width="10%">No.</th>
								<th scope="col" width="30%">프로젝트명</th>
								<th scope="col" width="15%">수요기관</th>
								<th scope="col" width="15%">진척률</th>
								<th scope="col" width="15%">예상 종료일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${projectList}" var="projectList">
								<tr>
									<td><input type="hidden" value="${projectList.project_code }">${projectList.rnum }</td>
									<td>${projectList.project_name }</td>
									<td>${projectList.rqpps_notice_agency }</td>
									<td>${projectList.pw_percent }</td>
									<td>${projectList.project_end }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /.nav-tabs-custom -->

		<!-- TO DO List -->
		<div class="box box-primary">
			<div class="box-header">
				<i class="ion ion-clipboard"></i>
				<h3 class="box-title">To Do List</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<div class="table-responsive">
		                <table id="table_todo" class="table table-bordered table-striped dataTable table-hover"
              			role="grid">
		                	<thead>
		               			<tr role="row">
				                   
				                    <th tabindex="0" class="sorting" aria-controls="table_todo" style="width:15%;" 
				                  	 rowspan="1" colspan="1">업무 명</th>
		                  			<th tabindex="0" class="sorting" aria-controls="table_todo" style="width:6%;" 
		                  			rowspan="1" colspan="1">진척도</th>
		                  			<th tabindex="0" class="sorting" aria-controls="table_todo" style="width:6%;" 
		                  			rowspan="1" colspan="1">마감일</th>
		                  			 <th tabindex="0" class="sorting" aria-controls="table_todo" style="width:18%;" 
				                  	 rowspan="1" colspan="1">프로젝트 명</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                		<c:forEach items="${apwl}" var="apwv">
				                  <tr class="odd" role="row">
				                    <td>${apwv.PW_FUNCTION }</td>
				                    <td>${apwv.PW_PERCENT }%</td>
				                    <td>${apwv.PW_EET }</td>
				                    <td>${apwv.PROJECT_NAME }</td>
				                  </tr>
				                  </c:forEach>
		                	
		                 	</tbody>
              			</table>
		              </div>
				
			</div>
			<!-- /.box-body -->
			<div class="box-footer clearfix no-border">
			</div>
		</div>
		<!-- /.box -->
	</section>
	<!-- /.Left col -->


	<!-- 캘린더  -->
	<section class="col-lg-6 connectedSortable">

		<!-- solid sales graph -->
		<div class="box box-solid ">
			<div class="box-header bg-teal">
				<i class="fa fa-th"></i>

				<h3 class="box-title ">캘린더</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn bg-teal btn-sm"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
				</div>
			</div>
			<div class="box-body border-radius-none">
				<div id='calendar'></div>
				<div id='loading'>loading...</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->



	</section>
	<!-- right col -->
</div>
<!-- /.row (main row) -->  
      
      
      
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div id="modal-container">
  
    <div class="modal-dialog dia" role="document">
      <div class="modal-content Mcon" style="margin-top: 200px; width: 520px;">
      
<!--         <div class="modal-header"> -->
<!--           <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--             <span aria-hidden="true">&times;</span> -->
<!--           </button> -->
<!--           <h3 class="modal-title" id="myModalLabel"> 프로젝트 </h3> -->
<!--         </div> -->
        
        <div class="modal-body mb" style="margin-bottom:auto; height: 235px;" id="projectdiv">
            <div class="col-md-12">
              <div class="box box-solid box-primary">
                <div class="box-header with-border" style="height:70px;">
                   <h3 style="margin-left: 30px;">프로젝트 명</h3>
                </div>
                
                <div class="box-body"  style="margin-left: 30px;">
                <h4>프로젝트 기간 : 123 ~ 123</h4>
                <h4>PM : 땡땡이</h4>
		            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right; margin-right: 1px;"><b>Close</b></button>
                </div>
              </div>
            </div>
        </div> 
    </div>
    </div>

  </div>
  </div>   
