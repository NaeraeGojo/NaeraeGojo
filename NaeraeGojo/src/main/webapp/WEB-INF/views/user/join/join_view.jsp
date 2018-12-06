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
              <input value="목록" type="button" id="returnList" class="btn btn-sm btn-warning btn-flat pull-right">
              <input value="수정" type="submit"  class="btn btn-sm btn-info btn-flat pull-right">
<!--               <button type="button" class="btn btn-sm btn-info btn-flat pull-right" data-toggle="modal" data-target="#exampleModal">피드백</button> -->
              </div>
            </form>
          </div>
          </div>
          </div>
          </section>
          
<script type="text/javascript">
$(function(){
	$('input[name=rqpps_name]').val('${joList[0].rqpps_name}');
	$('#returnList').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/join/join_list.do');
	});
});


</script>
