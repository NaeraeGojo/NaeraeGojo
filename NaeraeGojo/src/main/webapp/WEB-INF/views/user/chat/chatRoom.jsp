<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

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
	
	.right .direct-chat-text{
		width: fit-content;
		margin-right: 30px;
	}
	
	</style>
<script type="text/javascript">
var ws;

var today = new Date();
$(function(){
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};
	
	$(window).on("beforeunload", function() { 
		closeConnection();
	})
	
	// WebSocket EndPoint 접속 , 얘가 성공하면 onOpen 이벤트 발생
// 	ws = new WebSocket("ws://192.168.204.154/SpringToddler/wschat");
	ws = new WebSocket("ws://localhost/ng/wschat");
	
	ws.onopen = function(){
		var emp_code = '${LOGIN_EMPINFO.emp_code}';
		var chatroom_code = '${param.chatroom_code}';
		// 여기서 emp_code, chatroom_code 들고가서 chatjoin_join ='y' 로 업데이트
		$.ajax({
			url : '${pageContext.request.contextPath}/user/chat/joinRoom.do'
			, data : { chatjoin_emp : emp_code
						, chatjoin_chatroom :chatroom_code}
			, type : 'post'
			, dataType : 'json'
			, async : false
			, error : function(xhr,status, error){
				boalert(error);
			}
			, success : function(json){
				
			}
		});
		
		
		
	};
	
	ws.onmessage = function(message){
		var obj = JSON.parse(message.data);

		var direc = '';
		var name_direc = 'pull-left';
		if(obj.emp_code == '${LOGIN_EMPINFO.emp_code}'){
			direc = 'right';
			name_direc = 'pull-right';
		}
		
		var emp_name = obj.emp_name;
		var now_time = obj.time;
		var msg = obj.msg;
		
		var id_msg = obj.id;
		
		var text = 	'<div class="direct-chat-msg '+direc+'">'				
					+ '<div class="direct-chat-info clearfix">'
					+ '<span class="direct-chat-name '+name_direc+'">'+emp_name+'</span>'
					+ '</div>'	
					+ '<img class="direct-chat-img" src="${pageContext.request.contextPath}/images/icons/person2.jpeg"'		
					+ 'alt="alt">'
					+ '<div class="direct-chat-text '+name_direc+'">'+msg +'</div>'
					+ '<span class="direct-chat-timestamp">'+now_time+'</span></div>'
					
					
		$('.direct-chat-messages').append(text);
					
		var div_chat = $('#div_chat');

		var hei = $('#div_chat').prop('scrollHeight');
		$("#div_chat").scrollTop(hei);

		
	}
});

function postToServer(){
	// WebSocket EndPoint에 문자열 등 전송시 default UTF-8이 적용
	var text = $('#msg').val();
	
	var now_hour = today.getHours();
	var now_min = today.getMinutes();
	if(now_min<10){
		now_min = '0' + now_min;
	}
	
	var now_time = '';
	
	
	if(now_hour > 12){
		now_hour = now_hour - 12;
		now_time = '오후 ' + now_hour + ':' + now_min;
	}else{
		now_time = '오전 ' + now_hour + ':' + now_min;
	}
	
	
	var j_msg = JSON.stringify({
		emp_code : '${LOGIN_EMPINFO.emp_code}'
		, msg : text
		, emp_name : '${LOGIN_EMPINFO.emp_name}'
		, time : now_time
		, chatroom_code : '${param.chatroom_code}'
	});
	
	ws.send(j_msg);
	$('#msg').val('');
}

function closeConnection(){
	// 여기서 chatjoin 에 emp_code, chatroom_code 들고감
	// chatjoin_delete ='y'로 업데이트
	// chatjoin_join = 'n'로 업데이트
	
	var emp_code = '${LOGIN_EMPINFO.emp_code}';
	var chatroom_code = '${param.chatroom_code}';
	$.ajax({
		url : '${pageContext.request.contextPath}/user/chat/deleteRoom.do'
		, data : { chatjoin_emp : emp_code
					, chatjoin_chatroom :chatroom_code}
		, type : 'post'
		, dataType : 'json'
		, async : false
		, error : function(xhr,status, error){
			boalert(error);
		}
		, success : function(json){
			
		}
	});
	
	
	// onclose 이벤트 전파
	ws.close();
}

	
</script>

<body>
<div class="col-md-3">
	<!-- DIRECT CHAT SUCCESS -->
	<div class="box box-success direct-chat direct-chat-success">
		<div class="box-header with-border">
			<h3 class="box-title">Direct Chat</h3>

			<div class="box-tools pull-right">
				<span data-toggle="tooltip" title="3 New Messages"
					class="badge bg-green">3</span>
				<button type="button" class="btn btn-box-tool"
					data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button type="button" class="btn btn-box-tool"
					data-toggle="tooltip" title="Contacts"
					data-widget="chat-pane-toggle">
					<i class="fa fa-comments"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-widget="remove">
					<i class="fa fa-times"></i>
				</button>
			</div>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<!-- Conversations are loaded here -->
			
			
			<div class="direct-chat-messages" id="div_chat">
			
			
			
			
			</div>
			<!--/.direct-chat-messages-->



			<!-- Contacts are loaded here -->
			<div class="direct-chat-contacts">
				<ul class="contacts-list">
					<li><a href="#"> <img class="contacts-list-img"
							src="../dist/img/user1-128x128.jpg" alt="User Image">

							<div class="contacts-list-info">
								<span class="contacts-list-name"> Count Dracula <small
									class="contacts-list-date pull-right">2/28/2015</small>
								</span> <span class="contacts-list-msg">How have you been? I
									was...</span>
							</div> <!-- /.contacts-list-info -->
					</a></li>
					<!-- End Contact Item -->
				</ul>
				<!-- /.contatcts-list -->
			</div>
			<!-- /.direct-chat-pane -->
		</div>
		<!-- /.box-body -->
		<div class="box-footer">
				<div class="input-group">
					<input type="text" id="msg" name="msg" placeholder="Type Message ..."
						class="form-control"> <span class="input-group-btn">
						<input type="button" onclick="postToServer();"
						class="btn btn-success btn-flat" value="전송">
					</span>
				</div>
		</div>
		<!-- /.box-footer-->
	</div>
	<!--/.direct-chat -->
</div>
<!-- /.col -->
</body>
</html>