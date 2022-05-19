<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "dbconn_MYSQL.jsp" %>

<%
	//form 에서 Request 객체의 getParameter 로 폼에서 넘긴 변수의 값을 받는다.
	request.setCharacterEncoding("UTF-8");	 // 한글 깨지지 않도록 처리, EUC-KR, UTF-8
	
	String eno = request.getParameter("eno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String manager = request.getParameter("manager");
	String hiredate = request.getParameter("hiredate");
	String salary = request.getParameter("salary");
	String commission = request.getParameter("commission");
	String dno = request.getParameter("dno");
	
	
	Statement stmt = null;
	ResultSet rs = null;	//select한 결과를 담는 객체, Select 한 레코드셋을 담고 있다.
	String sql = null;
	
	//폼에서 넘겨받은 id와 passwd를 DB에서 가져온 ID, PASSWD를 확인해서 같으면 Update를 실행하고 다르면 Update하지 않는다 
	
	try{
		//폼에서 받은 id를 조건으로 해서 DB에 값을 select 해온다.
		sql = "SELECT eno, ename FROM emp_copy where eno ='" + eno + "'";
		stmt = conn.createStatement();  //conn의 createStatement()를 사용해서 stmt 객체를 활성화.
		
		rs = stmt.executeQuery(sql);
				//stmt.executeUpdate(sql) : insert, update, delete
				//stmt.executeQuery(sql)  : select 한 결과 ResultSet 객체로 값을 반환
				
		if(rs.next()) {		//DB에 폼에서 넘긴 ID가 존재하면 ==> 폼에서 넘긴 패스워드와 DB의 password가 일치 확인
			//out.println (id + ": 해당 아이디가 존재합니다. ");
		
		
			String rId = rs.getString("eno");
			String rPassword = rs.getString("ename");
			
			//폼에서 넘겨준 값과 DB에서 가져온 값이 일치 하는지 확인
			if(eno.equals(rId) && ename.equals(rPassword)){
		
				sql = "update emp_copy set eno ='"+ eno +"', ename = '" + ename+ "' where job = '"+ job+"'";
				// stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				out.println("테이블의 내용이 잘 수정되었습니다.");			
				
				out.println(sql); 
				
			}else{  
				out.println("사원명이 일치하지 않습니다.");
			}
			
		}else{ 
			out.println(eno + ": 해당 번호가 데이터 베이스에 존재하지 않습니다.");
		}									
		
		//out.println(sql);
		
	}catch(Exception ex){
		out.println(ex.getMessage());
		//out.println(sql);
	}finally {
		if (rs !=null)
			rs.close();
		if(stmt !=null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
	
	
	
	
	
	
%>

</body>
</html>