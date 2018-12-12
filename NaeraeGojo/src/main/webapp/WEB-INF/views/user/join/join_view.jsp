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
.form-control[readonly]{
	background-color: white;
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
                    <input type="text" class="form-control" name="rqpps_name"  readonly>
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
	                    <c:if test="${list.emp_level  eq '특급' }">
		                    <td><select  name="position_name"  id="PLselectSP" class="test123 selbox form-control perfect"  readonly onchange="select(this.value);">
<!-- 								<option  value="">권한 선택</option> -->
							<c:if test="${empty list.position_name}">
								<option  value="">권한 선택</option>
							</c:if>
							<c:if test="${!empty list.position_name}">
								<option  value="${list.position_name}">${list.position_name}</option>
							</c:if>
			                    <option  value="PL">PL</option>
				            </select></td>
<!-- 				            <td><input value="삭제" id="delete" type="button" class="btn btn-sm btn-danger btn-flat pull-right"></td> -->
<%-- 				            <td><input type="hidden" value="${ list.join_code}" name="join_code" /></td> --%>
	                    </c:if>
	                    <c:if test="${list.emp_level  eq '중급' || list.emp_level  eq '고급'}">
	                    <td><select  name="position_name"  id="PLselectMB" class="test123 selbox form-control perfect"  onchange="select(this.value);">
<%-- 							<option  value="${list.position_name}">권한 선택</option> --%>
							<c:if test="${empty list.position_name}">
								<option  value="">권한 선택</option>
							</c:if>
							<c:if test="${!empty list.position_name}">
								<option  value="${list.position_name}">${list.position_name}</option>
							</c:if>
		                    <option  value="PL">PL</option>
		                    <option  value="TA">TA</option>
		                    <option  value="DA">DA</option>
		                    <option  value="UA">UA</option>
		                    <option  value="AA">AA</option>
			            </select></td>
<!-- 			            <td><input value="삭제" id="delete" type="button" class="btn btn-sm btn-danger btn-flat pull-right"></td> -->
	                    </c:if>
	                    <c:if test="${list.emp_level  eq '초급' }">
	                    <td><select  name="position_name"  class="test123 selbox form-control perfect"  >
							<c:if test="${empty list.position_name}">
								<option  value="">권한 선택</option>
							</c:if>
							<c:if test="${!empty list.position_name}">
								<option  value="${list.position_name}">${list.position_name}</option>
							</c:if>
		                    <option  value="TA">TA</option>
		                    <option  value="DA">DA</option>
		                    <option  value="UA">UA</option>
		                    <option  value="AA">AA</option>
			            </select></td>
<!-- 			            <td><input value="삭제" id="delete" type="button" class="btn btn-sm btn-danger btn-flat pull-right"></td> -->
	                    </c:if>
	                 </tr>
	                </c:forEach>
	                  
                 </tbody>
               </table>
              </div>
              </div>
              <div class="box-footer clearfix">
<!--               <input value="추가" type="button" id="listAdd" data-toggle="modal" data-target="#modal1"  class="btn btn-sm btn-danger btn-flat pull-right level"> -->
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
      <div class="modal-body" style=" border-top:1px solid orange; height:680px; ">
      <form class="form-horizontal" id="sdfd" role="form"  action="${pageContext.request.contextPath}/user/join/join_add_insert.do" 
                            method="post" >
            <div  class="row" style="padding:30px; overflow:scroll; width:775px; height:600px;">
                <div class="form-group">
                    <div id="ff"></div>
              </div>      
                        
              <table class="table no-margin" id="mView" >
                  <thead>
                  <tr>
                    <th scope="col" width="20%">NO.</th>
                    <th scope="col" width="20%">소속부서</th>
                    <th scope="col" width="20%">레벨</th>
                    <th scope="col" width="20%">이름</th>
                    <th scope="col" width="20%">체크여부</th>
                  </tr>
                  </thead>
                  <tbody id="bodytable"  >
                  		<input type="hidden" value="${ rqpps_code}" name="rqpps_code" />
	                  	<input type="hidden" value="${ project_code}" name="project_code" />
                  
               		<c:forEach items="${addList }" var="alist">
	                  <tr>
<%-- 	                  	<input type="hidden" value="${ alist.emp_code}" name="emp_code" /> --%>
		                  	<td>${ alist.rnum}</td>
		                    <td>${alist.part_name}</td>
		                    <td>${alist.emp_level}</td>
		                    <td>${alist.emp_name}</td>
		                    <td><input type="checkbox" value="${ alist.emp_code}" name="micro" class="flat-red" ></td>
		                    <input type="hidden" name ="myArray">
	                 </tr>
	                </c:forEach>

                 </tbody>
               </table>
             </div>
      <div class="modal-footer">
      		<input type="button" id="modalAdd" class="btn btn-primary" value="등록">
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
		
		$('#modalAdd').click(function(){
			var myArray= [];
	        $('input[name=micro]:checked').each(function(index){
	            myArray.push( $(this).val());
	       });
		
			var rqpps_code = $('input[name=rqpps_code]').val();
			var project_code = $('input[name=project_code]').val();
		        
	 		$.ajax({
		            
		            type : "POST"
		                , url : "${pageContext.request.contextPath}/user/join/join_add_insert.do"
		                , dataType : "json"
		                , data: {myArray : myArray,
				                rqpps_code:rqpps_code,
								project_code:project_code}
		                		
		                , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		                , error : function(request, status, error) {
		                    boalert("error : " + request.status );
		                }
		                , success : function(list) {
		                	alert(list.rqpps_code);
		                	$(location).attr('href','${pageContext.request.contextPath}/user/join/join_view.do?rqpps_code='+list.rqpps_code);
		                	
		                }
		    });
		});
		
		
		
		
		
		
		
		$('#delete').click(function(){
	    	var  join_code = $('input[name=join_code]').val();
	    	var rqpps_code = $('input[name=rqpps_code]').val();
	    	$.ajax({
	            
	            type : "POST"
	                , url : "${pageContext.request.contextPath}/user/join/deleteAddList.do"
	                , dataType : "json"
	                , data: { join_code:join_code,
	                		  rqpps_code:rqpps_code}
	                		
	                , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	                , error : function(request, status, error) {
	                    boalert("error : " + request.status );
	                }
	                , success : function(list) {
	                	alert("삭제되었습니다.");
// 	                	$(this).parent().parent().remove();
	                	$(location).attr('href','${pageContext.request.contextPath}/user/join/join_view.do?rqpps_code='+rqpps_code);
	                	
	                }
	    });
// 	    	$(location).attr('href','${pageContext.request.contextPath}/user/join/deleteAddList/'+join_code+'.do');
	    });
	});
	
	function select(value){
		//한번클릭만됨
	//		var check = value;
	//		$('.selbox').val('');
	//		$('#test123').val(value);
	
	
	// 이건 클릭하자마자 그 버튼이 disabled 됨 selected에 id값
	//	if (value == 'PM/특급') {
	//			$('#test123').attr('disabled', 'true');
	//	     } else {
	//	    	 $('#test123').attr('disabled', 'false');
	//	     }		
	// optional에  id값
	// 되긴되는데 뭔가 찝찝함
	var headers = $('.test123 option:checked');
            // 반복문을 써서 반복 : for문보다는 jQuery의 each문이 사용하기 편리
	
	
            for (var i = 0; i < headers.length; i++) {
// 				list.push($(headers[i]).val())
//             	alert($(headers[i]).val());
                if($(headers[i]).val("PL")){
//                 	$("select option[value='']").attr("selected", true);
                	$(headers[i]).find("option[value='']").val();
                }
           		$(this).val("PL");
            }

//         	$("form[name='"+formName+  "'] select[name='"+objId+"'] option").remove();  
//          $("form[name='"+formName+  "'] select[name='"+objId+"']").append("<option value="">==SELECT==</option>");
			

	
// 	if (value == 'PL') {
// 			$("select option[value*='PL']").prop('disabled',true);
// 			$("select option[value*='PL']").css("background","red");
// 	     } else {
// 			$("select option[value*='PL']").prop('disabled',false);
// 	     }		
	
	//	if (value == 'PM/특급') {
	//			$("select option[value*='PM/특급']").prop('disabled',false);
	//	     } else {
	//			$('#test123 option').first().attr('selected', 'selected');
	//	     }		
	
	//javascript
	//	var selectbox = document.getElementById("selectId");
	//	selectbox.selectedIndex = 0;
	//jquery
	//	var selectbox = $("#test123");
	//	selectbox.selectedIndex = 0;
	
	//	$('select').find('option:first').attr('selected', 'selected'); 셀렉트박스 초기화
	
		}


</script>
