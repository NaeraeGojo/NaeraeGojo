<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="main_header">
	<!-- Small boxes (Stat box) -->
	 <div class="row">
	 	<div class="col-md-12" style="padding-right: 20px !important;">
	 	<br/>
         <div class="col-md-2 col-sm-3 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-teal"><i class="ion ion-ios-gear-outline"></i></span>
            <div class="info-box-content">
	            <a href="${pageContext.request.contextPath}/user/project/pw/pwList.do">
	            	<span class="info-box-number">업무</span>
	            </a>
              
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-list"></i></span>
            <div class="info-box-content">
            <a href="${pageContext.request.contextPath}/user/project/notice/notice_list.do">
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

         <div class="col-md-2 col-sm-3 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-maroon"><i class="fa fa-file-zip-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-number">자료실</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-file-text-o"></i></span>
            <div class="info-box-content">
            <a href="${pageContext.request.contextPath}/user/project/freeboard/freeboardList.do">
            	<span class="info-box-number">자유게시판</span>
            </a>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-check-square"></i></span>
            <div class="info-box-content">
              <a href="${pageContext.request.contextPath }/user/project/issue/issueList.do" >		
              	<span class="info-box-number">이슈</span>
              </a>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
         <div class="col-md-2 col-sm-3 col-xs-6">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-check-square-o"></i></span>
            <div class="info-box-content">
              <a href="${pageContext.request.contextPath }/user/project/issue/riskList.do" >		
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