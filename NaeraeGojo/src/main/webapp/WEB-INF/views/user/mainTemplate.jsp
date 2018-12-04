<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body class="hold-transition skin-purple sidebar-mini ">
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
<%-- 	   <tiles:insertAttribute name="content_header"></tiles:insertAttribute> --%>
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
</div>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</div>
</body>
</html>