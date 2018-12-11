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

/* General code */
.button {
    display: inline-block;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 14px/100% Arial, Helvetica, sans-serif;
    padding: .5em 2em .55em;
    text-shadow: 0 1px 1px rgba(0,0,0,.3);
    -webkit-border-radius: .5em; 
    -moz-border-radius: .5em;
    border-radius: .5em;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {
    text-decoration: none;
}
.button:active {
    position: relative;
    top: 1px;
}
/* 사이즈 */
.bigrounded {
    -webkit-border-radius: 2em;
    -moz-border-radius: 2em;
    border-radius: 2em;
}
.medium {
    font-size: 12px;
    padding: .4em 1.5em .42em;
}
.small {
    font-size: 11px;
    padding: .2em 1em .275em;
}
/* 컬러 */
.orange {
    color: #fef4e9;
    border: solid 1px #da7c0c;
    background: #f78d1d;
    background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
    background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
}
.orange:hover {
    background: #f47c20;
    background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
    background: -moz-linear-gradient(top,  #f88e11,  #f06015);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
}
.orange:active {
    color: #fcd3a5;
    background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
    background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
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
                <table id="tableID" class="table no-margin table-hover">
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
                  <c:forEach items="${noticeAllList}" var="list"> 
                  <tr>
                  	<td><input type="hidden" value="${list.notice_all_code}">${list.rnum }</td>
                    <td>${list.notice_all_title }</td>
                    <td>${list.emp_name }</td>
                    <td>${list.notice_all_date }</td>
                    <td>
                      ${list.notice_all_hit}
                    </td>
                  </tr>
                  </c:forEach>
                  </tbody>
                </table>
                ${pagingHtmls }
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <!-- /.box-footer -->
            
          </div>
        <form action="${pageContext.request.contextPath }/user/noticeAll/notice_allList.do" method="post" class="form-inline pull-right">
	    
	    
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
        $(location).attr('href', '${pageContext.request.contextPath}/user/noticeAll/notice_allForm.do');
	})

	
    $('#tableID tr:gt(0)').click(function(){
//     	var rnum = $(this).find('td:eq(0)').text();
    	var notice_all_code = $(this).find('td:eq(0) input').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/noticeAll/notice_allView/'+notice_all_code+'.do');
    });
    
})

</script>