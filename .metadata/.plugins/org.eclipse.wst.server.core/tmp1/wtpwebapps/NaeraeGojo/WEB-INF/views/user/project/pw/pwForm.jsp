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

.form-control[readonly]{
	background-color: white;
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
      <div class="col-md-12">	
          <div class="box box-warning">		
          
            <div class="box-header with-border">	
              <b class="box-title">새 업무등록</b>
              <br><br>	
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">			
            	<form role="form" id="suggestForm" class="form-horizontal" enctype="multipart/form-data" 
         method="post" action="${pageContext.request.contextPath }/user/suggest/suggestInsert.do">
         	<input type="hidden" name="rqpps_code">
            <!-- text input -->
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >분류</label>
	              <div class="col-sm-4">
	                <input id="name" type="text" name="pwc_name" class="form-control" style="border-radius: 1em;">
	                <input type="hidden" name="pwc_code">
	              </div>
	              <div class="col-sm-1" style="padding-left:0px;">
	                <input type="button" class="bg-teal btn form-control btn-sm" 
	           			 value="검색" style="border-radius: 1em;">
	              </div>
            </div>
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >제안서 명</label>
              <div class="col-sm-8">
                <input id="name" type="text" name="suggest_title" class="form-control" style="border-radius: 1em;" placeholder="제안서 명">
              </div>
            </div>
            
            <div class="form-group">
              <label for="writer" class="col-sm-2 control-label" >작성자</label>
              <div class="col-sm-8">
                <input id="writer" type="text" name="suggest_nickname" class="form-control" style="border-radius: 1em;" value="${LOGIN_EMPINFO.emp_nick}"
                 readonly="readonly" >
              </div>
            </div>

			
		<div class="form-group">
            <label for="sel_rfp" class="col-sm-2 control-label">제안요청서</label>
            <div class="col-sm-6">
			    <select id="sel_rfp" class="form-control select2" style="border-radius: 1em;">
			    	<option value="" selected disabled>작성된&nbsp;&nbsp;제안요청서</option>
			      	<c:forEach items="${rl }" var="rv">
			      		<option value="${rv.rqpps_code }">${rv.rqpps_name }</option>
			      	</c:forEach>
			    </select>
		    </div>
        </div>
                 
          <div class="form-group">
            <label for="edate" class="col-sm-2 control-label">예상 소요기간</label>
            <div class="col-md-8">
            <table class="date_table">
            	<tr>
            		<td>
            		<input type="date" name="suggest_start_date" class="form-control" style="border-radius: 1em;">
            		</td>
	              	<td style=" text-align: center; width: 20%; font-size: 1.5em;">~</td>
	              	<td>
	              	<input type="date" name="suggest_end_date" class="form-control" style="border-radius: 1em;">
	              	</td>
            	</tr>
            </table>
            </div> 
          </div>

          <div class="form-group">
            <label for="pmoney" class="col-sm-2 control-label">사업비</label>
            <div class="col-sm-3">
              <input id="pmoney" type="number" name="suggest_cost" class="form-control" style="border-radius: 1em;" placeholder="￦">
            </div> 
          </div>
                
                
                
	    <div class="form-group">
	      <label for="contents" class="col-sm-2 control-label">제안서 내용</label>
	      <textarea id="contents" name="suggest_content" class="col-sm-10"
	       rows="10" placeholder="제안서 내용" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
	      
	    </div>
	    
	    <div class="form-group">
			 <label for="file01" class="col-sm-2 control-label">제안서 첨부</label>
			 <div class="col-sm-10">
				 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
			 </div>
        </div>				
              
		<div class="box-footer clearfix">
	          	<input value="등록" type="submit" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="width:80px;"  class="btn btn-warning btn-flat pull-right">
	          	<input id="btn_back" value="목록" type="button"style="width:80px;"  class="btn btn-info btn-flat pull-right">
            </div>
            
        </form>
	</div>
</div>
</div>
</div>
</div>


        
</html>