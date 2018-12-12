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

.form-control[readonly]{
	background-color: white;
}

 .btn-flat{
 	margin-left: 5px;
 }
 
 .view_form[type=text], .view_form[type=date]{
 	border-radius: initial;
 	border: none;
    border-bottom: 2px solid gray;
 }
 
 .btn_bottom{
 	width:80px;
 }
</style>
<script type="text/javascript">
$(function(){
	var loading = '<div class="overlay">'
			+'<i class="fa fa-refresh fa-spin"></i>'
		+'</div>';
		
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};
	
	$('.view_form').attr('readonly',true);
	$('.up_form').hide();

	$("#btn_upForm").click(function(){
		$('.view_form').hide();
		$('.up_form').show();
	});
	
	$('#btn_cancle').click(function(){
		$('.up_form').hide();
		$('.view_form').show();
	});
	
	$('#btn_del').click(function(){
		var pw_code = '${pwv.PW_CODE}';
		var query = '?pw_code='+pw_code;
		$(location).attr('href','${pageContext.request.contextPath}/user/project/pw/pwDelete.do'+query);
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
		
		$(location).attr('href','${pageContext.request.contextPath}/user/project/pw/pwList.do'+query);
	});
	
	$('#btn_show_pwc').click(function(){
		$(this).hide();
		$('.div_pwc_search').show();
	});
	
	$('#btn_hide_pwc').click(function(){
		$('.div_pwc_search').hide();
		$('#btn_show_pwc').show();	
	});
	

	rePwc = function(mes){
		$('.table_pwc tbody').empty();
		
		$('.box_pwc .overlay').remove();
		
		$.ajax({
			url :'${pageContext.request.contextPath}/user/project/pwc/pwcList.do'
			, dataType : 'json'
			, data : {mes : mes}
			, type : 'post'
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
	        					+'"<input type="button" class="btn_choice_pwc btn btn-default hideUp'+v.pwc_code+'" code="'
	        					+ v.pwc_code+'" value="선택">'
	        					+'</td>'
	        		tdtag += '</tr>'
	        	})
	        	
	        	$('.table_pwc tbody').append(tdtag);
	        	
	        	$('.btn_choice_pwc').click(function(){
	        		var code = $(this).attr('code');
	        		
	        		var pwc_name = $('p[class=upForm'+code+']').text();
	        		
	        		$('input[name=pwc_code]').val(code);
	        		$('input[name=show_pwc_name]').val(pwc_name);
	        		
	        	});
	        }
		});
	};
	
	$('input[name=pwc_search]').on('input',function(e){
		var mes = $('input[name=pwc_search]').val();
		
		setTimeout(function() {
			var mes2 = $('input[name=pwc_search]').val();
			
			if(mes == mes2){
				if(!$('.box_pwc').hasClass('overlay')){
					$('.box_pwc').append(loading);
				}
				if(mes2 == ''){
					$('.box_pwc .overlay').remove();
					$('.table_pwc tbody').empty();
					return false;
				}
				setTimeout(function(){
					rePwc(mes2);
				},500);
			}
		}, 800);
	});


	$('#btn_insert_pwc').click(function(){
		var pwc_name = $('#pwcForm input[name=text_pwc]').val();
		
		if(pwc_name == ''){
			boalert('분류명을 입력해주세요.');
			return false;
		}
		
		$('#pwcForm input[name=text_pwc]').val('');
		
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
	        	var mes = $('input[name=pwc_search]').val();
	        	rePwc(mes);
	        }
	        
		});
	});
	
	$('#pwForm').submit(function(){
		var project_code = $('input[name=project_code]').val();
		var pwc_code = $('input[name=pwc_code]').val();
		var pw_function = $('input[name=pw_function]').val();
		var pw_content = $('textarea[name=pw_content]').val();
		var pw_percent = $('select[name=pw_percent]').val();
		var pw_writer = $('input[name=pw_writer]').val();
		var pw_damdang = $('select[name=pw_damdang]').val();
		var pw_est = $('input[name=pw_est]').val();
		var pw_eet = $('input[name=pw_eet]').val();
		
		
		if(pwc_code == ''){
			boalert("업무 분류를 선택해주세요.");
			return false;
		}
		
		if(pw_function == ''){
			boalert("업무명을 입력해주세요.");
			return false;
		}
		
		if(pw_content == ''){
			boalert("업무 내용을 입력해주세요.");
			return false;
		}
		
		if(pw_est == ''){
			boalert("업무 시작시간을 입력해주세요.");
			return false;
		}
		
		if(pw_eet == ''){
			boalert("업무 종료기한을 입력해주세요.");
			return false;
		}
		
		var dateArr = pw_est.split('-');
		var start_date = new Date(dateArr[0] , dateArr[1] -1, dateArr[2]);
		
		var dateArr2 = pw_eet.split('-');
		var end_date = new Date(dateArr2[0] , dateArr2[1] -1, dateArr2[2]);
		
		
		
		if(end_date.getTime() < start_date.getTime()){
			boalert("업무 종료기한은 시작시간보다 빠른 날짜일 수 없습니다.")
			return false;
		}
		
		
		return true;
	});
	
	
	
	$('.pw_up_form input[name=show_pwc_name]').val('${pwv.PWC_NAME}');
	$('.pw_up_form input[name=pw_code]').val('${pwv.PW_CODE}');
	$('.pw_up_form input[name=pwc_code]').val('${pwv.PWC_CODE}');
	$('.pw_up_form input[name=pw_function]').val('${pwv.PW_FUNCTION}');
	$('.pw_up_form input[name=pw_writer]').val('${pwv.PW_WRITER}');
	$('.pw_up_form select[name=pw_damdang]').val('${pwv.PW_DAMDANG}');
	$('.pw_up_form input[name=pw_est]').val('${pwv.PW_EST}');
	$('.pw_up_form input[name=pw_eet]').val('${pwv.PW_EET}');
	$('.pw_up_form select[name=pw_percent]').val('${pwv.PW_PERCENT}');
	
	
	$('.pw_up_form input[name=show_pwc_name_view]').val('${pwv.PWC_NAME}');
	$('.pw_up_form input[name=pw_function_view]').val('${pwv.PW_FUNCTION}');
	$('.pw_up_form input[name=pw_writer_view]').val('${pwv.WRITER_NAME}');
	$('.pw_up_form input[name=pw_damdang_view]').val('${pwv.DAMDANG_NAME}');
	$('.pw_up_form input[name=pw_est_view]').val('${pwv.PW_EST}');
	$('.pw_up_form input[name=pw_eet_view]').val('${pwv.PW_EET}');
	$('.pw_up_form input[name=pw_percent_view]').val('${pwv.PW_PERCENT}');
	
	
	// 피드백 받는 사람 
	$('#btn_feedback').click(function(){
		$('#feedbackmodal').modal('show');
		$('input[name=receive_emp]').val('${pwv.DAMDANG_NAME}');
	});
	
	$('#insertFeedback').click(function(){
		
        if($('textarea[name=feedback_content]').val()=='' || $('textarea[name=feedback_content]').val()==null){
            boalert("피드백 내용을 입력해주세요");
            return false;
        };
        
        if($('textarea[name=feedback_content]').val()!='' || $('textarea[name=feedback_content]').val()!=null){
			var myArray = [];
			var damdang = '${pwv.PW_DAMDANG}';
			var pw_code = '${pwv.PW_CODE}';
			var content = $('textarea[name=feedback_content]').val();
			
			myArray.push(damdang);
			myArray.push(pw_code);
			myArray.push(content);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/user/feedback/insertFeedback.do'
				, data : {myArray : myArray}
				, dataType : 'json'
				, type : 'POST'
				, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				, async : false
				, error : function(request, status, error){
					alert("error : " + request.status)
				}
				, success : function(result){
					boalert(result.message);
					
					setTimeout(function(){
						 $(location).attr('href', "${pageContext.request.contextPath}/user/project/pw/pwList.do");
	                },2000);
				}
				
				
			});
        };
		
	});
	
	
	
	
});


</script>
    
<div class="row pw_up_form" style="">
    <div class="pwcont">
      <div class="col-md-12">	
          <div class="box box-2team">		
          
            <div class="box-header with-border">	
              <b class="box-title">업무 조회</b>
              <br><br>	
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">			
            <form role="form" id="pwForm" class="form-horizontal" 
        		 method="post" action="${pageContext.request.contextPath }/user/project/pw/pwUpdate.do">
         	<input type="hidden" name="project_code" value="${project_code}"/>
         	<input type="hidden" name="pw_code"/>
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >분류</label>
	          <div class="col-sm-3">
	            <input readonly="readonly" type="text" name="show_pwc_name_view"
	             class="form-control view_form">
	            <input readonly="readonly" type="text" name="show_pwc_name"
	             class="form-control up_form" style="border-radius: 1em;">
	            <input type="hidden" name="pwc_code">
	          </div>
	          <div class="col-sm-1">
	          <input id="btn_show_pwc" type="button" class="bg-teal btn form-control btn-sm up_form" 
	            value="선택" style="border-radius: 1em;">
	          <input id="btn_hide_pwc" type="button" class="bg-teal btn form-control btn-sm div_pwc_search" 
	            value="접기" style="border-radius: 1em; display: none;">
	           </div>
            </div>
            
            <div class="form-group div_pwc_search" style="display: none;">
              <label style="visibility: hidden;" for="name" class="col-sm-2 control-label" >분류 선택</label>
              
              <div class="col-sm-4 cont_pwc">
              
              <div class="box box-success box_pwc">		
		            <div class="box-header with-border">	
		              <b class="box-title">조회 :</b>	
		            	<input id="name" type="text" name="pwc_search" class="form-control"
		            	 style="border-radius: 1em; border-radius: 1em;width: 70%;display: inline-block;margin-left: 15px;">
		            </div>
		            
		            <div class="box-body">			
		            
		              <div class="table-responsive" style="height: 200px;">
		                <table class="table no-margin table-hover table_pwc" >
		                  <thead>						
		                  <tr id="trtr">
		                    <th scope="col" width="20%">분류 No.</th>
		                    <th scope="col" width="45%">분류 명</th>
		                    <th scope="col" width="15%"></th>
		                  </tr>
		                  </thead>
		                  
		                  <tbody >
		                  
		                  </tbody>
		                  
		                </table>
		              </div>
		              
		              <div style="width: 70%; margin-top: 3%" class="center">
		              	<table id="pwcForm" class="perful">
		              		<tr>
		              			<td width="10%"></td>
			              		<td colspan="2">
			              		<input type="text" name="text_pwc" class="form-control input_foot" style="border-radius: 1em;"
			              		 placeholder="업무 분류 추가">
			              		</td>
			              		<td style="width:10%;"></td>
			              		<td  style="width: 20%">
			              		<button id="btn_insert_pwc" type="button" class="btn btn-primary">추가</button>
			              		</td>
			              	</tr>
			             </table>
		                </div>
		              
		            </div>
		            
		          </div>
		          
              	</div>
              	
            </div>
            
            
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label" >업무 명</label>
              <div class="col-sm-6">
                <input id="name" type="text" name="pw_function_view"
                 class="form-control view_form">
                <input id="name" type="text" name="pw_function"
                class="form-control up_form" style="border-radius: 1em;" placeholder="업무 명">
              </div>
            </div>
            
            <div class="form-group">
		      <label for="contents" class="col-sm-2 control-label">업무 내용</label>
		      <div  class="col-sm-8">
		      <textarea name="pw_content_view" class="form-control view_form" rows="10"
		      style=" border: 1px solid #d2d2d2; border-radius: 1em;">${pwv.PW_CONTENT}</textarea>
		      
		      <textarea name="pw_content" class="form-control up_form" rows="10" placeholder="업무 내용" 
		      style=" border: 1px solid #d2d2d2; border-radius: 1em;">${pwv.PW_CONTENT}</textarea>
		       </div>
		    </div>
            
            <div class="form-group">
              <label for="writer" class="col-sm-2 control-label" >작성자</label>
              <div class="col-sm-3">
              	<input type="hidden" name="pw_writer">
                <input type="text" name="pw_writer_view" class="form-control" style="border: none;
    					border-bottom: 2px solid gray;"
                 readonly="readonly" >
              </div>
            </div>
            
         <div class="form-group">
            <label for="sel_rfp" class="col-sm-2 control-label">담당자</label>
            <div class="col-sm-3">
            	<input type="text" name="pw_damdang_view"
            	 class="form-control view_form" readonly="readonly" >
			    <select name="pw_damdang" class="form-control select2 up_form" style="border-radius: 1em;">
			    	<option value="" selected disabled>담당자 선택</option>
			    	<option value=""></option>
			    	<c:forEach items="${el }" var="ev">
			      		<option value="${ev.emp_code }">${ev.emp_name }</option>
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
            		<input type="date" name="pw_est_view" class="form-control view_form">
            		<input type="date" name="pw_est" class="form-control up_form" style="border-radius: 1em;"
            		>
            		</td>
	              	<td style=" text-align: center; width: 20%; font-size: 1.5em;">~</td>
	              	<td>
	              	<input type="date" name="pw_eet_view" class="form-control view_form">
	              	<input type="date" name="pw_eet" class="form-control up_form" style="border-radius: 1em;">
	              	</td>
            	</tr>
            </table>
            </div> 
          </div>
          
          
          <div class="form-group">
            <label for="pmoney" class="col-sm-2 control-label">진척도</label>
            <div class="col-sm-2">
            	<input type="text" class="form-control view_form" name="pw_percent_view" 
            	style="display:inline-block; width: 40%; text-align: center;">
            	<select id="pw_percent" name="pw_percent" class="form-control select2 up_form"
            	 style="display:inline-block; width:60%; border-radius: 1em;">
			    	<option value="0" selected>0</option>
			    	<option value="10">10</option>
			    	<option value="20">20</option>
			    	<option value="30">30</option>
			    	<option value="40">40</option>
			    	<option value="50">50</option>
			    	<option value="60">60</option>
			    	<option value="70">70</option>
			    	<option value="80">80</option>
			    	<option value="90">90</option>
			    	<option value="100">100</option>
			    </select>
			    %
            </div> 
          </div>
                
              
		<div class="box-footer clearfix">
	          	<input value="수정" type="button" id="btn_upForm" 
	          	 class="btn btn-warning btn-flat pull-right view_form btn_bottom">
	          	<input value="등록" type="submit"
	          	  class="btn btn-warning btn-flat pull-right up_form btn_bottom">
	          	 <input id="btn_del" value="삭제" type="button" class="btn btn-danger btn-flat pull-right btn_bottom">
	          	 <input id="btn_cancle" value="취소" type="button" 
	              	 class="btn btn-default btn-flat pull-right up_form btn_bottom">
	          	<input id="btn_back" value="목록" type="button"
	          	  class="btn btn-info btn-flat pull-right btn_bottom">
	          	  
	          	<input value="피드백 보내기" type="button" id="btn_feedback" 
	          	 class="btn btn-warning btn-flat pull-right btn_bottom" name="feedback">
         </div>
            
        </form>
	</div>
</div>
</div>
</div>
</div>

<!-- 피드백 알림 -->
<div class="modal fade" id="feedbackmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="container" style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<form role="form" class="form-horizontal">
				<div class="modal-content">
					<div class="box box-2team">
						<div class="box-header with-border">
						   
							<b class="box-title">받은 피드백 상세내용</b><br /> <br />
						</div>
						<div class="box-body">

							<div class="form-group">
								<label for="name" class="col-sm-2 control-label" style="width: 130px; font-size:large;">받는사람</label>
								<div class="col-sm-8">
									<input id="receive_emp" type="text" name="receive_emp"
										class="form-control" style="border-radius: 1em;" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label for="contents" class="col-sm-2 control-label" style="width: 130px; font-size:large;">피드백내용  </label>
								<textarea id="contents" name="feedback_content" class="col-sm-10" rows="10"
									style="width: 62%; border: 1px solid #d2d2d2; border-radius: 1em; margin-left:15px; "></textarea>
							</div>

							<!-- /.box -->
						</div>
						<div class="modal-footer">
							<input type="button" value="보내기" class="btn btn-primary btn-sm" id="insertFeedback">
							 <input type="button" value="close" data-dismiss="modal" class="btn  btn-default btn-sm" >
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>


</html>