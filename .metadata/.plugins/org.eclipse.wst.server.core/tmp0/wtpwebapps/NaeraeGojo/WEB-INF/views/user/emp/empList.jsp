<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- Main content -->
<style>
.box-title{
	font-size: 30px !important;
}
</style>
    <section class="content">
      <div class="row">
        <div class="box box-danger">
            <div class="box-header">
              <h2 class="box-title">직원 전체 조회</h2>
              <br/><br/>
              <input value="+직원등록" type="button" id="empForm" class="btn btn-sm btn-danger btn-flat pull-right" style="font-size:15px; width:100px; height:40px; border-radius: 1em;">
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap" id="example1_wrapper">
              	<div class="row">
              		<div class="col-sm-12">
              			<table id="example1" class="table table-bordered table-striped dataTable"
              			role="grid" aria-describedby="example1_info">
		                	<thead>
		               			<tr role="row">
		                			<th tabindex="0" class="sorting_asc" aria-controls="example1" style="width:5%;"
		                			aria-sort="ascending" rowspan="1" colspan="1">No.</th>
				                    <th tabindex="0" class="sorting" aria-controls="example1" style="width:10%;" 
				                  	 rowspan="1" colspan="1">사원번호</th>
		                  			<th tabindex="0" class="sorting" aria-controls="example1" style="width:10%;" 
		                  			rowspan="1" colspan="1">부서</th>
		                  			<th tabindex="0" class="sorting" aria-controls="example1" style="width:10%;" 
		                  			rowspan="1" colspan="1">성명</th>
				                 	<th tabindex="0" class="sorting" aria-controls="example1" style="width:10%;" 
		                  			rowspan="1" colspan="1">이메일</th>
				                 	<th tabindex="0" class="sorting" aria-controls="example1" style="width:10%;" 
		                  			rowspan="1" colspan="1">레벨</th>
				                 	<th tabindex="0" class="sorting" aria-controls="example1" style="width:10%;" 
		                  			rowspan="1" colspan="1">전공</th>
				                 	<th tabindex="0" class="sorting" aria-controls="example1" style="width:5%;" 
		                  			rowspan="1" colspan="1">병역여부</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                		<c:forEach items="${empList}" var="empList">
				                  <tr class="odd" role="row">
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
	             </div>
            </div>
           </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
<script>

$(function () {
	$('#example1').DataTable();
	$('#example2').DataTable({
		'paging'      : true,
    	'lengthChange': true,
    	'searching'   : false,
    	'ordering'    : true,
    	'info'        : true,
    	'autoWidth'   : false
	});
	$('#empForm').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empForm.do');
	});
});

</script>