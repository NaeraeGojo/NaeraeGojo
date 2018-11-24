<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
.btn-sm {
	width : 80px;
	margin-right:5px; 
}
.col-md-11 {
	margin: 10px;
}
select{
  color: grey;
}
.filefile{
	margin-top: 5px;
}
}
</style>
<script type="text/javascript">
$(function(){
	$('body').on('change','select', function (ev){
	    if($(this).find('option:selected').val() == ""){
	        $(this).css('color','#999');
	        $(this).children().css('color','black');
	    }
	    else {
	        $(this).css('color','black');
	        $(this).children().css('color','black');
	    }
	});
});
</script>
<section class="content">
    <br/><br/>
      <div class="row">
      <div class="col-md-11">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">스케줄러 등록</b>
              <br/><br/>
            </div>
            
			<div class="box-body">
				<form role="form" class="form-horizontal">
                	
                	<div class="form-group">
	              		<label for="inputEmail3" class="col-sm-2 control-label" >스케줄러 이름</label>
		              	<div class="col-sm-8">
		                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="스케줄러 이름">
		              	</div>
            		</div>
            		
            		<div class="form-group">
	              		<label for="inputEmail3" class="col-sm-2 control-label" >작성자</label>
		              	<div class="col-sm-8">
		                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="작성자">
		              	</div>
            		</div>
            		
            		<div class="form-group">
	              		<label for="inputEmail3" class="col-sm-2 control-label" >키워드</label>
		              	<div class="col-sm-8">
		                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="키워드">
		              	</div>
            		</div>
            		
            		<div class="form-group" >
	              		<label for="inputEmail3" class="col-sm-2 control-label" >시간설정</label>
		                <div class="col-sm-8">	
		                	<input type="time" class="form-control" style="border-radius: 1em;"> 
            			</div>
            		</div>
                
                	<div class="form-group">
	      				<label for="inputEmail3" class="col-sm-2 control-label">스케줄러 설명</label>
	      				<textarea class="col-sm-8" rows="10" placeholder="스케줄러 설명" style="border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
	   				</div>
            	</div>
			
				<div class="box-footer clearfix">
	              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
	              <input value="목록" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right">
	              <input value="등록" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
	            </div>
       		</form>
        </div>
        </div>
	</div>
</section>
