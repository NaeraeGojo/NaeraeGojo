<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style> 
 .no-margin {
    padding: 10px !important;
}
.box-title {
    font-size: 30px !important;
}

table th {
    font-size: large;
}


table td {
    font-size: medium;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(function(){
    
    //상세내용
    $('table tr:gt(0)').click(function(){
        var meeting_code = $(this).find('td:eq(0) input').val();
        $(location).attr('href', '${pageContext.request.contextPath}/user/meetingFile/meetingFileView/' + meeting_code +'.do');
    });
    
    // 회의록 등록
    $('#btn1').click(function(){
         $(location).attr('href', '${pageContext.request.contextPath}/user/meetingFile/meetingFileForm.do');
    });
});


</script>

    <!-- Main content -->
    <section class="content"> 
      <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-2team">
            <div class="box-header with-border">
              <b class="box-title">회의록 목록</b>
              <br/><br/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>제목</th>
                    <th>관련 프로젝트</th>
                    <th>등록날짜</th>
                    <th>작성자</th>
                    <th>조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${meetingList}" var="meetingInfo">
	                  <tr>
	                    <td><input type="hidden" value="${meetingInfo.meeting_code}">${meetingInfo.rnum}</td>
	                    <td>${meetingInfo.meeting_title}</td>
	                    <td>${meetingInfo.project_name}</td>
	                    <td>${meetingInfo.meeting_date}</td>
	                    <td>${meetingInfo.emp_name}</td>
	                    <td>${meetingInfo.meeting_hit}</td>
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
        <form action="${pageContext.request.contextPath}/user/meetingFile/meetingFileList.do" method="post" class="form-inline pull-right col-sm-3.5">
        <select class="form-control" name="search_keycode" >
<!--            <option>검색조건</option> -->
            <option value="TOTAL">전체</option>
            <option value="TITLE">제목</option>
            <option value="CONTENT">내용</option>
            <option value="WRITER">작성자</option>
        </select>
        <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control"/>
        <button type="submit" class="btn btn-default form-control">검색</button>
        <input type="button" id="btn1" value="등록" class="btn btn-primary form-control ">
        </form>
          <!-- /.box -->
        </div>
        </section> 
