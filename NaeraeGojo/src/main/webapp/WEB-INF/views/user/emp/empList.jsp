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
              			<table id="example1" class="table table-bordered table-striped dataTable table-hover"
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
				                  <tr class="babo odd" role="row">
				                  	<td><input type="hidden" value="${empList.emp_code}">${empList.rnum}</td>
				                    <td>${empList.emp_code }</td>
				                    <td>${empList.part_name }</td>
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
	             <!-- 모달시작 -->
               		<div class="modal modal-primary fade" id="modal-primary">
          				<div class="modal-dialog">
            				<div class="modal-content">
            					<div class="modal-header">
                					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  					<span aria-hidden="true">&times;</span></button>
                					<h4 class="modal-title">이메일 인증확인</h4>
              					</div>
              					<div class="modal-body">
								    이메일로 인증링크가 전송됩니다.
              					</div>
              					</div>
              					<div class="modal-footer">
                					<button type="button" id="emailCom" class="btn-outline">이메일 인증 전송</button>
              					</div>
            				</div>
            				<!-- /.modal-content -->
          				</div>
          				<!-- /.modal-dialog -->
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
// 	$('#example2').DataTable({
// 		'paging'      : true,
//     	'lengthChange': true,
//     	'searching'   : false,
//     	'ordering'    : true,
//     	'info'        : true,
//     	'autoWidth'   : false
// 	});
	
	// ========= 직원등록 후 List에 왔을 경우 ======================================
	// 이메일 인증
	if (eval('${!empty param.emailId}')) {
		$('#modal-primary').modal();
	}

	$('#emailCom').click(function(){
		if (eval('${!empty param.emailId}')){
			var email_nick = '${param.emailId}';
			var code = '${param.emp_code}';

			$.ajax({
			    type : 'post',
			    url : '${pageContext.request.contextPath}/mail/send.do?emailId=',
			    dataType : "json",
			    data : { email_nick : email_nick,
			    	code : code },
			    success : function(result) {
						alert("인증메일 발송을 성공하였습니다.");
				},
			    error : function(request, status, error) {
					alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
				}
			});
		}
		else if (eval('${empty param.emailId}')){
			alert("이메일이 잘못되었습니다. 다시 입력해주세요");
			return false;
		}
	});
	// =====================================================================
	
	// 직원등록 버튼 
	$('#empForm').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empForm.do');
	});
	$(document).on('click', 'table tr:gt(0)', function(){
		var emp_code = $(this).find('td:eq(0) input').val();
		$(location).attr('href', '${pageContext.request.contextPath}/user/emp/empView.do?emp_code=' + emp_code);
	});
});

</script>