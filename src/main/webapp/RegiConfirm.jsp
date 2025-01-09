<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	int result = 0;
	
	String sql = "insert into tbl_resv_202109 values(?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql); 
	
	pstmt.setString(1,request.getParameter("resvno"));
	pstmt.setString(2,request.getParameter("empno"));
	pstmt.setString(3,request.getParameter("resvdate"));
	pstmt.setString(4,request.getParameter("seatno"));
	
	result = pstmt.executeUpdate();
	
	if(result == 1){
		%>
			<script>
			alert("좌석예약 정보가 등록되었습니다!");
			location = "Index.jsp";
			</script>
		<%
		}
		%>
