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
.freecont{
	margin-left: 160px;
   	margin-right: 160px;
   	width: 80%;
   	display: inline-block;
   	text-align: initial;
}
.btn_free_upper{
	color:white; 
	background-color:#8cd636; 
	border:1px outset; 
	width : fit-content; 
	margin-bottom:14px;
	margin-left: 10px;
	border-radius: 1em;
}
</style>
<script type="text/javascript">
$(function(){
	boalert = function(mes){
		BootstrapDialog.show({
	 		title: '알림',
	 		message: mes
		});
	};
	
	$('.table_free tr:gt(0)').click(function(){
		var freeboard_code = $(this).attr('code');
		var query = '?freeboard_code='+freeboard_code;
		
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
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/freeboard/freeboardView.do' + query);
	});
	
	$('#btn_freeForm').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/project/freeboard/freeboardForm.do');
	});
})
</script>
	<!-- Main content -->
	<div class="row">
		<div class="freecont">
			<div class="col-md-4 pull-right" style="width: auto;">
				<input id="btn_freeForm" value="+게시물 등록" type="button" class="btn btn-lg btn_free_upper">    	
      		</div>
		</div>
		
		<div class="freecont">
			<div class="col-md-12">
			<!-- TABLE: LATEST ORDERS -->
				<div class="box box-2team">		
					<div class="box-header with-border">	<!-- 테이블 위에 header부분(기본설정) -->
						<b class="box-title">자유게시판</b>		<!-- 해당하는 title로 수정 -->
	              			<sub><i class="fa fa-fw fa-angle-left"></i>${pv.project_name }<i class="fa fa-fw fa-angle-right"></i></sub>
	              		<br/><br/>
	            	</div>
	            	
	            	<!-- /.box-header -->
	            	<div class="box-body">
						<div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
							<table class="table no-margin table-hover table_free" >
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
									<tr code="${list.freeboard_code }">
										<td>${list.rnum}</td>
										<td>${list.freeboard_title }</td>	                  	
										<td>${list.emp_nick }</td>
										<td>${list.freeboard_date }</td>
										<td>${list.freeboard_hit}</td>
									</tr> 
								</c:forEach>
								</tbody>
							</table>
							<c:if test="${empty freeboardList}">
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
			<form action="${pageContext.request.contextPath}/user/project/freeboard/freeboardList.do" method="post" class="form-inline pull-right"
			style="margin-right: 15px;">
				<select class="form-control" name="search_keycode" >
					<option value="TOTAL">전체</option>
					<option value="TITLE">제목</option>
					<option value="CONTENT">내용</option>
					<option value="WRITER">작성자</option>
				</select>
				<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		    	<button type="submit" class="btn btn-primary form-control">검색</button>
			</form>
		</div>
	</div>