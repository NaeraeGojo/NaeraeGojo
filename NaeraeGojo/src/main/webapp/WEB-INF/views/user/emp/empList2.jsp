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
.btn-sm {
	width : 80px;
	margin-right:5px; 
}
.col-sm-1 {
	width: 2% !important;
}
.col-sm-18 {
	width: 5%;
}
</style>

    <!-- Main content -->
    <section class="content">	<!-- content 기본 큰 창 (기본설정)-->
    <br/><br/>
      <div class="row">		<!-- 행을 나누는 기준의 큰 div(기본 설정) -->
      <div class="col-md-11">	<!-- 원하는 width 비율로 class를 수정 -->
  		<!-- TABLE: LATEST ORDERS -->
        <div class="box box-warning">		<!-- 테이블을 넣을 박스 기본설정 warning일 경우 진한 노랑색 (수정해도 됨)-->
            <div class="box-header with-border">	<!-- 테이블 위에 header부분(기본설정) -->
        	<b class="box-title">직원 전체목록 조회</b>	
            <br/><br/>
        </div>
            <!-- /.box-header -->
        <div class="box-body">				<!-- 테이블이 나타하는 body부분 (기본설정)-->
           <div class="table-responsive">	<!-- 테이블 기본 설정 (기본설정)-->
			   <form action="${pageContext.request.contextPath}/user/emp/empList2.do" role="form" method="post" class="form-horizontal col-sm-12">
			  	   <div class="form-group">
			  	   		<label for="inputEmail3" class="col-sm-2 control-label" >기본검색</label>
			  	            <div class="col-sm-3">
                            <select class="form-control col-sm-4" name="search_keycode" >
                                <option selected="selected" value="ALL">전체</option>
                                <option value="EMPCODE">사원번호</option>
                                <option value="EMPNAME">이름</option>
                                <option value="EMPROLE">권한</option>
                            </select>
                            </div>
                              <div class="col-sm-3">
                                <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어를 입력해주세요" class="form-control" />
                           </div>
				   	</div>
			  	   <div class="form-group">
			  	   		<label for="inputEmail3" class="col-sm-2 control-label" >이메일</label>
			  	    <div class="col-sm-2">			
						<input type="text" placeholder="이메일 아이디를 입력하세요" class="form-control" />
				   </div>
						<label for="inputEmail3" class="col-sm-1 control-label">@</label>
			       <div class="col-sm-4">			
						<select class="form-control">
							<option selected="selected">메일을 선택하세요</option>
						</select>
				   </div>
				   </div>
				   
				   <div class="form-group">
			  	   		<label for="inputEmail3" class="col-sm-2 control-label" >연락처</label> 
			  	   <div class="col-sm-2">
						<select class="form-control">
							<option selected="selected">선택하세요</option>
						</select> 
			       </div>
  					<label for="inputEmail3" class="col-sm-1 control-label" >-</label>
			  	   <div class="col-sm-2">			
						<input type="text" placeholder="번호를 입력하세요" class="form-control" />
				   </div>
				   <label for="inputEmail3" class="col-sm-1 control-label" >-</label>
			  	   <div class="col-sm-2">			
						<input type="text" placeholder="번호를 입력하세요" class="form-control" />
				   </div>
				   </div>
					
				   <div class="form-group">
			  	   		<label for="inputEmail3" class="col-sm-2 control-label" >생년월일</label> 
            		<div class="col-sm-2">
	              		<label for="inputEmail3" class="col-sm-5 control-label">
		                  <input type="radio" name="r1" class="minimal" checked>&ensp;양력
		                </label>
		                <label for="inputEmail3" class="col-sm-5 control-label">
		                  <input type="radio" name="r1" class="minimal">&ensp;음력
		                </label>
	              	</div>	
			  	   <div class="col-sm-2">
						<select class="form-control">
							<option selected="selected">선택하세요</option>
						</select> 
			       </div>
			  	   <div class="col-sm-2">
						<select class="form-control">
							<option selected="selected">선택하세요</option>
						</select> 
			       </div>
			  	   <div class="col-sm-2">
						<select class="form-control">
							<option selected="selected">선택하세요</option>
						</select> 
			       </div>
				   </div>
					<div>
              			<input value="초기화" type="reset" href="#" class="btn btn-sm btn-danger btn-flat pull-right">
              			<input value="검색" type="submit" class="btn btn-sm btn-primary btn-flat pull-right">
          	    		<br>
          	    		<br>
          	    		<br>
          	    		
          	    	</div>
				</form>
				
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th scope="col" width="5%">No.</th>
                    <th scope="col" width="10%">사원번호</th>
                    <th scope="col" width="10%">부서</th>
                    <th scope="col" width="10%">성명</th>
                    <th scope="col" width="10%">이메일</th>
                    <th scope="col" width="10%">레벨</th>
                    <th scope="col" width="10%">전공</th>
                    <th scope="col" width="5%">병역여부</th>
                  </tr>
                  </thead>
                  <tbody>
            	  <c:forEach items="${empList}" var="empList">
                  <tr>
                  	<td>${empList.rnum}</td>
                    <td>${empList.emp_code }</td>
                    <td>${empList.emp_department }</td>
                    <td>${empList.emp_name}</td>
                    <td>${empList.emp_email}</td>
                    <td>${empList.emp_level}</td>
                    <td>${empList.emp_major}</td>
                    <td>${empList.emp_army}</td>
                  </tr>
                  </c:forEach>
                
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
           ${pagingUtil }
            <!-- /.box-body -->
            <div class="box-footer clearfix">	<!-- 테이블의 아래 하단부분(기본설정) -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
<!--               <ul class="pagination pagination-sm no-margin pull-right">	페이징버튼 (기본설정이나 본인의 임의로 설정가능) -->
<!--                 <li><a href="#">&laquo;</a></li>	 -->
<!--                 <li><a href="#">1</a></li>	페이징 갯수 박아놓은 부분 (수정가능) -->
<!--                 <li><a href="#">2</a></li> -->
<!--                 <li><a href="#">3</a></li> -->
<!--                 <li><a href="#">&raquo;</a></li> -->
<!--               </ul> -->
<!--             </div> -->
            <!-- /.box-footer -->
          		</div>
          <!-- /.box -->
        	</div>
       	</div>
      </div>
     </div>
	 </div>
	</section>
	
<script>
$(function(){
	$('#btn1').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardForm.do');
	});
})
</script>
  