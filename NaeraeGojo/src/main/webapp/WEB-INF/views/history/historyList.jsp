<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 요청주소 : localhost/ng/history/historyList.do -->
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
			<title>
				이력관리
			</title>
		
		<!-- CSS -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bower_components/Ionicons/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/form-elements.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/iCheck/square/blue.css">
	
		<!-- Favicon and touch icons -->
	    <link rel="shortcut icon" href="${pageContext.request.contextPath }/ico/favicon.png">
	    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/ico/apple-touch-icon-144-precomposed.png">
	    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/ico/apple-touch-icon-114-precomposed.png">
	    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/ico/apple-touch-icon-72-precomposed.png">
	    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/ico/apple-touch-icon-57-precomposed.png">
	
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/cookieControl.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsbn.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/prng4.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/rng.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/rsa.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/scripts.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/plugins/iCheck/icheck.min.js"></script>
		
		<!-- AdminLTE App -->
		<script src="${pageContext.request.contextPath }/dist/js/adminlte.min.js"></script>
		<script type="text/javascript">
			$(function(){
				//이력등록
// 				$('#insert').click(function(){
// 					if(eval('${!empty param.emp_code}')){
// 						var emp_code = '${param.emp_code}';
// 						var history_notice_agency = $('input[name=history_notice_agency]').val();
// 						var history_demand_agency = $('input[name=history_demand_agency]').val();
// 						var history_project_start = $('input[name=history_project_start]').val();
// 						var history_project_end = $('input[name=history_project_end]').val();
// 						var history_project_name = $('input[name=history_project_name]').val();
// 						var history_business = $('select[name=history_business]').val();
// 						var history_delete = $('input[name=history_delete]').val();
						
// 						var allData = { "emp_code" : emp_code , "history_notice_agency" : history_notice_agency , "history_demand_agency" : history_demand_agency,
// 								"history_project_start" : history_project_start, "history_project_end" : history_project_end, 
// 								"history_project_name" : history_project_name, "history_business" : history_business, "history_delete" : history_delete};
// 						if(history_project_name == ""||history_project_start == ""||history_project_end==""||history_notice_agency == "" || history_demand_agency== "" ||history_business==""){
// 								alert("누락된 정보가 있습니다. 다시 입력해주세요.");
// 								return false;
// 						 }else{
// 						$.ajax({
// 							type : 'POST',
// 							 url : '${pageContext.request.contextPath}/history/insertHistory.do',
// 							 data : allData,
// 							 dataType : 'json',
// 							 success : function(json) {
// 								alert("이력이 등록되었습니다.");
// 							}
// 							 ,
// 							 error : function(json) {
// 								alert("이력등록이 완료되었습니다.");
// 							}
// 						});
// 						}
// 					}
// 				});
			});
		</script>
		<style>
	 		
		</style>
	</head>
	
	<body>
		<div class="box-header">
        	<h2 class="box-title">이력관리 조회</h2>
			<br/><br/>
      	</div>
		<!-- /.box-header -->
        <div class="box-body col-md-10">
			<div class="box box-warning">
				<div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
             		<table class="table no-margin" id="projectTable">
               			<thead>	
               				<br/>
			                <button style="border-radius: 1em; width: 100px; margin-right: 10px;" class="form-control bg-yellow color-palette pull-right">+이력등록</button>
			                <br/>				
			                <br/>				
			                <tr>
			                    <th scope="col" width="10%">No.</th>
			                    <th scope="col" width="20%">프로젝트명</th>
			                    <th scope="col" width="15%">공고기관</th>
			                    <th scope="col" width="15%">수요기관</th>
			                    <th scope="col" width="25%">프로젝트기간</th>
			                    <th scope="col" width="15%">맡은업무</th>
							</tr>
						</thead>
			            <tbody>
							<c:forEach items="${historyList}" var="list">
								<tr>
				            		<td><input type="hidden" value="${list.history_code}">${list.rnum }</td>
				                	<td>${list.history_project_name }</td>
				                	<td>${list.history_notice_agency }</td>
				                	<td>${list.history_demand_agency }</td>
				                	<td>${list.history_project_start }</td>
				                	<td>${list.history_business }</td>
								</tr>
			                </c:forEach>
						</tbody>
					</table>
							<c:if test="${empty historyList }">
								등록된 이력이 존재하지 않습니다.
							</c:if>
				</div>
			</div>
		</div>
		<div class="footer">
			<button type="button" style="border-radius: 1em; width: 100px;" class="form-control bg-gray color-palette pull-left" data-dismiss="modal">Close</button>
		</div>
    </body>
</html>
