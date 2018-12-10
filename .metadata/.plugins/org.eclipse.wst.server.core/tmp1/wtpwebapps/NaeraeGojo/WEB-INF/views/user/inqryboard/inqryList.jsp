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
.inqrycont {
	margin-left: 160px;
	margin-right: 160px;
	width: 80%;
	display: inline-block;
	text-align: initial;
}
</style>
    <!-- Main content -->
<section class="content">	<!-- content 기본 큰 창 (기본설정)-->
	<br/><br/>
	<div class="row">
	<div class="inqrycont">
			<!-- 행을 나누는 기준의 큰 div(기본 설정) -->
		<div class="col-md-12">	<!-- 원하는 width 비율로 class를 수정 -->
  			<!-- TABLE: LATEST ORDERS -->
			<div class="box box-warning">		<!-- 테이블을 넣을 박스 기본설정 warning일 경우 진한 노랑색 (수정해도 됨)-->
            	<div class="box-header with-border">	<!-- 테이블 위에 header부분(기본설정) -->
					<b class="box-title">문의 게시판</b>		<!-- 해당하는 title로 수정 -->
              		<br/><br/>
            	</div>
            	<!-- /.box-header -->
            	<div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
              		<div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
                		<table class="table no-margin table-hover table_inqry">
                  			<thead>						
                  				<tr>
                    				<th scope="col" width="10%">No.</th>
                    				<th scope="col" width="30%">제목</th>
                    				<th scope="col" width="20%">작성자</th>
                    				<th scope="col" width="20%">작성날짜</th>
                   					<th scope="col" width="10%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${inqryboardList }" var="list">
									<tr code="${list.inqry_board_code }">
										<td>${list.rnum }</td>
										<td>${list.inqry_board_title }</td>
										<td>${list.emp_nick }</td>
										<td>${list.inqry_board_date }</td>
										<td>${list.inqry_board_hit }</td>
									</tr>
								</c:forEach>
                  			</tbody>
						</table>
                		<c:if test="${empty inqryboardList}">
                			<div style="text-align: center;">
                				<p style="margin-top: 20px;">
                					작성된 게시글이 존재하지 않습니다.
	    	            		</p>
                			</div>
                		</c:if>
              		</div>
              	<!-- /.table-responsive -->
            	</div>
            	<!-- /.box-body -->
            	${page }
          	</div>
          	<!-- /.box -->
        </div>
         	
	   	<!-- 검색설정부분(기본설정이나 임의로 수정가능) -->
		<form action="${pageContext.request.contextPath}/user/inqryboard/inqryList.do" method="post" class="form-inline pull-right"
		style="margin-right: 15px;">
			<select class="form-control" name="search_keycode" >
				<option value="TOTAL">전체</option>
				<option value="TITLE">제목</option>
				<option value="CONTENT">내용</option>
				<option value="WRITER">작성자</option>
			</select>
			<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
	    	<button type="submit" class="btn btn-primary form-control">검색</button>
	    	<button type="button" id="btn_inqryForm" class="btn btn-info form-control">등록</button>
		</form>
	</div>
	</div>
</section>
<script>
$(function(){
	boalert = function(mes){
		BootstrapDialog.show({
	 		title: '알림',
	 		message: mes
		});
	};
	
	$('.table_inqry tr:gt(0)').click(function(){
		var inqry_board_code = $(this).attr('code');
		var query = '?inqry_board_code='+ inqry_board_code;
		
		var currentPage = '${param.currentPage}';
		
		if(currentPage != null && currentPage != ''){
			query += '&currentPage=' + currentPage;
		}
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
    	
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
		$(location).attr('href', '${pageContext.request.contextPath}/user/inqryboard/inqryView.do' + query);
	});

	$('#btn_inqryForm').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/inqryboard/inqryForm.do');
	});
})
</script>
  