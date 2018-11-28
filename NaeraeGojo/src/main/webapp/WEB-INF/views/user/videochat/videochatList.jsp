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
 #modal-container {
   width: 200%;
/*    One Modal  100%, Two modals  200% */
   overflow: hidden;
 } 

 .dia {
   float: left;
   width: 50%;
   margin: 5px auto;
 } 

 .Mcon {
     width: 720px; 
     height : 350px; 
     margin-top: 200px; 
     margin-left: auto; 
     margin-right: auto; 
     margin-bottom: 200px; 
 } 

 .mb{ 
  
     height: 60%; 
    margin: auto; 
     overflow-y:auto; 
     overflow-x:hidden; 
     margin: 15px; 
/*      border: 1px solid ;  */
  
 } 

table th {
    font-size: large;
}


table td {
    font-size: medium;
}


</style>
<script src="multi-step-modal.js"></script>
<script type="text/javascript">

$(function(){
	
//     $('input[type="checkbox"].flat-red').iCheck({
//         checkboxClass: 'icheckbox_flat-blue'
//       });
    
    boalert = function(mes){
        BootstrapDialog.show({
            title: '알림',
            message: mes
            
        });
    };  
    
	//상세내용
    $('#listTable tr:gt(0)').click(function(){
        var video_chat_room_code = $(this).find('td:eq(0) input').val();
        $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatView/'+video_chat_room_code+'.do');
    });
    
    // 화상개설
    $('#btn1').click(function(){
    	 $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatForm.do');
    });
    
//     $('#btn1').click(function(){
//     	 $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatForm.do');
//     });

    $('#modal1').click(function(){
        
    	$('#myModal').modal('show');
    	
    	var projectListt ="";
        $.ajax({
            
             type : "POST"
                 , url : "${pageContext.request.contextPath}/user/video/modalProject.do"
                 , dataType : "json"
                 , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
                 , error : function(request, status, error) {
                        alert("error : " + request.status );
                 }
                 , success : function(projectList) {
                	 
                	 
                	 
                     for (var i = 0; i < projectList.projectList.length; i++) {
                    	 projectListt += '<div class="col-md-6">';
                    	 projectListt += ' <div class="box box-solid box-primary"style="width:280px; height:200px;">';
                    	 projectListt += '<div class="box box-primary" >';
                    	 projectListt += '<div class="box-header with-border" style="height:95px;">';
                    	 
                    	 projectListt += '<a onclick="ptclick('+projectList.projectList[i].project_code +');" class="btn-next"><input type="hidden" name="project_code" value="'+projectList.projectList[i].project_code+'"><h3>'+projectList.projectList[i].project_name+'</h3>';
                    	 projectListt += '</a>';
                    	 projectListt += ' </div>';
                    	 
                    	 projectListt += '<div class="box-body">';
                    	 projectListt += '<h5>프로젝트 기간 : &nbsp;<i style="font-size: 20px;">';
                    	 projectListt += projectList.projectList[i].project_start + ' - ' + projectList.projectList[i].project_end;
                         projectListt += '</i></h5>';
                    	 projectListt += ' </div>';
                    	 projectListt += '</div></div></div>';
                    	 
                     }
                     $('#projectdiv').empty().append(projectListt);
//                      $('#projectdiv').append(projectListt);
                }
        });
    });            


    $(document).on('click', '.btn-next', function() {
    	  $('#modal-container').animate({
    	    'margin-left': '-=100%'
    	  }, 500);
    });

    $(document).on('click', '.btn-back', function() {
   	    $('#modal-container').animate({
   	        'margin-left': '+=100%'
   	    }, 500);
   	});
    
    $(document).on('click', '#insert1', function() {
    	
    	var tmpArray =[];
    	$("input[name=chkbox]:checked").each(function() {
            var emp_code = $(this).val();
            tmpArray.push(emp_code);
        });
    	
//     	if(tmpArray.length>3){
//     		boalert("4명 이하로 선택해주세요");
//     		return false;
//     	};
    	
//     	if(tmpArray.length>4){
    		
	    	$.ajax({
	            
	            type : "POST"
	             , url : "${pageContext.request.contextPath}/user/video/insertempList.do"
	             , dataType : "json"
	             , data : {tmpArray : tmpArray}
	             , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	             , error : function(request, status, error) {
	                    alert("error : " + request.status );
	             }
	             , success : function(result) {
	             	alert('화상채팅방이 개설되었습니다.');
	             	
	             	
	             }
	       });
//     	}
    	
    	
    });
   	
    
});

function ptclick(project_code) {
	$.ajax({
        
        type : "POST"
            , url : "${pageContext.request.contextPath}/user/video/modalempList.do"
            , dataType : "json"
            , data : {project_code : project_code}
            , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
            , error : function(request, status, error) {
                   alert("error : " + request.status );
            }
            , success : function(result) {
                var text = "";
                text += ' <table class="table table-striped" id="empTable">';
                text += '<tr><th style="width:10px"></th>'
                    +'<th style="width: 70px">사원번호</th>'
                   + '<th style="width: 70px">이름</th>'
                   +' <th style="width: 70px">담당부서</th>'
                   +' <th style="width: 60px">역할</th></tr>';
                  
                for (var i = 0; i < result.empList.length; i++) {
                    
                    text += '<tr id="emp"><td><input type="checkbox" name="chkbox" class="flat-red" value="'+result.empList[i].emp_code+'"></td>';
                    text += '<td>'+ result.empList[i].emp_code+'</td>';
                    text += '<td>'+result.empList[i].emp_name+'</td>';
                    text += '<td>'+result.empList[i].part_name+'</td>';
                    text += ' <td>'+result.empList[i].emp_role+'</td></tr>';
                 
                }
                text += '</table>';
                $('#tb').empty().append(text);
           }
   });
}

</script>

    <!-- Main content -->
    <section class="content"> 
    <br/>
    <div class="col-md-2"  style="float:right;">
      <input id="modal1" value="+ 화상회의 개설" type="button" class="btn btn-block btn-warning btn-lg "   style="float:right;  border:1px outset;">
    </div>
    <br/>
     <br/>
      <br/>
      <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
            <div class="box-header with-border">
              <b class="box-title">화상회의 목록</b>
              <br/><br/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover" style="margin:auto;" id="listTable">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>회의일자</th>
                    <th>회의 제목</th>
                    <th>관련 프로젝트</th>
                    <th>참여인원</th>
                    <th>상태</th>
                    <th>개설자</th>
                  </tr>
                  </thead>
                  <tbody>
                  
                  
                  <c:forEach items="${chatroomList}" var="chatroomInfo">
	                  <tr>
                            <td style="width: 100px;"><input type="hidden" value="${chatroomInfo.video_chat_room_code}">${chatroomInfo.rnum}</td>
                            <td style="width: 180px;">${chatroomInfo.video_chat_room_date}</td>
                            <td  style="width: 350px;">${chatroomInfo.video_chat_room_title}</td>
                            <td style="width: 350px;">${chatroomInfo.project_name}</td>
                            <td style="width: 150px;">${chatroomInfo.emp_cnt}<label> 명</label></td>
                            
                            <c:if test="${chatroomInfo.video_chat_level_code=='level2'}">
	                           <td style="width: 140px;"><span class="label label-info ">
	                               <input type="hidden" name="video_chat_level_code" value="${chatroomInfo.video_chat_level_code}">${chatroomInfo.video_chat_level_name}
	                               </span>
	                           </td>
                            </c:if>
                            <c:if test="${chatroomInfo.video_chat_level_code=='level1'||chatroomInfo.video_chat_level_code=='level3'||
                               chatroomInfo.video_chat_level_code=='level4' }">
	                           <td style="width: 140px;"><span class="label label-warning ">
		                            <input type="hidden" name="video_chat_level_code" value="${chatroomInfo.video_chat_level_code}">${chatroomInfo.video_chat_level_name}
	                               </span>
	                           </td>
                            </c:if>
                            <td style="width: 120px;">${chatroomInfo.emp_name}</td>
	                  </tr>
                  </c:forEach>
                  </tbody>  

                </table>
              </div>
              
              <!-- /.table-responsive ㅇㅇㄹㅇㄹ-->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
                ${paging }
            </div>
            <!-- /.box-footer -->
          </div>
        <form action="${pageContext.request.contextPath}/user/video/chatList.do" method="post" class="form-inline pull-right">
        <select class="form-control" name="search_keycode" >
<!--            <option>검색조건</option> -->
            <option value="TOTAL">전체</option>
            <option value="TITLE">제목</option>
            <option value="CONTENT">내용</option>
            <option value="WRITER">개설자</option>
        </select>
        <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
        <button type="submit" class="btn btn-primary form-control">검색</button>
        </form>
          <!-- /.box -->
        </div>
         </section>     
        
  
 <!-- 모달 -->       
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div id="modal-container">
  
    <div class="modal-dialog dia" role="document">
      <div class="modal-content Mcon" >
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 class="modal-title" id="myModalLabel">관련 프로젝트</h3>
        </div>
        
        <div class="modal-body mb" style="margin-bottom:auto;" id="projectdiv">
<!--             <div class="col-md-6"> -->
<!--               <div class="box box-solid box-primary"> -->
<!--               <div class="box box-primary" > -->
              
<!--               </div> -->
<!--               </div> -->
<!--              </div> -->
	    </div> 
        <div class="modal-footer" >
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
    </div>
    </div>
    
    <div class="modal-dialog dia" role="document">
      <div class="modal-content Mcon">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 class="modal-title" id="myModalLabel">직원초대</h3>
        </div>
        <div class="modal-body mb">
           <div id= "tb">
            <table class="table table-striped" id="empTable">
<!--                 <tr> -->
<!--                   <th  style="width:10px"></th> -->
<!--                   <th style="width: 70px">사원번호</th> -->
<!--                   <th style="width: 70px">이름</th> -->
<!--                   <th style="width: 70px">담당부서</th> -->
<!--                   <th style="width: 60px">역할</th> -->
<!--                 </tr> -->
                
                
                
<!--                 <tr> -->
<!--                   <td><input type="checkbox" name="chkbox" class="flat-red" value=""></td> -->
<!-- 	               <td>25125</td> -->
<!-- 	               <td>최동화</td> -->
<!-- 	               <td>개발1팀</td> -->
<!-- 	               <td>DA</td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                   <td><input type="checkbox" name="chkbox" class="flat-red" value=""></td> -->
<!-- 	               <td>25125</td> -->
<!-- 	               <td>이동화</td> -->
<!-- 	               <td>개발2팀</td> -->
<!-- 	               <td>DA</td> -->
<!--                 </tr> -->
             </table>
            </div>
        </div>
        <div class="modal-footer" style="padding-bottom : 5px !important;  padding-top : 5px !important;">
          <button type="back" class="btn btn-default btn-back">뒤로가기</button>
          <input type="button" id="insert1" value="등록" class="btn btn-primary ">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>


    
  </div>
  </div>
