<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<style>
.table_pw tr{
	cursor: pointer;
}
.perful{
	width: 100% 
}
 .row, .table_pw, .table_pw>thead>tr>th , .table_pw>thead>tr>th {
	vertical-align : middle;
    text-align: center;
}

.table_pwc>tbody>tr>td{
	vertical-align: middle;
}
.table_pwc{
	font-size: 1.3em;
}
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}

.pwcont{
	width: 100%;
    display: inline-block;
    text-align: initial;
    padding: 0px 15px;
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
</style>
<script type="text/javascript">
$(function(){
	
// 	BootstrapDialog.show({
//         message: 'Hi Apple!',
//         buttons: [{
//             label: 'Button 1'
//         }, {
//             label: 'Button 2',
//             cssClass: 'btn-primary',
//             action: function(){
//                 alert('Hi Orange!');
//             }
//         }, {
//             icon: 'glyphicon glyphicon-ban-circle',
//             label: 'Button 3',
//             cssClass: 'btn-warning'
//         }, {
//             label: 'Close',
//             action: function(dialogItself){
//                 dialogItself.close();
//             }
//         }]
//     });
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};
	
	$('#btn_chart').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/pw/pwChart.do');
	});
	
	$('.table_pw tr:gt(0)').click(function(){
		var pw_code = $(this).attr('code');
		
		var query = '?pw_code='+pw_code;
		
		var currentPage = '${param.currentPage}';
		
		if(currentPage != null && currentPage != ''){
			query += '&currentPage=' + currentPage;
		}
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
		
		$(location).attr('href','${pageContext.request.contextPath}/user/project/pw/pwView.do' + query);
	});
	
	
	$('#pwForm').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/pw/pwForm.do');
	});
	
	//--------------------------------pwc-------------------------------------------	
	rePwc = function(){
		$('.table_pwc tbody').empty();
		
		$.ajax({
			url :'${pageContext.request.contextPath}/user/project/pwc/pwcList.do'
			, dataType : 'json'
			, async : false
			, error: function(xhr, status, error){
	            alert(error);
	        }
	        , success : function(json){
	        	var tdtag = '';
	        	$.each(json.pwcl,function(i,v){
	        		tdtag += '<tr>'
	        		tdtag += '<td style="text-align:center;">' + v.pwc_code+ '</td>'
	        		tdtag += '<td>' + '<p class="upForm'+v.pwc_code+'" style="margin:0px;">' + v.pwc_name +'</p>'
	        						+'<input type="text" name="'+v.pwc_code+'" hidden="hidden"' 
	        						+'class="text_hideUp hideUp'+v.pwc_code+'">'		
	        				 		+'</td>'
	        		tdtag += '<td>'
	        					+'<input type="button" code="'+v.pwc_code 
	        					+'" class="btn btn-warning btn_pwc_upForm upForm'+v.pwc_code+'" value="수정">'
	        					+'<input type="button" class="btn_updatePwc btn btn-warning hideUp'+v.pwc_code+'" code="'
	        					+ v.pwc_code+'" value="등록" style="display:none;">'
	        					+'</td>'
	        		tdtag += '<td><input code="'+v.pwc_code
	        				+'" type="button" class="btn btn-danger btn_pwc_del upForm'+v.pwc_code+'" value="삭제">'
	        				+'<input type="button" class="btn btn-default btn_pwc_cancle hideUp'+v.pwc_code+'" code="'
        					+ v.pwc_code+'" value="취소" style="display:none;">'
	        				+'</td>'
	        		tdtag += '</tr>'
	        	})
	        	$('.table_pwc tbody').append(tdtag);
	        	
	        	$('.btn_pwc_upForm').click(function(){
	        		var code = $(this).attr('code');
	        		$('.upForm'+code).hide();
	        		$('.hideUp'+code).show();
	        		$('input[name='+code+']').focus();
	        	});
	        	
	        	$('.btn_pwc_cancle').click(function(){
	        		var code = $(this).attr('code');
	        		$('.hideUp'+code).hide();
	        		$('.upForm'+code).show();
	        	});
	        	
	        	$('.btn_pwc_del').click(function(){
	        		var code = $(this).attr('code');
	        		$.ajax({
	        			url: '${pageContext.request.contextPath}/user/project/pwc/pwcDelete.do'
	        			, data : {pwc_code : code}
	        			, type : 'post'
	        			, error: function(xhr, status, error){
	        		        alert(error);
	        		    }
	        		    , success : function(json){
	        		    	rePwc();
	        		    }
	        		});
	        	});
	        	
	        	/* 업무 분류 수정 폼에서 등록 클릭 시 */
	        	$('.btn_updatePwc').click(function(){
	        		var code = $(this).attr('code');
	        		var pwc_name = $('input[name='+code+']').val();
	        		
	        		if(pwc_name == ''){
	        			boalert("업무명을 입력해주세요.")
	        			return false;
	        		}
	        		
	        		$.ajax({
	        			url : '${pageContext.request.contextPath}/user/project/pwc/pwcUdpate.do'
	        			, data : {pwc_code:code,pwc_name:pwc_name}
	        			, type : 'post'
	        			, error : function(xhr, status, error){
	        				boalert(error);
	        			}
	        			, success : function(json){
	        				rePwc();
	        			}
	        		});
	        		
	        	});
	        	
	        }
		});
	};
	
	$('#btn_pwcForm').click(function(){
		rePwc();
	});
	
	$('#feedback').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/feedback/feedbackList1.do');
	});
	
	

	$('#btn_insert_pwc').click(function(){
		var pwc_name = $('#pwcForm input[name=pwc_name]').val();
		
		if(pwc_name == ''){
			boalert('분류명을 입력해주세요.');
			return false;
		}
		
		$('#pwcForm input[name=pwc_name]').val('');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/project/pwc/pwcInsert.do'
			, data : {pwc_name : pwc_name}
			, type : 'post'
			, dataType : 'json'
			, async : false
			, error: function(xhr, status, error){
	            alert(error);
	        }
	        , success : function(json){
	        	if(json.jung == 'true'){
	        		boalert("이미 존재하는 분류 명 입니다.")
	        	}
	        	rePwc();
	        }
	        
		});
		
	});
	

});


</script>
    
      <div class="row">	
      
      <div class="pwcont">
    	<div class="col-md-4 pull-left" style="width: auto;" >
	      <input id="btn_chart" value="업무 차트 조회" type="button" 
	      class="btn btn-lg btn_pw_upper" style="background-color: #6884c1;"
	      data-toggle="modal" data-target="#modal-default">
	    </div>
    	<div class="col-md-4 pull-right" style="width: auto;" >
	      <input id="btn_pwcForm" value="+ 분류" type="button" 
	      class="btn btn-lg btn_pw_upper" style="background-color: #dd4b39;"
	      data-toggle="modal" data-target="#modal-default">
	      <input id="pwForm" value="+ 업무 등록" type="button" class="btn btn-lg btn_pw_upper">
	      <input id="feedback" value="피드백 관리" type="button" class="btn btn-lg btn_pw_upper" style="background-color: #f39c12;">
	    </div>
    </div>
    
    
    <div class="pwcont">
    
      <div class="col-md-12">	
          <div class="box box-2team">		
          
            <div class="box-header with-border">	
              <b class="box-title">업무 목록</b>	
              <br/><br/>
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">			
            
              <div class="table-responsive">
                <table class="table no-margin table-hover table_pw" >
                  <thead>						
                  <tr>
                    <th scope="col" width="5%" tex>No.</th>
                    <th scope="col" width="15%">분류</th>
                    <th scope="col" width="40%">업무명</th>
                    <th scope="col" width="10%">담당자</th>
                    <th scope="col" width="11%">시작예정</th>
                    <th scope="col" width="11%">종료예정</th>
                    <th scope="col" width="8%">진행도</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${pwl.size() >0 }">
	                  <c:forEach items="${pwl }" var="pwv">
			                 <tr code="${pwv.PW_CODE }">
	       						<td>${pwv.RNUM }</td>
			                   	<td>${pwv.PWC_NAME }</td>
			                   	<td>${pwv.PW_FUNCTION }</td>
			                   	<td>${pwv.EMP_NAME }</td>
			                   	<td>${pwv.PW_EST }</td>
			                   	<td>${pwv.PW_EET }</td>
			                   	<td>${pwv.PW_PERCENT} %</td>
			                 </tr>
			          </c:forEach>
			      </c:if>
                  </tbody>
                  
                  
                </table>
                
                
                <c:if test="${pwl.size() == 0 }">
                	<br>
			      	<h4 style="text-align: center">데이터가 존재하지 않습니다.</h4>
			    </c:if>
              </div>
              
            </div>
            
          </div>
          ${page}
        </div>
        
        <form action="${pageContext.request.contextPath}/user/project/pw/pwList.do" method="post" class="form-inline pull-right"
	   style="margin-right: 15px;">
			<select class="form-control" name="search_keycode" >
				<option value="total">전체</option>
				<option value="function">업무명</option>
				<option value="pwc">분류</option>
				<option value="damdang">담당자</option>
			</select>
			<input id="search_keyword"  name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		    <button type="submit" class="btn btn-primary form-control">검색</button>
		</form>
        
	   </div>
	   
	   
		
		
	</div>

		<div class="modal fade" id="modal-default">
          <div class="modal-dialog" style="margin-top: 10%; width: 80%; height: 60%;">
            <div class="modal-content" style="width:50%; height:100%; margin-left: auto; margin-right: auto; ">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" align="center">업무 분류</h4>
              </div>
              <div class="modal-body" style="height: 70%; overflow: auto;">
              <form id="ppForm">
              	<div class="box box-warning">		
		          
		            <div class="box-header with-border">	
		              <b class="box-title">분류</b>	
		            </div>
		            
		            <!-- /.box-header -->
		            <div class="box-body">			
		            
		              <div class="table-responsive">
		                <table class="table no-margin table-hover table_pwc" >
		                  <thead>						
		                  <tr id="trtr">
		                    <th scope="col" width="20%">분류 No.</th>
		                    <th scope="col" width="45%">분류 명</th>
		                    <th scope="col" width="15%"></th>
		                    <th scope="col" width="15%"></th>
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
              	<div style="width: 70%; margin-top: 3%" class="center">
              	<table id="pwcForm" class="perful">
              		<tr>
              			<td width="10%"></td>
	              		<td colspan="2">
	              		<input type="text" name="pwc_name" class="form-control input_foot" style="border-radius: 1em;"
	              		 placeholder="업무 분류 추가">
	              		</td>
	              		<td  style="width: 20%">
	              		<button id="btn_insert_pwc" type="button" class="btn btn-primary">추가</button>
	              		</td>
	              	</tr>
	             </table>
                </div>
              </div>
            </div>
            </form>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


        
</html>