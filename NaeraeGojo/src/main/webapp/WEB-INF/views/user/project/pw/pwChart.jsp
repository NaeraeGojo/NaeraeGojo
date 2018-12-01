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
	
	"use strict";

    var demoSource = [
                      {
        name: "Sprint 0",
        desc: "Analysis",
        values: [{
            from: 1320192000000,
            to: 1322401600000,
            label: "Requirement Gathering",
            customClass: "ganttRed"
        }]
    },{
        desc: "Scoping",
        values: [{
            from: 1322611200000,
            to: 1323302400000,
            label: "Scoping",
            customClass: "ganttRed"
        }]
    },{
        name: "Sprint 1",
        desc: "Development",
        values: [{
            from: 1323802400000,
            to: 1325685200000,
            label: "Development",
            customClass: "ganttGreen"
        }]
    },{
        name: " ",
        desc: "Showcasing",
        values: [{
            from: 1325685200000,
            to: 1325695200000,
            label: "Showcasing",
            customClass: "ganttBlue"
        }]
    },{
        name: "Sprint 2",
        desc: "Development",
        values: [{
            from: 1325695200000,
            to: 1328785200000,
            label: "Development",
            customClass: "ganttGreen"
        }]
    },{
        desc: "Showcasing",
        values: [{
            from: 1328785200000,
            to: 1328905200000,
            label: "Showcasing",
            customClass: "ganttBlue"
        }]
    },{
        name: "Release Stage",
        desc: "Training",
        values: [{
            from: 1330011200000,
            to: 1336611200000,
            label: "Training",
            customClass: "ganttOrange"
        }]
    },{
        desc: "Deployment",
        values: [{
            from: 1336611200000,
            to: 1338711200000,
            label: "Deployment",
            customClass: "ganttOrange"
        }]
    },
    {
        desc: "Warranty Period",
        values: [{
            from: new Date('12/02/2018').getTime(),
            to: new Date('12/05/2018').getTime(),
            label: "Warranty Period",
            customClass: "ganttOrange"
        }]
    },{
        desc: "",
        values: [{
            
        }]
    },{
        desc: "",
        values: [{
            
        }]
    },{
        desc: "",
        values: [{
            
        }]
    }
    
    ];
    
//     var today = moment();
//     var andTwoHours = moment().add(2, "hours");

//     var today_friendly = "/Date(" + today.valueOf() + ")/";
//     var next_friendly = "/Date(" + andTwoHours.valueOf() + ")/";

	  // shifts dates closer to Date.now()
//     var offset = new Date().setHours(0, 0, 0, 0) -
//         new Date(demoSource[0].values[0].from).setDate(35);
//     for (var i = 0, len = demoSource.length, value; i < len; i++) {
//         value = demoSource[i].values[0];
//         value.from += offset;
//         value.to += offset;
//     }
    
 
    $(".gantt").gantt({
	 	source: demoSource,
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
        title: function _getItemText() {
            return this.textContent;
        },
        content: "Here's some useful information.",
        trigger: "hover",
        placement: "auto right"
    });

//     prettyPrint();
    
});

</script>        
</html>