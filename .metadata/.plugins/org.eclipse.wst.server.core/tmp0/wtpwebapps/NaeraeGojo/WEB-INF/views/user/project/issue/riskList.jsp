<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
$(function(){
// 	$('#insert').click(function(){
// 		$(location).attr('href','${pageContext.request.contextPath}/user/risk/issueForm.do');
// 	});
		
	$('table tr:gt(0)').click(function(){
		var issue_result_code = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/issue/riskView.do?issue_result_code='+issue_result_code+'&rnum='+rnum);
	})

});
</script>
    <!-- Main content -->
    <section class="content">	<!-- content 기본 큰 창 (기본설정)-->
      <div class="row">		<!-- 행을 나누는 기준의 큰 div(기본 설정) -->
      <div class="col-md-12">	<!-- 원하는 width 비율로 class를 수정 -->
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">		<!-- 테이블을 넣을 박스 기본설정 warning일 경우 진한 노랑색 (수정해도 됨)-->
            <div class="box-header with-border">	<!-- 테이블 위에 header부분(기본설정) -->
              <b class="box-title">프로젝트 리스크</b>		<!-- 해당하는 title로 수정 -->
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
              <div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
                <table class="table no-margin table-hover" >
                  <thead>						
                  <tr id="trtr">
                    <th scope="col" width="5%" tex>No.</th>
                    <th scope="col" width="30%">리스크명</th>
                    <th scope="col" width="10%">발생일자</th>
                    <th scope="col" width="10%">처리일자</th>
                    <th scope="col" width="10%">이슈등급</th>
                    <th scope="col" width="10%">처리담당자</th>
                    <th scope="col" width="5%">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                 	<c:forEach items="${issueResultList}" var="issueResultList">
		                  <tr>
       						<td><input type="hidden" value="${issueResultList.issue_result_code }">${issueResultList.rnum }</td>
		                    <td>${issueResultList.issue_name }</td>
		                    <td>${fn:substringBefore(issueResultList.issue_event_day, ' ') }</td>
		                    <td>${fn:substringBefore(issueResultList.issue_result_day, ' ') }</td>
		                    <td>${issueResultList.issue_level }</td>
		                    <td>${issueResultList.emp_code_ir }</td>
		                    <td>${issueResultList.issue_result_hit }</td>
		                  </tr>
	                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            ${pagingUtil}
          </div>
        </div>
	   </div>
        <form action="${pageContext.request.contextPath}/user/issue/project/riskList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
		</form>
	</section>