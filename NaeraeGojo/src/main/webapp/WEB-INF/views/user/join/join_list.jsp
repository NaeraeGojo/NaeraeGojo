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
.tab-content {
	padding: 30px !important;
}
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
#rfpList{
	padding-left: 200px;
	padding-right: 200px;
}
.pull-right{
	margin-right: 200px;
}
.rfpIn{
	background: lightgray;
}

.rfps{
	max-height: 250px;
	padding: 5px;
}

.mpcont{
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
<div class="row">
    
    <div class="mpcont">
    	<div class="col-md-1"  style="float:right;">
	      <input id="joinForm" value="+ 인력계획 등록" type="button" class="btn btn-block bg-yellow btn-lg "  
	      style="float:right; background-color:#c8c8c8; border:1px outset; width:200px; margin-bottom:14px;">
	    </div>
    </div>
    
    <div class="joincont">
    	
       <c:forEach items="${joinLast }" var="itemS">
         <div class="col-md-6 ">
          <div class="box box-solid callout callout-warning rfps">
            <div class="box-header with-border">
              <a class="a_view" name="${itemS.rqpps_code }"
               href="">
              	<h2 >${itemS.rqpps_name }</h2>
              </a>
              <i style="font-size: 15px; margin-right:5px;" class="pull-right">${itemS.emp_name }</i>
            </div>
          </div>
       </div>
         
         </c:forEach>
         <c:if test="${empty joinLast}">
       	  등록된 제안요청서가 존재하지 않습니다.
         </c:if>
         
         
		</div>
<%-- 		${page } --%>
		
		
		<form action="${pageContext.request.contextPath }/user/rfp/rfpList.do" method="post" class="form-inline pull-right">
		
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



	
<script type="text/javascript">
$(function(){
	
	$('#joinForm').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/join/join_insertFinal.do');
	});
	
    $('.a_view').click(function(){
		var rqpps_code = $(this).attr('name');
		var query = '?rqpps_code=' + rqpps_code;
		$(this).attr('href','${pageContext.request.contextPath}/user/join/join_view.do'+query);
    });
    
    
})

</script>