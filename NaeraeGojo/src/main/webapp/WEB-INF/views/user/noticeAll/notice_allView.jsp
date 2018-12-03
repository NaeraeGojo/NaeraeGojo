<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
<!-- <!--     Main content -->
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
              <div class="box-body">
                <form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/user/noticeAll/updateNoticeAll.do" method="post">
                
                <div class="form-group">
                  <label for="inputPassword1" class="col-sm-2 control-label">제목</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="notice_all_title" name="notice_all_title">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword2" class="col-sm-2 control-label">작성자</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="emp_name" name="emp_name">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>

                  <div class="col-sm-9">
                    <input type="password" class="form-control" name="notice_all_pass" id="notice_all_pass">
                    <input type="hidden" name="notice_all_code" value="${vo.notice_all_code }">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword4" class="col-sm-2 control-label">내용</label>

                  <div class="col-sm-9">
                    <textarea  rows="10" type="text" class="form-control" id="notice_all_content" name="notice_all_content"></textarea>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">파일 입력</font></font></label>
                <c:forEach items="${vo.items }" var="allFileItem" varStatus="stat">
                  <div class="col-sm-10 control-label">
<%--                   <a id="${allFileItem.meeting_file_name}" href="${pageContext.request.contextPath }/user/meetingFile2/meetFileDownload.do?meeting_file_code=${meetFileInfo.meeting_file_code}">${meetFileInfo.meeting_file_name}</a> --%>
	                  <a>${allFileItem.all_file_name}</a>
<%-- 	                  <input type="file" id="file01" name="files" value="/ALL_FILE_SAVE_NAME/${allFileItem.all_file_save_name}"> --%>
                  </div>
                </c:forEach>
                </div>
              </div>
              <div class="box-footer clearfix">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              <button type="submit" class="btn btn-sm btn-info btn-flat pull-right">수정</button>
              <input id="delete" value="삭제" type="button"  class="btn btn-sm btn-danger btn-flat pull-right">
          </div>
            </form>
          </div>
          </div>
          </div>
          </section>
          
<script type="text/javascript">
$(function(){
	
	 	$('input[name=notice_all_title]').val('${vo.notice_all_title}');
	    $('textarea[name=notice_all_content]').val('${vo.notice_all_content}');
	    $('input[name=emp_name]').val('${vo.emp_name}');
	    $('input[name=notice_all_pass]').val('${vo.notice_all_pass}');
	    $('input[name=notice_all_pass]').val('${vo.notice_all_pass}');
	    
	    $('#delete').click(function(){
	    	var  notice_all_code = $('input[name=notice_all_code]').val();
	    	$(location).attr('href','${pageContext.request.contextPath}/user/noticeAll/deleteNoticeAll/'+notice_all_code+'.do');
	    });
	    
	    $('form').submit(function(){
	    	if($('input[name=notice_all_title]').val()==''){
	    		return false;
	    	}
	    	if($('input[name=notice_all_content]').val()==''){
	    		return false;
	    	}
	    	if($('input[name=notice_all_pass]').val()==''){
	    		return false;
	    	}
	    	if(!$('input[name=emp_name]').val().validationMAIL()){
	    		return false;
	    	}
	    	return true;
	    })
})

</script>
