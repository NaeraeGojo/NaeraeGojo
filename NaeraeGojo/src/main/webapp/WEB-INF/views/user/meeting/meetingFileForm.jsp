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
.hoverImg {
   padding-left : 30px;
    width: 25px;
    height: 25px;
}

.hoverImg img:last-child{
    display: none;
}

.hoverImg:hover img:first-child{
    display: none;
}
.hoverImg:hover img:last-child{
    display: inline-block;
}
.modal-dialog{
    width:400px;
    height:1000px;
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
            <form class="form-horizontal" role="form"  action="${pageContext.request.contextPath}/user/meetingFile/insertMeeting.do" 
                            method="post" enctype="multipart/form-data">
            <!-- /.box-header -->
            <div class="box-body" >
                <!-- text input -->
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label" >회의제목</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="meeting_title" id="meeting_title" style="border-radius: 1em;" placeholder="회의제목" re>
                  </div>
                </div>
                <br/><br/><br/>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련 프로젝트</label>
	                 <div class="col-sm-8">
	                <select class="form-control select2" name="project_code" style="border-radius: 0.5em;">
	                  <option selected="selected">선택하세요</option>
	                      
		                  <option value="${projectInfo[0].project_code}"> ${projectInfo[0].project_name}</option>
	                </select>
	                 </div>
	                
                 </div>
                <br/><br/><br/>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">관련업무</label>
                  <div class="col-sm-8" >
                    <button type="button" id="modalBtn" class="btn btn-block btn-info pull-right" >관련업무 추가</button>
                    <div id="ttt" style="border-radius: 1em;" >
<!--                         <input type="hidden" class="form-control" id ="pw_code" name="pw_code"> -->
                    </div>
                  </div>           
                </div>
                <br/><br/><br/>
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">회의내용</label>
                  <textarea class="col-sm-10" rows="10" name="meeting_content"  placeholder="회의내용" style=" width:68%; border: 1px solid #d2d2d2; border-radius: 1em;"></textarea>
                </div>
               <br/>
                <br/>
                 <div class="form-group">
                  <label for="exampleInputFile" class="col-sm-2 control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">첨부파일</font></font></label>
                  <div class="col-sm-10 control-label">
                      <input type="file" name="files" id="files1"> 
                  </div>
                </div>
                
				<div class="box-footer clearfix">
              	 <button type="submit" style="width:80px;"  id="submitForm" class="btn btn-info  pull-right">등록</button>
            	</div>
          <!-- /.box -->
             </div>
				</form>
        
        </div>
        </div>
	</section>
	
	
	
	<!--모달  -->
<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="container">
  <div class="modal-dialog" role="document">
    <div class="modal-content"   >
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

<script>
$(function(){
	
   boalert = function(mes){
        BootstrapDialog.show({
            title: '알림',
            message: mes
        });
    };
    
    $('input[type="checkbox"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-blue'
    });
    
    
    $('#modalBtn').click(function(){
       
        $('#ff').empty();
        $('#ttt').empty();
        $.ajax({
            
             type : "POST"
                 , url : "${pageContext.request.contextPath}/user/meetingFile/modalPW.do"
                 , dataType : "json"
                 , data: {project_code : $('select[name=project_code]').val()}
                 , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
                 , error : function(request, status, error) {
                        alert("error : " + request.status );
                 }
                 , success : function(modalPro) {
                     $('#modal1').modal('show');
//                   alert(modalPro.modalPro[0].pw_function);
                     
                     for (var i = 0; i < modalPro.modalPro.length; i++) {
                         
//                          $('#modalTxt2').append('<tr><td class="hoverImg" width="70" height="50">'
//                           + '<img id='+ i +' src="${pageContext.request.contextPath }/images/icons/check1.png">'
//                           +'<img id=h'+ i +'  onclick="onoff('+ i +')" src="${pageContext.request.contextPath }/images/icons/check2.png"></td>'
//                           +'<td id="pw_function" width="200" height="50"><input type="hidden" name="pw_code" value="'+modalPro.modalPro[i].pw_code+'">'+ modalPro.modalPro[i].pw_function +'</td></tr>');
                         $('#ff').append('<label><input type="checkbox" name="chkbox" class="flat-red" value="'+ modalPro.modalPro[i].pw_code +'">'+ modalPro.modalPro[i].pw_function +'</label>');
//                          $('#ff').append('<label><input type="checkbox" class="flat-red"></label>');
                     }
                }
        });
    });
    
    
    $('#modalAdd').click(function(){
        myArray=[];
        $('input[name=chkbox]:checked').each(function(index){
        	myArray.push( $(this).val());
        	
        });
        
//         alert(myArray);
        
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
                    for (var i = 0; i < list.list.length; i++) {
	                    $('#ttt').append('<label><input type="hidden" name="pw_code" value="'+myArray[i]+'">'+list.list[i]+'</label><br/>');
					}
               }
       });
    });
    
    
    $('form').submit(function(){
    	
//     	if($('input[name=meeting_title]').val()=='' ||$('input[name=meeting_title]').val()==null){
//     		boalert("제목을 입력해주세요");
//     		return false;
//     	}
    	
    	if($('textarea[name=meeting_content]').val()=='' ||$('textarea[name=meeting_content]').val()==null){
    		boalert("내용을 입력해주세요");
    		return false;
    	}
    	
    	if($('#ttt label').val()==null||$('#ttt input').val()==''){
    		boalert("관련업무를 선택해주세요");
    		return false;
    	}
    	
	    $('input[name=pw_code]').val();
    	return true;
    });
    
});


</script>
