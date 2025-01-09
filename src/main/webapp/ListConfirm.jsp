<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<jsp:include page="Header.jsp"></jsp:include>

<%
request.setCharacterEncoding("UTF-8");
String empno = request.getParameter("empno");
boolean b = false;

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select te.empno, te.empname, substr(tr.resvdate, 1, 4), substr(tr.resvdate, 5, 2), substr(tr.resvdate, 7, 2), ts.seatno, ts.office, ts.callno "
            + "from tbl_emp_202109 te, tbl_seat_202109 ts, tbl_resv_202109 tr "
            + "where te.empno = tr.empno and ts.seatno = tr.seatno and te.empno = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, empno);
ResultSet rs = pstmt.executeQuery();

List<String[]> results = new ArrayList<>();
while (rs.next()) {
    b = true;
    String[] row = {
        rs.getString(1),
        rs.getString(2),
        rs.getString(3),
        rs.getString(4),
        rs.getString(5),
        rs.getString(6),
        rs.getString(7),
        rs.getString(8)
    };
    results.add(row);
}

if (b) {
%>
<br>
<h2 style="text-align: center;">사원번호 : <%= empno %>님의 좌석예약조회</h2>
<br>
<section style="display: flex; justify-content: center;">

        <table border="1" style="border-spacing: 0px;">
            <tr>
                <th>사원번호</th>
                <th>이름</th>
                <th>근무일자</th>
                <th>좌석번호</th>    
                <th>좌석위치</th>    
                <th>내선번호</th>      
            </tr>
            <%
            for (String[] row : results) {
            %>
            <tr>
                <td><%= row[0] %></td>
                <td><%= row[1] %></td>
                <td><%= row[2] %>년<%= row[3] %>월<%= row[4] %>일</td>
                <td><%= row[5] %></td>
                <td><%= row[6] %></td>
                <td><%= row[7] %></td>
            </tr>
            <%
            }
            %>
        </table>
</section>
<br>
<div style="display: flex; justify-content: center;">
<input type="button" value="돌아가기" onclick="fn_home();">
</div>
<%
} else {
%>
<br>
<br>
<h1 style="display: flex; justify-content: center;">좌석예약정보가 존재하지 않습니다!</h1>
<br>
<div style="display: flex; justify-content: center;">
<input type="button" value="돌아가기" onclick="fn_home();">
</div>
<%
}
rs.close();
pstmt.close();
conn.close();
%>
<script type="text/javascript">
function fn_home() {
	location = "Index.jsp";
}
</script>
</body>
</html>
