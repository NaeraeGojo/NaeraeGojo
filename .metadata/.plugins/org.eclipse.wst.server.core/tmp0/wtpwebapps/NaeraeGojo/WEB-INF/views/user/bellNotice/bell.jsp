<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
    $('#modal1 tr:gt(0)').click(function(){
    	
        $('#exampleModal').modal('show');
    });
   
});
</script>    
    
    
<style>
label{
	margin : 5px;
}
input[type="text"].form-control1 {
	height: 35px;
    margin: 5px;
    padding: 0 20px;
    vertical-align: middle;
    background: #fff;
    border: 2px solid #888;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 35px;
    color: #888;
    -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
    -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
    -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
}
textarea.form-control1 {
	height: 100px;
	margin: 5px;
    padding: 0 20px;
    vertical-align: middle;
    background: #fff;
    border: 2px solid #888;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 35px;
    color: #888;
    -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
    -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
    -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
}
   .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
    
.box-body{
    overflow-y: scroll; 
    height:150px;
    
}
table th,td{
    text-align: center;

}
</style>



<!-- 이슈 알림 -->
      
      <div class="row">
      <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
             <h3 class="box-title">이슈 알림
              <span class="label label-warning pull-right">3</span></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>발생 이슈</th>
                    <th>작성자</th>
                    <th>이슈단계</th>
                    <th>작성날짜</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>1</td>
                    <td>OR9842</td>
                    <td>Call of Duty IV</td>
                    <td>2018-11-14</td>
                    <td>
                      <div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
                    </td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>OR1848</td>
                    <td>Samsung Smart TV</td>
                    <td>2018-11-14</td>
                    <td>
                      <div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
                    </td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>OR7429</td>
                    <td>iPhone 6 Plus</td>
                    <td>2018-11-14</td>
                    <td>
                      <div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div>
                    </td>
                  </tr>


                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        </div>
      
      
      
      
      <!-- 피드백 알림 -->
      <div class="row">
      <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
             <h3 class="box-title">피드백 알림
              <span class="label label-warning pull-right">2</span></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table id="modal1" class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>피드백 내용</th>
                    <th>대상자</th>
                    <th>작성날짜</th>
                    <th>상태</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>1</td>
                    <td ><label>[받은 피드백]</label>OR9842</td>
                    <td>Call of Duty IV</td>
                    <td>2018-11-14</td>
                    <td>
                      <div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
                    </td>
                  </tr>
                  <tr>
                  	<td>2</td>
                    <td><label>[보낸 피드백]</label>OR1848</td>
                    <td>Samsung Smart TV</td>
                    <td>2018-11-14</td>
                    <td>
                      <div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        </div>
        
        <!-- 화상회의 초대 알림 -->
        
        <div class="row">
        <div class="col-md-12">
  		<!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">화상회의 초대
              <span class="label label-warning pull-right">2</span></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" >
              <div class="table-responsive">
                <table  class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>채팅방 이름</th>
                    <th>초대자</th>
                    <th>초대날짜</th>
                    <th>참여여부</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                  	<td>1</td>
                    <td>OR9842</td>
                    <td>Call of Duty IV</td>
                    <td>2018-11-14</td>
                    <td>
                     <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  <tr>
                  	<td>2</td>
                    <td>OR1848</td>
                    <td>Samsung Smart TV</td>
                    <td>2018-11-14</td>
                    <td>
                     <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
             </div>
              </div>
              </div>
            
<!-- 프로젝트 초대 알림 -->
        
        <div class="row">
        <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">프로젝트 초대 알림
              <span class="label label-warning pull-right">2</span></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>프로젝트명</th>
                    <th>초대자</th>
                    <th>초대날짜</th>
                    <th>참여여부</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>1</td>
                    <td>OR9842</td>
                    <td>Call of Duty IV</td>
                    <td>2018-11-14</td>
                    <td>
                      <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>OR1848</td>
                    <td>Samsung Smart TV</td>
                    <td>2018-11-14</td>
                    <td>
                      <input type="button" class="btn btn-primary " value="참여">
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>            
            
            
            
       				
       	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="container">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	        <h4 class="modal-title" id="exampleModalLabel">피드백 상세내용</h4>
	      </div>
	      <div class="modal-body">
	         <div class="row">
		        <label class="form-control1 col-md-2" style="margin">보낸 사람</label>
		        <input type="text" class="form-control1 col-md-8" placeholder="">
	         </div>
	          <div class="row">
		      	<label class="form-control1 col-md-2">관련업무</label>
		        <input type="text" class="form-control1 col-md-8" placeholder="">
	      	 </div>
	          <div class="row">
		      	<label  class="form-control1 col-md-2">내용</label>
		        <textarea class="form-control1 col-md-8" placeholder="내용을 입력하세요">
		        </textarea>
	      	 </div>
	      	 <div class="row">
	      	 	<label class="col-md-2 pull-right">읽음</label>
	      	 </div>
	      </div>
	 
	      <div class="modal-footer">
<!-- 		       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!-- 		       <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	  </div>
	</div>
       <!-- /.modal-content -->
       <!-- /.modal-dialog -->
          <!-- /.box-body -->
          <div class="box-footer clearfix">
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
          </div>
          <!-- /.box-footer -->
        </div>
        <!-- /.box -->
      </div>
      </div>
      <!-- /.col -->
