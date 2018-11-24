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
            	boalert(json.rv.rqpps_code);
            }
        });
		
	});
	
	$('#btn_back').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/suggest/suggestList.do');
	});
	
	$('#suggestForm').submit(function(){
		var mp_code = $('#suggestForm input[name=mp_code]').val();
		var suggest_notice_agency = $('input[name=suggest_notice_agency]').val();
		var suggest_name = $('input[name=suggest_name]').val();
		var suggest_contents = $('#contents').val();
		var suggest_end_date = $('input[name=suggest_end_date]').val();
		var suggest_budget = $('input[name=suggest_budget]').val();
		var suggest_qualification = $('input[name=suggest_qualification]').val();
		var file1 = $('#file01').val();
		var file2 = $('#file02').val();
		
		
		if(suggest_notice_agency == '' || suggest_name == '' || suggest_contents == ''||
				suggest_end_date == ''|| suggest_budget == '' || suggest_qualification == ''){
			boalert("빈 항목이 존재합니다.");
			return false;
		}
		
		if(mp_code == null || mp_code == ''){
			boalert("인력비었다");
			return false;
		}
		
		if(file1 == ''){
			boalert("제안요청서 첨부파일을 등록해 주세요.")
			return false;
		}

		if(file2 == ''){
			boalert("공고서 첨부파일을 등록해 주세요.")
			return false;
		}
		var dateArr = suggest_end_date.split('-');
		
		var rq_date = new Date(dateArr[0] , dateArr[1] -1, dateArr[2]);
		
		if(rq_date.getTime() < today.getTime()){
			boalert("이미 지난날짜는 제안서의 마감기한으로 설정할 수 없습니다.")
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
      <div class="box box-warning">
        <div class="box-header with-border">
          <b class="box-title">제안서 등록</b>
          <br/><br/>
        </div>
        <!-- /.box-header -->
        <div class="box-body" >
         <form role="form" id="suggestForm" class="form-horizontal" enctype="multipart/form-data" 
         method="post" action="${pageContext.request.contextPath }/user/suggest/suggestInsert.do">
         
            <!-- text input -->
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >제안서 명</label>
              <div class="col-sm-8">
                <input id="name" type="text" name="suggest_name" class="form-control" style="border-radius: 1em;" placeholder="제안서 명">
              </div>
            </div>
            
            <div class="form-group">
              <label for="writer" class="col-sm-2 control-label" >작성자</label>
              <div class="col-sm-8">
                <input id="writer" type="text" name="suggest_nickname" class="form-control" style="border-radius: 1em;" value="${LOGIN_EMPINFO.emp_department }_${LOGIN_EMPINFO.emp_name}"
                 readonly="readonly" >
              </div>
            </div>

			
		<div class="form-group">
            <label for="pr" class="col-sm-2 control-label">제안요청서</label>
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
            		<input id="edate" type="date" name="suggest_end_date" class="form-control" style="border-radius: 1em;" placeholder="제안서 마감">
            		</td>
	              	<td style=" text-align: center; width: 20%; font-size: 1.5em;">~</td>
	              	<td>
	              	<input id="edate" type="date" name="suggest_end_date" class="form-control" style="border-radius: 1em;" placeholder="제안서 마감">
	              	</td>
	              
            
            	</tr>
            </table>
            </div> 
          </div>

          <div class="form-group">
            <label for="pmoney" class="col-sm-2 control-label">사업비</label>
            <div class="col-sm-3">
              <input id="pmoney" type="number" name="suggest_budget" class="form-control" style="border-radius: 1em;" placeholder="￦">
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
			 </div>
        </div>				
	    <div class="form-group">
			 <label for="file02" class="col-sm-2 control-label">공고서 첨부</label>
			 <div class="col-sm-10 div_files">
<!-- 			 	<input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary" -->
<!-- 				 style="display: none;"> -->
			 	<a id="${rv.items[1].suggfi_code }" class="a_files" href="${pageContext.request.contextPath }/user/suggfi/suggfiDownload.do?suggfi_code=${rv.items[1].suggfi_code}">
			 	${rv.items[1].suggfi_name }</a>
			 	
			 </div>
        </div>				
              
          	</form>
          <!-- /.box -->
        </div>
        </div>
      </div>
     </div>
     
     
</html>
