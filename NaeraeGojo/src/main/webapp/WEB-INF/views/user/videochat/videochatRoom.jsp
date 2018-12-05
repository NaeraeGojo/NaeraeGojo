<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	
	
	$('#btn-mic').click(function(){
		
	
	// 	if (typeof webkitSpeechRecognition !== 'function') {
		// 	    alert('크롬에서만 동작 합니다.');
		// 	    return false;
		// 	  }
		var isRecognizing = false;
		var ignoreEndProcess = false;
	
		// 	  const audio = document.querySelector('#audio');
		const
		recognition = new webkitSpeechRecognition();
		const
		language = 'ko-KR';
	
		const
		$btnMic = $('#btn-mic');
		const
		$result = $('#result');
	
		recognition.continuous = true;
		recognition.interimResults = true;
	
		/**
		 * 음성 인식 시작 처리
		 */
		recognition.onstart = function() {
			console.log('onstart', arguments);
			isRecognizing = true;
			$btnMic.attr('class', 'on');
		};
	
		/**
		 * 음성 인식 종료 처리
		 * @returns {boolean}
		 */
		recognition.onend = function() {
			console.log('onend', arguments);
			isRecognizing = false;
			isRecognizing = true;
			$('#btn-mic').click();
	
			if (ignoreEndProcess) {
				return false;
			}
	
			// DO end process
			$btnMic.attr('class', 'off');
			if (!finalTranscript) {
				console.log('empty finalTranscript');
				return false;
			}
		};
	
		/**
		 * 음성 인식 결과 처리
		 * @param event
		 */
		var finalTranscript = '';
		var interimTranscript = '';
		recognition.onresult = function(event) {
			console.log('onresult', event);
	
			for (var i = event.resultIndex; i < event.results.length; ++i) {
				if (event.results[i].isFinal) {
					finalTranscript += event.results[i][0].transcript;
				} else {
					interimTranscript += event.results[i][0].transcript;
				}
			}
	
			//포커스된  객체!
			fireCommand(interimTranscript);
			console.log('interimTranscript', interimTranscript);
			console.log('finalTranscript', finalTranscript);
			var $focused = $(':focus');
			if (interimTranscript.endsWith('지워')
					|| finalTranscript.endsWith('지워')) {
				interimTranscript = '';
				finalTranscript = '';
				$focused.val('');
				$('#result').summernote('code', '');
			}
	
	
		};
	
		/**
		 * 음성 인식 에러 처리
		 * @param event
		 */
		// 	  recognition.onerror = function(event) {
		// 	    console.log('onerror', event);
		// 	    if (event.error.match(/no-speech|audio-capture|not-allowed/)) {
		// 	      ignoreEndProcess = true;
		// 	    }
		// 	    $btnMic.attr('class', 'off');
		// 	  };
		/**
		 * 명령어 처리
		 * @param string
		 */
		// 	  function fireCommand(string) {
		// 	    if (string.endsWith('레드')) {
		// 	        $result.attr('class', 'red');
		// 	    } else if (string.endsWith('블루')) {
		// 	        $result.attr('class', 'blue');
		// 	    } else if (string.endsWith('그린')) {
		// 	        $result.attr('class', 'green');
		// 	    } else if (string.endsWith('옐로우')) {
		// 	        $result.attr('class', 'yellow');
		// 	    } else if (string.endsWith('오렌지')) {
		// 	        $result.attr('class', 'orange');
		// 	    } else if (string.endsWith('그레이')) {
		// 	        $result.attr('class', 'grey');
		// 	    } else if (string.endsWith('골드')) {
		// 	        $result.attr('class', 'gold');
		// 	    } else if (string.endsWith('화이트')) {
		// 	        $result.attr('class', 'white');
		// 	    } else if (string.endsWith('블랙')) {
		// 	        $result.attr('class', 'black');
		// 	    }  else if (string.endsWith('스피치') || string.endsWith('말해줘') || string.endsWith('말 해 줘')) {
		// 	      textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
		// 	    }
		// 	  }
		/**
		 * 개행 처리
		 * @param s
		 * @returns {string}
		 */
		function linebreak(s) {
			return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
		}
	
		/**
		 * 음성 인식 트리거
		 * @param event
		 */
		function start(event) {
	// 		if (isRecognizing) {
	// 			recognition.stop();
	// 			return;
	// 		}
			recognition.lang = language;
			recognition.start();
	// 		ignoreEndProcess = false;
	
			finalTranscript = '';
			final_span.innerHTML = '';
			interim_span.innerHTML = '';
		}
	
		/**
		 * 초기 바인딩
		 */
		function initialize() {
			$btnMic.click(start);
		}
	
		initialize();
	
		$('#btn-mic').click();
	// 	$('#btn-mic').hide();

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
<!-- 					<button id="btn-mic" class="off">마이크</button> -->
<!-- 					<audio id="audio" src="audio/ending.mp3"></audio> -->
				</div>
				
				<div class="box-body">
				
				    <!--화상회의화면 div  -->
				    <div class="dd" id="firstDiv" style="width: 60%; float: left; margin-right: 20px; height: 680px !important;">
					    <div>
						   <video id="localVideo" autoplay mute></video>   <!--  로컬 -->
						   <video id="remoteVideo" autoplay></video>            <!--  원격카메ㅏ -->
	<!-- 					   <video id="remoteVideo2" autoplay></video>  -->
	<!-- 				       <video src="" ></video> -->
	<!-- 				       <video src="" ></video> -->
	<!-- 				       <video src="" ></video> -->
						</div>
						
						<div id="result" style="border: 1px solid gray; height: 100px;">
					      <span class="final" id="final_span"></span>
					      <span class="interim" id="interim_span"></span>
   						 </div>
   						 <button id="btn-mic" class="off">마이크 <span></span></button>
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


