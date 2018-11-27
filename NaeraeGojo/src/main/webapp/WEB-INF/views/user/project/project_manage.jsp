<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<script type="text/javascript">
$(function(){
	$('#insertProject').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/projectForm.do');
	});
	
	$('.aa').click(function(){
		var project_code =$(this).attr('name');
		var query = '?project_code='+project_code;
		$(this).attr('href', '${pageContext.request.contextPath}/user/project/pro/project_manage_see.do' + query)

	})
});


</script>
<br/>
<br/>
<div class="row">
	<c:forEach items="${projectList}" var="projectList">
		<div class="col-md-6">
			<div class="box box-solid">
				<div class="box-header with-border">
					<a class="aa" name="${projectList.project_code }" id="${projectList.project_code }"> 
						<spanclass ="labellabel-success">완료임박</span>
						<h2>${projectList.project_name}</h2>
					</a>
				</div>
				<div class="box-body">
					<h4>
						프로젝트 기간 : &nbsp;<i style="font-size: 20px;">${projectList.project_start}-${projectList.project_end}</i>
					</h4>
					<h2>
						<sup style="font-size: 15px">진척률 &nbsp; </sup>${projectList.pw_percent}%
					</h2>
					<div class="progress">
						<div
							class="progress-bar progress-bar-primary progress-bar-striped"  aria-valuenow="${projectList.pw_percent}"
							aria-valuemin="0" aria-valuemax="100" style="width: ${projectList.pw_percent}%" role="progressbar">
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!--         <div class="col-md-6"> -->
	<!--           <div class="box box-solid"> -->
	<!--             <div class="box-header with-border"> -->
	<!--               <p><span class="label label-info">진행중</span><h2>학사관리 프로그램</h2></p> -->
	<!--             </div> -->
	<!--             /.box-header -->
	<!--             <div class="box-body"> -->
	<!--              	<h4>프로젝트 기간 : &nbsp;<i style="font-size: 20px;"> 2018.11.04 - 2019.08.12</i></h4> -->
	<!--             	<h2><sup style="font-size: 15px">진척률 &nbsp; </sup> 20%</h2> -->
	<!--               <div class="progress"> -->
	<!--                 <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"  style="width: 20%"> -->
	<!--                    <span class="sr-only">90% Complete (success)</span> -->
	<!--                 </div> -->
	<!--               </div> -->
	<!--               </div> -->
	<!--              </div> -->
	<!--          </div> -->

	<!--         <div class="col-md-6"> -->
	<!--           <div class="box box-solid"> -->
	<!--             <div class="box-header with-border"> -->
	<!--               <p><span class="label label-success">완료임박</span><h2>모바일웹 앱 패키징</h2></p> -->
	<!--             </div> -->
	<!--             /.box-header -->
	<!--             <div class="box-body"> -->
	<!--              	<h4>프로젝트 기간 : &nbsp;<i style="font-size: 20px;"> 2018.05.04 - 2018.11.29</i></h4> -->
	<!--             	<h2><sup style="font-size: 15px">진척률&nbsp;</sup> 82%</h2> -->
	<!--               <div class="progress"> -->
	<!--                 <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="82" aria-valuemin="0" aria-valuemax="100"  style="width: 82%"> -->
	<!--                    <span class="sr-only">90% Complete (success)</span> -->
	<!--                 </div> -->
	<!--               </div> -->
	<!--               </div> -->
	<!--              </div> -->
	<!--          </div> -->
	<!--         <div class="col-md-6"> -->
	<!--           <div class="box box-solid"> -->
	<!--             <div class="box-header with-border"> -->
	<!--               <p><span class="label label-warning">보류중</span><h2>응용프로그램 개발</h2></p> -->
	<!--             </div> -->
	<!--             /.box-header -->
	<!--             <div class="box-body"> -->
	<!--              	<h4>프로젝트 기간 : &nbsp;<i style="font-size: 20px;"> 2017.11.14 - 2018.12.09</i></h4> -->
	<!--             	<h2><sup style="font-size: 15px">진척률 &nbsp;</sup> 40%</h2> -->
	<!--               <div class="progress"> -->
	<!--                 <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"  style="width: 40%"> -->
	<!--                    <span class="sr-only">90% Complete (success)</span> -->
	<!--                 </div> -->
	<!--               </div> -->
	<!--               </div> -->
	<!--              </div> -->
	<!--         </div> -->

</div>
<form action="${pageContext.request.contextPath }/12/main.jsp" method="post" class="form-inline pull-right">
	<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> 
	<select class="form-control" name="search_keycode">
		<option value="TOTAL">전체</option>
		<option value="TITLE">프로젝트 명</option>
		<option value="CONTENT">내용</option>
		<option value="WRITER">진척률</option>
	</select>
	<button type="submit" class="btn btn-primary form-control">검색</button>
	<button type="button" id="insertProject" class="btn btn-info form-control">프로젝트 등록</button>
</form>
