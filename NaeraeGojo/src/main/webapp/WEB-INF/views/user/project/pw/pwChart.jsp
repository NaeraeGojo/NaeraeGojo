<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
 <link href="${pageContext.request.contextPath }/css/style_gantt.css" type="text/css" rel="stylesheet">
 <script src="${pageContext.request.contextPath }/js/jquery.fn.gantt.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
<style>
.perful{
	width: 100% 
}
 .row, .table_pwc, .table_pw>thead>tr>th , .table_pwc>thead>tr>th {
	vertical-align : middle;
    text-align: center;
}

.table_pwc>tbody>tr>td{
	vertical-align: middle;
}
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}

.cont_pwc .box-title{
	font-size: 20px !important;
}

.pwcont{
	margin-left: 160px;
    margin-right: 160px;
    width: 80%;
    display: inline-block;
    text-align: initial;
}

.btn_pw_upper{
	color:white; 
	background-color:#8cd636; 
	border:1px outset; 
	width : fit-content; 
	margin-bottom:14px;
	margin-left: 10px;
	border-radius: 1em;
}

.input_foot{
	display: inline-block;
    width: 100%;
}

.center{
	margin-left: auto;
	margin-right: auto;
}

#pwcForm td{
	text-align: center;
}
.text_hideUp{
	border: none;
	border-bottom: 1px solid gray;
}

.form-control[readonly]{
	background-color: white;
}

 .btn-flat{
 	margin-left: 5px;
 }
 
 body {
     font-family: Helvetica, Arial, sans-serif;
     font-size: 13px;
     padding: 0 0 50px 0;
 }
 .contain {
     width: 800px;
     margin: 0 auto;
 }
 h1 {
     margin: 40px 0 20px 0;
 }
 h2 {
     font-size: 1.5em;
     padding-bottom: 3px;
     border-bottom: 1px solid #DDD;
     margin-top: 50px;
     margin-bottom: 25px;
 }
 table th:first-child {
     width: 150px;
 }
</style>
    
	<div class="gantt"></div>

<script type="text/javascript">
$(function(){
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};
	
	thistimes = function(data){
		var dateArr = data.split('-');
		var date = new Date(dateArr[0] , dateArr[1] -1, dateArr[2]);
		
		return date.getTime();
	}
	
	"use strict";
	var testArray = new Array();
	var t = new Object();
	
// 	for(var i=0 ; i<10;i++)	{
// 		var i = new Object();
// 	}
	
	$.ajax({
		url : '${pageContext.request.contextPath}/user/project/pw/getPwChart.do'
		, dataType : 'json'
		, async : false
		, error : function(xhr, status, error){
			boalert(error);
		}
		, success : function(json){
			$.each(json.pc,function(i,v){
				var testSource = {
						 desc : v.PW_FUNCTION
						, values : [{
							from : thistimes(v.PW_EST)
							, to : thistimes(v.PW_EET)
							, label : v.PW_FUNCTION
							, customClass : 'ganttBlue'
							, dataObj: {myTitle: v.PW_FUNCTION
								, myContent: '업무 기한 : ' + v.PW_EST + ' ~ ' + v.PW_EET 
								+ '\n 담당자 : ' + v.EMP_NAME + '\n'
								+ '\n 업무내용 : ' + v.PW_CONTENT
								+ '\n 진척도 : ' + v.PW_PERCENT
								}
						}]
				};
				testArray.push(testSource);
			})
		}
	});
	
	var dummy = {
			 desc : ''
			, values : [{
				from : ''
				, to : thistimes('2018-12-31')
				, label : ''
				, customClass : 'ganttOpa'
			}]
	};
	
	var dummy2 = {
			 desc : ''
			, values : [{
				from : thistimes('2018-11-10')
				, to : ''
				, label : ''
				, customClass : 'ganttOpa'
			}]
	};
	
	testArray.push(dummy);
	testArray.push(dummy);
	testArray.push(dummy);
	testArray.push(dummy2);
	testArray.push(dummy2);
	
	
	
    $(".gantt").gantt({
	 	source: testArray,
    	navigate: "scroll",
        scale: "days",
        maxScale: "months",
        minScale: "hours",
        itemsPerPage: 20,
        navigate : "scroll",
        scrollToToday: false,
        useCookie: true,
        onItemClick: function(data) {
            alert("Item clicked - show some details");
        },
        onAddClick: function(dt, rowId) {
            alert("Empty space clicked - add an item!");
        },
        onRender: function() {
            if (window.console && typeof console.log === "function") {
                console.log("chart rendered");
            }
        }
    });
    
    $(".gantt").popover({
        selector: ".bar",
        title: function() {
        	return $(this).data('dataObj').myTitle;
        },
        content: function() {
        	return $(this).data('dataObj').myContent;
        },	
        trigger: "hover",
        placement: "auto"
    });
    
    

//     prettyPrint();
    
});

</script>        
</html>