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
            <form class="form-horizontal">
              <div class="box-body">
              
              
              <table class="table no-margin" id="mpView">
                  <thead>
                  <tr>
                    <th scope="col" width="20%">소속부서</th>
                    <th scope="col" width="10%">레벨</th>
                    <th scope="col" width="10%">작성자</th>
                    <th scope="col" width="10%">PM</th>
                    <th scope="col" width="10%">PL</th>
                    <th scope="col" width="10%">TA</th>
                    <th scope="col" width="10%">DA</th>
                    <th scope="col" width="10%">UA</th>
                    <th scope="col" width="10%">AA</th>
                    <th scope="col" width="10%">BA</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
<!--                   foreach name + 1씩증가 클릭했을때 String값을 parseint로 바꿔 -->
                  	<td>개발1팀</td>
                    <td>특급</td>
                    <td>박희태</td>
                    <td><input type="radio" name="PO" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발1팀</td>
                    <td>특급</td>
                    <td>김기덕</td>
                    <td><input type="radio" name="PO1" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO1" class="flat-red"  ></td>
                    <td><input type="radio" name="PO1" class="flat-red"  ></td>
                    <td><input type="radio" name="PO1" class="flat-red"  ></td>
                    <td><input type="radio" name="PO1" class="flat-red"  ></td>
                    <td><input type="radio" name="PO1" class="flat-red"  ></td>
                    <td><input type="radio" name="PO1" class="flat-red"  ></td>
                  <tr>
                    <td>개발1팀</td>
                    <td>특급</td>
                    <td>진형용</td>
                    <td><input type="radio" name="PO2" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO2" class="flat-red"  ></td>
                    <td><input type="radio" name="PO2" class="flat-red"  ></td>
                    <td><input type="radio" name="PO2" class="flat-red"  ></td>
                    <td><input type="radio" name="PO2" class="flat-red"  ></td>
                    <td><input type="radio" name="PO2" class="flat-red"  ></td>
                    <td><input type="radio" name="PO2" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발1팀</td>
                    <td>고급</td>
                    <td>최동화</td>
                    <td><input type="radio" name="PO3" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO3" class="flat-red"  ></td>
                    <td><input type="radio" name="PO3" class="flat-red"  ></td>
                    <td><input type="radio" name="PO3" class="flat-red"  ></td>
                    <td><input type="radio" name="PO3" class="flat-red"  ></td>
                    <td><input type="radio" name="PO3" class="flat-red"  ></td>
                    <td><input type="radio" name="PO3" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발1팀</td>
                    <td>고급</td>
                    <td>김한솔</td>
                    <td><input type="radio" name="PO4" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO4" class="flat-red"  ></td>
                    <td><input type="radio" name="PO4" class="flat-red"  ></td>
                    <td><input type="radio" name="PO4" class="flat-red"  ></td>
                    <td><input type="radio" name="PO4" class="flat-red"  ></td>
                    <td><input type="radio" name="PO4" class="flat-red"  ></td>
                    <td><input type="radio" name="PO4" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발2팀</td>
                    <td>중급</td>
                    <td>안창렬</td>
                    <td><input type="radio" name="PO" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발2팀</td>
                    <td>중급</td>
                    <td>전 현</td>
                    <td><input type="radio" name="PO" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발2팀</td>
                    <td>중급</td>
                    <td>이소라</td>
                    <td><input type="radio" name="PO" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발2팀</td>
                    <td>초급</td>
                    <td>이쁜이</td>
                    <td><input type="radio" name="PO" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                  </tr>
                  <tr>
                  	<td>개발2팀</td>
                    <td>초급</td>
                    <td>양다일</td>
                    <td><input type="radio" name="PO" class="flat-red" checked ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                    <td><input type="radio" name="PO" class="flat-red"  ></td>
                  </tr>
                  
                  </tbody>
                </table>
              
                
              </div>
              
            </form>
            <table class="table no-margin" id="View">
             <tbody>
                  <thead>
                  <tr>
                    <th scope="col" width="10%">초급</th><td width="15%"><label id="begin">5</label></td>
                    <th scope="col" width="10%">중급</th><td width="15%"><label id="inter">5</label></td>
                    <th scope="col" width="10%">고급</th><td width="15%"><label id="high">5</label></td>
                    <th scope="col" width="10%">특급</th><td width="15%"><label id="spec">5</label></td>
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
	    
	  })
function change(value){
// 		$('#beginner').text("5");
		$.ajax({
			url : '${pageContext.request.contextPath}/user/join/join_ajax.do?rqpps_name='+ value,
			dataType: 'json',
			success : function(data){
				console.log(data);
				var info = data.mpJoinInfo;
				$('#begin').text(info.mp_begin);
				$('#inter').text(info.mp_inter);
				$('#high').text(info.mp_high);
				$('#spec').text(info.mp_spec);
			},
			error : function(res){
				alert(res.status);
			}
		})
};	  
</script>

          
          
