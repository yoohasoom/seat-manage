<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
th {
padding: 0 10px;
}
td {
text-align: center;
}
</style>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select empno, empname, deptcode, position from tbl_emp_202109";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">부서별근무일수집계</h2>
<br>
<section style="display: flex; justify-content: center;">

	<table border="1" style="border-spacing: 0px;">
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>부서명</th>
			<th>근무일수</th>
		</tr>
		<%
		while(rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3).equalsIgnoreCase("10") ? "구매팀" : rs.getString(3).equalsIgnoreCase("20") ? "영업팀" : (rs.getString(3).equalsIgnoreCase("30") ? "총무팀" : "")%></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<%
		}
		%>
	</table>
</section> 
</body>
</html>