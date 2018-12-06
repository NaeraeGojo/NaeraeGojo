<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

$(function(){
	$('#homeBtn').click(function(){
		var query = '?project_code='+${project_code};
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/pro/project_manage_see.do' + query);
	});
})

</script>    
    
<style>
.info-box{
    height: 90px;
}    
 
 .div_icon{
    display: inline-block;
    float: left;
 }
 
 .info-box-content{
    display: table;
    margin-left: auto;
    margin-right: auto;
    height: 90px;
 }
 
 .a_text{
    display: table-cell;
    vertical-align: middle;
 }
 
 .dd {
    width: 15%;
 }
 
 .col-md-2 {
    width: 15%;
}

/* 'href', '${pageContext.request.contextPath}/user/project/pro/project_manage_see.do' + query  */
</style>

<section class="main_header">
	<!-- Small boxes (Stat box) -->
	 <div class="row">
	 	<div class="col-md-12" style="padding-right: 20px !important;">
	 	<br/>
	 	
	 	
         <div class=" col-xs-1 asdf">
          <div class="div_icon" style="cursor: pointer;">
            <a id="homeBtn"><span class="info-box-icon bg-red"><i class="fa fa-home"></i></span></a>
           </div>
        </div>	 
        
        	
         <div class="col-md-2 col-sm-2 col-xs-6 dd">
          <div class="info-box">
          <div class="div_icon">
            <span class="info-box-icon bg-teal"><i class="ion ion-ios-gear-outline"></i></span>
           </div>
            <div class="info-box-content">
	            <a class="a_text" href="${pageContext.request.contextPath}/user/project/pw/pwList.do">
	            	<span class="info-box-number">업무</span>
	            </a>
              
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6 dd">
          <div class="info-box">
          <div class="div_icon">
            <span class="info-box-icon bg-yellow"><i class="fa fa-list"></i></span>
           </div>
            <div class="info-box-content">
            <a class="a_text" href="${pageContext.request.contextPath}/user/project/notice/notice_list.do">
            	<span class="info-box-number">공지사항</span>
            </a>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

         <div class="col-md-2 col-sm-3 col-xs-6 dd">
          <div class="info-box">
          <div class="div_icon">
            <span class="info-box-icon bg-maroon"><i class="fa fa-file-zip-o"></i></span>
           </div>
            <div class="info-box-content">
            <a class="a_text" href="${pageContext.request.contextPath}/user/project/recs/recsList.do">
            	  <span class="info-box-number">자료실</span>
             </a>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6 dd">
          <div class="info-box">
	          <div class="div_icon">
	            <span class="info-box-icon bg-red"><i class="fa fa-file-text-o"></i></span>
	          </div>
            <div class="info-box-content">
            <a class="a_text" href="${pageContext.request.contextPath}/user/project/freeboard/freeboardList.do">
            	<span class="info-box-number">자유게시판</span>
            </a>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6 dd">
          <div class="info-box">
          	<div class="div_icon">
            <span class="info-box-icon bg-aqua"><i class="fa fa-check-square"></i></span>
            </div>
            <div class="info-box-content">
              <a class="a_text" href="${pageContext.request.contextPath }/user/project/issue/issueList.do" >		
              	<span class="info-box-number">이슈</span>
              </a>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6 dd">
          <div class="info-box">
          	<div class="div_icon">
            <span class="info-box-icon bg-green"><i class="fa fa-check-square-o"></i></span>
            </div>
            <div class="info-box-content">
              <a class="a_text" href="${pageContext.request.contextPath }/user/project/issue/riskList.do" >		
              	<span class="info-box-number">리스크</span>
              </a>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
	</div>
</section>