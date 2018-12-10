<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title> PMS | MainPage에 오신걸 환영합니다. </title>      
	
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<!-- 모든 link와 script는 Ctrl+F로 검색 후 header.jsp에 없으면 등록해주세요. -->
 
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/Ionicons/css/ionicons.min.css">
	<!-- DataTables -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
		folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">
	<!-- Morris chart -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/morris.js/morris.css">
	<!-- jvectormap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/jvectormap/jquery-jvectormap.css">
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
	
	<!-- 화면적용이 안된다면 한번 주석 풀어봐요. -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
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
	<!-- Morris.js charts -->
	<script src="${pageContext.request.contextPath}/bower_components/raphael/raphael.min.js"></script>
	
	<!-- 모리스 에러가 많이 나요. 비추합니다. -->
	<%-- <script src="${pageContext.request.contextPath}/bower_components/morris.js/morris.min.js"></script> --%>
	
	<!-- Sparkline -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	
	<!-- InputMask -->
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
	
	<!-- daterangepicker -->
	<script src="${pageContext.request.contextPath}/bower_components/moment/min/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- datepicker -->
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	
	<!-- DataTables -->
	<script src="${pageContext.request.contextPath}/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	
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
	
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css"></script> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css"></script> -->
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
	
	<style>
	 .box.box-2team {
    border-top-color: #63a3ff;
	}
	
	.callout.callout-2team {
    border-color: #63a3ff;
	}
	
	#a_chat_emp{
		cursor: pointer;
	}
	
	
	.center{
		margin-left: auto;
		margin-right: auto;
	}
	
	#pwcForm td{
		text-align: center;
	}
	.perful{
		width: 100% 
	}
	
	.modal-content{
		border-radius : 10px;
	}
	
	.container_chat_emp {
	   width: 200%;
	   overflow: hidden;
	 } 
	
	</style>
	
		<body class="hold-transition skin-blue sidebar-mini">
  		<header class="main-header">
    <!-- Logo -->
    		<a href="${pageContext.request.contextPath }/user/join/mainForm.do" class="logo">
	<!-- mini logo for sidebar mini 50x50 pixels -->
      			<span class="logo-mini"><b>P</b>MS</span>
    <!-- logo for regular state and mobile devices -->
     			<span class="logo-lg" style="font-size: 20px"><img src="${pageContext.request.contextPath}/image/protoss.png" width="230" height="50"></span>
<%--      			<img src="${pageContext.request.contextPath}/image/protoss.png" width="230" height="50"> --%>
   			</a>
    <!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
	<!-- Sidebar toggle button-->
      			<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
       				<span class="sr-only">Toggle navigation</span>
      			</a>

      			<div class="navbar-custom-menu">
        			<ul class="nav navbar-nav">
	<!-- Notifications: style can be found in dropdown.less -->
          				<li class="dropdown notifications-menu">
          					<a id="a_chat_emp" data-toggle="modal" data-target="#modal-chat">
              					<i class="fa  fa-comments"></i>
              					<span class="label label-danger">N</span>
           					</a>
						</li>
          				<li class="dropdown notifications-menu">
            				<a href="${pageContext.request.contextPath}/user/bell/bellList.do">
              					<i class="fa fa-bell-o"></i>
             					<span class="label label-warning">10</span>
           					</a>
						</li>
	<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<c:if test="${!empty PHOTO.emp_code}">
								<img src="/img/${PHOTO.user_file_save_name}" class="user-image" alt="User Image">
							 	</c:if>	
							 	<c:if test="${empty PHOTO.emp_code}">
								<img src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
	                            </c:if>
								<span class="hidden-xs">
									<c:if test="${!empty LOGIN_EMPINFO.emp_name}">
          								${LOGIN_EMPINFO.emp_nick}
          							</c:if>
								</span>
							</a>
							<ul class="dropdown-menu">
	<!-- User image -->
              					<li class="user-header">
              					<c:if test="${!empty PHOTO.emp_code}">
									<img src="/img/${PHOTO.user_file_save_name}" class="img-circle" alt="User Image">
							 	</c:if>	
							 	<c:if test="${empty PHOTO.emp_code}">
                					<img src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
								</c:if>
									<p>
									<c:if test="${!empty LOGIN_EMPINFO.emp_name}">
          								${LOGIN_EMPINFO.emp_nick}
          							</c:if>
										<small>
											<c:if test="${!empty LOGIN_EMPINFO.emp_encpn}">
          										입사 : ${LOGIN_EMPINFO.emp_encpn.split(' ')[0]}
          										<br/>
          										권한 : ${LOGIN_EMPINFO.emp_role}
          									</c:if>
										</small>
									</p>
             					</li>
	<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
                					</div>
                					<div class="pull-right">
                  						<a href="${pageContext.request.contextPath}/user/join/logout.do" class="btn btn-default btn-flat">Sign out</a>
               						</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>
	<!-- </div> -->

	</body>
	
	<div class="modal fade" id="modal-chat">
		<div class="container_chat_emp">
		
			<div class="modal-dialog" style="margin-top: 10%; width: 50%; height: 60%; float: left;">
            <div class="modal-content" style="width:50%; margin-left: auto; margin-right: auto; ">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" align="center">채팅</h4>
              </div>
              <div class="modal-body" style="height: 70%; overflow: auto;">
              <form id="chatForm">
              	<div class="box box-warning">
		          
		            <div class="box-header with-border" style="height: auto;">
		              <b class="box-title">채팅 초대 알림</b>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body" style="height: 100%;">
		              <div class="table-responsive">
		                <table id="table_chat_list" class="table table-bordered table-striped dataTable table-hover"
              			role="grid" aria-describedby="example1_info">
		                	<thead>
		               			<tr role="row">
				                    <th tabindex="0" style="width: 3%;"
				                  	 rowspan="1" colspan="1"></th>
				                    <th tabindex="0" class="sorting" aria-controls="table_chat_emp" style="width:10%;" 
				                  	 rowspan="1" colspan="1">초대자</th>
		                  			<th tabindex="0" class="sorting" aria-controls="table_chat_emp" style="width:10%;" 
		                  			rowspan="1" colspan="1">개설일</th>
		                  			<th tabindex="0" class="sorting" aria-controls="table_chat_emp" style="width:10%;" 
		                  			rowspan="1" colspan="1">참여자</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                 	</tbody>
              			</table>
		              </div>
		              
		            </div>
		          </div>
              </div>
              <div class="modal-footer">
              	<div style="width: 10%;" class="center">
              	<table id="" class="perful">
              		<tr>
	              		<td  style="width: 100%">
	              		<input id="btn_show_emp" type="button" class="btn btn-primary" value="New">
	              		</td>
	              	</tr>
	             </table>
	             
                </div>
              </div>
              
            </div>
              
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
		
	
	
          <div class="modal-dialog" style="margin-top: 10%; width: 50%; height: 60%; float: left;">
            <div class="modal-content" style="width:50%; margin-left: auto; margin-right: auto; ">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" align="center">새로운 채팅</h4>
              </div>
              <div class="modal-body" style="height: 70%; overflow: auto;">
              <form id="chatForm">
              	<div class="box box-warning">
		          
		            <div class="box-header with-border" style="height: auto;">
		              <b class="box-title">회원 목록</b>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body" style="height: 100%;">
		              <div class="table-responsive">
		                <table id="table_chat_emp" class="table table-bordered table-striped dataTable table-hover"
              			role="grid" aria-describedby="example1_info">
		                	<thead>
		               			<tr role="row">
				                    <th tabindex="0"  style="width:10%;" 
				                  	 rowspan="1" colspan="1"></th>
				                    <th tabindex="0" class="sorting" aria-controls="table_chat_emp" style="width:10%;" 
				                  	 rowspan="1" colspan="1">사원번호</th>
		                  			<th tabindex="0" class="sorting" aria-controls="table_chat_emp" style="width:10%;" 
		                  			rowspan="1" colspan="1">부서</th>
		                  			<th tabindex="0" class="sorting" aria-controls="table_chat_emp" style="width:10%;" 
		                  			rowspan="1" colspan="1">성명</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                	
		                	
		                 	</tbody>
              			</table>
		              </div>
		              
		            </div>
		          </div>
              </div>
              <div class="modal-footer">
              	<div style="width: 20%;" class="center">
              	<table id="pwcForm" class="perful">
              		<tr>
	              		<td  style="width: 100%">
	              		<input type="button" id="btn_show_cl" class="pull-left btn btn-default" value="채팅 목록">
	              		</td>
	              		<td  style="width: 100%">
	              		<button id="btn_check_emp" type="button" class="btn btn-primary">초대</button>
	              		</td>
	              	</tr>
	             </table>
	             
                </div>
              </div>
              
            </div>
              
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->

		</div>
        </div>
        <!-- /.modal -->
	
<script type="text/javascript">
$(function(){
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};

	
	$('#btn_show_emp').click(function(){
		$('.container_chat_emp').animate({
    	    'margin-left': '-=100%'
    	 }, 500);
	});
	
	$('#btn_show_cl').click(function(){
		$('.container_chat_emp').animate({
    	    'margin-left': '+=100%'
    	 }, 500);
	});
	
	// 체크된 emp가 저장될 배열
	var ea = new Array();
	
	// emp체크 하고 시작 누르는 부분
	$('#btn_check_emp').click(function(){
		
		
		var ealen = ea.length;

		if(ealen == 0){
			boalert("채팅에 초대할 직원을 선택해주세요.");
			return false;
		}
		var chatroom_code = '';
		$.ajax({
			url : '${pageContext.request.contextPath}/user/chat/chatRoomInsert.do'
			, type : 'post'
			, data : {
				chatroom_writer : '${LOGIN_EMPINFO.emp_code}'
				, el : ea
			}
			, dataType : 'json'
			, async : false
			, traditional : true
			, error : function(xhr, status, error){
				boalert(error);
			}
			, success : function(json){
				chatroom_code = json.chatroom_code;
			}
		})
		
		
		
		$('#modal-chat').modal('hide');
		
		// 여기서 채팅방개설, 채팅참여 목록 인서트 작업 필요
		var url = "${pageContext.request.contextPath}/user/chat/chatRoom.do";
		var query = "?chatroom_code="+chatroom_code;
		
		var options = "width = 500, height = 450, scrollbars = no, toolbar = no, menubar=no,titlebar=no";
	
		window.open(url+query, "대화창"+query, options);
		
	});
	
	// 채팅버튼 눌렀을때
	$('#a_chat_emp').click(function(){
		ea= new Array();
		
		// 여기서 일단 uncheck
		$('input[name=check_emp]').iCheck('uncheck');
		$('input[name=check_emp]').iCheck('update');
		
		getChatList();
		getEmpList();
	});
	
	// 채팅방 참여 눌렀을 때
	$(document).delegate('.btn_join_chat','click',function(){
		var chatroom_code = $(this).attr('code');
		
		
		var url = '${pageContext.request.contextPath}/user/chat/chatRoom.do';
		var query = '?chatroom_code=' + chatroom_code;
		
		var options = "width = 500, height = 500, scrollbars = no, toolbar = no, menubar=no,titlebar=no";
		
		$('#modal-chat').modal('hide');
		
		window.open(url+query, "대화창"+query, options);
	})
	
	
	getChatList = function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/user/chat/chatList.do'
			, type : 'post'
			, data : {emp_code:'${LOGIN_EMPINFO.emp_code}'}
			, dataType : 'json'
			, async : false
			, error : function(xhr,stauts, error){
				boalert(error);
			}
			, success: function(json){
				var tdtag = '';
				$.each(json.crl,function(i,v){
					tdtag += '<tr><td style=" text-align: center;">';
					tdtag += '<input type="button" class="btn btn-success btn_join_chat" code="'
								+v.chatroom_code+'" value="참여"></td>';
					tdtag += '<td>'+v.chatroom_writer_name+'</td>';
					tdtag += '<td>'+v.chatroom_reg_date+'</td>';
					tdtag += '<td>'+v.chatroom_jl+'</td></tr>';
				})
				
				$('#table_chat_list tbody tr').remove();
	        	$('#table_chat_list tbody').append(tdtag);
	        	
	        	var table_chat = $('#table_chat_list').DataTable();
	        	
			}
		});
	}
	
	getEmpList = function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/user/emp/empChatList.do'
			, dataType : 'json'
			, async : false
			, error : function(xhr, status, error){
				alert(error)
			}
			, success : function(json){
				var tdtag = '';
	        	$.each(json.el,function(i,v){
	        		tdtag += '<tr>'
	        		tdtag += '<td style="text-align: center;"><label><input name="check_emp"  value="'
	        				+ v.emp_code + '" type="checkbox" class="flat-red"></label></td>'
	        		tdtag += '<td>' + v.emp_code + '</td>' 
	        		tdtag += '<td>' + v.part_name + '</td>' 
	        		tdtag += '<td>' + v.emp_name + '</td>' 
	        		tdtag += '</tr>'
	        	})
	        	$('#table_chat_emp tbody tr').remove();
	        	$('#table_chat_emp tbody').append(tdtag);
	        	
	        	var table_emp = $('#table_chat_emp').DataTable();
	        	
				table_emp.on('draw', function () {
					$('input[name=check_emp].flat-red, input[type="radio"].flat-red').iCheck({
		        		checkboxClass: 'icheckbox_flat-green',
		        	  	radioClass   : 'iradio_flat-green'
		        	})
		        	
		        	$('input[name=check_emp]').on('ifChecked',function(event){
		        		var emp_code = $(this).val();
		        		ea.push(emp_code);
					});

					$('input[name=check_emp]').on('ifUnchecked',function(event){
		        		var emp_code = $(this).val();
		        		ea.splice(ea.indexOf(emp_code), 1);
		        		
					});
				} );
				
				table_emp.draw();
// 				$('input[name=check_emp].flat-red, input[type="radio"].flat-red').iCheck({
// 					checkboxClass: 'icheckbox_flat-green',
// 				  	radioClass   : 'iradio_flat-green'
// 				})

// 				$('input[name=check_emp]').on('ifChecked',function(event){
// 		        		var emp_code = $(this).val();
// 		        		ea.push(emp_code);
// 				});
				
// 				$('input[name=check_emp]').on('ifUnchecked',function(event){
// 					var emp_code = $(this).val();
// 					ea.splice(emp_code, 1);
// 				});
				
	        	
			}
		})
	}
	
	
	
	
});

</script>	
</html>
