<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<style>
#secondDiv {
    border: 1px solid black;

}
/* #firstDiv { */
/*     border-right: 1px solid black; */

/* } */

video {
    width:31%; 
    height : 190px;
    margin: 7px; 
    border: 1px solid #dcdcdc;
}

#urlText {
	width: 500px; 
	height: 40px; 
	margin-right: 30px; 
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 1.2em;
}

.bootstrap-dialog{
    padding-top: 200px;
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
					<button id="startBtn" class="btn btn-warning btn-lg btn-flat pull-right" >회의시작</button>
					<input id="urlText" name="video_chat_room_url" type="text" class="pull-right"  placeholder="상단의 url 주소를 복사하여 입력해주세요.">
					<input type="hidden" value="${video_chat_room_code }" name="room_code"> 
				</div>
				
				<div class="box-body">
				
				    <!--화상회의화면 div  -->
				    <div class="dd" id="firstDiv" style="width: 60%; float: left; margin-right: 20px; height: 680px !important;">
					   <video id="localVideo" autoplay mute></video>   <!--  로컬 -->
					   <video id="remoteVideo1" autoplay></video>            <!--  원격카메ㅏ -->
					   <video id="remoteVideo2" autoplay></video> 
				       <video src="" ></video>
				       <video src="" ></video>
				       <video src="" ></video>
					</div>
				    <!--관련업무  div -->
				    <div class="dd" id="secondDiv" style="width: 38%; float: right;  height: 680px !important;">
				        <div>  
				            <b>관련 업무 확인하기</b>
				        </div>
				        
				        <div>
				        
				        </div>
				    
				    </div> <!-- 관련업무 div  끝 -->
				   
				    <br />
			
					<div class="box-footer clearfix" style="margin-top: 700px;">
						<div class="col-sm-12">
							<button  style="width: 80px;" class="btn btn-danger btn-lg btn-flat pull-right">종료</button>
						</div>
					</div>
			
			 </div>
		  </div>
	   </div>
	</div>
</section>


