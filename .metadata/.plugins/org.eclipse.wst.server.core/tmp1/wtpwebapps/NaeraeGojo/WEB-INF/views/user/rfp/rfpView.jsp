<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<style>
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
 
 tr{
 	height: 50px; 
 }
 
 .table_rp{
 	margin-right : 20px;
 	text-align: center;	
 }
 .table_rp th{
 	text-align: center;	
 }
 
 .table_rp tr{
 	height: 20px;
 }

 .table_rp td{
 	width: 60px;
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
	
	var today = new Date();
	
	$('.upForm').hide();
	
	$('#btn_del').click(function(){
		var rqpps_code = '${rv.rqpps_code}'; 
		$(location).attr('href','${pageContext.request.contextPath}/user/rfp/rfpDelete.do?rqpps_code='+rqpps_code);
	});
	
	$('#btn_back').click(function(){
		var currentPage = '${param.currentPage}';
		
		var query = '?currentPage=' + currentPage;
// 		if(currentPage != null && currentPage != ''){
// 			query = '?currentPage=' + currentPage;
// 		}
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
		
		$(location).attr('href','${pageContext.request.contextPath}/user/rfp/rfpList.do'+query);
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
	
	
	$('#btn_upForm').click(function(){
		$('input[name=rqpps_name]').removeAttr('readonly');
		$('input[name=rqpps_notice_agency]').removeAttr('readonly');
		$('input[name=rqpps_end_date]').removeAttr('readonly');
		$('input[name=rqpps_qualification]').removeAttr('readonly');
		$('input[name=rqpps_budget]').removeAttr('readonly');
		$('#contents').removeAttr('readonly');
// 		$('.a_files').hide();
		$('input[name=files]').attr('style','display:inline-block');
		
		
		$('#btn_upForm').hide();
		$('#btn_update').attr('style','display:inline-block');
		$('.upForm').show();
	});
	
	$('#rfpView').submit(function(){
		var rqpps_notice_agency = $('input[name=rqpps_notice_agency]').val();
		var rqpps_name = $('input[name=rqpps_name]').val();
		var rqpps_contents = $('#contents').val();
		var rqpps_end_date = $('input[name=rqpps_end_date]').val();
		var rqpps_budget = $('input[name=rqpps_budget]').val();
		var rqpps_qualification = $('input[name=rqpps_qualification]').val();
		
		
		if(rqpps_notice_agency == '' || rqpps_name == '' || rqpps_contents == ''||
				rqpps_end_date == ''|| rqpps_budget == '' || rqpps_qualification == ''){
			boalert("빈 항목이 존재합니다.");
			return false;
		}
		
		var dateArr = rqpps_end_date.split('-');
		
		var rq_date = new Date(dateArr[0] , dateArr[1] -1, dateArr[2]);
		
		if(rq_date.getTime() < today.getTime()){
			boalert("이미 지난날짜는 제안서의 마감기한으로 설정할 수 없습니다.")
			return false;
		}
		
		
		return true;
	});
	
	$('#btn_rpre').click(function(){
		var mp_code = $('input[name=mp_code]').val();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/mp/getMp.do',
            data : {'mp_code' : mp_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=mp_code]').val(json.mp.mp_code);
            	
            	$('#modal-update input[name=mp_begin]').val(json.mp.mp_begin);
            	$('#modal-update input[name=mp_inter]').val(json.mp.mp_inter);
            	$('#modal-update input[name=mp_high]').val(json.mp.mp_high);
            	$('#modal-update input[name=mp_spec]').val(json.mp.mp_spec);
            }
        });
	});
	
	$('#btn_ppre').click(function(){
		var begin = $('#modal-update input[name=mp_begin]').val();
		var inter = $('#modal-update input[name=mp_inter]').val();
		var high = $('#modal-update input[name=mp_high]').val();
		var spec = $('#modal-update input[name=mp_spec]').val();
		
		if(begin<0 || inter < 0 || high <0 || spec < 0){
			alert("0보다 크게")
			return false;
		}
		
		var formData = $('#reppForm').serialize();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/mp/updateMp.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=mp_code]').val(json.mp.mp_code);
            	
            	$('.table_rp tr:eq(1) td:eq(0)').text(begin);
            	$('.table_rp tr:eq(1) td:eq(1)').text(inter);
            	$('.table_rp tr:eq(1) td:eq(2)').text(high);
            	$('.table_rp tr:eq(1) td:eq(3)').text(spec);
            	
            	
                $('#modal-update').modal('hide');
            }
        });
	});
	
	
	$('input[name=rqpps_name]').val('${rv.rqpps_name}');
	$('input[name=rqpps_nickname]').val('${rv.rqpps_nickname}');
	$('input[name=rqpps_notice_agency]').val('${rv.rqpps_notice_agency}');
	$('input[name=rqpps_end_date]').val('${rv.rqpps_end_date}');
	$('input[name=rqpps_qualification]').val('${rv.rqpps_qualification}');
	$('input[name=rqpps_budget]').val('${rv.rqpps_budget}');
	$('#contents').val('${rv.rqpps_contents}');
	
	
	var ptag = $('<div class="box"><table class="table_rp table">'
				+'<tr>'
	    		+'<th>초급</th>'
	    		+'<th>중급</th>'
	    		+'<th>고급</th>'
	    		+'<th>특급</th>'
	    	+'</tr>'
	    	+'<tr>'
	    		+'<td>'+'${mv.mp_begin}'+'명</td>'
	    		+'<td>'+'${mv.mp_inter}'+'명</td>'
	    		+'<td>'+'${mv.mp_high}'+'명</td>'
	    		+'<td>'+'${mv.mp_spec}'+'명</td>'
	    	+'</tr></table></div>');
	
	$('#dres').append(ptag);
	$('#dres').attr('style','display:inline-block');
});

</script>

<br/><br/>
  <div class="row" >
  <div class="col-md-12">
	<!-- TABLE: LATEST ORDERS -->
      <div class="box box-warning">
        <div class="box-header with-border">
          <b class="box-title">제안 요청서 조회</b>
          <br/><br/>
        </div>
        <!-- /.box-header -->
        <div class="box-body" >
         <form role="form" id="rfpView" class="form-horizontal"
         method="post" action="${pageContext.request.contextPath }/user/rfp/rfpUpdate.do">
         <input type="hidden" name="rqpps_code" value="${rv.rqpps_code }">
         <input type="hidden" name="mp_code" value="${rv.mp_code }">
         <input type="hidden" name="emp_code" value="${rv.emp_code }">
         
            <!-- text input -->
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >제안 요청서 명</label>
              <div class="col-sm-8">
                <input id="name" type="text" name="rqpps_name" class="form-control" style="border-radius: 1em;" placeholder="제안 요청서 명" readonly="readonly">
              </div>
            </div>
            
            <div class="form-group">
              <label for="writer" class="col-sm-2 control-label" >작성자</label>
              <div class="col-sm-8">
                <input id="writer" name="rqpps_nickname" type="text" class="form-control" style="border-radius: 1em;"
                 readonly="readonly">
              </div>
            </div>

            <div class="form-group">
              <label for="aname" class="col-sm-2 control-label" >공고기관 명</label>
              <div class="col-sm-8">
                <input id="aname" type="text" name="rqpps_notice_agency" class="form-control" style="border-radius: 1em;" placeholder="공고기관 명" readonly="readonly">
              </div>
            </div>
            
<!--                  <div class="form-group"> -->
<!--                   <label for="inputEmail3" class="col-sm-2 control-label">공고기관 명</label> -->
<!-- 	                 <div class="col-sm-8"> -->
<!-- 	                <select class="form-control select2" style="border-radius: 1em;"> -->
<!-- 	                  <option selected="selected">선택하세요</option> -->
<!-- 	                  <option>정부청사 통합시스템 유지보수</option> -->
<!-- 	                  <option>식약청 구축 1단계</option> -->
<!-- 	                  <option>질병관리본부 유지보수</option> -->
<!-- 	                </select> -->
<!-- 	                 </div> -->
<!--                  </div> -->
                 
          <div class="form-group">
            <label for="edate" class="col-sm-2 control-label">제안서 기한</label>
            <div class="col-sm-3">
              <input id="edate" type="date" name="rqpps_end_date" class="form-control" style="border-radius: 1em;" placeholder="제안서 마감" readonly="readonly">
            </div> 
          </div>

          <div class="form-group ">
            <label for="rp" class="col-sm-2 control-label">요구 인력</label>
            <div class="col-md-1 " style="width: auto;">
             	<div id="dres" style=" margin-top: 10px; padding: 5px;"></div>
	            <input id="btn_rpre" type="button" class=" bg-teal btn form-control btn-sm upForm" 
	            data-toggle="modal" data-target="#modal-update"
	            value="수정" style="border-radius: 1em; display:none;">
	           
	            
<!--               <input id="rp" type="select" class="form-control" style="border-radius: 1em;" placeholder="제안서 마감"> -->
            </div> 
          </div>
                
          <div class="form-group">
            <label for="pr" class="col-sm-2 control-label">참가 자격</label>
            <div class="col-sm-3">
              <input id="pr" type="text" name="rqpps_qualification" class="form-control" style="border-radius: 1em;" 
              placeholder="참가 자격" readonly="readonly">
            </div> 
          </div>

          <div class="form-group">
            <label for="pmoney" class="col-sm-2 control-label">예산</label>
            <div class="col-sm-3">
              <input id="pmoney" type="number" name="rqpps_budget" class="form-control" style="border-radius: 1em;" 
              placeholder="￦" readonly="readonly">
            </div> 
          </div>
                
                
                
	    <div class="form-group">
	      <label for="contents" class="col-sm-2 control-label">요청서 내용</label>
	      <textarea id="contents" name="rqpps_contents" class="col-sm-10"
	       rows="10" placeholder="요청서 내용" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;" readonly="readonly"></textarea>
	      
	    </div>
	    
	    <div class="form-group">
			 <label for="file01" class="col-sm-2 control-label">제안요청서 첨부</label>
			 <div class="col-sm-10 div_files">
					<a id="${rv.items[0].suggfi_code }" class="a_files" href="${pageContext.request.contextPath }/user/suggfi/suggfiDownload.do?suggfi_code=${rv.items[0].suggfi_code}">
					${rv.items[0].suggfi_name }</a>
					<input type="button" class="btn_refile upForm"  data-toggle="modal" data-target="#fileUpForm"
			 	 name="${rv.items[0].suggfi_code }" value="수정">
			 </div>
        </div>				
	    <div class="form-group">
			 <label for="file02" class="col-sm-2 control-label">공고서 첨부</label>
			 <div class="col-sm-10 div_files">
<!-- 			 	<input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary" -->
<!-- 				 style="display: none;"> -->
			 	<a id="${rv.items[1].suggfi_code }" class="a_files" href="${pageContext.request.contextPath }/user/suggfi/suggfiDownload.do?suggfi_code=${rv.items[1].suggfi_code}">
			 	${rv.items[1].suggfi_name }</a>
			 	<input type="button" class="btn_refile upForm"  data-toggle="modal" data-target="#fileUpForm"
			 	 name="${rv.items[1].suggfi_code }" value="수정">
			 	
			 </div>
        </div>				
              
              
              
				<div class="box-footer clearfix">
<%--               	<input value="삭제" type="button" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="width:80px;" class="btn btn-warning btn-flat pull-right"> --%>
              	<input id="btn_update" value="등록" type="submit" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="display:none;"
              	  class="btn btn-warning btn-flat pull-right"
              	 >
              	<c:if test="${LOGIN_EMPINFO.emp_code == rv.emp_code }">
              		<input id="btn_del" value="삭제" type="button" class="btn btn-danger btn-flat pull-right">
              		<input id="btn_upForm" value="수정" type="button" class="btn btn-warning btn-flat pull-right">	
              	</c:if>
              	<input id="btn_back" value="목록" type="button" style="width:80px;"  class="btn btn-info btn-flat pull-right">
          	    </div>
          	    
          	</form>
          <!-- /.box -->
        </div>
        </div>
      </div>
     </div>
      
        
        <div class="modal fade" id="modal-update">
          <div class="modal-dialog" style="margin-top: 400px;">
            <div class="modal-content" style="width:300px;">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" align="center">요구 인력 계획</h4>
              </div>
              <div class="modal-body">
              <form id="reppForm">
              <input type="hidden" name="mp_code">
              	<table style="margin-left:80px;">
              		<tr>
              			<td style="width:50px;"><label class="control-label">초급</label></td>
              			<td><input name="mp_begin" type="number" class="form-control"
              			 style="border-radius: 1em; width: 50%;" value="0"></td>
              		</tr>
              		<tr>
              			<td><label class="control-label">중급</label></td>
              			<td><input name="mp_inter" type="number" class="form-control" 
              			style="border-radius: 1em; width: 50%;" value="0"></td>
              		</tr>
              		<tr>
              			<td><label class="control-label">고급</label></td>
              			<td><input name="mp_high" type="number" class="form-control" 
              			style="border-radius: 1em; width: 50%;" value="0"></td>
              		</tr>
              		<tr>
              			<td><label class="control-label">특급</label></td>
              			<td><input name="mp_spec" type="number" class="form-control" 
              			style="border-radius: 1em; width: 50%;" value="0"></td>
              		</tr>
              	</table>
              	
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button id="btn_ppre" type="button" class="btn btn-primary">재등록</button>
              </div>
            </div>
            </form>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
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
