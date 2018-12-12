<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.todo-list{
	background-color: white;
}
#updateBtn, #commitBtn{
	margin-right: 5px;
}
.upForm{
	margin-left: 15px;
}
#myChart{
	height: 100px;
	width: 250px;
	display: inline-table;
}
.chart2{
	width: 100%;
	height: 100%;

}

 #modal-container {
   width: 200%;
/*    One Modal  100%, Two modals  200% */
   overflow: hidden;
 } 
 
 
  .Mcon {
     width: 600px; 
     height: 750px;
     margin-top: 100px; 
     margin-left: auto; 
     margin-right: auto; 
     margin-bottom: 200px; 
 } 

 .mb{ 
  
     height: 60%; 
    margin: auto; 
     overflow-y:auto; 
     overflow-x:hidden; 
     margin: 15px; 
/*      border: 1px solid ;  */
  
 } 
  .dia {
   float: left;
   width: 50%;
   margin: 5px auto;
 } 

#empList{
   overflow-y: scroll; 
}

.modal-content{
	width : 800px;
}
.modal-body{
	height : 600px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	
	boalert = function(mes){
		BootstrapDialog.show({
	 	    title: '알림',
	 	    message: mes
		});
	}
	
	$('.btn_update').click(function(){
		project_code = $(this).attr('name');
		$('#updateForm input[name=project_code]').val(project_code);
	});
	
	$('#updateBtn').click(function(){
		
		var project_code = $('input[name=project_code]').val();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/project/pro/projectInfo.do',
            data : {'project_code' : project_code},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=project_code]').val(json.projectInfo.project_code);
            	
            	$('#updateForm input[name=project_name]').val(json.projectInfo.project_name);
            	$('#updateForm input[name=project_start]').val(json.projectInfo.project_start);
            	$('#updateForm input[name=project_end]').val(json.projectInfo.project_end);
            }
        });
	});
	
	$(document).on('click', '#commitBtn', function() {
		var project_name = $('#updateForm input[name=project_name]').val();
		var project_start = $('#updateForm input[name=project_start]').val();
		var project_end = $('#updateForm input[name=project_end]').val();
		
		if(project_name == '' || project_start == '' || project_end == ''){
			boalert("빈 항목이 존재합니다.");
			return false;
		}

		var formData = $('#update').serialize();
		
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/user/project/pro/updateProject.do',
            data : formData,
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(json){
            	$('input[name=project_code]').val(json.projectInfo.project_code);
            	
            	$('#update tr:eq(0) td:eq(2)').text(project_name);
            	$('#update tr:eq(1) td:eq(2)').text(project_start);
            	$('#update tr:eq(2) td:eq(2)').text(project_end);
            	
            	
                $('#updateForm').modal('hide');
                $(location).attr('href', '${pageContext.request.contextPath}/user/project/pro/project_manage_see.do?project_code='+'${projectInfo.project_code }');
            }
        });
	});
	
	$('#deleteBtn').click(function(){
	  	$(location).attr('href', '${pageContext.request.contextPath}/user/project/pro/deleteProject/${projectInfo.project_code}.do')
	});
	
	
	var complete = ${totalComplete}
    var ing = ${totalIng}
    var totalnew = ${totalNew}
    
    new Chart(document.getElementById("myChart"), {
        animation:true,
        type: 'doughnut',
        data: {
            labels: ["완료", "진행", "신규"],
                datasets: [
                {
                    backgroundColor: ["#f56954", "#00a65a","#f39c12"],
                    data: [complete,ing,totalnew]
                }
            ]
        },
        options: {
            legend: {
              position: 'right',
              labels: {
                    fontSize: 16,
                    padding: 25
              }
            }
        }
    });
    
    
    $('input[name=chkbox1].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-blue'
      });
    
    $('#addBtn').click(function() {
        
        if($("input[name=chkbox1]:checked").length == 0){
            alert("인원을 체크해주세요.");
            return false;
        }
        
        var code =[];
        var department =[];
        var name =[];
        var level =[];
        
        
        $("input[name=chkbox1]:checked").each(function(i) {
            
            var tr =  $("input[name=chkbox1]:checked").parent().parent().parent().eq(i);
            var td = tr.children();
             
            var emp_code = $(this).val();
            code.push(emp_code);
            var emp_department = td.eq(2).text();
            department.push(emp_department);
            var emp_name = td.eq(3).text();
            name.push(emp_name);
            var emp_level = td.eq(4).text();
            level.push(emp_level);
            
        });     
        
        $('#modal-container').animate({
            'margin-left': '-=100%'
        }, 500);
        
        
        $.ajax({
            type : 'POST',
            url : '${pageContext.request.contextPath}/user/project/empArray.do',
            data : {code : code, department : department, name : name, level : level},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(data){
                
                var text = '';
                for (var i = 0; i < data.code.length; i++) {
                    text += '<tr>';
                    text += '<td >'+data.code[i]+'</td>';
                    text += '<td >'+data.department[i]+'</td>';
                    text += '<td >'+data.name[i]+'</td>';
                    text += '<td>'+ data.level[i]+'</td>';
                    text += '<td>';
                    text += '<select class="form-control select2" >';
                    text += '<option >선택하여주세요</option>';
                    for (var j = 0; j < data.positionList.length; j++) {
                        
                        text += '<option value="'+data.code[i]+'">' + data.positionList[j].position_name + '</option>';
                    }
                    text += '</select>';
                    text += '</td>';
                    text += '</tr>';
                }
                $('#emp_table').empty().append(text);
                
            }
        });
    });
    
//     $(document).on('click', '.btn-next', function() {
//         $('#modal-container').animate({
//           'margin-left': '-=100%'
//         }, 500);
//     });

//     $(document).on('click', '.btn-back', function() {
//        $('#modal-container').animate({
//            'margin-left': '+=100%'
//        }, 500);
//     });
    
    $('.btn-back').click(function(){
         $('#modal-container').animate({
             'margin-left': '+=100%'
         }, 500);
    })
    

    $('#insert1').click(function(){
        
        
        var emp_array = [];
        var emp_position = [];
        
        $('select option:selected').each(function(i){
            if(this.text=='선택하여주세요') {
                alert("역할을 선택하여 주세요.")
                return false;
            } else if(this.text!='선택하여주세요'){
                
                emp_array.push(this.value);
                emp_position.push(this.text);
            }
        })
        
//         if(emp_array.indextOf("선택하여주세요")){
//          alert("역할을 선택하여 주세요.")
//          return false;
//         }
        $.ajax({
            type : 'POST',
            url : '${pageContext.request.contextPath}/user/project/empJoinInsert.do',
            data : {emp_array : emp_array, emp_position : emp_position},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(data){
                
                var currentPage = '${param.currentPage}';
                var query = '?project_code='+data.project_code;
                
                if (currentPage != null && currentPage != '') {
                    query += '&currentPage=' + currentPage;
                }

                var search_keyword = '${param.search_keyword}';
                var search_keycode = '${param.search_keycode}';

                if (search_keyword != null && search_keyword != '') {
                    query += '&search_keycode=' + encodeURI(search_keycode)
                            + '&search_keyword='
                            + encodeURI(search_keyword);
                }
                
                $(location).attr('href', '${pageContext.request.contextPath}/user/project/pro/project_manage_see.do' + query);

                
            }
        });
        
    });
	
	
});


function deleteEmp(join_code, emp_code) {
    if('${LOGIN_EMPINFO.emp_code}' == emp_code){
    	alert('본인은 삭제할 수 없습니다.');
    	return false;
    }else if('${LOGIN_EMPINFO.emp_code}' != emp_code){
    	
	    $.ajax({
	    	type : 'POST',
	        url : '${pageContext.request.contextPath}/user/project/deleteEmp.do',
	        data : {join_code : join_code},
	        dataType : 'json',
	        error: function(xhr, status, error){
	            alert(error);
	        },
	        success : function(data){
	        	var text = '';
	        	for (var i = 0; i < data.joinList.length; i++) {
	        		text +='<li>';
	        		text +='<span class="handle"> <i class="fa fa-user"></i></span>';
	        		text +='<span class="text"><input type="hidden" name="emp_code" value="'+data.joinList[i].emp_code+'">['+data.joinList[i].emp_department + '] &ensp;' + data.joinList[i].emp_name+ '('+data.joinList[i].position_name +')</span>';
	        		text +='<div class="tools"><i class="fa fa-remove"  onclick="deleteEmp('+data.joinList[i].join_code +','+data.joinList[i].emp_code+')"></i></div>';
	        		text +='</li>';
				}
	        	
	        	$('#empUL').empty().append(text);
	        }
	    });
    };
    
    

    
    
}


</script>
<section class="content">
	<div class="row"> 
		<section class="col-lg-7 connectedSortable">

			<div class="row">
				<div class="col-md-12">
					<div class="nav-tabs-custom">
						<div class="box box-2team" style="height:480px">
							
							<div class="box-header with-border">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab_2" data-toggle="tab"><font size="2">진행 현황</font></a></li>
									<li ><a href="#tab_1" data-toggle="tab"><font size="2">업무 목록</font></a></li>
								</ul>
							</div>
							
							<div class="tab-content">
								<div  class="tab-pane box-body"  id="tab_1">
									<div class="table-responsive">
										<table id="modal1" class="table no-margin table-hover">
											<thead>
												<tr>
													<th>No.</th>
													<th>업무</th>
													<th>업무</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>

								<div class="tab-pane active box-body" id="tab_2">
									<div class="row">
										<div class="col-md-8">
											<div class="chart-responsive">
												<canvas id="myChart" class="chart2"></canvas> 
											</div>
										</div>
									</div>
									<div class="box-footer no-padding" >
										<ul class="nav nav-pills nav-stacked">
											<li>
												<a href="#"> 완료
													<span class="pull-right text-red">
														<c:if test="${totalComplete > 0}">
															<fmt:formatNumber value="${totalComplete/(totalComplete+totalIng+totalNew)*100}"
 															pattern=".0"/> %
 														</c:if> 
														<c:if test="${totalComplete == 0}">
															0 %
														</c:if>
													</span>
												</a>
											</li>
											<li>
												<a href="#"> 진행중 
													<span class="pull-right text-green">
														<c:if test="${totalIng > 0}">
															<fmt:formatNumber value="${totalIng/(totalComplete+totalIng+totalNew)*100}" 
															pattern=".0"/> % 
														</c:if>
														<c:if test="${totalIng == 0}">
															0 %
														</c:if>
													</span>
												</a>
											</li>
											<li>
												<a href="#"> 신규
													<span class="pull-right text-yellow">
														<c:if test="${totalNew > 0}">
															<fmt:formatNumber value="${totalNew/(totalComplete+totalIng+totalNew)*100}"
															pattern=".0"/> %
														</c:if>
														<c:if test="${totalNew == 0}">
															0 %
														</c:if>
													</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								
							</div>
							<div class="box-footer clearfix"></div>
						</div>
					</div>
				</div>
			</div>

			<div class="box box-2team">
				<div class="box-header with-border">
					<h3 class="box-title">프로젝트</h3>
				</div>
				<div class="box-body">
					<input type="hidden" name="project_code" value="${projectInfo.project_code }"> 
					<dl class="dl-horizontal">
						<dt>프로젝트명</dt>          <dd>${projectInfo.project_name }</dd>
						<dt>프로젝트 시작일</dt>      <dd>${projectInfo.project_start }</dd>
				        <dt>프로젝트 예상 종료일</dt>  <dd>${projectInfo.project_end }</dd>
						<dt>프로젝트 진척도</dt>      <dd>${projectInfo.pw_percent } %</dd>
						<dt>프로젝트 예산</dt>        <dd>${projectInfo.suggest_cost }</dd>
						<dt>프로젝트 수요기관</dt>     <dd>${projectInfo.rqpps_notice_agency}</dd>
						<c:if test="${LOGIN_EMPINFO.emp_code == projectInfo.emp_code }">
						<input value="삭제" id="deleteBtn" type="button" class="btn btn-sm btn-danger btn-flat pull-right">
						<input value="수정" id="updateBtn" type="button" class="btn btn-sm btn-warning btn-flat pull-right"
						data-toggle="modal" data-target="#updateForm">
						</c:if>
					</dl>
				</div>
			</div>
		</section>
		
		<section class="col-lg-5 connectedSortable">
			<div class="box box-2team">
				<div class="box-header">
					<i class="fa fa-users"></i>
					<h3 class="box-title">참여 인원</h3>
				</div>
				<div class="box-body" style="height: 607px" id="empList">
					<ul class="todo-list" id="empUL">
						<c:forEach items="${joinList}" var="joinList">
						<li>
							<span class="handle"> <i class="fa fa-user"></i></span>
							<span class="text"><input type="hidden" name="emp_code" value="${joinList.emp_code }">[${joinList.emp_department }] &ensp;${joinList.emp_name }(${joinList.position_name })</span> 
							<div class="tools"><i class="fa fa-remove"  onclick="deleteEmp(${joinList.join_code },${joinList.emp_code })"></i></div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="box-footer clearfix no-border">
					<button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-plus"></i> 인원 추가
					</button>
				</div>
			</div>
		</section>
	
		<div class="modal fade" id="updateForm">
			<div class="modal-dialog" style="top: 20%;">
				<div class="modal-content" style="width: 90%">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">내용 수정</h4>
					</div>
					<div class="modal-body" style="height: 220px">
						<form id="update" method="post">
							<input type="hidden" name="project_code">
							<tr>
		              			<td style="width:60px;"><label class="control-label">프로젝트 명</label></td>
		              			<td>
		              				<input name="project_name" type="text" class="form-control" style="border-radius: 1em; width: 100%;">
		              			</td>
              				</tr>
              				<tr>
		              			<td style="width:60px;"><label class="control-label">프로젝트 시작일</label></td>
		              			<td>
		              				<input name="project_start" type="date" class="form-control" style="border-radius: 1em; width: 100%;">
		              			</td>
              				</tr>
              				<tr>
		              			<td style="width:60px;"><label class="control-label">프로젝트 예상종료일</label></td>
		              			<td>
		              				<input name="project_end" type="date" class="form-control" style="border-radius: 1em; width: 100%;">
		              			</td>
              				</tr>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal">취소</button>
						<button id="commitBtn" type="button" class="btn btn-warning btn_Upda">수정</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>
</section>

<!-- 모달 -->       
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div id="modal-container">
  
    <div class="modal-dialog dia" role="document">
      <div class="modal-content Mcon" >
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 class="modal-title" id="myModalLabel">프로젝트 인원 추가</h3>
        </div>
        
        <div class="modal-body mb" style="margin-bottom:auto;" id="projectdiv">
             <div  class="row" style=" overflow-y:scroll; width:775px; height:600px;">
                <div class="form-group">
                    <div id="ff"></div>
              </div>      
                        
              <table class="table no-margin" id="mView" >
                  <thead>
                  <tr>
                    <th scope="col" width="10%"></th>
                    <th scope="col" width="18%">사원번호</th>
                    <th scope="col" width="18%">소속부서</th>
                    <th scope="col" width="18%">이름</th>
                    <th scope="col" width="15%">레벨</th>
                  </tr>
                  </thead>
                  <tbody id="bodytable" >
                    <c:forEach items="${empList }" var="empInfo">
                    <tr>
                        <td><input type="checkbox" value="${empInfo.emp_code}" name="chkbox1" class="flat-red" ></td>
                        <td>${empInfo.emp_code}</td>
                        <td>${empInfo.emp_department}</td>
                        <td>${empInfo.emp_name}</td>
                        <td>${empInfo.emp_level}</td>
<!--                         <td> -->
<!--                             <select class="form-control select2" id="POselectBox"> -->
<%--                                 <c:forEach items="${positionList }" var="positionInfo"> --%>
<%--                                  <option id="">${positionInfo.position_name}</option> --%>
<%--                                 </c:forEach> --%>
<!--                             </select> -->
<!--                         </td> -->
                     </tr>
                     </c:forEach>

                 </tbody>
               </table>
             </div>           
        
        
        </div> 
        <div class="modal-footer" >
            <button type="button" class="btn btn-secondary btn-next" id="addBtn" >추가</button>
            <button type="button" class="btn btn-secondary"  data-dismiss="modal">Close</button>
        </div>
    </div>
    </div>
    
    
    <div class="modal-dialog dia" role="document">
      <div class="modal-content Mcon">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 class="modal-title" id="myModalLabel">직원 역할 지정</h3>
        </div>
        <div class="modal-body mb">
           <div id= "tb">
	           <table class="table no-margin" id="roleTable" >
	                  <thead>
	                  <tr>
	                    <th scope="col" width="18%">사원번호</th>
	                    <th scope="col" width="18%">소속부서</th>
	                    <th scope="col" width="18%">이름</th>
	                    <th scope="col" width="15%">레벨</th>
	                    <th scope="col" width="20%">부서</th>
	                  </tr>
	                  </thead>
	                  <tbody id="emp_table" >

                     </tbody>
               </table>
            </div>
        </div>
        <div class="modal-footer" style="padding-bottom : 5px !important;  padding-top : 5px !important;">
          <button type="back" class="btn btn-default btn-back">뒤로가기</button>
          <input type="button" id="insert1" value="등록" class="btn btn-primary ">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  </div>

