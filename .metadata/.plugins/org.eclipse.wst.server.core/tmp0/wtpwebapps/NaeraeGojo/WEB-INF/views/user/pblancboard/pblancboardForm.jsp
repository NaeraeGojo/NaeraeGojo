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
/* label { */
/* 	font-size: 20px !important; */
/* } */
.col-md-11 {
	margin: 10px;
}
.filefile{
	margin-top: 5px;
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
    <!-- Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
      <div class="col-md-11">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">공고 등록</b>
              <br/><br/>
            </div>
            <div class="box-body">
             <form role="form" class="form-horizontal">
               
                <div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" >공고제목</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고제목">
	              	</div>
            	</div>
                
                <div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" >공고기관</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고기관">
	              	</div>
            	</div>
            		
            	<div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" >공고일자</label>
	              	<div class="col-sm-8">
	                	<input type="date" class="form-control" style="border-radius: 1em;" placeholder="공고일자">
	              	</div>
            	</div>	
            	
            	<div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" >공고링크</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고링크">
	              	</div>
            	</div>
            	
            	<div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" >예산</label>
	              	<div class="col-sm-8">
	                	<input type="text" class="form-control" style="border-radius: 1em;" placeholder="공고링크">
	              	</div>
            	</div>
            	
            	<div class="form-group">
              		<label for="inputEmail3" class="col-sm-2 control-label" >제안서 마감일자</label>
	              	<div class="col-sm-8">
	                	<input type="date" class="form-control" style="border-radius: 1em;" placeholder="공고일자">
	              	</div>
            	</div>	
            	
                <div class="form-group">
			 		<label for="inputEmail3" class="col-sm-2 control-label">첨부 파일</label>
				 		<div class="col-sm-8">
					 		<input type="file" class="filefile"
					 		style="background-color:transparent;border:0;"">
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
