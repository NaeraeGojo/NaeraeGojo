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
    padding-right: 54px !important;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
	line-height: 2.428571 ;
}
</style>
<!--     Main content -->
    <section class="content">
    <br/><br/>
      <div class="row">
	<div class="col-md-12">
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
                  <label for="inputPassword3" class="col-sm-2 control-label">관련 제안요청서</label>

                  <div class="col-sm-10">
                  <!-- select -->
                  <select class="form-control" onchange="change(this.value);">
                    <option>선택해주세요</option>
                   <c:forEach items="${rqName }" var="rqList">
                    <option >${rqList.rqpps_name}</option>
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
              
              
              <table class="table no-margin" id="mpView">
                  <thead>
                  <tr>
                    <th scope="col" width="20%">소속부서</th>
                    <th scope="col" width="10%">레벨</th>
                    <th scope="col" width="10%">작성자</th>
<!--                     <th scope="col" width="10%">PM</th> -->
<!--                     <th scope="col" width="10%">PL</th> -->
<!--                     <th scope="col" width="10%">TA</th> -->
<!--                     <th scope="col" width="10%">DA</th> -->
<!--                     <th scope="col" width="10%">UA</th> -->
<!--                     <th scope="col" width="10%">AA</th> -->
<!--                     <th scope="col" width="10%">BA</th> -->
                  </tr>
                  </thead>
                  <tbody id="bodytable">

                  <c:forEach items="${empList }" var="list" begin="0" step="1" varStatus="status">
	                  <tr>
	<!--                   String값을 parseint로 바꿔 -->
	                  	<td>${list.emp_department }</td>
	                    <td>${list.emp_level }</td>
	                    <td>${list.emp_name }</td>
						<td>
				  <c:if test="${list.emp_level eq '특급'}">
                  		<select  id="test123" class="selbox form-control perfect"  onchange="select(this.value);">
							<option  value="">권한 선택</option>
		                    <option    value="PM/${list.emp_level }">PM</option>
		                    <option  value="PL/${list.emp_level }">PL</option>
			            </select>
                  </c:if>
                  <c:if test="${list.emp_level eq '고급'}">
                  		<select name="role" class="selbox form-control" onchange="select1(this.value);">
							<option value="">권한 선택</option>
		                    <option id="${list.emp_code }" value="PL/${list.emp_level }">PL</option>
			            </select>
                  </c:if>
                  <c:if test="${list.emp_level eq '중급'}">
                  		<select name="role" class="selbox form-control" onchange="select2(this.value);">
							<option id="test01" value="">권한 선택</option>
		                    <option  value="TA/${list.emp_level }">TA</option>
		                    <option  value="DA/${list.emp_level }">DA</option>
		                    <option  value="UA/${list.emp_level }">UA</option>
		                    <option  value="AA/${list.emp_level }">AA</option>
		                    <option  value="BA/${list.emp_level }">BA</option>
			            </select>
                  </c:if>
                  <c:if test="${list.emp_level eq '초급'}">
                  		<select name="role" class="selbox form-control" onchange="select3(this.value);">
							<option value="">권한 선택</option>
		                    <option  value="TA/${list.emp_level }">TA</option>
		                    <option  value="DA/${list.emp_level }">DA</option>
		                    <option  value="UA/${list.emp_level }">UA</option>
		                    <option  value="AA/${list.emp_level }">AA</option>
		                    <option  value="BA/${list.emp_level }">BA</option>
			            </select>
                  </c:if>
		              </td>
<%-- 	                    <td><input onchange="level(1)"  type="radio"  name="PO${status.index }" id="pm${status.index }" value="pm/${list.emp_name }" class="flat-red"></td> --%>
<%-- 	                    <td><input onchange="level(2)"  type="radio" name="PO${status.index }" id="pl${status.index }"  value="pl/${list.emp_name }" class="flat-red" ></td> --%>
<%-- 	                    <td><input onchange="level(3)"  type="radio" name="PO${status.index }" id="ta${status.index }"  value="ta/${list.emp_name }" class="flat-red" ></td> --%>
<%-- 	                    <td><input onchange="level(4)"  type="radio" name="PO${status.index }" id="da${status.index }" value="da/${list.emp_name }" class="flat-red" ></td> --%>
<%-- 	                    <td><input onchange="level(5)"  type="radio" name="PO${status.index }" id="ua${status.index }" class="flat-red" ></td> --%>
<%-- 	                    <td><input onchange="level(6)"  type="radio" name="PO${status.index }" id="aa${status.index }" class="flat-red" ></td> --%>
<%-- 	                    <td><input onchange="level(7)"  type="radio" name="PO${status.index }" id="ba${status.index }" class="flat-red" ></td> --%>
	                 </tr>
                 </c:forEach>
                 </tbody>
               </table>
              
                
              </div>
              
            </form>
            <table class="table no-margin" id="View">
             <tbody>
                  <thead>
                  <tr>
                    <th scope="col" width="10%" id="cho">초급</th><td width="15%"><label id="begin"></label></td>
                    <th scope="col" width="10%" id="mid">중급</th><td width="15%"><label id="inter"></label></td>
                    <th scope="col" width="10%" id="hig">고급</th><td width="15%"><label id="high"></label></td>
                    <th scope="col" width="10%" id="spe">특급</th><td width="15%"><label id="spec"></label></td>
                  </tr>
                  </thead>
            </tbody>
            </table>
          </div>
          </div>
          </div>
                
              </div>
              <div class="box-footer clearfix">
              <input value="취소" type="reset" href="javascript:void(0)" class="btn btn-sm btn-warning btn-flat pull-right">
              <input value="등록" type="button" href="javascript:void(0)" class="btn btn-sm btn-danger btn-flat pull-right">
          </div>
            </form>
          </div>
          </div>
          </div>
          </section>
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
	    
	  
	    
	    
	    
	    
// 	    var tmpArray = []
	    
// 	    tmpArray =  $('input[type=radio]:checked').val();
	    
// 	    var po = $('#pm${status.index }').text();
// 	   	 alert(po);
// 	    var PO = $('input[name="PO"]:checked').val();
//         	alert(PO);

//         var cho = $('#cho').text();
//         	alert(cho);
//         var mid = $('#mid').text();
//         	alert(mid);
//         var hig = $('#hig').text();
//         	alert(hig);
//         var spe = $('#spe').text();
//         	alert(spe);
	    
	  });
	function change(value){
			$.ajax({
				url : '${pageContext.request.contextPath}/user/join/join_ajax.do?rqpps_name='+ value,
				dataType: 'json',
				success : function(data){
					console.log(data);
					info = data.mpJoinInfo;
					$('#begin').text(info.mp_begin);
					$('#inter').text(info.mp_inter);
					$('#high').text(info.mp_high);
					$('#spec').text(info.mp_spec);
					$('.selbox').val('');
					$("select option[value*='PM/특급']").prop('disabled',false);//다시 초기화
					$("select option[value*='PM/특급']").css("background","white");//다시 초기화
					
				},
				error : function(res){
					alert(res.status);
				}
			})
	};	
	function select(value){
		//한번클릭만됨
// 		var check = value;
// 		$('.selbox').val('');
// 		$('#test123').val(value);


	// 이건 클릭하자마자 그 버튼이 disabled 됨 selected에 id값
// 	if (value == 'PM/특급') {
// 			$('#test123').attr('disabled', 'true');
// 	     } else {
// 	    	 $('#test123').attr('disabled', 'false');
// 	     }		
	// optional에  id값
	// 되긴되는데 뭔가 찝찝함
	if (value == 'PM/특급') {
			$("select option[value*='PM/특급']").prop('disabled',true);
			$("select option[value*='PM/특급']").css("background","red");
	     } else {
			$("select option[value*='PM/특급']").prop('disabled',false);
	     }		
	
// 	if (value == 'PM/특급') {
// 			$("select option[value*='PM/특급']").prop('disabled',false);
// 	     } else {
// 			$('#test123 option').first().attr('selected', 'selected');
// 	     }		
	
	//javascript
// 	var selectbox = document.getElementById("selectId");
// 	selectbox.selectedIndex = 0;
	//jquery
// 	var selectbox = $("#test123");
// 	selectbox.selectedIndex = 0;
	
// 	$('select').find('option:first').attr('selected', 'selected'); 셀렉트박스 초기화
	
	
	
// 		}
// 			parseInt($('#spec').text())-1
// 			specialo = parseInt($('#spec').text())-1;
// 			if($('#spec').text() == "0"){
// 				specialo = "0";
// 				return false;
// 			}
// 			var special2 = $('#spec').text(specialo);
			//권한없음 클릭시 +1 증가
			var special;
			if(value == "PM/특급"){
				special = parseInt($('#spec').text())-1;
			}else if(value == ""){
				special = parseInt($('#spec').text())+ 1;
			}
			$('#spec').text(special);
// 		} 
	}
	function select1(value){
		
// 			specialo1 = parseInt($('#high').text())-1;
// 			if($('#high').text() == "0"){
// 				specialo1 = "0";
				
// 				return false;
// 			}
// 			var special3 = $('#high').text(specialo1);
			var special = 0;
			if(value == "PL/고급"){
				special = parseInt($('#high').text())-1;
				if(special == -1 ){
					alert("다참");
// 					$(this).val("").prop("selected", true);
// 					$(this).find("option:eq(0)").prop('selected', true);
					alert("끝");
					return false;
				}
			}else if(value == ""){
				special = parseInt($('#high').text())+ 1;
			}
			$('#high').text(special);
			
			
	}
	function select2(value){
// 			specialo1 = parseInt($('#inter').text())-1;
// 			if($('#inter').text() == "0"){
// 				specialo1 = "0";
				
// 				return false;
// 			}
// 			var special3 = $('#inter').text(specialo1);

			if(value == "TA/중급" || value == "UA/중급"|| value == "DA/중급"|| value == "AA/중급"|| value == "BA/중급"){
				special = parseInt($('#inter').text())-1;
			}else if(value == ""){
				special = parseInt($('#inter').text())+ 1;
			}
			$('#inter').text(special);
			
	}
	function select3(value){
			var special;
			if(value == "TA/초급" || value == "UA/초급"|| value == "DA/초급"|| value == "AA/초급"|| value == "BA/초급"){
				special = parseInt($('#begin').text())-1;
			}else if(value == ""){
				special = parseInt($('#begin').text())+ 1;
			}
			$('#begin').text(special);
	}

// 	function level(attitude){
// 		alert("sdf");
// 		var dd = $('table tr td:eq(1)').text();
// 		var dr = $('table tr td:eq(1)').val();
		
// 		alert("안창렬1 " + dd  + "안창렬2 " + dr );
		
// 	}
</script>

          
          
