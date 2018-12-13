<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
.row{margin-bottom:10px;}
.control-label{
	font-size: 18px;
	margin-right: -20px;
}
 .no-margin {
    padding: 10px !important;
}
.123{
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
  .modal-body{
  
  width : 800px;
  }
  
  .box-title{
  	font-size : 40px !important;
  }
  .form-horizontal .control-label {
    padding-top: 2px !important;
    padding-right: 80px !important;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
	line-height: 2.428571 ;
}
</style>
<!--     Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
	<div class="col-md-6">
<!--           Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border" >
              <h3 class="box-title">인력투입 관리</h3>
            </div>
<!--             /.box-header -->
<!--             form start -->
            <form class="form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-4 control-label">관련 제안요청서</label>

                  <div class="col-sm-8">
                  <!-- select -->
                  <select class="form-control" onchange="change(this.value);">
                    <option id="selectPlease">선택해주세요</option>
                   <c:forEach items="${rqName }" var="rqList">
                    <option value="${rqList.rqpps_code}">${rqList.rqpps_name}</option>
                   </c:forEach>
                  </select>
                  </div>
                </div>
                
                
                <div class="row">
	<div class="col-md-12">
<!--           Horizontal Form -->
          <div class="box box-info">
            <form name="select_machine" class="form-horizontal">
              <div class="box-body">
              
              
              
                
              </div>
              
            </form>
            
            <table class="table no-margin" id="View">
             <tbody>
                  <thead>
                  <tr>
                  
                  <tr>
                    <th scope="col" width="30%" id="cho">&emsp;&emsp;&emsp;&emsp;특급</th>
                    <td width="15%"><label id="spec"></label></td>
                    <th scope="col" width="10%">
<!--                     <button value="특급"  onclick="level(this.value);" style="width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right">등록</button> -->
<!--                     <input value="등록" name="특급" onclick="level(this.name)"  type="button" style="width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right"> -->
                    <input value="등록" name="특급"  id="vaseSpec" type="button" style="font-size: 20px; width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right level">
                    </th>
                    <th scope="col" width="10%">
                    </th>
                  </tr>
                  
                  <tr>
                    <th scope="col" width="30%" id="cho">&emsp;&emsp;&emsp;&emsp;고급</th>
                    <td width="15%"><label id="high"></label></td>
                    <th scope="col" width="10%">
                    <input value="등록" name="고급" id="vaseHigh" type="button" style="font-size: 20px; width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right level">
<!--                     <button value="고급" onclick="level(this.value);" style="width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right">등록</button> -->
                    </th>
                    <th scope="col" width="10%">
                    </th>
                  </tr>
                  
                  <tr>
                    <th scope="col" width="30%" id="cho">&emsp;&emsp;&emsp;&emsp;중급</th>
                    <td width="15%"><label id="inter"></label></td>
                    <th scope="col" width="10%">
                    <input value="등록" name="중급" id="vaseInter" type="button" style="font-size: 20px; width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right level">
<!--                     <button value="중급"  onclick="level(this.value);" style="width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right">등록</button> -->
                    </th>
                    <th scope="col" width="10%">
                    <input type="hidden" value="" id="bb">
                    <input type="hidden" id="return">
<!--                     <input type="hidden" value="" id="bc"> -->
                    </th>
                  </tr>
                  
                   
                    <th scope="col" width="30%" id="cho">&emsp;&emsp;&emsp;&emsp;초급</th>
                    <td width="15%"><label id="begin"></label></td> 
                    <th scope="col" width="10%">
                    <input value="등록" name="초급" id="vaseBegin" type="button" style="font-size: 20px; width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right level">
<!--                     <button value="초급" onclick="level(this.value);" style="width : 150px; height : 50px;"  class="btn btn-sm btn-danger btn-flat pull-right">등록</button> -->
                    </th>
                    <th scope="col" width="10%">
                    </th>
                  </tr>
                  
                  </thead>
            </tbody>
            </table>
            
          </div>
            <br>
            <br>
          </div>
          </div>
                
              </div>
            </form>
          </div>
          </div>
	<div class="col-md-6" id="newTable">
<!--           Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border" >
              <h3 class="box-title">레벨별 직원 리스트</h3>
              &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
              <input value="등록" id="lastCheck" style="width:200px; height:50px; font-size: 25px;" type="button" disabled="" class="btn btn-sm btn-warning btn-flat pull-right">
            </div>
<!--             /.box-header -->
<!--             form start -->
            <form class="form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-4 control-label">&emsp;</label>
                </div>
                
                
                <div class="row">
	<div class="col-md-12">
<!--           Horizontal Form -->
          <div class="box box-info" style="overflow:scroll; width:770px; height:320px;">
            <form name="select_machine" class="form-horizontal">
              <div class="box-body">
              
              
              
                
              </div>
              
            </form>
            
            <table class="table no-margin" id="mView">
                  <thead>
                  <tr>
                    <th scope="col" width="36%">레벨</th>
                    <th scope="col" width="36%">이름</th>
                    <th scope="col" width="33%">체크여부</th>
                  </tr>
                  </thead>
                  <tbody id="bodytable">
<!-- 	                  <tr> -->
<%-- 	                  	<td>${list.emp_department }</td> --%>
<%-- 	                    <td>${list.emp_level }</td> --%>
<%-- 	                    <td>${list.emp_name }</td> --%>
<!-- 	                 </tr> -->

                 </tbody>
               </table>
          </div>
               <br>
<!--                <button id="modalNext" type="button" class="btn btn-sm btn-info btn-flat pull-right" >다음</button> -->
               
<!--                <div id="1234" class="123" style="padding-left: 670px;"> -->
               </div>
               <div>
               <input type="hidden" id="spec1" value=""/>
               </div>
               
          </div>
          </div>
                
              </div>
            </form>
          </div>
          </div>
          </div>
          </section>
          
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="container">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title" id="exampleModalLabel">권한 부여</h3>
      </div>
      <div class="modal-body">
<!--         	모달창입니다~ -->
	<div class="col-md-9">
<!--           Horizontal Form -->
          <div class="box box-info">
            <form class="form-horizontal">
              <div class="box-body">
              	<table class="table no-margin" >
                  <thead>
                  <tr>
                    <th scope="col" width="50%">이름</th>
                    <th scope="col" width="50%">레벨</th>
                  </tr>
                  </thead>
                  <tbody id="nextList">
<!-- 	                  <tr> -->
<%-- 	                  	<td>${list.emp_department }</td> --%>
<%-- 	                    <td>${list.emp_level }</td> --%>
<%-- 	                    <td>${list.emp_name }</td> --%>
<!-- 	                 </tr> -->

                 </tbody>
                 
               </table>
                
              </div>
            </form>
            
          </div>
          </div>
      </div>
      <div class="modal-footer">
              <input value="등록" id="aa" type="button" data-dismiss="modal" class="btn btn-sm btn-danger btn-flat pull-right">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
<!-- 	       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!-- 	       <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
  </div>
</div>


<script type="text/javascript">
$(function () {
	    //Initialize Select2 Elements
	    $('.select2').select2()
	
	    //iCheck for checkbox and radio inputs
	    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
	      checkboxClass: 'icheckbox_minimal-blue',
	      radioClass   : 'iradio_minimal-blue'
	    })
	    //Red color scheme for iCheck
	    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
	      checkboxClass: 'icheckbox_minimal-red',
	      radioClass   : 'iradio_minimal-red'
	    })
	    //Flat red color scheme for iCheck
	    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	      checkboxClass: 'icheckbox_flat-red',
	      radioClass   : 'iradio_flat-red'
	    })
	    
	    
	    $('#aa').click(function(){
	    	var len = $('#nextList tr').length;
	    	var insertNm=""; 
	    	for(var i=0; i< len; i++){ 
               var str = $('#nextList tr:eq('+i+')').find('td:eq(0) input').val();//<f로 준이유
               insertNm += str+"/";
            }
		
    		var select = $('#bb').val();
	    	
	    	$.ajax({
				url : '${pageContext.request.contextPath}/user/join/join_levelInsert.do',
				dataType: 'json',
				data : {
					
						"list":insertNm,
						"select":select
						
						},
				success : function(data){
					console.log(data);
					if(name == "특급"){
						$('#bodytable').empty();
						$('#vaseSpec').attr("disabled", true);
					}
					if(name == "고급"){
						$('#bodytable').empty();
						$('#vaseHigh').attr("disabled", true);
					}
					if(name == "중급"){
						$('#bodytable').empty();
						$('#vaseInter').attr("disabled", true);
					}
					if(name == "초급"){
						$('#bodytable').empty();
						$('#vaseBegin').attr("disabled", true);
					}
					if($('#vaseBegin').attr('disabled') == 'disabled' && $('#vaseInter').attr('disabled') == 'disabled' && $('#vaseHigh').attr('disabled') == 'disabled' && $('#vaseSpec').attr('disabled') == 'disabled'){
						$('#bodytable').empty();
						$('#lastCheck').attr("disabled", false);
						$('#lastCheck').click(function(){
							$(location).attr('href','${pageContext.request.contextPath}/user/join/join_list.do');
						});
					}
				},
				error : function(res){
					alert(res.status);
				}
			});
	    });
});


	name = "";
	
	
$(document).on('click', '.level', function(){
		name = $(this).parent().parent().find('th:eq(0)').text().trim();
// 		alert(name);
		
		
		
		
		var sel = $(this).parent().parent().find('label').text();
// 		alert(sel);
		$('#spec1').attr('value', sel);
		
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/join/join_specialList.do?emp_level='+ name,
			dataType: 'json',
			success : function(data){
				console.log(data);
				empLevelList = data.empLeveltest;
				var code ='';
				var code1 ='';
				$('#bodytable').empty();
				for (var i = 0; i < empLevelList.length; i++) {
					nextData = "";
					nextData += empLevelList[i].emp_level
							 +  "/"
							 +  empLevelList[i].emp_name
							 +  "/"
							 +  empLevelList[i].emp_code;
// 					nextData += empLevelList[i].emp_code
							 
					code += '<tr>';
// 					code += '<td>'+empLevelList[i].emp_department+'</td>';
					code += '<td>'+empLevelList[i].emp_level+'</td>';
					code += '<td>'+empLevelList[i].emp_name+'</td>';
					code += '<td><input type="checkbox" value="'+nextData+'" name="micro" class="flat-red" ></td>';
					code += '</tr>';
				}
					code += '<tr>';
					code += '	<td colspan="4">';
					code += '		<button id="modalNext" type="button" class="btn btn-sm btn-info btn-flat pull-right" style="width:70px; height:30px; font-size: 15px;">다음</button>';
					code += '	</td>';
					code += '</tr>';
				$('#bodytable').append(code);
// 				$('#1234').append(code1);
		
			},
			error : function(res){
				alert(res.status);
			}
		});
// 		$.ajax({
// 			url : '${pageContext.request.contextPath}/user/join/join_specialList.do?emp_level='+ name,
// 			dataType: 'json',
// 			success : function(data){
// 				console.log(data);
// 				empLevelList = data.empLeveltest;
// 				var code ='';
// 				$('#bodytable').empty();
// 				for (var i = 0; i < empLevelList.length; i++) {
// 					nextData = "";
// 					nextData += empLevelList[i].emp_level
// 							 +  "/"
// 							 +  empLevelList[i].emp_name
// 							 +  "/"
// 							 +  empLevelList[i].emp_code;
// // 					nextData += empLevelList[i].emp_code
							 
// 					code += '<tr>';
// // 					code += '<td>'+empLevelList[i].emp_department+'</td>';
// 					code += '<td>'+empLevelList[i].emp_level+'</td>';
// 					code += '<td>'+empLevelList[i].emp_name+'</td>';
// 					code += '<td><input type="checkbox" value="'+nextData+'" name="micro" class="flat-red" ></td>';
// 					code += '</tr>';
// 				}
// 					code += '<tr>';
// 					code += '	<td colspan="4">';
// 					code += '		<button id="modalNext" type="button" class="btn btn-sm btn-info btn-flat pull-right">다음</button>';
// 					code += '	</td>';
// 					code += '</tr>';
// 				$('#bodytable').append(code);
		
// 			},
// 			error : function(res){
// 				alert(res.status);
// 			}
// 		});
	});
	
	
	
	
	
	function change(value){
			$('#bb').val(value);
		
			$.ajax({
				url : '${pageContext.request.contextPath}/user/join/join_ajax.do?rqpps_code='+ value,
				dataType: 'json',
				success : function(data){
					if(data.ddd == "no"){
						alert("등록할수없습니다. 제안요청서 작성자가 작성해주시길바랍니다.");
						$(location).attr('href','${pageContext.request.contextPath}/user/join/join_list.do');
					}else{
					console.log(data);
					info = data.mpJoinInfo;
					$('#begin').text(info.mp_begin);
					$('#inter').text(info.mp_inter);
					$('#high').text(info.mp_high);
					$('#spec').text(parseInt(info.mp_spec)-1);
					}
					if($('#spec').text()==0){
						$('#vaseSpec').attr("disabled", true);
					}else{
						$('#vaseSpec').attr("disabled", false);
					}
				},
				error : function(res){
					alert(res.status);
				}
			});
	};	
	
	
	// 없어졌다 사라졌다를 생기는거는 document로 해야함 정적
	$(document).on('click', '#modalNext', function(){
		//특급
        var limitNum = parseInt($('#spec1').val());
        var num = 0;
        var insertNm = "";
        $("input[name='micro']:checked").each(function() {
        	num++;      
        });
	    if(num == limitNum){
		   $('#exampleModal').modal();
		   
		   var appendList ="";
           $("input[name='micro']:checked").each(function() {
              var arr = $(this).val();
//               parseInt($('#spec1').text())
              insertNm += arr +",";
              
              var arrstr = arr.split('/');
             
              appendList += '<tr>'
                             + '<td><input type="hidden" value="'+arrstr[2]+'"/>'
                             + arrstr[1]
                             + '</td>'
                             + '<td>'
                             + arrstr[0]
                             + '</td>'+
                         '</tr>';
           });
           $('#nextList').empty().append(appendList);
		   
	    }else{
	       alert(limitNum + "명에 맞게 선택해 주세요.");
		}
	});
	
	
</script>

          
          
