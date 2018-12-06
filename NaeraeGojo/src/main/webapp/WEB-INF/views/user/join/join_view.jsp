<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.modal-content{
	width : 800px;
}
.modal-body{
	height : 600px;
}
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
label {
	font-size: 20px !important;
}
.col-md-11 {
	margin: 10px;
}
.test1 {
    width: 99%;
  }
  
  .box-title{
  	font-size : 40px !important;
  }
table{
 	padding-left: 40px !important;
 }
th{
 	padding-left: 40px !important;
 }
td{ 
  	padding-left: 40px !important;
} 
select{
	width: 150px !important;


}
</style>
<!--     Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
	<div class="col-md-12">
<!--           Horizontal Form -->
          <div class="box box-info" >
            <div class="box-header with-border" >
              <h3 class="box-title">인력투입 관리</h3>
            </div>
<!--             /.box-header -->
<!--             form start -->
            <form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/user/join/join_updateRole.do" method="post">
              <div class="box-body" >
                
                <div class="form-group">
                  <label for="inputPassword2" class="col-sm-2 control-label" >제목</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="rqpps_name"  >
                  </div>
                </div>
                
               <div class="form-group" style="overflow:scroll; width:1600px; height:640px;" >
                <table class="table no-margin"  id="mView"  >
                  <thead >
                  <tr>
                    <th scope="col" width="25%">NO.</th>
                    <th scope="col" width="25%">레벨</th>
                    <th scope="col" width="25%">이름</th>
                    <th scope="col" width="25%">직책</th>
                  </tr>
                  </thead>
                  <tbody >
                  	<c:forEach items="${joList }" var="list">
	                  <tr>
	                  	<input type="hidden" value="${ list.join_code}" name="join_code" />
	                  	<input type="hidden" value="${ list.rqpps_code}" name="rqpps_code" />
	                  	<input type="hidden" value="${ list.project_code}" name="project_code" />
	                  	<input type="hidden" value="${ list.emp_code}" name="emp_code" />
	                  	<td>${ list.rnum}</td>
	                    <td>${list.emp_level}</td>
	                    <td>${list.emp_name}</td>
	                    <td><select  name="position_name" id="test123" class="selbox form-control perfect"  onchange="select(this.value);">
							<option  value="">권한 선택</option>
		                    <option  value="PM">PM</option>
		                    <option  value="PL">PL</option>
			            </select></td>
	                 </tr>
	                </c:forEach>
	                  
                 </tbody>
               </table>
              </div>
              </div>
              <div class="box-footer clearfix">
              <input value="추가" type="button" id="listAdd" data-toggle="modal" data-target="#modal1"  class="btn btn-sm btn-danger btn-flat pull-right level">
              <input value="목록" type="button" id="returnList" class="btn btn-sm btn-warning btn-flat pull-right">
              <input value="수정" type="submit"  class="btn btn-sm btn-info btn-flat pull-right">
<!--               <button type="button" class="btn btn-sm btn-info btn-flat pull-right" data-toggle="modal" data-target="#exampleModal">피드백</button> -->
              </div>
            </form>
          </div>
          </div>
          </div>
          </section>
          
          <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="container">
  <div class="modal-dialog" role="document">
    <div class="modal-content"   >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title" id="exampleModalLabel">인력 추가</h3>
      </div>
      <div class="modal-body" style=" border-top:1px solid orange;">
      <form class="form-horizontal" role="form"  action="${pageContext.request.contextPath}/user/join/join_add_insert.do" 
                            method="post" >
<!--          <div  class="row" style="padding-left:35px"> -->
<!--            <select class="col-sm-3" id="pw_function" style="margin:5px; height:30px;" > -->
<!--             <option selected="selected">분류</option> -->
<!--            </select> -->
<!--            <input class="col-sm-4"type="text" style="margin:5px; height:30px;"> -->
<!--            <button class="col-sm-2" class="btn btn-flat" style="margin:5px; height:30px;">검색</button> -->
<!--            </div > -->
            <div  class="row"  style="padding:30px;">
                <div class="form-group">
                    <div id="ff"></div>
              </div>      
                        
              <div class="form-group">
					<label for="inputPassword2" class="col-sm-2 control-label" style="margin-top: 10px !important;">제목</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="report_feed_title" name="report_feed_title" style="margin-top: 10px !important">
					</div>
				</div>
				</br></br>
                <div class="form-group">
					<label for="inputPassword2" class="col-sm-2 control-label" style="margin-top: 10px !important;">발신</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="emp_name" name="emp_name" style="margin-top: 10px !important">
						<input type="hidden" class="form-control" value="${vo.emp_code }" name="emp_code">
						<input type="hidden" class="form-control" value="${vo.report_code }" name="report_code">
						<c:forEach items="${stList }" var="list">
							<input type="hidden" class="form-control" value="${list.pl_name }" name="pl_name">
						</c:forEach>
						
					</div>
				</div>
				</br>
				<div class="form-group">
					<label for="inputPassword1" class="col-sm-2 control-label" style="margin-top: 10px !important;">내용</label>
					<div class="col-sm-9">
						<textarea rows="10" type="text" class="form-control" id="report_feed_content" name="report_feed_content" style="margin-top: 10px !important"></textarea>
					</div>
				</div>
             </div>
      <div class="modal-footer">
      		<input type="submit" id="modalAdd" class="btn btn-primary" value="등록">
<!--            <button type="submit" id="modalAdd" class="btn btn-primary" data-dismiss="modal">등록</button> -->
      </div>
      </form>
    </div>
  </div>
  </div>
</div>
</div>
          
<script type="text/javascript">
$(function(){
	$('input[name=rqpps_name]').val('${joList[0].rqpps_name}');
	$('#returnList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/join/join_list.do');
	});
	
	$('#listAdd').click(function(){
		  var rqpps_code = $('input[name="rqpps_code"]').val();
		  var project_code = $('input[name=project_code]').val();
// 		  var emp_code = $('input[name=emp_code]').val();
//		  $(location).attr('href','${pageContext.request.contextPath}/user/report/feedDEV/'+report_code+'/'+emp_code+'.do');
		  
		  $.ajax({
				url : '${pageContext.request.contextPath}/user/join/listAdd.do',
				dataType: 'json',
				data : {
					
					rqpps_code:rqpps_code,
					project_code :project_code
						
						},
				success : function(data){
					console.log(data);
					alert(data.rpo.report_feed_title);
					$('input[name=report_feed_title]').val(data.rpo.report_feed_title);
					$('input[name=report_feed_content]').val(data.rpo.report_feed_content);
					$('input[name=pm_name]').val(data.rpo.pm_name);
				},
				error : function(res){
					alert(res.status);
				}
			});
	 })
});


</script>
