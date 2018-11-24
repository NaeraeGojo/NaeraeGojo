<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};
	
	$('input[name=meeting_title]').val('${meetingInfo[0].meeting_title}');
	$('textarea[name=meeting_content]').val('${meetingInfo[0].meeting_content}');
	$('input[name=project_name]').val('${meetingInfo[0].project_name}');
	
	
	
	$('#btn2').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/meetingFile/meetingFileList.do');
	});
	
	$('#filebtn').click(function(){
		$('#filediv').empty();
		$('#filediv').append('<input type="file" name="files">');
	});
});


</script>
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

/*  .row { */
/*     margin-right:50px;  */
/*     margin-left:50px;  */
/*  } */
</style>




    <!-- Main content -->
    <section class="content">
    <br/><br/>
      <div class="row" >
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">회의록 게시글</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <form class="form-horizontal" role="form"  action="${pageContext.request.contextPath}/user/meetingFile/updateMeeting.do" 
                            method="post" enctype="multipart/form-data" >
            <div class="box-body" >
                <!-- text input -->
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label" >회의제목</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="meeting_title" style="border-radius: 1em;" placeholder="회의제목">
                  </div>
                </div>
                
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련 프로젝트</label>
	                <div class="col-sm-8">
                     <input type="text" class="form-control" name="project_name" style="border-radius: 1em;" placeholder="관련프로젝트">
                    </div>
                 </div>
                 
                 
                <br/><br/><br/>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련 업무</label>
                  <div class="col-sm-8">
                  <table>
                  	<tr>
                    <c:forEach items="${meetingInfo }" var="meetingList">
                  		<td><input type="text" class="form-control" name="pw_function" value="${meetingList.pw_function }"  style="border-radius: 1em;" ></td>
                    </c:forEach>
                  	</tr>
                  </table>
                    
                  </div>           
                </div>
                 
                <br/><br/><br/>
          
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">회의내용</label>
                  <textarea class="col-sm-10" rows="10" name="meeting_content" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
                </div>
               <br/><br/><br/><br/>
               
                 <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">첨부 파일</font></font></label>
                  <div class="col-sm-10 control-label" id="filediv">
                    <c:forEach items="${meetingInfo[0].items}" var="meetFileInfo">
                      <a id="${meetFileInfo.meeting_file_name}" href="${pageContext.request.contextPath }/user/meetingFile2/meetFileDownload.do?meeting_file_code=${meetFileInfo.meeting_file_code}">${meetFileInfo.meeting_file_name}</a>
                    </c:forEach>
                      <input type="button" value="파일수정" id="filebtn">
                  </div>
                 </div>
                
				<div class="box-footer clearfix">
              	<input value="삭제" type="button" href="${pageContext.request.contextPath}/user/meeting/meetingList.do" style="width:80px;" class="btn btn-warning btn-flat pull-right">
              	<input value="목록" id="btn2" type="button" style="width:80px;"  class="btn btn-info btn-flat pull-right">
              	<button  type="submit"  style="width:80px;" class="btn btn-danger btn-flat pull-right">수정</button>
            	</div>
          <!-- /.box -->
             </div>
				</form>
        
      	  </div>
       	 </div>
       	 </div>
	</section>
	
	
