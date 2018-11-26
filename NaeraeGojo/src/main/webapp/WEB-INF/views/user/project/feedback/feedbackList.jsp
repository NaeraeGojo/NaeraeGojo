<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom" id="divdiv">
            <ul class="nav nav-tabs">
                <li class="active"><a href="${pageContext.request.contextPath}/user/project/issue/issueList.do">받은 피드백</a></li>
                <li><a href="${pageContext.request.contextPath}/user/project/issue/issueResultList.do">보낸 피드백</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <b class="box-title">받은 피드백</b><br/>
                            <br/>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <table class="table no-margin table-hover" id="issue">
                                    <thead>
<!--                                         <tr id="trtr"> -->
<!--                                             <th scope="col" width="5%" tex>No.</th> -->
<!--                                             <th scope="col" width="23%">프로젝트명</th> -->
<!--                                             <th scope="col" width="23%">관련 업무</th> -->
<!--                                             <th scope="col" width="7%">보낸사람</th> -->
<!--                                             <th scope="col" width="10%">받은날짜</th> -->
<!--                                             <th scope="col" width="5%">상태</th> -->
<!--                                         </tr> -->
                                        <tr id="trtr">
                                            <th scope="col" width="5%" tex>No.</th>
                                            <th scope="col" width="10%"></th>
                                            <th scope="col" width="10%">받은날짜</th>
                                            <th scope="col" width="5%">상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${empty receivefbList}">
					                   <tr >
					                    <td onclick='event.cancelBubble=true;' colspan="6" >받은 피드백이 없습니다.</td>
					                  </tr>
					                  </c:if>
					                  
					                  <c:if test="${!empty receivefbList}">                  
					                  <c:forEach items="${receivefbList }" var="receiveInfo">
					                  <tr>
					                    <td><input type="hidden" name="feedback_code" value="${receiveInfo.feedback_code}">${receiveInfo.rnum}</td>
					                    <td><label>${receiveInfo.emp_name }</label> 님께서 피드백을 보냈습니다.</td>
					                    <td>${receiveInfo.feedback_st }</td>
					                    <c:if test="${receiveInfo.feedback_alarm=='n' }">
					                       <td>미확인</td>
					                    </c:if>
					                    <c:if test="${receiveInfo.feedback_alarm=='y' }">
					                       <td>확인</td>
					                    </c:if>
					                  </tr>
					                  </c:forEach>
					                   </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        ${pagingUtil}
                    </div>

                    <form action="${pageContext.request.contextPath}/user/project/issue/issueList.do" method="post" class="form-inline pull-right">
                        <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" /> 
                        <select class="form-control" name="search_keycode">
                            <option value="TOTAL">전체</option>
                            <option value="ISSUE">제목</option>
                            <option value="LEVEL">등급</option>
                        </select>
                        <button type="submit" class="btn btn-primary form-control">검색</button>
                        <button type="button" id="" class="btn btn-warning form-control">이슈 차트</button>
                        <button type="button" id="insertIssue" class="btn btn-danger form-control">이슈 등록</button>
                        <button type="button" id="listBtn1" class="btn btn-info form-control">프로젝트 목록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>