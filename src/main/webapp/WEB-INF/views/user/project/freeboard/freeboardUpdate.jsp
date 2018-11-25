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
label {
	font-size: 20px !important;
}
.col-md-11 {
	margin: 10px;
}
</style>
    <br/>
    <br/>
      <div class="row">
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">문의 수정</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <form class="form-horizontal">
                <!-- text input -->

                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">게시글 제목</label>
                  	<div class="col-sm-8">
                  		<input type="text" class="form-control" placeholder="title" style="border-radius: 1em;">
                	</div>                
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">프로젝트 코드</label>
                  <div class="col-sm-8">
                  	<input type="text" class="form-control" disabled="" style="border-radius: 1em;">
 	              </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
                  <div class="col-sm-8">
                  	<input type="text" class="form-control" disabled="" style="border-radius: 1em;">
 	              </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">글 비밀번호</label>
                  <div class="col-sm-8">
                  	<input type="password" class="form-control" style="border-radius: 1em;">
	              </div>
                </div>
                <!-- textarea -->
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">내용</label>
                  <div class="col-sm-8">
                  	<textarea class="form-control" rows="10" style="border-radius: 1em;"></textarea>
                  </div>
                </div>
                <div class="form-group">
			 	  <label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
				  <div class="col-sm-10">
				  	  <input type="file" class="filestyle form-control" id="file01" name="files" data-buttonName="btn-primary">
				  </div>
            	</div>
              </form>
            <div class="box-footer clearfix">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              <input value="확인" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right">
          </div>
          </div>
          <!-- /.box -->
        </div>
        </div>
      </div>
