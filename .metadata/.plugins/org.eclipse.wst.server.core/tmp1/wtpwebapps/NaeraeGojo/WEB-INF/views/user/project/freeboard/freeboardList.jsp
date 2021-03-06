<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
  .no-margin { 
     padding: 10px !important; 
}
.box-title {
	font-size: 30px !important;
}
</style>
    <!-- Main content -->
    <section class="content">	<!-- content 기본 큰 창 (기본설정)-->
      <div class="row">		<!-- 행을 나누는 기준의 큰 div(기본 설정) -->
      <div class="col-md-11">	<!-- 원하는 width 비율로 class를 수정 -->
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">		<!-- 테이블을 넣을 박스 기본설정 warning일 경우 진한 노랑색 (수정해도 됨)-->
            <div class="box-header with-border">	<!-- 테이블 위에 header부분(기본설정) -->
              <b class="box-title">자유게시판</b>		<!-- 해당하는 title로 수정 -->
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
              <div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
                <table class="table table-hover"">
                  <thead>						
                  <tr>
                    <th scope="col" width="10%">No.</th>
                    <th scope="col" width="40%">제목</th>
                    <th scope="col" width="10%">작성자</th>
                    <th scope="col" width="20%">작성날짜</th>
                    <th scope="col" width="5%">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${freeboardList}" var="list">
	                  <tr>
	                  	<td><input type="hidden" value="${list.freeboard_code }">${list.rnum }</td>
						<td>${list.freeboard_title }</td>	                  	
                  		<td>${list.emp_code }</td>
                  		<td>${fn:substringBefore(list.freeboard_date, ' ') }</td>
                		<td></td>  
                  </c:forEach>
                  	<td>1</td>
                    <td>자유게시판을 오픈하였습니다.</td>
                    <td>이소라</td>
                    <td>2018.11.13.18:42:08</td>
                    <td>24</td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">	<!-- 테이블의 아래 하단부분(기본설정) -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
              <ul class="pagination pagination-sm no-margin pull-right">	<!-- 페이징버튼 (기본설정이나 본인의 임의로 설정가능) -->
                <li><a href="#">&laquo;</a></li>	
                <li><a href="#">1</a></li>	<!-- 페이징 갯수 박아놓은 부분 (수정가능) -->
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
       <div class="col-md-11">  	
	   <!-- 검색설정부분(기본설정이나 임의로 수정가능) -->
        <form action="#" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
<!-- 			<option>검색조건</option> -->
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" id="btn1" class="btn btn-info form-control"> + 자유게시판 등록</button>
		</form>
	    <a href="${pageContext.request.contextPath}/user/project/project_manage_see.do" class="btn bg-maroon pull-left">뒤로가기</a>
       </div>
	   </div>
	</section>
<script>
$(function(){
	$('table tr:gt(0)').click(function(){
		var bo_no = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardView.do');
	});
	$('#btn1').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardForm.do');
	});
})
</script>
  