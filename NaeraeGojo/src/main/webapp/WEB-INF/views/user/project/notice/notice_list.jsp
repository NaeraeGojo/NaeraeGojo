<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
	font-size: 30px !important;
}
.tab-content {
	padding: 30px !important;
}
</style>



    <!-- Main content -->
    <section class="content">
               <div class="box box-info">
            <div class="box-header with-border">
              <b class="box-title">공지사항</b>	
              <br/><br/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th scope="col" width="10%">No.</th>
                    <th scope="col" width="30%">제목</th>
                    <th scope="col" width="20%">작성자</th>
                    <th scope="col" width="20%">작성날짜</th>
                    <th scope="col" width="10%">조회수</th>
                  </tr>
                  </thead>
                  <tbody id="noticeV">
                  <c:forEach items="${noticeList}" var="list"> 
                  <tr>
                  	<td><input type="hidden" value="${list.notice_code}">${list.rnum }</td>
                    <td>${list.notice_title }</td>
                    <td>${list.emp_name }</td>
                    <td>${list.notice_date }</td>
                    <td>
                      ${list.notice_hit}
                    </td>
                  </tr>
                  </c:forEach>
                  </tbody>
                
                </table>
                <c:if test="${empty noticeList}">
                	<div style="text-align: center;">
	                	<p style="margin-top: 20px;">
	                	작성된 게시글이 존재하지 않습니다.
    	            	</p>
			      	</div>
			      </c:if>
              </div>
              <!-- /.table-responsive -->
            </div>
                ${pagingHtmls }
            <!-- /.box-body -->
            <div class="box-footer clearfix">
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
<!--               <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
              <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
            </div>
            <!-- /.box-footer -->
            
          </div>
        <form action="${pageContext.request.contextPath }/user/project/notice/notice_list.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
<!-- 			<option>검색조건</option> -->
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" id="btn2" class="btn btn-info form-control">등록</button>
		</form>
              </div>
              <!-- /.tab-pane -->
            
            
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
        
	</section>
	
<script type="text/javascript">
$(function(){
	$('#btn2').click(function(){
        $(location).attr('href', '${pageContext.request.contextPath}/user/project/notice/notice_form.do');
	})
	
	
    $('table tr:gt(0)').click(function(){
//     	var rnum = $(this).find('td:eq(0)').text();
    	var notice_code = $(this).find('td:eq(0) input').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/project/notice/notice_view/'+notice_code+'.do');
    });
    
})

</script>