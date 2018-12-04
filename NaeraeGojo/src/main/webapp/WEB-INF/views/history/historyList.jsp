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
        	 $('#historyForm').click(function(){
        		 var emp_code = '${param.emp_code}';
        		 $(location).attr('href', '${pageContext.request.contextPath}/history/historyForm.do?emp_code='+emp_code);
        	 });
         });
      </script>
      <style>
          
      </style>
   </head>
   
   <body>
      <div class="row">
         <div class="box box-warning">
            <div class="box-header with-border">
                 <h2 class="box-title"><b>이력관리 조회</b></h2>
               <br/><br/>
               </div>
            <!-- /.box-header -->
                <div class="box-body col-md-10">
               <div class="table-responsive">   <!-- 테이블 기본 설정 (기본설정)-->
                   <table class="table no-margin table-hover" id="projectTable">
                        <thead>   
                           <br/>
                         <button style="border-radius: 1em; width: 100px; margin-right: 10px; height: " id="historyForm" class="form-control bg-yellow color-palette pull-right">+이력등록</button>
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
      </div>
    </body>
</html>