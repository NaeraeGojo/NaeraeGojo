<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="wrapper">
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<br/>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
	모달 연습용 버튼
</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleAlem">
	알림 연습용 버튼
</button>

<!-- 알림창 -->
<div class="modal fade" id="exampleAlem" tabindex="-1" aria-hidden="true">
  <div class="container">
	<br/><br/>
	<br/><br/>
	<div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
	  <strong>Warning!</strong> 이슈가 발생하였습니다.
	</div>
   </div>
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
        <h3 class="modal-title" id="exampleModalLabel">Modal title</h3>
      </div>
      <div class="modal-body">
        	모달창입니다~
      </div>
      <div class="modal-footer">
	       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	       <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
  </div>
</div>
</div>
</div>