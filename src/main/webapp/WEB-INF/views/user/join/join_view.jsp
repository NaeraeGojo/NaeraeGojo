<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.modal-content{
	width : 800px;
}
.modal-body{
	height : 600px;
}
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
.test1 {
    width: 99%;
  }
  
  .box-title{
  	font-size : 40px !important;
  }
</style>
<!--     Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
	<div class="col-md-12">
<!--           Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border" >
              <h3 class="box-title">인력투입 관리</h3>
            </div>
<!--             /.box-header -->
<!--             form start -->
            <form class="form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">관련 제안요청서</label>

                  <div class="col-sm-9">
                   <!-- select -->
                  <select class="form-control">
                    <option>option 1</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword2" class="col-sm-2 control-label">제목</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="inputPassword2" placeholder="제목을 입력해주세요">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label" >인력계획</label>
                  <div class="col-sm-9">
                	<button type="button" class="test1 btn btn-sm btn-info btn-flat pull-right" data-toggle="modal" data-target="#exampleModal">인력배치</button>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword1" class="col-sm-2 control-label">내용</label>

                  <div class="col-sm-9">
                    <textarea  rows="10" type="text" class="form-control" id="inputPassword1" disabled=""></textarea>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력1</font></font></label>
                  <div class="col-sm-10 control-label">
	                  <input type="file" id="exampleInputFile">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력2</font></font></label>
                  <div class="col-sm-10 control-label">
                  <input type="file" id="exampleInputFile">
                  </div>
                </div>
                
              </div>
              <div class="box-footer clearfix">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              <input value="수정" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right">
              <input value="삭제" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
<!--               <button type="button" class="btn btn-sm btn-info btn-flat pull-right" data-toggle="modal" data-target="#exampleModal">피드백</button> -->
          </div>
            </form>
          </div>
          </div>
          </div>
          </section>
          
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="container">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title" id="exampleModalLabel">보고서 피드백</h3>
      </div>
      <div class="modal-body">
<!--         	모달창입니다~ -->
      <div class="row">
	<div class="col-md-12">
<!--           Horizontal Form -->
          <div class="box box-info">
            <form class="form-horizontal">
              <div class="box-body">
              
                <div class="form-group">
                  <label for="inputPassword2" class="col-sm-3 control-label">받는사람</label>
                  	<div class="col-sm-6">
                    <input type="text" class="form-control" id="inputPassword2" >
                  </div>
                </div>
                  
                <div class="form-group">
                  <label for="inputPassword2" class="col-sm-3 control-label">보고서</label>
              		<div class="col-sm-6">
                    <input type="text" class="form-control" id="inputPassword2" >
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword2" class="col-sm-3 control-label">제목</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" id="inputPassword2" placeholder="제목을 입력해주세요">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword2" class="col-sm-3 control-label">제목</label>

                  <div class="col-sm-6">
                    <input type="text" class="form-control" id="inputPassword2" placeholder="제목을 입력해주세요">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword1" class="col-sm-3 control-label">내용</label>

                  <div class="col-sm-6">
                    <textarea  rows="10" type="text" class="form-control" id="inputPassword1" ></textarea>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-3 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력1</font></font></label>
                  <div class="col-sm-6 control-label">
	                  <input type="file" id="exampleInputFile">
                  </div>
                </div>
                
              </div>
            </form>
            
          </div>
          </div>
          </div>
      </div>
      <div class="modal-footer">
              <input value="등록" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
<!-- 	       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!-- 	       <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
  </div>
</div>
<script type="text/javascript">
$(function(){

}


</script>
