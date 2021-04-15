<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!--page전체에 import불러오기 ="java패키지. sql클래스. *모든메소드/기능,액션 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사원별 연봉</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">

		<!-- Navbar(메뉴) -->
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
		
		<h1>연봉 목록</h1>
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
		//현재페이지가 값request.getParameter("currentPage")이 null이 아니라면
		//왜냐 첫페이지가 나오고 있기때문
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//현재페이지 = 현재 페이지값을 넣는다.
      }
		
		int rowPerPage = 10;
         //한페이지에 몇행씩 볼래?
		int beginRow = (currentPage-1)*10;
         //시작은 0
		
		// String sql ="SELECT emp_no, salary, from_date, to_date FROM salaries limit ";
//콤마뒤 띄어쓰기!
			PreparedStatement stmt = conn.prepareStatement("SELECT emp_no, salary, from_date, to_date FROM salaries limit ?,?");
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
		
		<table class="table">
			<thead>
				<tr>
					<th>emp_no</th>
					<th>salary</th>
					<th>상/중/하</th>
					<th>from_date</th>
					<th>to_date</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()){
				%>
						<tr>
							<td><%=rs.getInt("emp_no")%></td>
							<td><%=rs.getInt("salary")%></td>
							<td>
							<%
								if(rs.getInt("salary")>80000){
							%>
								<span style="color:red">상</span>
							<% 
								} else if (rs.getInt("salary")>50000){
							%>
								<span style="color:grey">중</span>
							<%
								} else {
							%>
								<span style="color:green">하</span>
							<%
								}
									
							%>
							</td>
							<td><%=rs.getString("from_date")%></td>
							<td><%=rs.getString("to_date")%></td>
				<%
					}
				%>
			</tbody>
		</table>
		<%
         if(currentPage > 1){
         //현재 페이지가 1보다 크면 이전이 나오게 해라.
      %>
            <a href="<%=request.getContextPath()%>/salaries/salariesList.jsp?currentPage=<%=currentPage-1%>">이전</a>
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
            <a href="<%=request.getContextPath()%>/salaries/salariesList.jsp?currentPage=<%=currentPage+1%>">다음
            </a>
</div>
</body>
</html>