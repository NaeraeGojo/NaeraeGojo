<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function(){
	    $('input[name=video_chat_room_title]').val('${chatInfo[0].video_chat_room_title }');
// 	    if('${chatInfo[0].video_chat_join_intime }' != null){
	    	
// 	    	$('input[name=video_chat_join_intime]').val('${chatInfo[0].video_chat_join_intime }');
// 	    }
// 	    if('${chatInfo[0].video_chat_join_intime }' == null){
	    	
// 	    	$('input[name=video_chat_join_intime]').val('참여하지 않았습니다.');
// 	    }
// 	    $('input[name=video_chat_join_outtime]').val('${chatInfo[0].video_chat_join_outtime }');
	    
// 	    $('select[name=project_name]').val('${chatInfo[0].project_name}');
	    
	    $("#project_name").append('<option selected="selected">${chatInfo[0].project_name}</option>');
	    
	    $('#btn2').click(function(){
	    	$(location).attr('href', '${pageContext.request.contextPath}/user/video/chatList.do');
	    });
	    
	    $('form').submit(function(){
	        
	    });
	    
	    $('#btn3').click(function() {
	    	var video_chat_room_code =  $('input[name=video_chat_room_code]').val();
	    	$(location).attr('href', '${pageContext.request.contextPath}/user/video/deleteVideoChat/'+video_chat_room_code+'.do');
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
     <form class="form-horizontal"   action="${pageContext.request.contextPath}/user/video/videochatUpdate.do" 
                            method="post" enctype="multipart/form-data" > 
      <div class="row" >
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
            <div class="box-header with-border">
              <b class="box-title">회의 상세내용</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body" >

                <!-- text input -->
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label" >회의제목</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="video_chat_room_title" style="border-radius: 1em;" placeholder="회의제목">
                    <input type="hidden" name="video_chat_room_code" value="${chatInfo[0].video_chat_room_code}">
                  </div>
                </div>
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련프로젝트</label>
	                 <div class="col-sm-8">
	                <select class="form-control select1" readonly="readonly"   id="project_name" name="project_name" style="border-radius: 0.7em; background-color: white;">
<!-- 	                  <option selected="selected" >선택하세요</option> -->
	                </select>
	                 </div>
                 </div>
                <br/><br/><br/>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">참여시간</label>
                  
                  <c:if test="${!empty chatInfo[0].video_chat_join_intime}">
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="video_chat_join_intime" readonly="readonly" value="${chatInfo[0].video_chat_join_intime}" style="border-radius: 1em;background-color: white;" placeholder="시작시간">
                  </div> <label for="inputEmail3" class="col-sm-1 control-label" >  ~ </label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" readonly="readonly" name="video_chat_join_outtime" value="${chatInfo[0].video_chat_join_outtime}" style="border-radius: 1em;background-color: white;" placeholder="종료시간">
                  </div>   
                  </c:if>
                  
                  <c:if test="${empty chatInfo[0].video_chat_join_intime}">
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="video_chat_join_intime" readonly="readonly" style="border-radius: 1em; background-color: white;" value="참여하지 않았습니다.">
                  </div> 
                  </c:if>
                                 
                </div>
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">참여인원</label>
                  <div class="col-sm-8"  align="center" style="width:68%; height: auto; border: 1px solid #d2d2d2; border-radius: 1em;">
                    <table >
                   	   <tr >
                       <c:forEach varStatus="status" items="${chatInfo}" var="chatInfo_emp">
                          <c:if test="${status.index==3}">
                       </tr>
                        <tr >
                          </c:if>
                   			<td width="50" height="50"><img src="${pageContext.request.contextPath }/images/icons/person2.jpeg" ></td>
                   			<td width="200" height="50">${chatInfo_emp.emp_name}</td>
                        </c:forEach>
                   		</tr>
                    </table>
                  </div>
                <br/><br/><br/><br/> <br/>
                </div>
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">회의내용</label>
                  <textarea class="col-sm-10" rows="10" name="video_chat_room_content" placeholder="회의내용" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;">${chatInfo[0].video_chat_room_content}</textarea>
                </div>
               <br/><br/>
               
               
                 <div class="form-group">
                     <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">첨부 파일</font></font></label>
	                 <div class="col-sm-10 control-label" id="filediv">
	                    <c:if test="${empty chatInfo[0].items }">
	                           <input type="file" name="files">
	                    </c:if>
	                    
	                    <c:if test="${!empty chatInfo[0].items }">   
		                    <c:forEach items="${chatInfo[0].items}" var="videoFileInfo">
		                      <a id="${videoFileInfo.video_file_name}" href="${pageContext.request.contextPath }/user/videoFile/videochatFileDown.do?video_file_code=${videoFileInfo.video_file_code}">${videoFileInfo.video_file_name}</a>
	                        <input type="button" name="files" value="파일수정" id="filebtn">
		                    </c:forEach>
	                    
	                    </c:if>
	                 </div>
                  
                 </div>
				<div class="box-footer clearfix form-group">
              	<input value="목록" id="btn2" type="button"  style="width:80px;"  class="btn btn-info btn-flat pull-right">
              	<c:if test="${LOGIN_EMPINFO.emp_code==chatInfo[0].emp_code}">
	              	<button type="submit"  style="width:80px;"  class="btn btn-danger btn-flat pull-right">수정</button>
	              	<input  data-toggle="modal" data-target="#modal1" value="삭제"  type="button" style="width:80px;" class="btn btn-warning btn-flat pull-right">
              	</c:if>
          	    </div>
          <!-- /.box -->
        </div>
        </div>
       </form>
	</section>
	
	<!-- 모달 -->
<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="container">
  <div class="modal-dialog" role="document">
    <div class="modal-content"   >
      <div class="modal-header">
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
        <h3 class="modal-title" id="exampleModalLabel">삭제하시겠습니까?</h3>
      </div>
      <div class="modal-body" style=" border-top:1px solid gray;">
            <div  class="row" align="center" style="padding:10px;">
                <table >
                	<tr>
                		<td style="width:80px; padding:10px;" ><input value="삭제" id="btn3" type="button" style="width:80px;" class="btn btn-block btn-default "></td>
                		<td style="width:80px; padding:10px;" ><input value="취소"  data-dismiss="modal" type="button" style="width:80px; " class="btn btn-block btn-default "></td>
                	</tr>
                </table>
                
                    
                    
             </div>
      </div>
  </div>
  </div>
</div>
</div>
