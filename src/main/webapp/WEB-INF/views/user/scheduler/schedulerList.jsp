<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$('#insert').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/scheduler/schedulerForm.do');
	});
});

$(function() {
    $('#toggle-one').bootstrapToggle();
})
</script>
    <section class="content-header">
      <h1>
      	스케줄러 관리
<!--         <small>목록</small> -->
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>게시판</a></li>
        <li class="active">스케줄러 목록조회</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">	<!-- content 기본 큰 창 (기본설정)-->
    <br/><br/>
      <div class="row">		<!-- 행을 나누는 기준의 큰 div(기본 설정) -->
      <div class="col-md-12">	<!-- 원하는 width 비율로 class를 수정 -->
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">		<!-- 테이블을 넣을 박스 기본설정 warning일 경우 진한 노랑색 (수정해도 됨)-->
            <div class="box-header with-border">	<!-- 테이블 위에 header부분(기본설정) -->
              <b class="box-title">스케줄러</b>		<!-- 해당하는 title로 수정 -->
              <br/><br/>
            </div>
            <!-- /.box-header -->
            <div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
              <div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
                <table class="table no-margin" >
                  <thead>						
                  <tr id="trtr">
                    <th scope="col" width="5%" tex>No.</th>
                    <th scope="col" width="30%">스케줄러명</th>
                    <th scope="col" width="10%">등록자</th>
                    <th scope="col" width="10%">시간</th>
                    <th scope="col" width="10%">설정</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                  	<td>2</td>
                    <td>스케줄러</td>
                    <td>전현</td>
                    <td>09:00</td>
                    <td>
						<input type="checkbox" checked data-toggle="toggle" data-size="mini" data-onstyle="info" data-offstyle="danger">
                    </td>
                  </tr>
                  <tr>
                  	<td>1</td>
                    <td>스케줄러</td>
                    <td>전현</td>
                    <td>14:00</td>
                    <td>
						<input type="checkbox" checked data-toggle="toggle" data-size="mini" data-onstyle="info" data-offstyle="danger">
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
            
            <div class="box-footer clearfix">	<!-- 테이블의 아래 하단부분(기본설정) -->
              <ul class="pagination pagination-sm no-margin pull-right">	<!-- 페이징버튼 (기본설정이나 본인의 임의로 설정가능) -->
                <li><a href="#">&laquo;</a></li>	
                <li><a href="#">1</a></li>	<!-- 페이징 갯수 박아놓은 부분 (수정가능) -->
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
            </div>
         
          </div>
       
        </div>
         	
	   </div>
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
	    <button type="button" id="insert" class="btn btn-danger form-control">스케줄러 등록</button>
		</form>
	</section>