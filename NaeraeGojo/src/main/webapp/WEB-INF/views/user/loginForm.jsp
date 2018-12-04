<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<!-- 요청주소 : localhost/ng/user/join/loginForm.do -->
<html>
  <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>
		프로토스 로그인 창
		</title>
	
		<!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/iCheck/square/blue.css">

		<!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/ico/apple-touch-icon-57-precomposed.png">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cookieControl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsbn.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/prng4.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/rng.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/rsa.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/scripts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/plugins/iCheck/icheck.min.js"></script>

<!-- 부트스트랩 다이얼로그 js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
$(function(){
	boalert = function(mes) {
		BootstrapDialog.show({
			title : '알림',
			message : mes
		});
	};
	
	var message = '${param.message}';
	if(!message == ''){
		boalert(message);
		
		setTimeout(function(){
			$(location).attr('href','${pageContext.request.contextPath}/user/join/loginForm.do');
		},800)
		
	}
	
	
	if(Get_Cookie('emp_code') != null){
		$('input[name=emp_code]').val(Get_Cookie('emp_code'));
		$('input[type=checkbox]').attr('checked', true);
	}
	// 'true' or 'false' if('true'){} or if('false'){} 
	if(eval('${!empty params.message}')){
		alert("해당정보가 존재하지 않습니다.");
	}
	$('.btn').click(function(){
		if(!$('input[name=emp_code]').val()){
			alert('해당사원번호를 찾을 수 없습니다.');
			return false;
		}
		if(!$('input[name=emp_pass]').val().validationPASS()){
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}
		
		if($('input[type=checkbox]').is(':checked')){
			// 체크박스 체크
			Set_Cookie('emp_code', $('input[name=emp_code]').val(), 1, '/');
		}else{
			Delete_Cookie('emp_code', '/');
		}
		
		// 평문을 암호문으로 변경
		var modulus = '${publicKeyMap["publicModulus"]}';
		var exponent = '${publicKeyMap["publicExponent"]}';
		
		// 공개키 설정
		var rsaObj = new RSAKey();
		rsaObj.setPublic(modulus, exponent);
		
		var encryptEMPCODE = rsaObj.encrypt($('input[name=emp_code]').val());
		var encryptEMPPASS = rsaObj.encrypt($('input[name=emp_pass]').val());
		
		var $frm = $('<form action="${pageContext.request.contextPath }/user/join/loginCheck.do" method="post"></form>');
		$frm.append('<input type="text" name="emp_code" value="' + encryptEMPCODE + '"/>');
		$frm.append('<input type="text" name="emp_pass" value="' + encryptEMPPASS + '"/>');
		
		$(document.body).append($frm);
		$frm.submit();
	});
	
	// 이메일 인증 이후 링크로 직원등록 완료창 
	if (eval('${!empty param.emp_code}')) {
// 		$('#modal-primary').modal();
			var emp_code = '${param.emp_code}';
			$.ajax({
			    type : 'post',
			    url : '${pageContext.request.contextPath}/user/join/check.do?emp_code='+emp_code,
			    dataType : "json",
// 			    data : { emp_code : emp_code },
			    success : function() {
//						$('#code').val(result.code);
			    	// result.flag = "true" or "false"
					// boolean type false : undefined, null
					// "1" + 1 = '11'
					// eval("1" + 1) = 2
						alert("직원등록 완료!!!!!!");
				}
// 			    error : function(request, status, error) {
// 					alert("code : " + request.status );
// 							+ "\r\nmessage : " + request.reponseText);
// 				}
			});
// 		return ture;
		}
		
		$('#empNum').click(function(){
			if(!$('input[name=empName]').val().validationNM()){
				alert("이름을 정확히 입력해주세요")
				return false;
			}
			email = $('input[name=empEmail1]').val() + '@' + $('label[name=empEmail2]').text();
			if (!email.validationMAIL()) {
				alert("이메일을 바르게 입력해주세요.");
				return false;
			}
			$('input[name=empEmail]').val(email);
			var name = $('input[name=empName]').val();
			var email = $('input[name=empEmail]').val();
			
			$.ajax({
				type : 'POST',
				 url : '${pageContext.request.contextPath}/user/emp/idCheck.do',
				 data : { emp_name : name,
						emp_email : email},
				 dataType : 'json',
				 success : function(json) {
					alert("사원 번호는 "+ "["+  json.emp_code + "] 입니다.");
				}
				 ,
				 error : function(result) {
				}
			});
			
		});
		
		$('#empPass').click(function(){
			if(!$('input[name=numCode]').val()){
				alert("사원번호를 정확히 입력해주세요")
				return false;
			}
			email = $('input[name=email11]').val() + '@' + $('label[name=email12]').text();
			if (!email.validationMAIL()) {
				alert("이메일을 바르게 입력해주세요.");
				return false;
			}
			$('input[name=Email0]').val(email);
			var code = $('input[name=numCode]').val();
			var email = $('input[name=Email0]').val();
			
			$.ajax({
				type : 'POST',
				 url : '${pageContext.request.contextPath}/user/emp/passCheck.do',
				 data : { emp_code : code,
						emp_email : email},
				 dataType : 'json',
				 success : function(json) {
					alert("사원 비밀번호는 "+ "["+  json.emp_pass + "] 입니다.");
				}
				 ,
				 error : function(result) {
				}
			});
			
		});
		
		
});
</script>
</head>
   <body>
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Team2 PMS</strong> Login Form</h1>
                            <div class="description">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Login to our site</h3>
                            		<p>Project Management System 에 오신걸 환영합니다.</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="" method="post" class="login-form">
			                    	<div class="form-group">
			                    	<div class="row">
			                    		<label class="col-sm-3 control-label" style="color: white; font-size: 18px; margin-left:30px; margin-top: 10px;" >사원번호</label>
			                        	<div class="col-sm-8">
			                        		<input type="text" name="emp_code" placeholder="사원번호를 입력해주세요" class="form-control" style="border-radius: 1em; margin-left: 10px;">
			                       		</div>
			                    	</div>
			                        </div>
			                        <div class="form-group">
			                        <div class="row">
			                        	<label class="col-sm-3 control-label" style="color: white; font-size: 18px; margin-left:30px; margin-top: 10px;">비밀번호</label>
			                        	<div class="col-sm-8">
			                        		<input type="password" name="emp_pass" placeholder="비밀번호를 입력해주세요" class="form-control" style="border-radius: 1em; margin-left: 10px;">
			                        	</div>
			                        </div>
			                        </div>
<!-- 			                       button class="btn"의 클래스 이름 바꾸면 css적용이 안됨 -->
			                       		<div class="form-group">
						                  <div class="row">
									      	    <label for="inputcheck" class="col-sm-4 control-label" style="color: white; font-size: 18px; margin-left:30px; margin-top: 5px;">사원번호 저장</label>
						                        <input type="checkbox" id="inputcheck" style="width:25px;height:25px; margin-top: 5px;">
                						</div>
			                        </div>
			                        <div class="row">
			                        <div class="col-sm-12">
			                        	<button type="button" class="btn" style="border-radius: 1em;">로그인</button>
			                        </div>
			                        </div>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h4>로그인이 안되나요?</h4>
                        	<div class="social-login-buttons">
	                        	<a class="btn-link-2" data-toggle="modal"  data-target="#modal-primary">
	                        		사원번호 찾기
	                        	</a>
	                        	<a class="btn-link-2" data-toggle="modal"  data-target="#modal-primary1">
	                        		비밀번호 찾기
	                        	</a>
                        	</div>
               		<!-- 모달시작 -->
               		<div class="modal modal-primary fade" id="modal-primary">
      					<form method="POST">
          				<div class="modal-dialog">
            				<div class="modal-content">
            					<div class="modal-header">
                					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  					<span aria-hidden="true">&times;</span></button>
                					<h4 class="modal-title">사원번호 찾기</h4>
              					</div>
              					<div class="modal-body">
								    <div class="form-group has-feedback">
								        <input type="text" class="form-control2" name="empName" placeholder="Name" style="margin-left: -100px !important;">
								    </div>
              						<div class="form-group has-feedback">
								        <input type="hidden" name="empEmail">
								        <input type="text" class="form-control2" name="empEmail1" placeholder="Email">
								        @
										<label name="empEmail2" class="form-control2">naver.com</label>
								    </div>
              					</div>
              					</div>
              					<div class="modal-footer">
                					<button type="button" class="btn-outline pull-left" data-dismiss="modal">Close</button>
                					<button type="button" id="empNum" class="btn-outline">사원번호 찾기</button>
              					</div>
            				</div>
            				</form>
            				<!-- /.modal-content -->
          				</div>
          				<!-- /.modal-dialog -->
          				
               		<div class="modal modal-primary fade" id="modal-primary1">
          				<div class="modal-dialog">
            				<div class="modal-content">
            					<div class="modal-header">
                					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  					<span aria-hidden="true">&times;</span></button>
                					<h4 class="modal-title">비밀번호 찾기</h4>
              					</div>
              					<div class="modal-body">
								    <div class="form-group has-feedback">
								        <input type="text" class="form-control1" name="numCode" placeholder="ID number">
								    </div>
              						<div class="form-group has-feedback">
              						 	<input type="hidden" name="Email0">
								        <input type="text" class="form-control2" name="email11" placeholder="email_id">
								        @
										<label name="email12" class="form-control2">naver.com</label>
								    </div>
								    <br/>
              					</div>
              					</div>
              					<div class="modal-footer">
                					<button type="button" class="btn-outline pull-left" data-dismiss="modal">Close</button>
                					<button type="button" id="empPass" class="btn-outline">비밀번호 찾기</button>
              					</div>
            				</div>
            				<!-- /.modal-content -->
          				</div>
          				<!-- /.modal-dialog -->
        			</div>
        			<!-- /.modal -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
