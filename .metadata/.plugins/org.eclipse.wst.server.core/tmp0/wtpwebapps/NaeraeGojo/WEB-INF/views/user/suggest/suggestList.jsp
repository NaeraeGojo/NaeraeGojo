<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    <!-- 요청주소 :
    	화면 : 개발자 로그인 시 화면
    -->
<script type="text/javascript">
$(function(){
	$('#suggestForm').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/suggest/suggestForm.do');
	});
	
	$('.a_view').click(function(){
		var suggest_code = $(this).attr('name');
		var currentPage = '${param.currentPage}';
		
		var query = '?suggest_code='+suggest_code;
		
		if(currentPage != null && currentPage != ''){
			query += '&currentPage=' + currentPage;
		}
		
		var search_keyword = '${param.search_keyword}';
    	var search_keycode = '${param.search_keycode}';
		
    	if(search_keyword != null && search_keyword != '' ){
    		query += '&search_keycode=' + encodeURI(search_keycode) 
    		+ '&search_keyword=' + encodeURI(search_keyword);
    	}
    	
		$(this).attr('href','${pageContext.request.contextPath}/user/suggest/suggestView.do' + query)
		
	});
	
// 	$('.box').hover()
});
</script>    
<style>
.row{
	text-align: center;
}
p {
	font-size: 20px !important;
}

.callout.callout-info, .callout.callout-danger, .callout.callout-warning, .callout.callout-success {
    background-color: #fff !important;
    color: #525252 !important;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
}
#suggestList{
	padding-left: 200px;
	padding-right: 200px;
}
.pull-right{
	margin-right: 200px;
}
.suggestIn{
	background: lightgray;
}

.suggests{
	max-height: 250px;
	padding: 5px;
}

.suggestcont{
	margin-left: 160px;
    margin-right: 160px;
    width: 80%;
    display: inline-block;
    text-align: initial;
}

.callout a{
	color: #3a94c1;
	text-decoration: none;
}

.callout a:hover{
	color: #74b0ce;
}


</style>
		
    <!-- Main content -->
    <div class="row">
    
    <div class="suggestcont">
    	<div class="col-md-1"  style="float:right;">
	      <input id="suggestForm" value="+ 제안서 등록" type="button" class="btn btn-block bg-yellow btn-lg "  
	      style="float:right; background-color:#c8c8c8; border:1px outset; width:200px; margin-bottom:14px;">
	    </div>
    </div>
    
    <div class="suggestcont">
    	
       <c:forEach items="${sl }" var="sv">
         <div class="col-md-6 ">
          <div class="box box-solid callout callout-warning suggests">
            <div class="box-header with-border">
              <a class="a_view" name="${sv.suggest_code }"
               href="">
              	<span class="label label-success">${sv.suggest_result }</span>
              	<h2 title="${sv.suggest_title }">
              	<c:if test="${ sv.suggest_title.length() <= 12}">
              		${sv.suggest_title }
              	</c:if>
              	<c:if test="${ sv.suggest_title.length() > 12}">
              		${fn:substring(sv.suggest_title,0,11) }...
              	</c:if>
              	</h2>
              </a>
              <i style="font-size: 15px; margin-right:5px;" class="pull-right">${sv.rqpps_nickname } </i>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<h4>예상 진행기간&nbsp; : &nbsp;<i style="font-size: 20px;">${sv.suggest_start_date }&nbsp;~&nbsp;${sv.suggest_end_date } </i></h4>
             	<h4>사업비&nbsp; : &nbsp;<i style="font-size: 20px;"> ${sv.suggest_cost }￦</i></h4>
             	<h4>작성일자&nbsp; : &nbsp;<i style="font-size: 20px;">${sv.suggest_reg_date } </i></h4>
            </div>
            
          </div>
       </div>
         
         </c:forEach>
         <c:if test="${empty sl}">
       	  등록된 제안서가 존재하지 않습니다.
         </c:if>
         
         
		</div>
		${page }
		
		
		<form action="${pageContext.request.contextPath }/user/suggest/suggestList.do" method="post" class="form-inline pull-right">
		
		<select class="form-control" name="search_keycode">
<!-- 			<option>검색조건</option> -->
			<option value="TOTAL">전체</option>
			<option value="TITLE">프로젝트 명</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control">
	    <button type="submit" class="btn btn-primary form-control">검색</button>
		</form>
		
      </div>
      
      
    <!-- /.content -->
