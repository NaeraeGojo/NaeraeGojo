<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
    font-size: 30px !important;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(function(){
	//상세내용
    $('table tr:gt(0)').click(function(){
        var video_chat_room_code = $(this).find('td:eq(0) input').val();
        $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatView/'+video_chat_room_code+'.do');
    });
    
    // 화상개설
    $('#btn1').click(function(){
    	 $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatForm.do');
    });
    
});


</script>

    <!-- Main content -->
    <section class="content"> 
    <br/>
    <div class="col-md-2"  style="float:right;">
      <input id="btn1" value="+ 화상회의 개설" type="button" class="btn btn-block btn-default btn-lg "  style="float:right; background-color:#c8c8c8; border:1px outset;">
    </div>
    <br/>
     <br/>
      <br/>
      <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">화상회의 목록</b>
              <br/><br/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover" style="margin:auto;" >
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>회의일자</th>
                    <th>회의 제목</th>
                    <th>관련 프로젝트</th>
                    <th>참여인원</th>
                    <th>상태</th>
                    <th>개설자</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${chatroomList}" var="chatroomInfo">
	                  <tr>
                            <td style="width: 100px;"><input type="hidden" value="${chatroomInfo.video_chat_room_code}">${chatroomInfo.rnum}</td>
                            <td style="width: 180px;">${chatroomInfo.video_chat_room_date}</td>
                            <td  style="width: 350px;">${chatroomInfo.video_chat_room_title}</td>
                            <td style="width: 350px;">${chatroomInfo.project_name}</td>
                            <td style="width: 150px;">${chatroomInfo.emp_cnt}<label> 명</label></td>
                            <c:if test="${chatroomInfo.video_chat_status=='y'}">
                                <td  style="width: 140px;"><span class="label label-warning ">종료</span></td>
                            </c:if>
                            <c:if test="${chatroomInfo.video_chat_status=='n'}">
                                <td  style="width: 140px;"><span class="label label-info">진행중</span></td>
                            </c:if>                            
                            
                            <td style="width: 120px;">${chatroomInfo.emp_name}</td>
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
          <!-- /.box -->
        </div>
         </section>     
        <form action="${pageContext.request.contextPath}/user/video/chatList.do" method="post" class="form-inline pull-right">
        <select class="form-control" name="search_keycode" >
<!--            <option>검색조건</option> -->
            <option value="TOTAL">전체</option>
            <option value="TITLE">제목</option>
            <option value="CONTENT">내용</option>
            <option value="WRITER">개설자</option>
        </select>
        <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
        <button type="submit" class="btn btn-primary form-control">검색</button>
        </form>
