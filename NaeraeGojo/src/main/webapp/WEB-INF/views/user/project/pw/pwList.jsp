<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
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
</style>
<script type="text/javascript">
$(function(){
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};
	
	
	
	
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
	
	
	$('#pwForm').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/pw/pwForm.do');
	});

// 	$('table tr:gt(0)').click(function(){
// 		var pblanc_board_code = $(this).find('td:eq(0) input').val();
// 		var rnum = $(this).find('td:eq(0)').text();
// 		$(location).attr('href', '${pageContext.request.contextPath}/user/pblancboard/pblancboardView.do?pblanc_board_code='+pblanc_board_code+'&rnum='+rnum);
// 	})

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
	        	rePwc();
	        }
	        
		});
		
	});
	

});


</script>
    
      <div class="row">	
      
      <div class="pwcont">
    	<div class="col-md-4 pull-right" style="width: auto;" >
	      <input id="btn_pwcForm" value="+ 분류" type="button" 
	      class="btn btn-lg btn_pw_upper" style="background-color: #dd4b39;"
	      data-toggle="modal" data-target="#modal-default">
	      <input id="pwForm" value="+ 업무 등록" type="button" class="btn btn-lg btn_pw_upper">
	    </div>
    </div>
    
    
    <div class="pwcont">
    
      <div class="col-md-12">	
          <div class="box box-warning">		
          
            <div class="box-header with-border">	
              <b class="box-title">업무 목록</b>	
              <br/><br/>
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">			
            
              <div class="table-responsive">
                <table class="table no-margin table-hover table_pw" >
                  <thead>						
                  <tr id="trtr">
                    <th scope="col" width="5%" tex>No.</th>
                    <th scope="col" width="15%">분류</th>
                    <th scope="col" width="20%">업무명</th>
                    <th scope="col" width="10%">담당자</th>
                    <th scope="col" width="20%">시작예정</th>
                    <th scope="col" width="20%">종료예정</th>
                    <th scope="col" width="10%">진행도</th>
                  </tr>
                  </thead>
                  <tbody>
		                 <tr>
       						<td></td>
		                   	<td></td>
		                   	<td></td>
		                   	<td></td>
		                   	<td></td>
		                   	<td></td>
		                   	<td></td>
		                 </tr>
                  </tbody>
                </table>
              </div>
              
            </div>
            ${pagingUtil}
          </div>
          
        </div>
        
	   </div>
	   
	   <form action="${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do" method="post" class="form-inline pull-right"
	   style="margin-right: 200px;">
			<input id="search_keyword"  name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
			<select class="form-control" name="search_keycode" >
				<option value="TOTAL">전체</option>
				<option value="TITLE">제목</option>
				<option value="PBLANC">공고기관</option>
			</select>
		    <button type="submit" class="btn btn-primary form-control">검색</button>
		</form>
		
		
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