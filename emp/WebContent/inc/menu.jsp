<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- navbar 메뉴 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
<!-- links -->
		<ul class="navbar-nav">
			<li class="nav-item active"> 
			<a class="nav-link" 
				href="<%=request.getContextPath()%>/departments/departmentsList.jsp"> 
				departmentsList</a>
			<li class="nav-item"> 
			<a class="nav-link" 
				href="<%=request.getContextPath()%>/deptEmp/deptEmpList.jsp"> 
				deptEmpList</a>
			<li class="nav-item"> 
			<a class="nav-link" 
				href="<%=request.getContextPath()%>/deptManager/deptManagerList.jsp"> 
				deptManagerList</a>
			<li class="nav-item">
			 <a class="nav-link" 
				href="<%=request.getContextPath()%>/employees/employeesList.jsp"> 
				employeesList</a>
			<li class="nav-item"> 
			<a class="nav-link" 
				href="<%=request.getContextPath()%>/salaries/salariesList.jsp"> 
				salariesList</a>
			<li class="nav-item"> 
			<a class="nav-link" 
				href="<%=request.getContextPath()%>/ titles/titlesList.jsp"> 
				titlesList</a>
		</ul>
<!-- Navbar text -->
		<span class="navbar-brand">
			Copyright. 강혜란
		</span>
	</nav>
	

	
