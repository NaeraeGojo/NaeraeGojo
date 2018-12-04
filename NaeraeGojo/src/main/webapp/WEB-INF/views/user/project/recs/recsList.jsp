<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<style>
.table_recsroom tr{
	cursor: pointer;
}
.perful{
	width: 100% 
}
 .row, .table_recsroom {
	vertical-align : middle;
    text-align: center;
}

.table_recsroom>thead>tr>th {
	text-align: left;
}

.table_recsroom>tbody>tr>td{
	text-align: left;
	vertical-align: middle;
}

 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}

.pwcont{
	margin-left: 160px;
    margin-right: 160px;
    width: 80%;
    display: inline-block;
    text-align: initial;
}

.btn_pw_upper{
	color:white; 
	background-color:#8cd636; 
	border:1px outset; 
	width : fit-content; 
	margin-bottom:14px;
	margin-left: 10px;
	border-radius: 1em;
}

.input_foot{
	display: inline-block;
    width: 100%;
}

.center{
	margin-left: auto;
	margin-right: auto;
}

#pwcForm td{
	text-align: center;
}
.text_hideUp{
	border: none;
	border-bottom: 1px solid gray;
}
</style>
<script type="text/javascript">
$(function(){
	
// 	BootstrapDialog.show({
//         message: 'Hi Apple!',
//         buttons: [{
//             label: 'Button 1'
//         }, {
//             label: 'Button 2',
//             cssClass: 'btn-primary',
//             action: function(){
//                 alert('Hi Orange!');
//             }
//         }, {
//             icon: 'glyphicon glyphicon-ban-circle',
//             label: 'Button 3',
//             cssClass: 'btn-warning'
//         }, {
//             label: 'Close',
//             action: function(dialogItself){
//                 dialogItself.close();
//             }
//         }]
//     });
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	};
	
	$('.table_recsroom tr:gt(0)').click(function(){
		var recsroom_code = $(this).attr('code');
		
		var query = '?recsroom_code='+recsroom_code;
		
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
		
		$(location).attr('href','${pageContext.request.contextPath}/user/project/recs/recsView.do' + query);
	});
	
	$('#btn_recsForm').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/project/recs/recsForm.do');
	});

});


</script>
    
      <div class="row">	
      
      <div class="pwcont">
    	<div class="col-md-4 pull-right" style="width: auto;" >
<!-- 	      <input id="btn_pwcForm" value="+ 분류" type="button"  -->
<!-- 	      class="btn btn-lg btn_pw_upper" style="background-color: #dd4b39;" -->
<!-- 	      data-toggle="modal" data-target="#modal-default"> -->
	      <input id="btn_recsForm" value="+ 등록" type="button" class="btn btn-lg btn_pw_upper">
	    </div>
    </div>
    
    
    <div class="pwcont">
    
      <div class="col-md-12">	
          <div class="box box-2team">		
          
            <div class="box-header with-border">	
              <b class="box-title">자료실</b>
              	<sub><i class="fa fa-fw fa-angle-left"></i>${pv.project_name }<i class="fa fa-fw fa-angle-right"></i></sub>
              <br/><br/>
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">			
            
              <div class="table-responsive">
                <table class="table no-margin table-hover table_recsroom" >
                  <thead>						
                  <tr>
                    <th scope="col" width="10%" tex>No.</th>
                    <th scope="col" width="50%">제목</th>
                    <th scope="col" width="15%">작성자</th>
                    <th scope="col" width="15%">작성일</th>
                    <th scope="col" width="10%">조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${rl }" var="rv">
		                 <tr code="${rv.recsroom_code }">
       						<td>${rv.rnum }</td>
       						<td>${rv.recsroom_title }</td>
       						<td>${rv.emp_nick }</td>
       						<td>${rv.recsroom_date }</td>
       						<td>${rv.recsroom_hit }</td>
		                 </tr>
		          </c:forEach>
			      
                  </tbody>
                  
                </table>
                <c:if test="${empty rl}">
                	<div style="text-align: center;">
	                	<p style="margin-top: 20px;">
	                	작성된 게시글이 존재하지 않습니다.
    	            	</p>
			      	</div>
			      </c:if>
              </div>
              
            </div>
            ${page}
          </div>
          
        </div>
        
        <form action="${pageContext.request.contextPath}/user/project/recs/recsList.do" method="post" class="form-inline pull-right"
	   style="margin-right: 15px;">
			<select class="form-control" name="search_keycode" >
				<option value="total">전체</option>
				<option value="title">제목</option>
				<option value="nick">작성자</option>
				<option value="content">내용</option>
			</select>
			<input id="search_keyword"  name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		    <button type="submit" class="btn btn-primary form-control">검색</button>
		</form>
        
	   </div>
		
	</div>



        
</html>