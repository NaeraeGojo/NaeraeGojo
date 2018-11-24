<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<!-- 모든 link와 script는 Ctrl+F로 검색 후 header.jsp에 없으면 등록해주세요. -->
 
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/Ionicons/css/ionicons.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
		folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">
	<!-- Morris chart -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/morris.js/morris.css">
	<!-- jvectormap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/jvectormap/jquery-jvectormap.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
	<!-- Daterange picker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap-daterangepicker/daterangepicker.css">
	<!-- bootstrap wysihtml5 - text editor -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
	  
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/fullcalendar/dist/fullcalendar.min.css">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	
	<!-- 화면적용이 안된다면 한번 주석 풀어봐요. -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<!-- jQuery 3 -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	</script>

	<!-- Bootstrap 3.3.7 -->
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Morris.js charts -->
	<script src="${pageContext.request.contextPath}/bower_components/raphael/raphael.min.js"></script>
	
	<!-- 모리스 에러가 많이 나요. 비추합니다. -->
	<%-- <script src="${pageContext.request.contextPath}/bower_components/morris.js/morris.min.js"></script> --%>
	
	<!-- Sparkline -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	
	<!-- jQuery Knob Chart -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
	
	<!-- daterangepicker -->
	<script src="${pageContext.request.contextPath}/bower_components/moment/min/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<!-- datepicker -->
	<script src="${pageContext.request.contextPath}/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	
	<!-- Bootstrap WYSIHTML5 -->
	<%-- <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script> --%>
	
	<!-- Slimscroll -->
	<script src="${pageContext.request.contextPath}/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/bower_components/fastclick/lib/fastclick.js"></script>
	
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
	
	<!-- AdminLTE dashboard demo (This is only for demo purposes) 예시 보여주기용 || 실제로 쓸땐 없애야 됨-->
	<%-- <script src="${pageContext.request.contextPath}/dist/js/pages/dashboard.js"></script> --%>
	
	<!-- AdminLTE for demo purposes -->
	<%-- <script src="${pageContext.request.contextPath}/dist/js/demo.js"></script> --%>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css"></script> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css"></script> -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>





</head>
<body class="hold-transition layout-boxed skin-purple sidebar-mini">
<!-- <body class="hold-transition skin-blue  layout-boxed sidebar-mini"> -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<div id="wrapper">
	<tiles:insertAttribute name="left"></tiles:insertAttribute>
	<div id="page-wrapper">
	<div class="page-content">
		<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
	   
	   <!-- 여기가 content-header -->
	   <tiles:insertAttribute name="content_header"></tiles:insertAttribute>
	<!-- content-header 끝 -->
	
	    <!-- Main content -->
	    <section class="content">
	    <tiles:insertAttribute name="content"></tiles:insertAttribute>
	    </section>
	    <!-- /.content -->
	  </div>
	  <!-- /.content-wrapper -->
	</div>
	<!-- ./wrapper -->
	
	
<%-- 		<tiles:insertAttribute name="content"></tiles:insertAttribute> --%>
	</div>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</div>
</div>
</body>
</html>