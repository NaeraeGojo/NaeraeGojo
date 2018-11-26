<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    	
<%--        <c:forEach items="${rl }" var="item"> --%>
<!--          <div class="col-md-6 "> -->
<!--           <div class="box box-solid callout callout-warning rfps"> -->
<!--             <div class="box-header with-border"> -->
<%--               <a class="a_view" name="${item.rqpps_code }" --%>
<!--                href=""> -->
<!--               	<span class="label label-success">완료임박</span> -->
<%--               	<h2 >${item.rqpps_name }</h2> --%>
<!--               </a> -->
<%--               <i style="font-size: 15px; margin-right:5px;" class="pull-right"> ${item.rqpps_nickname }</i> --%>
<!--             </div> -->
<!--             /.box-header -->
<!--             <div class="box-body"> -->
<%--              	<h4>제안서 마감기한&nbsp; : &nbsp;<i style="font-size: 20px;">~ ${item.rqpps_end_date }</i></h4> --%>
<%--              	<h4>예산&nbsp; : &nbsp;<i style="font-size: 20px;"> ${item.rqpps_budget }￦</i></h4> --%>
<%--              	<h4>작성일자&nbsp; : &nbsp;<i style="font-size: 20px;"> ${item.rqpps_date }</i></h4> --%>
<!--             </div> -->
            
<!--           </div> -->
<!--        </div> -->
         
<!--          </c:forEach> -->
         <div class="col-md-6 ">
          <div class="box box-solid callout callout-warning rfps">
            <div class="box-header with-border">
              <a class="a_view" name=""
               href="">
              	<span class="label label-success">완료임박</span>
              	<h2 >인력계획 테스트</h2>
              </a>
              <i style="font-size: 15px; margin-right:5px;" class="pull-right"> 안창렬</i>
            </div>
            <!-- /.box-header -->
          </div>
       </div>
         <c:if test="${empty rl}">
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



<!--     Main content -->
<!--     <section class="content"> -->
<!--                <div class="box box-info"> -->
<!--             <div class="box-header with-border"> -->
<!--               <b class="box-title">인력투입 관리</b>	 -->
<!--               <br/><br/> -->
<!--               <div class="box-tools pull-right"> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> -->
<!--                 </button> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
<!--               </div> -->
<!--             </div> -->
<!--             /.box-header -->
<!--             <div class="box-body"> -->
<!--               <div class="table-responsive"> -->
<!--                 <table class="table no-margin" id="mpView"> -->
<!--                   <thead> -->
<!--                   <tr> -->
<!--                     <th scope="col" width="10%">No.</th> -->
<!--                     <th scope="col" width="30%">제목</th> -->
<!--                     <th scope="col" width="20%">작성자</th> -->
<!--                     <th scope="col" width="20%">작성날짜</th> -->
<!--                     <th scope="col" width="10%">조회수</th> -->
<!--                   </tr> -->
<!--                   </thead> -->
<!--                   <tbody> -->
<!--                   <tr> -->
<!--                   	<td>1</td> -->
<!--                     <td>통계청 통합정보시스템 인력계획</td> -->
<!--                     <td>박희태</td> -->
<!--                     <td>2018-11-11</td> -->
<!--                     <td> -->
<!--                       3 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>2</td> -->
<!--                     <td>한국산업은행 IT 인력계획	</td> -->
<!--                     <td>박희태</td> -->
<!--                     <td>2018-11-11</td> -->
<!--                     <td> -->
<!--                       3 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td>3</td> -->
<!--                     <td>덕성여자대학교 IT 인력계획</td> -->
<!--                     <td>최동화</td> -->
<!--                     <td>2018-10-19</td> -->
<!--                     <td> -->
<!--                       4 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>4</td> -->
<!--                     <td>C-ITS 실증사업 인력계획</td> -->
<!--                     <td>전 현</td> -->
<!--                     <td>2018-10-17</td> -->
<!--                     <td> -->
<!--                       5 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>5</td> -->
<!--                     <td>대덕인재개발원 IT 인력계획</td> -->
<!--                     <td>최동화</td> -->
<!--                     <td>2018-10-11</td> -->
<!--                     <td> -->
<!--                       4 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>6</td> -->
<!--                     <td>배재대학교 인프라 인력계획</td> -->
<!--                     <td>최동화</td> -->
<!--                     <td>2018-10-09</td> -->
<!--                     <td> -->
<!--                       4 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>7</td> -->
<!--                     <td>마이크로소프트 시스템 구축</td> -->
<!--                     <td>최동화</td> -->
<!--                     <td>2018-10-16</td> -->
<!--                     <td> -->
<!--                       4 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>8</td> -->
<!--                     <td>2020년 기준 경제총조사 인력계획</td> -->
<!--                     <td>최동화</td> -->
<!--                     <td>2018-10-17</td> -->
<!--                     <td> -->
<!--                       4 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>9</td> -->
<!--                     <td>통계청 경영지원팀 IT개발 인력계획</td> -->
<!--                     <td>최동화</td> -->
<!--                     <td>2018-10-14</td> -->
<!--                     <td> -->
<!--                       4 -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                   	<td>10</td> -->
<!--                     <td>대덕인재개발원 IT 인력계획</td> -->
<!--                     <td>최동화</td> -->
<!--                     <td>2018-10-13</td> -->
<!--                     <td> -->
<!--                       4 -->
<!--                     </td> -->
<!--                   </tr> -->
                  
<!--                   </tbody> -->
<!--                 </table> -->
<!--               </div> -->
<!--               /.table-responsive -->
<!--             </div> -->
<!--             /.box-body -->
<!--             <div class="box-footer clearfix"> -->
<!-- <!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!-- <!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
<!--               <ul class="pagination pagination-sm no-margin pull-right"> -->
<!--                 <li><a href="#">&laquo;</a></li> -->
<!--                 <li><a href="#">1</a></li> -->
<!--                 <li><a href="#">2</a></li> -->
<!--                 <li><a href="#">3</a></li> -->
<!--                 <li><a href="#">&raquo;</a></li> -->
<!--               </ul> -->
<!--             </div> -->
<!--             /.box-footer -->
            
<!--           </div> -->
<%--         <form action="${pageContext.request.contextPath }/12/main.jsp" method="post" class="form-inline pull-right"> --%>
<!-- 		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> -->
<!-- 		<select class="form-control" name="search_keycode" > -->
<!-- <!-- 			<option>검색조건</option> --> -->
<!-- 			<option value="TOTAL">전체</option> -->
<!-- 			<option value="TITLE">제목</option> -->
<!-- 			<option value="CONTENT">내용</option> -->
<!-- 			<option value="WRITER">작성자</option> -->
<!-- 		</select> -->
<!-- 	    <button type="submit" class="btn btn-primary form-control">검색</button> -->
<!-- 	    <button type="button" id="btn2" class="btn btn-info form-control"> + 등록</button> -->
<!-- 		</form> -->
<!--               </div> -->
<!--               /.tab-pane -->
            
            
<!--             </div> -->
<!--             /.tab-content -->
<!--           </div> -->
<!--           nav-tabs-custom -->
        
<!-- 	</section> -->
	
<script type="text/javascript">
$(function(){
	
	$('#joinForm').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/join/join_insertFinal.do');
	});
	
    $('.a_view').click(function(){
//         var bo_no = $(this).find('td:eq(0)').text();
		$(this).attr('href','${pageContext.request.contextPath}/user/join/join_view.do');
    });
    
})

</script>