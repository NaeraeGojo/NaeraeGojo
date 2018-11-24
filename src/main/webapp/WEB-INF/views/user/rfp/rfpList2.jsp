<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 요청주소 :
    	화면 : 개발자 로그인 시 화면
    -->
<style>
p {
	font-size: 20px !important;
}

.callout.callout-info, .callout.callout-danger, .callout.callout-warning, .callout.callout-success {
    background-color: #fff !important;
    color: #525252 !important;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
}
#rfpList{
	padding-left: 200px;
	padding-right: 200px;
}
.pull-right{
	margin-right: 200px;
}
/* .rfpIn{ */
/* 	background: lightgray; */
/* } */

.rfps{
	max-height: 250px;
}

</style>
    <!-- Main content -->
    <div class="row">
        <div class="col-md-12" id="rfpList">
        
          <div class="box box-default rfpIn">
            <div class="box-header with-border">
              <i class="fa fa-th-list"></i>

              <h3 class="box-title">제안 요청서 목록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
        <div class="callout callout-warning">
                <h4>제안요청서_PMS</h4>

                <p>작성자 : 이PM</p>
        </div>
        
        <div class="callout callout-warning">
            <h4>제안요청서_맛집기행</h4>
            <p>
                작성자 : 김PM
            </p>
        </div>
        
        <div class="col-md-6">
          <div class="box box-solid callout callout-warning">
            <div class="box-header with-border">
              <p><span class="label label-info">진행중</span><h2>학사관리 프로그램</h2></p>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<h4>프로젝트 기간 : &nbsp;<i style="font-size: 20px;"> 2018.11.04 - 2019.08.12</i></h4>
            	<h2><sup style="font-size: 15px">진척률 &nbsp; </sup> 20%</h2>
              <div class="progress">
                <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"  style="width: 20%">
<!--                   <span class="sr-only">90% Complete (success)</span> -->
                </div>
              </div>
              </div>
             </div>
         </div>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->

      </div>
      
      <form action="/ng/12/main.jsp" method="post" class="form-inline pull-right">
		
		<select class="form-control" name="search_keycode">
<!-- 			<option>검색조건</option> -->
			<option value="TOTAL">전체</option>
			<option value="TITLE">프로젝트 명</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">진척률</option>
		</select>
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control">
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" id="btn1" class="bg-yellow form-control">제안요청서 등록</button>
		</form>
    <!-- /.content -->
