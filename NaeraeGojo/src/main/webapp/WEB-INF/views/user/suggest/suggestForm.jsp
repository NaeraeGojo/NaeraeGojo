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
	
	var to ={
		att1 : '1',
		att2 : '2'
	}
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	}
	
	var today = new Date();
	
	$('#sel_rfp').change(function(){
		var rqpps_code = $('#sel_rfp').val();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/rfp/getMyRfp.do',
            data : {'rqpps_code' : rqpps_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	// json (제안요청서, 인력계획 정보 담고있음)
            	
            	// 제안요청서 정보 세팅
            	$('input[name=rqpps_code]').val(json.rv.rqpps_code);
            	$('input[name=rqpps_name]').val(json.rv.rqpps_name);
            	$('input[name=rqpps_nickname]').val(json.rv.rqpps_nickname);
            	$('input[name=rqpps_notice_agency]').val(json.rv.rqpps_notice_agency);
            	$('input[name=rqpps_end_date]').val(json.rv.rqpps_end_date);
            	$('input[name=rqpps_qualification]').val(json.rv.rqpps_qualification);
            	$('input[name=rqpps_budget]').val(json.rv.rqpps_budget);
            	$('textarea[name=rqpps_contents]').val(json.rv.rqpps_contents);
            	$('.a_files').each(function(i,v){
            		$(this).attr('href','${pageContext.request.contextPath}/user/suggfi/suggfiDownload.do?suggfi_code='
            				 + json.rv.items[i].suggfi_code);
            		$(this).text(json.rv.items[i].suggfi_name);
            	})
            	
            	
            	// 요구인력 세팅
            	$('.table_rp td:eq(0)').text(json.mv.mp_begin);
            	$('.table_rp td:eq(1)').text(json.mv.mp_inter);
            	$('.table_rp td:eq(2)').text(json.mv.mp_high);
            	$('.table_rp td:eq(3)').text(json.mv.mp_spec);
            	
            	$('.rfpRow').show();
            }
        });
		
	});
	
	$('#btn_back').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/suggest/suggestList.do');
	});
	
	$('#suggestForm').submit(function(){
		var rqpps_code = $('input[name=rqpps_code]').val();
		var suggest_title = $('input[name=suggest_title]').val();
		var suggest_content = $('textarea[name=suggest_content]').val();
		var suggest_start_date = $('input[name=suggest_start_date]').val();
		var suggest_end_date = $('input[name=suggest_end_date]').val();
		var suggest_cost = $('input[name=suggest_cost]').val();
		var file1 = $('#file01').val();
		
		
		if(suggest_title == '' || suggest_start_date == '' || suggest_end_date == ''||
				suggest_cost == ''|| suggest_content == ''){
			boalert("빈 항목이 존재합니다.");
			return false;
		}
		
		if(rqpps_code == ''){
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
		
		
		if(file1 == ''){
			boalert("제안서 첨부파일을 등록해 주세요.")
			return false;
		}

		
		return true;
	});
	
});

</script>

<br/><br/>
  <div class="row" >
  <div class="col-md-12">
	<!-- TABLE: LATEST ORDERS -->
      <div class="box box-2team">
        <div class="box-header with-border">
          <b class="box-title">제안서 등록</b>
          <br/><br/>
        </div>
        <!-- /.box-header -->
        <div class="box-body" >
        
        
         <form role="form" id="suggestForm" class="form-horizontal" enctype="multipart/form-data" 
         method="post" action="${pageContext.request.contextPath }/user/suggest/suggestInsert.do">
         	<input type="hidden" name="rqpps_code">
            <!-- text input -->
            
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
          <!-- /.box -->
        </div>
        </div>
      </div>
     </div>
     
     
     <!-- ######################## 제안 요청서 정보    ###############################3 -->
     
  <div class="row rfpRow" style="display:none;">
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
         method="post">
         
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
             	<div id="dres" style=" margin-top: 10px; padding: 5px;">
             		<div class="box">
             		<table class="table_rp table">
						<tr>
				    		<th>초급</th>
				    		<th>중급</th>
				    		<th>고급</th>
				    		<th>특급</th>
				    	</tr>
				    	<tr>
				    		<td></td>
				    		<td></td>
				    		<td></td>
				    		<td></td>
				    	</tr>
				    </table>
				    </div>
             	</div>
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
					<a class="a_files" ></a>	
			 </div>
        </div>				
	    <div class="form-group">
			 <label for="file02" class="col-sm-2 control-label">공고서 첨부</label>
			 <div class="col-sm-10 div_files">
<!-- 			 	<input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary" -->
<!-- 				 style="display: none;"> -->
			 	<a class="a_files"></a>
			 </div>
        </div>				
              
          	</form>
          <!-- /.box -->
        </div>
        </div>
      </div>
     </div>
     
     
</html>
