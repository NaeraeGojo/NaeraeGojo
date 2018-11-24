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
    <!-- Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
      <div class="col-md-11">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">문의게시글 수정</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <form role="form">
                <!-- text input -->
                <div class="form-group">
                  <label>게시글 제목</label>
                  <input type="text" class="form-control" placeholder="title">
                </div>
                <div class="form-group">
                  <label>작성자</label>
                  <input type="text" class="form-control" disabled="">
                </div>
                <div class="form-group">
                  <label>글 비밀번호</label>
                  <input type="password" class="form-control">
                </div>
                <!-- textarea -->
                <div class="form-group">
                  <label>Textarea</label>
                  <textarea class="form-control" rows="10" placeholder="Enter ..."></textarea>
                </div>
                <div class="form-group">
                  <label for="exampleInputFile"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력1</font></font></label>
                  <input type="file" id="exampleInputFile">
                </div>
                <div class="form-group">
                  <label for="exampleInputFile"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력2</font></font></label>
                  <input type="file" id="exampleInputFile">
                </div>
             </div>
            <div class="box-footer clearfix">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              <input value="확인" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
          </div>
              </form>
          <!-- /.box -->
        </div>
        </div>
      </div>
	</section>