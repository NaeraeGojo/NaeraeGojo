<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function(){
	
	    $('input[name=video_chat_join_outtime]').val('${videochatInfo[0].video_chat_join_outtime }');
	    $('input[name=video_chat_room_date]').val('${videochatInfo[0].video_chat_room_date }');
	    
	    $("#project_name").append('<option selected="selected">${videochatInfo[0].project_name}</option>');
	    
// 	    $('#btn2').click(function(){
// 	    	$(location).attr('href', '${pageContext.request.contextPath}/user/video/chatList.do');
// 	    });
	    
	    $('form').submit(function(){
	        
	        if($('input[name=video_chat_room_title]').val()=='' || $('input[name=video_chat_room_title]').val()==null){
	            boalert("제목을 입력해주세요");
	            return false;
	        }
	        
	        if($('textarea[name=video_chat_room_content]').val()=='' ||$('textarea[name=video_chat_room_content]').val()==null){
	            boalert("내용을 입력해주세요");
	            return false;
	        }
	        
// 	        if($('#ttt label').val()==null||$('#ttt input').val()==''){
// 	            boalert("관련업무를 선택해주세요");
// 	            return false;
// 	        }
	        
	        return true;
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
                            method="post" enctype="multipart/form-data"> 
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
                    <input type="hidden" name="video_chat_room_code" value="${videochatInfo[0].video_chat_room_code}">
                  </div>
                </div>
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련프로젝트</label>
	                 <div class="col-sm-8">
	                <select class="form-control select1" readonly="readonly"  id="project_name" name="project_name" style="border-radius: 0.7em;">
<!-- 	                  <option selected="selected" >선택하세요</option> -->
	                </select>
	                 </div>
                 </div>
                <br/><br/><br/>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">개설일</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" readonly="readonly" name="video_chat_room_date" style="border-radius: 1em;" placeholder="종료시간">
                  </div>                  
                </div>
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">참여인원</label>
                  <div class="col-sm-8"  align="center" style="width:68%; height: auto; border: 1px solid #d2d2d2; border-radius: 1em;">
                    <table >
                    		<tr >
                        <c:forEach varStatus="status" items="${videochatInfo}" var="chatInfo_emp">
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
                  <textarea class="col-sm-10" rows="10" name="video_chat_room_content" placeholder="회의내용" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
                </div>
               <br/><br/>
				  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">첨부파일</font></font></label>
                  <div class="col-sm-10 control-label">
                      <input type="file" name="files" id="files1"> 
                  </div>
            	</div>
				<div class="box-footer clearfix form-group">
<!--               	<input value="목록" id="btn2" type="button"  style="width:80px;"  class="btn btn-info btn-flat pull-right"> -->
	              	<button type="submit"  style="width:80px;"  class="btn btn-danger btn-flat pull-right">회의록 등록</button>
              	<c:if test="${LOGIN_EMPINFO.emp_code==videochatInfo[0].emp_code}">
              	</c:if>
          	    </div>
          <!-- /.box -->
        </div>
        </div>
       </form>
	</section>
	
