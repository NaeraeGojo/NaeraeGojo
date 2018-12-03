<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
.btn{
	border-radius: 1em;
}
.btn-sm {
	width : 80px;
	vertical-align: top;
}
/* label { */
/* 	font-size: 20px !important; */
/* } */
.col-md-11 {
	margin: 10px;
}

.row {
   margin-right:100px;
   margin-left:100px;
 }
 
 .filestyle{
 	padding-top: 5px;
 }
 
 tr{
 	height: 50px; 
 }
 .table_rqpps{
 	margin-bottom: 0px;
 }
 .table_rqpps tr{
 	height: 20px;
 }
 
 .table_rqpps th{
 	width: 30%;
 	text-align: right;
 }
 .table_rppps>tbody>tr>th {
 	vertical-align: middle;
 }
 
 .table_rqpps td{
 	border-left: 1px solid #f4f4f4;
 }
 
 .table_rp{
 	margin-bottom: 0px;
 }
 .table_rp td{
 	text-align: center;
 	border: none;
 }
 .table_rp th{
 	width: 20%;
 	text-align: center;
 }
 .table_rp>tbody>tr>th {
 	border : none;
	padding: 0px; 
	padding-bottom: 5px;
 }

 #dres{
 	margin-right: 20px;
 }
 
 .form-control[readonly]{
	background-color: white;
}
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
.btn{
	border-radius: 1em;
}
.btn-sm {
	width : 80px;
	vertical-align: top;
}
/* label { */
/* 	font-size: 20px !important; */
/* } */
.col-md-11 {
	margin: 10px;
}

.row {
   margin-right:100px;
   margin-left:100px;
 }
 
 .filestyle{
 	padding-top: 5px;
 }
 #dres{
 	margin-right: 20px;
 }
 
 .div_files{
 	margin-top: 5px;
 }
 
 #btn_upForm, #btn_update, #btn_del{
 	width: 80px;
 }
 
 .modal-content{
 	margin-left: auto;
 	margin-right: auto;
 }
 
 .date_table tbody{
 	vertical-align: initial;
 }
 
 .date_table tr{
 	height: auto;
 }
 
 .btn-flat{
 	margin-left: 5px;
 }
</style>
<script type="text/javascript">
$(function(){
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	}
	$('.hideUp').hide();
	
	$('#btn_cancle').click(function(){
		$('.hideUp').hide();
		$('.upForm').attr('readonly','readonly');
		$('.hideForm').show();
	});
	
	$('.form-control').attr('readonly','readonly');
	
	$('#btn_upForm').click(function(){
		$('.hideForm').hide();
		$('.hideUp').show();
		$('.upForm').removeAttr('readonly');
		
	});

	$('#btn_del').click(function(){
		var suggest_code = '${sv.suggest_code}';
		var query = '?suggest_code='+suggest_code;
		$(location).attr('href','${pageContext.request.contextPath}/user/suggest/suggestDelete.do'+query)
	});
	
	$('#btn_back').click(function(){
		
		var currentPage = '${param.currentPage}';
		
		var query = '?currentPage=' + currentPage;
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
    	
		$(location).attr('href','${pageContext.request.contextPath}/user/suggest/suggestList.do'+query);
	});
	
	$('.btn_refile').click(function(){
		suggfi_code = $(this).attr('name');
		$('#fileUpForm input[name=suggfi_code]').val(suggfi_code);
	});
	
	$('.btn_fileUp').click(function(){
		var file01 = $('#file01').val();
		
		if(file01 == ''){
			boalert("파일을 선택해 주세요.")
			return false;
		}
		
		var formData = new FormData(); 
		formData.append("suggfi_code", suggfi_code); 
		formData.append("file", $("input[name=files]")[0].files[0]);
		
		$.ajax({
            type : 'post',
            enctype: 'multipart/form-data',
            processData: false,  // Important!
            contentType: false,
            cache: false,
            url : '${pageContext.request.contextPath}/user/suggfi/suggfiUpdate.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('#'+suggfi_code).text(json.suggfi_name);
            	
                $('#fileUpForm').modal('hide');
            }
        });
		
	});
	
	
	$('#suggestUp').submit(function(){
		var suggest_code = $('input[name=suggest_code]').val();
		var suggest_title = $('input[name=suggest_title]').val();
		var suggest_content = $('textarea[name=suggest_content]').val();
		var suggest_start_date = $('input[name=suggest_start_date]').val();
		var suggest_end_date = $('input[name=suggest_end_date]').val();
		var suggest_cost = $('input[name=suggest_cost]').val();
		var suggest_result = $('#sel_result').val();
		
		if(suggest_title == '' || suggest_start_date == '' || suggest_end_date == ''||
				suggest_cost == ''|| suggest_content == ''){
			boalert("빈 항목이 존재합니다.");
			return false;
		}
		
		if(suggest_code == ''){
			boalert("관련 제안요청서를 선택해주세요.");
			return false;
		}
		
		var dateArr = suggest_start_date.split('-');
		var start_date = new Date(dateArr[0] , dateArr[1] -1, dateArr[2]);
		
		var dateArr2 = suggest_end_date.split('-');
		var end_date = new Date(dateArr2[0] , dateArr2[1] -1, dateArr2[2]);
		
		
		
		if(end_date.getTime() < start_date.getTime()){
			boalert("소요기간의 시작일과 종료일을 확인해주세요.")
			return false;
		}
		
		$('input[name=suggest_result]').val(suggest_result);
		return true;
	});
	
	$('input[name=suggest_code]').val('${sv.suggest_code}');
	$('input[name=suggest_title]').val('${sv.suggest_title}');
	$('input[name=suggest_nickname]').val('${rv.rqpps_nickname}');
	$('input[name=suggest_start_date]').val('${sv.suggest_start_date}');
	$('input[name=suggest_end_date]').val('${sv.suggest_end_date}');
	$('input[name=suggest_cost]').val('${sv.suggest_cost}');
	$('textarea[name=suggest_content]').val('${sv.suggest_content}');
	$('input[name=suggest_result]').val('${sv.suggest_result}');
	$('#sel_result').val('${sv.suggest_result}');
});

</script>

<br/><br/>
  <div class="row" >
  <div class="col-md-12">
	<!-- TABLE: LATEST ORDERS -->
      <div class="box box-2team">
        <div class="box-header with-border">
          <b class="box-title">제안서 조회</b>
          <br/><br/>
        </div>
        <!-- /.box-header -->
        <div class="box-body" >
         <form role="form" id="suggestUp" class="form-horizontal"
         method="post" action="${pageContext.request.contextPath }/user/suggest/suggestUpdate.do">
         	<input type="hidden" name="suggest_code">
            <!-- text input -->
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >제안서 명</label>
              <div class="col-sm-8">
                <input id="name" type="text" name="suggest_title" class="form-control upForm" 
                style="border-radius: 1em;">
              </div>
            </div>
            
            <div class="form-group">
              <label for="writer" class="col-sm-2 control-label" >작성자</label>
              <div class="col-sm-8">
                <input id="writer" type="text" name="suggest_nickname" class="form-control" style="border-radius: 1em;"
                 readonly="readonly" >
              </div>
            </div>

			
		<div class="form-group">
            <label for="sel_rfp" class="col-sm-2 control-label">제안요청서</label>
            <div class="col-sm-6">
			    <div class="box" style="margin-bottom: 0px;">
             		<table class="table_rqpps table">
						<tr>
				    		<th>제안 요청서 명</th>
				    		<td>${rv.rqpps_name }</td>
				    	</tr>
				    	<tr>
				    		<th>공고기관</th>
				    		<td>${rv.rqpps_notice_agency }</td>
				    	</tr>
				    	<tr>
				    		<th>예산</th>
				    		<td>￦  ${rv.rqpps_budget }원</td>
				    	</tr>
				    	<tr>
				    		<th>요구인력</th>
				    		<td style="padding:2px;">
				    			<table class="table_rp table">
									<tr>
							    		<th>초급</th>
							    		<th>중급</th>
							    		<th>고급</th>
							    		<th>특급</th>
							    	</tr>
							    	<tr>
							    		<td>${mv.mp_begin }</td>
							    		<td>${mv.mp_inter }</td>
							    		<td>${mv.mp_high }</td>
							    		<td>${mv.mp_spec }</td>
							    	</tr>
							    </table>
				    		</td>
				    	</tr>
				    </table>
				</div>
			    
		    </div>
        </div>
                 
          <div class="form-group">
            <label for="edate" class="col-sm-2 control-label">예상 소요기간</label>
            <div class="col-md-8">
            <table class="date_table">
            	<tr>
            		<td>
            		<input type="date" name="suggest_start_date" class="form-control upForm" style="border-radius: 1em;">
            		</td>
	              	<td style=" text-align: center; width: 20%; font-size: 1.5em;">~</td>
	              	<td>
	              	<input type="date" name="suggest_end_date" class="form-control upForm" style="border-radius: 1em;">
	              	</td>
            	</tr>
            </table>
            </div> 
          </div>

          <div class="form-group">
            <label for="pmoney" class="col-sm-2 control-label">사업비</label>
            <div class="col-sm-3">
              <input id="pmoney" type="number" name="suggest_cost" class="form-control upForm" style="border-radius: 1em;" placeholder="￦">
            </div> 
          </div>
                
                
                
	    <div class="form-group">
	      <label for="contents" class="col-sm-2 control-label">제안서 내용</label>
	      <textarea id="contents" name="suggest_content" class="col-sm-10 form-control upForm"
	       rows="10" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
	      
	    </div>
	    
	    <div class="form-group">
			 <label for="file01" class="col-sm-2 control-label">제안서 첨부</label>
			 <div class="col-sm-10 div_files">
					<a id="${sv.items[0].suggfi_code }" class="a_files"
					 href="${pageContext.request.contextPath }/user/suggfi/suggfiDownload.do?suggfi_code=${sv.items[0].suggfi_code}">
					${sv.items[0].suggfi_name }</a>
					<input type="button" class="btn_refile hideUp"  data-toggle="modal" data-target="#fileUpForm"
			 	 name="${sv.items[0].suggfi_code }" value="수정">
			 </div>
        </div>
        
        <div class="form-group">
            <label for="sel_rfp" class="col-sm-2 control-label">상태</label>
            <div class="col-sm-2">
            	<input id="name" type="text" name="suggest_result" class="form-control upForm hideForm" 
                style="border-radius: 1em;">
			    <select id="sel_result" class="form-control select2 hideUp" style="border-radius: 1em;">
			    	<option>신규</option>
			    	<option>수주</option>
			    	<option>미수주</option>
			    </select>
		    </div>
        </div>					
              
				<div class="box-footer clearfix">
	              	<input value="등록" type="submit" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="width:80px;"
	              	  class="btn btn-warning btn-flat pull-right hideUp">
	              	<input id="btn_cancle" value="취소" type="button" style="width:80px;" 
	              	 class="btn btn-default btn-flat pull-right hideUp">
	              	 <c:if test="${LOGIN_EMPINFO.emp_code == rv.emp_code }">
	              		<input id="btn_upForm" value="수정" type="button" style="width:80px;"  
	              			class="btn btn-warning btn-flat pull-right hideForm">
	              		<input id="btn_del" value="삭제" type="button" class="btn btn-danger btn-flat pull-right">
              		</c:if>
	              	
	              	<input id="btn_back" value="목록" type="button"style="width:80px;"  class="btn btn-info btn-flat pull-right">
          	    </div>
          	    
          	</form>
          <!-- /.box -->
        </div>
        </div>
      </div>
     </div>
     
     <!-- 파일 업로드 모달 창 -->
     <div class="modal fade" id="fileUpForm">
          <div class="modal-dialog" style="top:50%;">
            <div class="modal-content" style="width: 60%">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">파일 변경</h4>
              </div>
              <div class="modal-body">
              <form id="refileForm" enctype="multipart/form-data" method="post">
              <input type="hidden" name="suggfi_code">
               <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
              
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary btn_fileUp">수정</button>
              </div>
            </div>
            </form>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
     
</html>
