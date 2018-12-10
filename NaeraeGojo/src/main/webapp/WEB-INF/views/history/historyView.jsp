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
         	이력관리 상세보기
         </title>
      
    <!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/Ionicons/css/ionicons.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
		folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
	<!-- iCheck for checkboxes and radio inputs -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/all.css">
	<!-- Bootstrap Color Picker -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
	<!-- Bootstrap time Picker -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">
	
	<!-- Daterange picker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap-daterangepicker/daterangepicker.css">
	<!-- bootstrap wysihtml5 - text editor -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
	 <!-- Select2 -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/select2/dist/css/select2.min.css">
	  
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/fullcalendar/dist/fullcalendar.min.css">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	
	<!-- 부트스트랩 다이얼로그 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
	
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<!-- jQuery 3 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.7 -->
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script src="${pageContext.request.contextPath}/bower_components/select2/dist/js/select2.full.min.js"></script>
	
	<!-- Sparkline -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	
	<!-- InputMask -->
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	
	<!-- daterangepicker -->
	<script src="${pageContext.request.contextPath}/bower_components/moment/min/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- datepicker -->
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	
	<!-- Bootstrap WYSIHTML5 -->
<%-- 	<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script> --%>
	
	<!-- Slimscroll -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/bower_components/fastclick/lib/fastclick.js"></script>
	
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
	
	<!-- AdminLTE dashboard demo (This is only for demo purposes) 예시 보여주기용 || 실제로 쓸땐 없애야 됨-->
	<%-- <script src="${pageContext.request.contextPath}/dist/js/pages/dashboard.js"></script> --%>
	
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/iCheck/minimal/_all.css"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
	<!-- 부트스트랩 다이얼로그 js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<!-- jQuery UI CSS파일  -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<!-- jQuery 기본 js파일 -->
<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>   -->
	<!-- jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
    <script type="text/javascript">
    $(function(){
    	//이력수정
        $('#historyUpdate').submit(function(){
         	var emp_code =  $('input[name=emp_code]').val();
           	var history_project_name = $('input[name=history_project_name]').val();
           	var history_notice_agency = $('input[name=history_notice_agency]').val();
           	var history_demand_agency = $('input[name=history_demand_agency]').val();
           	var history_project_start = $('input[name=history_project_start]').val();
            var history_project_end = $('input[name=history_project_end]').val();
           	var history_business = $('select[name=history_business]').val();
           	var history_delete = $('input[name=history_delete]').val();
           	
           	if(history_project_name == ''){
            	boalert("프로젝트 명을 입력해주세요");
             	return false;
            }
            if(history_notice_agency == ''|| history_demand_agency == ''){
            	boalert("해당 기관 명을 입력해주세요");
            	return false;
            }
            if(history_project_start == '' || history_project_end == '' ){
            	boalert("프로젝트 기간을 입력해주세요");
            	return false;
            }
            boalert("이력수정이 완료되었습니다!!");
           	return true;
        });
    	
        var emp_code = '${param.emp_code}';
        $('input[name=history_code]').val('${historyInfo.history_code}');
        $('input[name=history_notice_agency]').val('${historyInfo.history_notice_agency}');
        $('input[name=history_demand_agency]').val('${historyInfo.history_demand_agency}');
        $('input[name=history_project_start]').val('${historyInfo.history_project_start}');
        $('input[name=history_project_end]').val('${historyInfo.history_project_end}');
        $('input[name=history_project_name]').val('${historyInfo.history_project_name}');
        $('select[name=history_business]').val('${historyInfo.history_business}');
        $('input[name=history_delete]').val('${historyInfo.history_delete}');
        
        $('input[value=삭제]').click(function(){
    		history_code = $('input[name=history_code]').val();
    		emp_code = $('input[name=emp_code]').val();
    		alert("이력이 삭제되었습니다.");
    		$(location).attr('href', '${pageContext.request.contextPath}/history/deleteHistory.do?history_code=' + history_code+ '&emp_code='+emp_code);
    	});
        $('input[value=목록]').click(function(){
        	emp_code = $('input[name=emp_code]').val();
        	$(location).attr('href', '${pageContext.request.contextPath}/history/historyList.do?emp_code=' + emp_code);
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
                 <h2 class="box-title"><b>이력수정</b></h2>
               <br/><br/>
            </div>
            <!-- /.box-header -->
            <form id="historyUpdate" method="POST" enctype="multipart/form-data"
            action="${pageContext.request.contextPath }/history/updateHistory.do">
            <br/>
    			<div class="row">
               		<label class="col-sm-3 control-label">프로젝트 명</label>
                	<div class="col-sm-7">
                		<input type="text" name="history_project_name" class="form-control" placeholder="프로젝트명을 입력해주세요" style="border-radius: 1em; border: solid;">
                		<input type="hidden" name="history_code" class="form-control" style="border-radius: 1em; border: solid;">
           			</div>                
           		</div>
    			<div class="row">
               		<label class="col-sm-3 control-label">공고기관</label>
                	<div class="col-sm-7">
                		<input type="text" name="history_notice_agency" class="form-control" placeholder="공고기관을 입력해주세요" style="border-radius: 1em;">
           			</div>                
           		</div>
    			<div class="row">
               		<label class="col-sm-3 control-label">수요기관</label>
                	<div class="col-sm-7">
                		<input type="text" name="history_demand_agency" class="form-control" placeholder="수요기관을 입력해주세요" style="border-radius: 1em;">
           			</div>                
           		</div>
    			<div class="row">
					<div class="form-group">
					    <label for="edate" class="col-sm-3 control-label">프로젝트 기간</label>
					    <div class="col-md-10" style="margin-left: 100px;">
						    <table class="date_table">
							   	<tr>
						        	<td>
						           		<input type="date" name="history_project_start" class="form-control upForm" style="border-radius: 1em;">
						           	</td>
						            <td style=" text-align: center; width: 20%; font-size: 1.5em;">~</td>
						            <td>
						            	<input type="date" name="history_project_end" class="form-control upForm" style="border-radius: 1em;">
						            </td>
						        </tr>
						    </table>
						</div> 
					</div>
				</div>
    			<div class="row">
               		<label class="col-sm-3 control-label">맡은업무</label>
                	<div class="col-sm-4">
                		<select class="form-control" name="history_business" style="border-radius: 1em;">
                			<option value="PM">PM</option>
                			<option value="PL">PL</option>
                			<option value="TA">TA</option>
                			<option value="DA">DA</option>
                			<option value="AA">AA</option>
                			<option value="UA">UA</option>
                		</select>
           			</div> 
           			<input type="hidden" name="history_delete" class="form-control upForm" style="border-radius: 1em;" value="n">               
           			<input type="hidden" name="emp_code" class="form-control upForm" style="border-radius: 1em;" value="${param.emp_code}">
           		</div>
           		<br/>
   				<br/>
           		<input type="submit" value="수정" style="border-radius: 1em; width: 100px; margin: 20px;" class="form-control btn-danger btn-flat pull-right" />
           		<input type="button" value="목록" style="border-radius: 1em; width: 100px; margin: 20px;" class="form-control btn-danger btn-flat pull-right" />
           		<input type="button" value="삭제" style="border-radius: 1em; width: 100px; margin: 20px;" class="form-control btn-danger btn-flat pull-right" />
   			</form>
      	</div>
      </div>
    </body>
</html>