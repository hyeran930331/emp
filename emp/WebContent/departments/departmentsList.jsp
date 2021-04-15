<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!--page전체에 import불러오기 ="java패키지. sql클래스. *모든메소드/기능,액션 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>부서 목록</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">

		<!-- Navbar(메뉴) -->
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
		
		<h1>부서목록</h1>


		<%	
			Class.forName("org.mariadb.jdbc.Driver");
			//마리아 디비 드라이브 검색
			//org켠다 mariadb를 jdbc Drive자동으로 켜지게 = 마리아db 준비
		System.out.print("\n"); 
//1단계 드라이브 불러오기 성공하면 띄어쓰기 콘솔에 출력
		
			
			String url ="jdbc:mysql://localhost:3306/employees";
			//마리아 디비 유알엘 검색
			String user = "root";
			String pwd = "java1004";
			//길어지니깐 짧게하려고 변수지정.
			Connection conn = DriverManager.getConnection(url, user, pwd);
		System.out.println(conn);
		//클래스@위치
		System.out.println("사원들 DB:연결 성공");
//2단계 DB불러오기 성공 콘솔에 출력
		
		
//여기까지 모든 페이지 동일


// page.jsp를 만들어 넣으면 jsp에 복붙으로 입력하지 않아도 되는걸까요? 
// 강사님께서 안 좋은 방식이라 하심..

		int currentPage = 1;
         //현재페이지
		if(request.getParameter("currentPage") != null){
		//현재페이지가 널값이 아니라면
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
		
		int rowPerPage = 10;
         //한페이지에 몇행씩 볼래?
		int beginRow = (currentPage-1)*10;
         //시작은 0


			String sql = "select dept_no, dept_name from departments limit";
			PreparedStatement stmt = conn.prepareStatement(sql+" ?,?");
			stmt.setInt(1,beginRow);
			stmt.setInt(2,rowPerPage);
		System.out.println("from테이블:쿼리(명령) 실행해서 select 변수 값을 beginRwo 부터 rowPerPage 만큼 가져옴");
//3단계 완료되었는지 확인	
			ResultSet rs = stmt.executeQuery();
		System.out.println(rs);
//4단계 완료되었는지 확인	
			
//여기까지 sql stmt rs 동일해도 어차피 한페이지안에서니깐 충돌없음
//PreparedStatement ResultSet 메서드는 위에서 불러옴.
		
		%>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>dept_no</th>
					<th>dept_name</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()){
				%>
						<tr>
							<td><%=rs.getString("dept_no")%></td>
							<td><%=rs.getString("dept_name")%></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
	<%
         if(currentPage > 1){
         //현재 페이지가 1보다 크면 이전이 나오게 해라.
      %>
            <a href="<%=request.getContextPath()%>/departmentsList/depaartmentList.jsp?currentPage=<%=currentPage-1%>">이전</a>
      <%      
         }
      %>
      
      
      <%
         //PreparedStatement total = conn.prepareStatement("select count(*) from board");
         //ResultSet totalnum = total.executeQuery();
         //int totalNumtotalnum.getInt("board_no");
         //if(currentPage > 1){
         //현재 페이지가 전체게시글/페이지행 몫이 딱 떨어지거나. 몫보다 클때.
         //select count(*) from board
         //보드 케이블의 총 행수 구하는 쿼리.
      %>
            <a href="<%=request.getContextPath()%>/departmentsList/departmentList.jsp?currentPage=<%=currentPage+1%>">다음
            </a>
</div>
</body>
</html>