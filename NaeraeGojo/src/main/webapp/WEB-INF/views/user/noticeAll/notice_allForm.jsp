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
.test1 {
    width: 47%;
    margin: 5px; 
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
              <h3 class="box-title">공지사항</h3>
            </div>
<!--             /.box-header -->
<!--             form start -->
		<form role="form" class="form-horizontal" id="notice_form" action="${pageContext.request.contextPath}/user/noticeAll/insertNoticeAll.do" method="post" enctype="multipart/form-data">
              <div class="box-body">
                
                <div class="form-group">
                  <label for="inputPassword1" class="col-sm-2 control-label">제목</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="notice_all_title" name="notice_all_title" placeholder="제목을 입력해주세요">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>

                  <div class="col-sm-9">
                    <input type="password" class="form-control" name="notice_all_pass" id="notice_all_pass">
                    <input type="hidden" name="emp_code" value="${LOGIN_EMPINFO.emp_code }">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword1" class="col-sm-2 control-label">내용</label>

                  <div class="col-sm-9">
                    <textarea  rows="10" type="text" class="form-control" id="notice_all_content" name="notice_all_content" ></textarea>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력1</font></font></label>
                  <div class="col-sm-10 control-label">
	                  <input type="file" id="file01" name="files">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력2</font></font></label>
	                  <div class="col-sm-10 control-label">
	                  	<input type="file" id="file02" name="files">
	                  </div>
                </div>
                
              </div>
              <div class="box-footer clearfix">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              <input value="등록" type="submit"  href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
          </div>
            </form>
          </div>
          </div>
          </div>
          </section>
<script type="text/javascript">
$(function(){
	    $('#notice_form').submit(function(){
	    	if($('input[name=notice_all_title]').val()==''){
	    		alert('입력해봐라');
	    		return false;
	    	}
	    	if($('input[name=notice_all_content]').val()==''){
	    		alert('입력해봐라');
	    		return false;
	    	}
	    	if($('input[name=notice_all_pass]').val()==''){
	    		alert('입력해봐라');
	    		return false;
	    	}
	    	var file1 = $('#file01').val();
			if(file1 == ''){
				alert("파일을 등록 선택해 주세요.");
				return false;
		    }
	    	var file2 = $('#file02').val();
			if(file2 == ''){
				alert("파일을 등록 선택해 주세요.");
				return false;
		    }
	    	
	    	return true;
	    })
})

</script>