<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">근무좌석예약</h2>
<br>
<section style="display: flex; justify-content: center;">
		<form action="RegiConfirm.jsp" name="form" >
			<table border="1" style="border-spacing: 0px;">
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="resvno" id="resvno">예) 20210001</td>
				</tr>
				
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="empno" >예) 1001</td>
				</tr>
				
				<tr>
					<th>근무일자</th>
					<td><input type="text" name="resvdate" >예) 20211231</td>
				</tr>
				
				<tr>
					<th>좌석번호</th>
					<td><input type="text" name="seatno">예) S001 ~ S009</td>
				</tr>
				<tr>
				<td colspan="2" style="text-align: center;">
				<input type="submit" value="등록" onclick="fn_submit(); return false;">
				<button type="reset" onclick="fn_reset();">다시쓰기</button></td>
				</tr>
			</table>
		</form>
</section>
<script>
function fn_submit(){
	var f = document.form;	
	
	if(f.resvno.value == ""){
		alert("예약번호가 입력되지 않았습니다.");
		f.resvno.focus(); return false;
	}
	if(f.empno.value == ""){
		alert("사원번호가 입력되지 않았습니다.");
		f.empno.focus(); return false;
	}
	if(f.resvdate.value == ""){
		alert("근무일자가 입력되지 않았습니다.");
		f.resvdate.focus(); return false;
	}
	if(f.seatno.value == ""){
		alert("좌석번호가 입력되지 않았습니다.");
		f.seatno.focus(); return false;
	}
	
	f.submit();
}
function fn_reset(){
	var f = document.form;
	
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	f.resvno.focus();
}
</script> 
</body>
</html>