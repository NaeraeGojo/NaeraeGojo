<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
#secondDiv {
    border: 1px solid gary;

}
/* #firstDiv { */
/*     border-right: 1px solid black; */

/* } */

#localVideo {
    width:31%; 
    height : 190px;
    margin: 7px; 
    border: 1px solid #dcdcdc;
    float: right;
}
#remoteVideo {
    width:68%; 
    height : 450px;
    margin: 7px; 
    border: 1px solid #dcdcdc;
}

#urlText {
	width: 360px; 
	height: 40px; 
	margin-right: 30px; 
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 1.2em;
}

#scroll{
    overflow-y:scroll;
    height: 520px;
    width: 90%
}

.bootstrap-dialog{
    padding-top: 200px;
}

.fa-book  {
    font-size: x-large;
}
strong {
    font-size: medium;
}
.text-muted{
    font-size: large;
}

ul, .collapse {
    margin-left: 20px;
}

#firstDiv {
    border-right: 1px solid gray;
}
</style>


<!-- 전체 라이브러리 -->
<script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/realWebRTC.js"></script>
<script>

$(function(){
	
    boalert = function(mes){
        BootstrapDialog.show({
            title: '알림',
            message: mes
        });
    };	
    
	$('#startBtn').click(function(){
		
		if($('input[name=video_chat_room_url]').val()==null || $('input[name=video_chat_room_url]').val()==''){
			boalert('url을 입력해주세요.');
			return false;
		}
		
		var video_chat_room_url= $('input[name=video_chat_room_url]').val();
		var video_chat_room_code = $('input[name=room_code]').val();
		
		$.ajax({
			type : "POST"
			, url : "${pageContext.request.contextPath}/user/video/urlInsert.do"
			, dataType : "json"
			, contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
			, data : {video_chat_room_url : video_chat_room_url, video_chat_room_code : video_chat_room_code}
			, error : function(requset, status, error) {
				alert("error : " + request.status);
			}
		    , success : function(result){
			    boalert("화상회의를 시작하였습니다.");
		    	setTimeout(function(){
		    		$('.bootstrap-dialog').dialog("close");

			   		$('#startBtn').attr('disabled',true);
			   		
                },1500);
		    }
		});
	});
	
	
	// 개설자 이외 참가자들 화상회의 방 나가기 
	$('#endBtn').click(function(){
		
		var video_chat_room_code = $('input[name=room_code]').val();
		
		BootstrapDialog.show({
            message: '화상회의를 종료하시겠습니까?',
            buttons: [{
                label: '나가기',
                cssClass: 'btn-primary',
                action: function(){
                	
                    $.ajax({
                        type : "POST"
                        , url : "${pageContext.request.contextPath}/user/videoChatJoin/getOutRoom.do"
                        , dataType : "json"
                        , contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
                        , data : {video_chat_room_code : video_chat_room_code}
                        , error : function(request, status, error) {
                            alert("error : " + request.status);
                        }
                        , success : function(result) {
                            $(location).attr('href', '${pageContext.request.contextPath}/user/bell/bellList.do');
                        }
                    });                	
                }
            }, {
                label: '닫기',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }]
        });
		
	});
	
	$('#pmEndBtn2').click(function(){
		
        var video_chat_room_code = $('input[name=room_code]').val();
        
        BootstrapDialog.show({
            message: '화상회의를 종료하시겠습니까?',
            buttons: [{
                label: '나가기',
                cssClass: 'btn-primary',
                action: function(){
                    
                    $.ajax({
                        type : "POST"
                        , url : "${pageContext.request.contextPath}/user/videoChatJoin/endChatRoom.do"
                        , dataType : "json"
                        , contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
                        , data : {video_chat_room_code : video_chat_room_code}
                        , error : function(request, status, error) {
                            alert("error : " + request.status);
                        }
                        , success : function(result) {
                            $(location).attr('href', '${pageContext.request.contextPath}/user/video/videoChatStep3/'+video_chat_room_code +'.do');
                        }
                    });                 
                }
            }, {
                label: '닫기',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }]
        });		
	});
	
	$('#pwcSelect').on('change', function() {
		  var pwc_code = this.value;
		  var video_chat_room_code = '${video_chat_room_code}';
		  
		  $.ajax({
			  type : "POST"
			  , url : "${pageContext.request.contextPath}/user/video/pwfunction.do"
			  , dataType : "json"
			  , contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
			  , data : {pwc_code : pwc_code , video_chat_room_code : video_chat_room_code}
			  , error : function(request, status, error) {
				  alert ("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			  } , success : function(result) {
				  var data = '';
				  for (var i = 0; i < result.pwList.length; i++) {
					data = $('<option  value="' + result.pwList[i].pw_code+ '">'+ result.pwList[i].pw_function +'</option>');
				  }
				  $('#pwSelect').empty().append(data);
			  }
		  });
	});	
	$('#addPw').click(function(){
		
// 		$('#parent li .function').each(function(i){
// 			if(this.text == $("#pwSelect option:selected").val()){
// 				alert('기존 업무가 등록되어있습니다.');
// 	            return false;
				
// 			}
// 		})
		
// 		if($('#parent li .function').text() == $("#pwSelect option:selected").val()){
// 		}

		
		if($("#pwSelect option:selected").val() == null ||$("#pwSelect option:selected").val()=='' 
			  ||$("#pwcSelect option:selected").val()=='대분류' || $("#pwSelect option:selected").val() =='관련 업무'){
			alert('관련 업무를 선택하여 주세요');
			 return false;
		}
		
		if($("select option:selected").val() !=null){
			
			var pwc_code= $("#pwcSelect option:selected").val();
			var pw_code= $("#pwSelect option:selected").val();
			var video_chat_room_code = '${video_chat_room_code}';
			$.ajax({
				 type : "POST"
				 , url : "${pageContext.request.contextPath}/user/video/pwAdd.do"
				 , dataType : "json"
				 , contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
				 , data : {pwc_code : pwc_code , pw_code : pw_code, video_chat_room_code : video_chat_room_code}
				 , error : function(request, status, error) {
					  alert ("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				 } , success : function(result) {
					 
					 if(result.chatPwList == "있다"){
						 alert("동일한 업무를 추가할 수 없습니다.");
						 return false;
					 } else if(result.chatPwList[0].chat_pw_code !=null){
						 var data = '';
		                 data += '<ul class="nav nav-stacked" id="parent">';
		                 for (var i = 0; i < result.chatPwList.length; i++) {
		                     data += '<li class="panel"> <a data-toggle="collapse" data-parent="#parent" href="#'+result.chatPwList[i].chat_pw_code+'"><strong><i class="fa fa-check-circle margin-r-5"></i>'+ result.chatPwList[i].pwc_name+'</strong><br>';
		                     data += ' <label class="text-muted function" >'; 
		                     data += result.chatPwList[i].pw_function + '</label><div class="tools pull-right delete" style="cursor: pointer;" name="'+result.chatPwList[i].chat_pw_code+'"><i class="fa fa-remove"></div></i></a>';
		                     data +=  '<div id="'+result.chatPwList[i].chat_pw_code+'" class="collapse">';
		                     data +=  '<label>담당자 : '+result.chatPwList[i].pw_damdang +'</label>' + '<br>'+'업무 내용 : ' + result.chatPwList[i].pw_content + ' </div>';
		                     data +=  '</li>';
		                 }
		                 data +=  ' </ul>';    
					   	$('#pwdiv').empty().append(data);
						 
					 }
					 
				 }
			});
		}

	}) ;
	
	timer = setInterval(function(){
	   var video_chat_room_code = '${video_chat_room_code}';
		$.ajax({
            type : "POST"
            , url : "${pageContext.request.contextPath}/user/video/getNewpwList.do"
            , dataType : "json"
            , contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
            , data : {video_chat_room_code : video_chat_room_code}
            , error : function(request, status, error) {
                 alert ("code = "+ request.status + " message = " + request.responseText + " error = " + error);
            } , success : function(result) {
                var data = '';
                data += '<ul class="nav nav-stacked" id="parent">';
                for (var i = 0; i < result.chatPwList.length; i++) {
                    data += '<li class="panel"> <a data-toggle="collapse" data-parent="#parent" href="#'+result.chatPwList[i].chat_pw_code+'"><strong><i class="fa fa-check-circle margin-r-5"></i>'+ result.chatPwList[i].pwc_name+'</strong><br>';
                    data += ' <label class="text-muted" function>'; 
                    data += result.chatPwList[i].pw_function + '</label><div class="tools pull-right delete" style="cursor: pointer;" name="'+result.chatPwList[i].chat_pw_code+'"><i class="fa fa-remove"></div></i></a>';
                    data +=  '<div id="'+result.chatPwList[i].chat_pw_code+'" class="collapse">';
                    data += '<label>담당자 : '+result.chatPwList[i].pw_damdang +'</label>' + '<br>'+'업무 내용 : '+ result.chatPwList[i].pw_content + ' </div>';
                    data +=  '</li>';
                }
                data +=  ' </ul>';
//                 for (var i = 0; i < result.chatPwList.length; i++) {
//                     data += '<ul  id="'+result.chatPwList[i].chat_pw_code+'"><a data-toggle="collapse" data-parent="#'+result.chatPwList[i].chat_pw_code+'" href="#'+result.chatPwList[i].pw_function+'"><li><strong><i class="fa fa-check-circle margin-r-5"></i>'+ result.chatPwList[i].pwc_name+'</strong>';
//                     data += ' <label class="text-muted" >'; 
//                     data += result.chatPwList[i].pw_function + '</label><div class="tools pull-right" style="cursor: pointer;"><i class="fa fa-remove"></div></i><hr></li></a></ul>';
//                     data += '<div id="'+result.chatPwList[i].pw_function+'" class="collapse">';
//                     data += 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.  </div>';
//                 }
               $('#pwdiv').empty().append(data);
               
            }
       });
    },5000);
	
	
	 $(document).on('click', '.delete', function() {
		 
		 var video_chat_room_code = '${video_chat_room_code}';
		 var chat_pw_code = $(this).attr('name');
         $.ajax({
             type : "POST"
             , url : "${pageContext.request.contextPath}/user/video/pwdelete.do"
             , dataType : "json"
             , contentType : "application/x-www-form-urlencoded; charset=UTF-8" 
             , data : {chat_pw_code : chat_pw_code, video_chat_room_code : video_chat_room_code}
             , error : function(request, status, error) {
                  alert ("code = "+ request.status + " message = " + request.responseText + " error = " + error);
             } , success : function(result) {
            	 
                 var data = '';
                 data += '<ul class="nav nav-stacked" id="parent">';
                 for (var i = 0; i < result.chatPwList.length; i++) {
                     data += '<li class="panel"> <a data-toggle="collapse" data-parent="#parent" href="#'+result.chatPwList[i].chat_pw_code+'"><strong><i class="fa fa-check-circle margin-r-5"></i>'+ result.chatPwList[i].pwc_name+'</strong><br>';
                     data += ' <label class="text-muted" function>'; 
                     data += result.chatPwList[i].pw_function + '</label><div class="tools pull-right delete" style="cursor: pointer;" name="'+result.chatPwList[i].chat_pw_code+'"><i class="fa fa-remove"></div></i></a>';
                     data +=  '<div id="'+result.chatPwList[i].chat_pw_code+'" class="collapse">';
                     data += '<label>담당자 : '+result.chatPwList[i].pw_damdang +'</label>' + '<br>'+'업무 내용 : '+ result.chatPwList[i].pw_content + ' </div>';
                     data +=  '</li>';
                 }
                 data +=  ' </ul>';
                $('#pwdiv').empty().append(data);
                
             }
        });		 
	 });
		    
});

</script>


<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
		
			<div class="box box-2team">
				<div class="box-header with-border">
					<b class="box-title"><label><h3>${projectInfo.project_name }_</h3></label> 화상회의 </b> / ${projectInfo.position_name } : ${projectInfo.emp_name } <br/>
					프로젝트 기간 :  ${projectInfo.project_start} ~ ${projectInfo.project_end}
					
					<c:if test="${projectInfo.emp_code == LOGIN_EMPINFO.emp_code }">
					   <button id="startBtn" class="btn btn-warning btn-lg btn-flat pull-right" >회의시작</button>
						<input id="urlText" name="video_chat_room_url" type="text" class="pull-right"  placeholder="상단의 url 주소를 복사하여 입력해주세요.">
					</c:if>
					<input type="hidden" value="${video_chat_room_code }" name="room_code"> 
				</div>
				
				<div class="box-body">
				
				    <!--화상회의화면 div  -->
				    <div class="dd" id="firstDiv" style="width: 66%; float: left; margin-right: 20px; height: 680px !important;">
					    <div>
						   <video id="remoteVideo" autoplay></video>            <!--  원격카메ㅏ -->
						   <video id="localVideo" autoplay></video><br/>   <!--  로컬 -->

	<!-- 				       <video src="" ></video> -->
	<!-- 				       <video src="" ></video> -->
	<!-- 				       <video src="" ></video> -->
						</div>
						
					</div>
				    <!--관련업무  div -->
				    <div class="dd box box-primary" id="secondDiv" style="width: 28%; float: right;  height: 680px !important; " >
				        <div style="text-align: center;">  
				             <label></label><br/>
				            <b style="font-size: 1.8em;">관련 업무 확인하기</b>
				        </div>
				        <div style="text-align: center;">  
				            <div class="form-group">
			                <label></label><br/>
			                <select class="form-control select2" id="pwcSelect" style="width: 30%; float: left; margin-right: 10px;  margin-left: 10px; ">
			                  <option selected="selected">대분류</option>
			                  <c:forEach items="${pwcList }" var="pwcInfo">
				                  <option value="${pwcInfo.pwc_code}">${pwcInfo.pwc_name}</option>
			                  </c:forEach>
			                </select>
			                <select class="form-control select2" id="pwSelect" style="width: 40%; float: left; margin-right: 5px;  " >
			                  <option selected="selected">관련 업무</option>
			                </select>
			                <button id="addPw" class="btn btn-block btn-primary btn-sm" style="width: 15%; height: 33px; font-size: 1.1em;">추가</button>
                        </div>
				        </div>
				        <div id="scroll">
				                 <div class="box-body" id="pwdiv">
					            </div>
				        
				        
				        </div>
				    
				    </div> <!-- 관련업무 div  끝 -->
				   
				    <br />
			
					<div class="box-footer clearfix" style="margin-top: 700px;">
						<div class="col-sm-12">
						  <c:if test="${projectInfo.emp_code != LOGIN_EMPINFO.emp_code }">
							<button  style="width: 80px;" id="endBtn" class="btn btn-danger btn-lg btn-flat pull-right">나가기</button>
					       </c:if>		 
						  <c:if test="${projectInfo.emp_code == LOGIN_EMPINFO.emp_code }">
							<button  style="width: 80px;" id="pmEndBtn2" class="btn btn-danger btn-lg btn-flat pull-right">종료</button>
						  </c:if>
						</div>
					</div>
			
			 </div>
		  </div>
	   </div>
	</div>
</section>


