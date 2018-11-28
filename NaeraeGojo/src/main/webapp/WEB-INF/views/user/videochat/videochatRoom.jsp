<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<style>
#secondDiv {
    border: 1px solid black;

}
#firstDiv {
    border-right: 1px solid black;

}

video {
    width:31%; 
    height : 190px;
    margin: 7px; 
    border: 1px solid black;
}

</style>


<!-- 전체 라이브러리 -->
<script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/realWebRTC.js"></script>
<script>

</script>


<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
		
		
		
			<div class="box box-2team">
				<div class="box-header with-border">
					<b class="box-title">화상회의 </b> <label>/   PM : 박희태</label> <br/>
					<button class="btn-danger btn-lg pull-right">회의시작</button>
				</div>
				
				<div class="box-body">
				
				    <!--화상회의화면 div  -->
				    <div class="dd" id="firstDiv" style="width: 60%; float: left; margin-right: 20px; height: 680px !important;">
				       <video src=""></video>
				       <video src="" ></video>
				       <video src="" ></video>
				       <video src=""></video>
				       <video src="" ></video>
				       <video src="" ></video>
				       <video src=""></video>
				       <video src="" ></video>
				       <video src="" ></video>
				    
				    </div>  <!-- 화상회의화면 div  끝 -->
				    
				    <!--관련업무  div -->
				    <div class="dd" id="secondDiv" style="width: 38%; float: right;  height: 680px !important;">
				        <div class="box-header with-border">
				            
				        </div>
				        
				        <div>
				        </div>
				    
				    </div> <!-- 관련업무 div  끝 -->
				</div>    
				<br />
				<br />
			</div>
			
			
			
			
			<div class="box-footer clearfix">
				<div class="col-sm-10">
					<button  style="width: 80px;" class="btn btn-info btn-lg btn-flat pull-right">종료</button>
				</div>
			</div>
			
			
			
		</div>
	</div>
</section>


