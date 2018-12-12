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
	$('input[name=project_name]').val('${meetingInfo[0].project_name}');
	
	
	
	$('#btn2').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/meetingFile/meetingFileList.do');
	});
	
	$('#filebtn').click(function(){
		$('#filediv').empty();
		$('#filediv').append('<input type="file" name="files">');
	});
	
	 $('#modalBtn').click(function(){
	       
	        $('#ff').empty();
	        $('#pwdiv').empty();
	        $.ajax({
	            
	             type : "POST"
	                 , url : "${pageContext.request.contextPath}/user/meetingFile/modalPW.do"
	                 , dataType : "json"
	                 , data: {project_code : $('input[name=project_code]').val()}
	                 , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	                 , error : function(request, status, error) {
	                        alert("error : " + request.status );
	                 }
	                 , success : function(modalPro) {
	                     $('#modal1').modal('show');
// 	                   alert(modalPro.modalPro[0].pw_function);
	                     
	                     for (var i = 0; i < modalPro.modalPro.length; i++) {
	                         
	                         $('#ff').append('<label><input type="checkbox" name="chkbox" class="flat-red" value="'+ modalPro.modalPro[i].pw_code +'">&ensp;&ensp;'+ modalPro.modalPro[i].pw_function +'</label><br>');
	                         $('input[type="checkbox"].flat-red').iCheck({
	                             checkboxClass: 'icheckbox_flat-blue'
	                         });
	                     }
	                     
	                     
	                }
	        });
	  });
	 
	  $('#modalAdd').click(function(){
	        myArray=[];
	        $('input[name=chkbox]:checked').each(function(index){
	            myArray.push( $(this).val());
	        });
	        
//	         alert(myArray);
	        
	        $.ajax({
	            
	            type : "POST"
	                , url : "${pageContext.request.contextPath}/user/meetingFile/modalAdd.do"
	                , dataType : "json"
	                , data: {myArray : myArray}
	                , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	                , error : function(request, status, error) {
	                    boalert("error : " + request.status );
	                }
	                , success : function(list) {
// 	                	alert(list.list[0].pw_function);
	                    for (var i = 0; i < list.list.length; i++) {
	                        $('#pwdiv').append('<label><input type="hidden" name="pw_code" value="'+myArray[i]+'">'+list.list[i]+'</label><br/>');
	                    }
	               }
	       });
	  });
	  
	  $('form').submit(function(){
	        if($('input[name=meeting_title]').val()=='' ||$('input[name=meeting_title]').val()==null){
	            boalert("제목을 입력해주세요");
	            return false;
	        }
	        
	        if($('textarea[name=meeting_content]').val()=='' ||$('textarea[name=meeting_content]').val()==null){
	            boalert("내용을 입력해주세요");
	            return false;
	        }
	        
	        if($('#pwdiv input').val()==null){
	            boalert("관련업무를 선택해주세요");
	            return false;
	        }
	        
	        return true;
	  });
	  
// 	  $('#btn3').click(function(){
// 		  var meeting_code = $('input[name=meeting_code]').val();
// 		  $(location).attr('href', '${pageContext.request.contextPath}/user/meetingFile/deleteMeeting/'+meeting_code+'.do');
// 	  });
	  
	  $('#deletebtn').click(function() {
// 		  $('#deleteModal').modal('show');
		  
		  BootstrapDialog.show({
	            message: '회의록을 삭제하시겠습니까?',
	            buttons: [{
	                label: '삭제',
	                cssClass: 'btn-danger',
	                action: function(){
	                	 boalert('회의록이 삭제되었습니다.');
	                	 var meeting_code = $('input[name=meeting_code]').val();
                         
                         setTimeout(function(){
                        	 $(location).attr('href', '${pageContext.request.contextPath}/user/meetingFile/deleteMeeting/'+meeting_code+'.do');
                         },1800);
	          		  
	                }
	            }, {
	                label: '닫기',
	                action: function(dialogItself){
	                    dialogItself.close();
	                }
	            }]
	        });
		  
		  
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


.form-control[readonly]{
   background-color: white;
}

</style>




    <!-- Main content -->
    <section class="content">
    <br/><br/>
      <div class="row" >
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
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
                    <input type="hidden" name="meeting_code" value="${meetingInfo[0].meeting_code}" >
                  </div>
                </div>
                
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련 프로젝트</label>
	                <div class="col-sm-8">
                     <input type="text" class="form-control" name="project_name" style="border-radius: 1em;" placeholder="관련프로젝트">
                     <input type="hidden" class="form-control" name="project_code" value="${meetingInfo[0].project_code}" >
                    </div>
                 </div>
                 
                 
                <br/><br/><br/>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련 업무</label>
                  <div class="col-sm-8" >
                    <button type="button" id="modalBtn"  class="btn btn-info pull-right" >관련 업무수정</button>
                    <div id="pwdiv">
                    <c:forEach items="${meetingInfo}" var="meetingList" >
                  		<input type="text" class="form-control" name="pw_function" value="${meetingList.pw_function }"  style="border-radius: 1em; width: auto;" readonly="readonly">
                  		<input type="hidden" class="form-control" name="pw_code" value="${meetingList.pw_code }"  style="border-radius: 1em;" >
                    </c:forEach>
                    </div>
                  </div>           
                </div>
                <br/><br/><br/>
          
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">회의내용</label>
                  <textarea class="col-sm-10" rows="10" name="meeting_content" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;">${meetingInfo[0].meeting_content }</textarea>
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
              	<input value="목록" id="btn2" type="button" style="width:80px;"  class="btn btn-info btn-flat pull-right">
              	<c:if test="${LOGIN_EMPINFO.emp_code==meetingInfo[0].emp_code}">
              	<input value="삭제"  type="button" id="deletebtn"  style="width:80px;" class="btn btn-warning btn-flat pull-right">
              	<button  type="submit"    style="width:80px;" class="btn btn-danger btn-flat pull-right">수정</button>
              	</c:if>
            	</div>
          <!-- /.box -->
             </div>
				</form>
      	  </div>
       	 </div>
       	 </div>
	</section>
	
	   <!--모달  -->
<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="container">
  <div class="modal-dialog" role="document">
    <div class="modal-content"   style="width: 450px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title" id="exampleModalLabel">관련 업무 선택</h3>
      </div>
      <div class="modal-body" style=" border-top:1px solid orange;">
<!--          <div  class="row" style="padding-left:35px"> -->
<!--            <select class="col-sm-3" id="pw_function" style="margin:5px; height:30px;" > -->
<!--             <option selected="selected">분류</option> -->
<!--            </select> -->
<!--            <input class="col-sm-4"type="text" style="margin:5px; height:30px;"> -->
<!--            <button class="col-sm-2" class="btn btn-flat" style="margin:5px; height:30px;">검색</button> -->
<!--            </div > -->
            <div  class="row"  style="padding:30px;">
                <div class="form-group">
                    <div id="ff"></div>
              </div>                
             </div>
      <div class="modal-footer">
           <button type="button" id="modalAdd" class="btn btn-primary" data-dismiss="modal">추가</button>
      </div>
    </div>
  </div>
  </div>
</div>
</div>

<!-- 삭제확인 모달창 -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	
