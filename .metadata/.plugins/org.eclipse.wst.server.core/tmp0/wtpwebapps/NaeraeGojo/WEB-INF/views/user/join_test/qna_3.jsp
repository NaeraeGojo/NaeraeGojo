<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
    <!-- Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
      <div class="col-md-11">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">문의게시글 조회</b>
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <form role="form">
                <!-- text input -->
                <div class="form-group">
                  <label>게시글 제목</label>
                  <input type="text" class="form-control" disabled="">
                </div>
                <div class="form-group">
                  <label>작성자</label>
                  <input type="text" class="form-control" disabled="">
                </div>
                <div class="form-group">
                  <label>글 비밀번호</label>
                  <input type="text" class="form-control">
                </div>
                <!-- textarea -->
                <div class="form-group">
                  <label>Textarea</label>
                  <textarea class="form-control" rows="10" placeholder="Enter ..." disabled=""></textarea>
                </div>
                <div class="form-group">
					<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
			
			<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
						</ol>
			<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" style="height: 200px;">
							<c:forEach items="${freeboardInfo.items }" var="fileItemInfo" varStatus="stat">
								<c:if test="${stat.first }">
									<div class="item active">
								</c:if>
								<c:if test="${stat.last }">
									<div class="item">
								</c:if>
							<img src="/image/${fileItemInfo.file_save_name }" alt="pic1"
						 onclick="javascript:location.href='${pageContext.request.contextPath}/12/fileDownload.jsp?file_seq=${fileItemInfo.file_seq }';">
						</div>
							</c:forEach>
					</div>
			<!-- Left and right controls -->
						<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div>
            	</div>
				<div class="box-footer clearfix">
              	<input value="삭제" type="button" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              	<input value="목록" type="button" href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-right">
              	<input value="수정" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
          	</div>
              </form>
          <!-- /.box -->
        </div>
        </div>
      </div>
	</section>