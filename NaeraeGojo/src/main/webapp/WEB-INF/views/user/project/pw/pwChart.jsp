<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
 <link href="${pageContext.request.contextPath }/css/style_gantt.css" type="text/css" rel="stylesheet">
 <script src="${pageContext.request.contextPath }/js/jquery.fn.gantt.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
<style>

 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
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
 .bar{
 	cursor: pointer;
 }
 
 .modal-dialog {
    width: 400px;
    margin: 30px auto;
    margin-top: 300px;
}
.modal-content{
	border-radius : 10px;
}
 
</style>
 <div class="row">
    <div class="">
	    <form method="post" class="form-inline pull-right"
		   style="margin-right: 15px;">
				<select class="form-control" name="search_keycode" >
					<option value="total">전체</option>
					<option value="function">업무명</option>
					<option value="pwc">분류</option>
					<option value="c_damdang">담당자</option>
				</select>
				<select class="form-control"  name="damdang" style="display: none;">
					<option value="" selected="selected" disabled="disabled"></option>
					<c:forEach items="${el }" var="ev">
						
						<option value="${ev.emp_code }">${ev.emp_name }</option>
					</c:forEach>
				</select>
				<input id="search_keyword"  name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
				<input type="button" class="btn btn-primary form-control" value="검색" id="btn_search_gantt">
		</form>
    </div>
    </div>
    
    <div>
		<div class="gantt"></div>
	</div>
<script type="text/javascript">
$(function(){
	$('#btn_search_gantt').click(function(){
		refresh();
	});
	
	$('select[name=search_keycode]').change(function(){
		var keycode = $(this).val();
		if(keycode == 'c_damdang'){
			$('#btn_search_gantt').hide();
			$('input[name=search_keyword]').hide();
			$('select[name=damdang]').show();
		}else{
			$('select[name=damdang]').hide();
			$('input[name=search_keyword]').show();
			$('#btn_search_gantt').show();
		}
	});
	
	$('select[name=damdang]').change(function(){
		var search_keycode = $('select[name=search_keycode]').val();
		var search_keyword = $(this).val();
		
		refresh(search_keycode,search_keyword);
	});
	
	$('#btn_search_gantt').click(function(){
		var search_keycode = $('select[name=search_keycode]').val();
		var search_keyword = $('input[name=search_keyword]').val();
		
		refresh(search_keycode,search_keyword);
	});
	

    gRender = function(array){
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
   	
	   	array.push(dummy);
	   	array.push(dummy);
	   	array.push(dummy);
	   	array.push(dummy2);
	   	array.push(dummy2);
   	
	    $(".gantt").gantt({
	   	 	source: array,
	       	navigate: "scroll",
	           scale: "days",
	           maxScale: "months",
	           minScale: "hours",
	           itemsPerPage: 50,
	           navigate : "scroll",
	           scrollToToday: false,
	           useCookie: true,
	           onItemClick: function(data) {
	           	var title = data.myTitle;
	           	var mes = '선택 업무 : ' + title
	           				+ '\n\n선택업무의 상세정보를 조회하시겠습니까?';
	           	
	           	var pw_code = data.pw_code;
	           	
	           	confirm(mes, pw_code,1);
	           },
	           onAddClick: function(dt, rowId) {
	           	var cd = thisdate(dt);
	           	var cdt = thistimes(cd);
	           	var mes = '선택 날짜 : ' +cd
	           				+ '\n\n선택 날짜에 새로운 업무를 등록하시겠습니까?';
	           	
	           	confirm(mes ,cd,2);
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
           placement: "auto left",
           html: true
       });
    }
	
	function confirm(mes,data,part){
		BootstrapDialog.show({
			 message: mes,
			 buttons: [
			           {
						label: '확인',
						cssClass: 'btn-primary',
						action: function(){
							//조회
							if(part == 1){
								var href = '${pageContext.request.contextPath}/user/project/pw/pwView.do';
								var query = '?pw_code='+data;
					        	
					        	$(location).attr('href',href + query)
								
								$(location).attr('href',href + query);
							}else{
								var href = '${pageContext.request.contextPath}/user/project/pw/pwForm.do';
								var query = '?cdate=' + data;
								$(location).attr('href',href + query);
							}
							
							 
							}
						}
			           , {
					     label: '취소',
					     action: function(dialogItself){
					         dialogItself.close();
					     }
			 }]
		});
	}
	
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
	
	thisdate = function(dt){
		var cyear = new Date(dt).getFullYear();
    	var cmonth = new Date(dt).getMonth() + 1 ;
    	var cdate = new Date(dt).getDate();
		
    	if(cmonth<10){
    		cmonth = '0' + cmonth;
    	}
    	
    	if(cdate <10){
    		cdate = '0' + cdate;
    	}
    	
    	var cd = cyear + '-' + cmonth + '-' + cdate;
		return cd; 
	}
	
	"use strict";
    
    refresh = function(search_keycode,search_keyword){
    	$('.gantt').empty();
    	
    	var testArray = new Array();
    	
    	$.ajax({
    		url : '${pageContext.request.contextPath}/user/project/pw/getPwChart.do'
    		, data : {search_keycode:search_keycode , search_keyword:search_keyword}
    		, type : 'post'
    		, dataType : 'json'
    		, async : false
    		, error : function(xhr, status, error){
    			boalert(error);
    		}
    		, success : function(json){
    			var len = json.pc.length;
    			if(len == 0){
    				boalert("검색 결과가 존재하지 않습니다.")
    				return;
    			}
    			var name1 = '';
    			var nameGo = '';
    			$.each(json.pc,function(i,v){
    				nameGo = v.PWC_NAME;
    				if(name1 == nameGo){
    					nameGo = '';
    				}else{
    					name1 = nameGo;
    				}
    				
    				
    				var cc = 'ganttGray';
    				
    				var today = new Date();
    				
    				var eetTime = thistimes(v.PW_EET);
    				
    				var per = parseInt(v.PW_PERCENT);
    				
    				// percent 가 90 이상이면 파란색
    				if(per >= 90){
    					cc = 'ganttBlue';
    				}
    				
    				// percent 가 90 미만, 완료기한이 지났으면 빨간색
    				if(today.getTime() > eetTime){
    					if(per < 90){
    						cc = 'ganttRed';
    					}
    				}
    				
    				var content_text = '업무 기한 : ' + v.PW_EST + ' ~ ' + v.PW_EET 
    									+ '<br> 담당자 : ' + v.EMP_NAME 
    									+ '<br> 진척도 : ' + v.PW_PERCENT + '%'
    									+ '<br> 업무내용 : ' + v.PW_CONTENT;
    				
    				var testSource = {
    						name : nameGo
    						, desc : v.PW_FUNCTION
    						, values : [{
    							from : thistimes(v.PW_EST)
    							, to : thistimes(v.PW_EET)
    							, label : v.PW_FUNCTION
    							, customClass : cc
    							, dataObj: {myTitle: v.PW_FUNCTION , myContent: content_text , pw_code:v.PW_CODE}
    						}]
    				};
    				testArray.push(testSource);
    			})
    		}
    	});
    	
    	if(testArray.length != 0){
    		gRender(testArray);
    	}
    }
    
    refresh();

});

</script>        
</html>