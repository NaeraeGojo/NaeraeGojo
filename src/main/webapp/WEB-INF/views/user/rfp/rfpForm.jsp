<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	$('#btn_back').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/rfp/rfpList.do');
	});
	
	$('#rfpForm').submit(function(){
		var mp_code = $('#rfpForm input[name=mp_code]').val();
		var rqpps_notice_agency = $('input[name=rqpps_notice_agency]').val();
		var rqpps_name = $('input[name=rqpps_name]').val();
		var rqpps_contents = $('#contents').val();
		var rqpps_end_date = $('input[name=rqpps_end_date]').val();
		var rqpps_budget = $('input[name=rqpps_budget]').val();
		var rqpps_qualification = $('input[name=rqpps_qualification]').val();
		var file1 = $('#file01').val();
		var file2 = $('#file02').val();
		
		
		if(rqpps_notice_agency == '' || rqpps_name == '' || rqpps_contents == ''||
				rqpps_end_date == ''|| rqpps_budget == '' || rqpps_qualification == ''){
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
	
	$('#btn_pp').click(function(){
		var begin = $('#modal-default input[name=mp_begin]').val();
		var inter = $('#modal-default input[name=mp_inter]').val();
		var high = $('#modal-default input[name=mp_high]').val();
		var spec = $('#modal-default input[name=mp_spec]').val();
		
		if(begin<0 || inter < 0 || high <0 || spec < 0){
			alert("0보다 크게")
			return false;
		}
		
		var formData = $('#ppForm').serialize();
		
		 $.ajax({
	            type : 'post',
	            url : '${pageContext.request.contextPath}/user/mp/insertMp.do',
	            data : formData,
	            dataType : 'json',
	            error: function(xhr, status, error){
	                alert(error);
	            },
	            success : function(json){
	            	$('input[name=mp_code]').val(json.mp.mp_code);
	            	
	            	
	            	var ptag = $('<div class="box"><table class="table_rp table">'
	            					+'<tr>'
		                    		+'<th>초급</th>'
		                    		+'<th>중급</th>'
		                    		+'<th>고급</th>'
		                    		+'<th>특급</th>'
		                    	+'</tr>'
		                    	+'<tr>'
		                    		+'<td>'+json.mp.mp_begin+'명</td>'
		                    		+'<td>'+json.mp.mp_inter+'명</td>'
		                    		+'<td>'+json.mp.mp_high+'명</td>'
		                    		+'<td>'+json.mp.mp_spec+'명</td>'
		                    	+'</tr></table></div>');
	            	
	            	
	            	
	            	$('#dres').append(ptag);
	         		$('#dres').removeAttr('hidden');
	         		$('#dres').attr('style','display:inline-block');
	                $('#btn_rp').hide();
	                $('#btn_rpre').show();
	                $('#modal-default').modal('hide');
	            }
	        });
		 
			
	});
});

</script>

<br/><br/>
  <div class="row" >
  <div class="col-md-12">
	<!-- TABLE: LATEST ORDERS -->
      <div class="box box-warning">
        <div class="box-header with-border">
          <b class="box-title">제안 요청서 등록</b>
          <br/><br/>
        </div>
        <!-- /.box-header -->
        <div class="box-body" >
         <form role="form" id="rfpForm" class="form-horizontal" enctype="multipart/form-data" 
         method="post" action="${pageContext.request.contextPath }/user/rfp/rfpInsert.do">
         
         <input type="hidden" name="mp_code">
         <input type="hidden" name="emp_code" value="${LOGIN_EMPINFO.emp_code}">
         
            <!-- text input -->
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >제안 요청서 명</label>
              <div class="col-sm-8">
                <input id="name" type="text" name="rqpps_name" class="form-control" style="border-radius: 1em;" placeholder="제안 요청서 명">
              </div>
            </div>
            
            <div class="form-group">
              <label for="writer" class="col-sm-2 control-label" >작성자</label>
              <div class="col-sm-8">
                <input id="writer" type="text" name="rqpps_nickname" class="form-control" style="border-radius: 1em;" value="${LOGIN_EMPINFO.emp_nick}"
                 readonly="readonly" >
              </div>
            </div>

            <div class="form-group">
              <label for="aname" class="col-sm-2 control-label" >공고기관 명</label>
              <div class="col-sm-8">
                <input id="aname" type="text" name="rqpps_notice_agency" class="form-control" style="border-radius: 1em;" placeholder="공고기관 명">
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
              <input id="edate" type="date" name="rqpps_end_date" class="form-control" style="border-radius: 1em;" placeholder="제안서 마감">
            </div> 
          </div>

          <div class="form-group ">
            <label for="rp" class="col-sm-2 control-label">요구 인력</label>
            <div class="col-md-1 " style="width: auto;">
             	<div id="dres" hidden="hidden" style=" margin-top: 10px; padding: 5px;"></div>
	            <input id="btn_rp" type="button" class="bg-teal btn form-control btn-sm" 
	            data-toggle="modal" data-target="#modal-default"
	            value="추가" style="border-radius: 1em;">
	            <input id="btn_rpre" type="button" class=" bg-teal btn form-control btn-sm" 
	            data-toggle="modal" data-target="#modal-update"
	            value="수정" style="border-radius: 1em; display:none;">
	           
	            
<!--               <input id="rp" type="select" class="form-control" style="border-radius: 1em;" placeholder="제안서 마감"> -->
            </div> 
          </div>
                
          <div class="form-group">
            <label for="pr" class="col-sm-2 control-label">참가 자격</label>
            <div class="col-sm-3">
              <input id="pr" type="text" name="rqpps_qualification" class="form-control" style="border-radius: 1em;" placeholder="참가 자격">
            </div> 
          </div>

          <div class="form-group">
            <label for="pmoney" class="col-sm-2 control-label">예산</label>
            <div class="col-sm-3">
              <input id="pmoney" type="number" name="rqpps_budget" class="form-control" style="border-radius: 1em;" placeholder="￦">
            </div> 
          </div>
                
                
                
	    <div class="form-group">
	      <label for="contents" class="col-sm-2 control-label">요청서 내용</label>
	      <textarea id="contents" name="rqpps_contents" class="col-sm-10"
	       rows="10" placeholder="요청서 내용" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
	      
	    </div>
	    
	    <div class="form-group">
			 <label for="file01" class="col-sm-2 control-label">제안요청서 첨부</label>
			 <div class="col-sm-10">
				 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
			 </div>
        </div>				
	    <div class="form-group">
			 <label for="file02" class="col-sm-2 control-label">공고서 첨부</label>
			 <div class="col-sm-10">
				 <input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary">
			 </div>
        </div>				
<!-- 					<div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
			
<!-- 			<!-- Indicators -->
<!-- 						<ol class="carousel-indicators"> -->
<!-- 							<li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!-- 							<li data-target="#myCarousel" data-slide-to="1"></li> -->
<!-- 						</ol> -->
<!-- 			<!-- Wrapper for slides -->
<!-- 					</div> -->
<!-- 			<!-- Left and right controls -->
<!-- 					<div> -->
			
<!-- 						<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a> -->
<!-- 						<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a> -->
<!-- 					</div> -->
<!--             	</div> -->
              
              
              
				<div class="box-footer clearfix">
<%--               	<input value="삭제" type="button" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="width:80px;" class="btn btn-warning btn-flat pull-right"> --%>
              	<input value="등록" type="submit" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="width:80px;"  class="btn btn-warning btn-flat pull-right">
              	<input id="btn_back" value="목록" type="button"style="width:80px;"  class="btn btn-info btn-flat pull-right">
          	    </div>
          	    
          	</form>
          <!-- /.box -->
        </div>
        </div>
      </div>
     </div>
      
      <div class="modal fade" id="modal-default">
          <div class="modal-dialog" style="margin-top: 400px;">
            <div class="modal-content" style="width:300px; margin-left: auto; margin-right: auto; ">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" align="center">요구 인력 계획</h4>
              </div>
              <div class="modal-body">
              <form id="ppForm">
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
                <button id="btn_pp" type="button" class="btn btn-primary">등록</button>
              </div>
            </div>
            </form>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
        <div class="modal fade" id="modal-update">
          <div class="modal-dialog" style="margin-top: 400px;">
            <div class="modal-content" style="width:300px; margin-left: auto; margin-right: auto; ">
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
        
</html>
