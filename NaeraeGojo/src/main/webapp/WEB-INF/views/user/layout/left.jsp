<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
         <c:if test="${!empty PHOTO.emp_code}">
          <img src="/img_user/${PHOTO.user_file_save_name}" class="img-circle" alt="User Image" style="height: 50px;">
         </c:if>
         <c:if test="${empty PHOTO.emp_code}">
         <img src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
         </c:if>
        </div>
        <div class="pull-left info">
          <p>
          	<c:if test="${!empty LOGIN_EMPINFO.emp_name}">
          		${LOGIN_EMPINFO.emp_nick}
          	</c:if>
          </p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN MENU</li>

        <li class="treeview">
         <a href="#">
            <i class="fa fa-th"></i> 
            <span>프로젝트 계획</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
         </a>
           <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/user/rfp/rfpList.do"><i class="fa fa-circle-o"></i>제안요청서 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/user/join/join_list.do"><i class="fa fa-circle-o"></i>인력투입 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/user/suggest/suggestList.do"><i class="fa fa-circle-o"></i>제안서 관리</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>프로젝트 수행</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">

            <li><a href="${pageContext.request.contextPath}/user/project/project_manage.do"><i class="fa fa-circle-o"></i>프로젝트 관리</a></li>
            
<%--             <c:if test="${LOGIN_EMPINFO.emp_role eq 'PL'}"> --%>
<%--             <li><a href="${pageContext.request.contextPath}/user/report/report_listPL.do"><i class="fa fa-circle-o"></i>보고서 관리</a></li> --%>
<%--             </c:if>  --%>
            
<%--             <c:if test="${LOGIN_EMPINFO.emp_role eq 'PM'}"> --%>
<%--             <li><a href="${pageContext.request.contextPath}/user/report/report_listPM.do"><i class="fa fa-circle-o"></i>보고서 관리</a></li> --%>
<%--             </c:if>  --%>
            
<%--             <c:if test="${LOGIN_EMPINFO.emp_role eq 'DEP'}"> --%>
<%--             <li><a href="${pageContext.request.contextPath}/user/report/report_listDev.do"><i class="fa fa-circle-o"></i>보고서 관리</a></li> --%>
<%--             </c:if>  --%>

          </ul>
        </li>
    
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>회의</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/user/video/chatList.do"><i class="fa fa-circle-o"></i>화상회의</a></li>
            <li><a href="${pageContext.request.contextPath}/user/meetingFile/meetingFileList.do"><i class="fa fa-circle-o"></i>회의록</a></li>
          </ul>
        </li>
        
        <c:if test="${LOGIN_EMPINFO.emp_role eq 'MANAGER'}">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> 
            <span>멤버관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/user/emp/empList.do"><i class="fa fa-circle-o"></i>직원 전체 조회</a></li>
          </ul>
        </li>
        </c:if>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table">
            </i> <span>게시판</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/user/pblancboard/pblancboardList.do"><i class="fa fa-circle-o"></i>공고게시판</a></li>
<%--             <li><a href="${pageContext.request.contextPath}/user/inqryboard/inqryList.do"><i class="fa fa-circle-o"></i>문의게시판</a></li> --%>
<%--             <li><a href="${pageContext.request.contextPath}/user/noticeAll/notice_allList.do"><i class="fa fa-circle-o"></i>공지사항 게시판</a></li> --%>
          </ul>
        </li>
        
        <c:if test="${LOGIN_EMPINFO.emp_role eq 'MANAGER'}">
         <li class="treeview">
          <a href="#">
            <i class="fa fa-clock-o">
            </i> <span>스케줄러</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/user/scheduler/schedulerList.do"><i class="fa fa-circle-o"></i>스케줄러</a></li>
          </ul>
        </li>
        </c:if>
       
      </ul>
    </section>
    <!-- /.sidebar -->
    </aside>
