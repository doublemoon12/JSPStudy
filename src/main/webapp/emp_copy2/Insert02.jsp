<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method = "post" action = "insert02_process.jsp">
		<p>사원번호 : <input type = "text" name = "eno">
		<p>사원명 :	<input type = "text" name = "ename">
		<p>직책 :		<input type = "text" name = "job">
		<p>매니저 :	<input type = "text" name = "manager">
		<p>입사일 :<input type = "text" name = "hiredate">
		<p>월급 :<input type = "text" name = "salary">
		<p>보너스 :<input type = "text" name = "commission">
		<p>부서번호 :<input type = "text" name = "dno">
		<p> <input type = "submit" values = "전송">
	

</body>
</html>