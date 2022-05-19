<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%@ include file = "dbconn_MYSQL.jsp" %>


<%
	request.setCharacterEncoding("UTF-8");	 // 한글 깨지지 않도록 처리, EUC-KR, UTF-8

	String eno = request.getParameter("eno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String manager = request.getParameter("manager");
	String hiredate = request.getParameter("hiredate");
	String salary = request.getParameter("salary");
	String commission = request.getParameter("commission");
	String dno = request.getParameter("dno");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;	//select한 결과를 담는 객체, Select 한 레코드셋을 담고 있다.
	String sql = null;
	
	try {
		//레코드 삭제, 폼에서 넘긴 ID, Passwd와 DB의 ID와 Passwd가 일치할때 레코드 제거, id(primary key)
		sql = "select eno, ename from emp_copy where job = ?";		
		pstmt = conn.prepareCall(sql);
		pstmt.setString(1, job);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){	// ID가 존재할 때
			//rs의 결과 레코드를 변수에 할당.
			String rEno = rs.getString("eno");
			String rEname = rs.getString("ename");
			
			//패스워드가 일치하는지 확인
			if (ename.equals(rEname)){	
				sql = "delete emp_copy where eno = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, eno);
				pstmt.executeUpdate();
				
				out.println("테이블에서 사원번호 : " + eno + " 가 잘 삭제되었습니다.");
				
				out.println(sql);
			}else{ 
				out.println("사원번호가 일치하지 않습니다.");				
			}
			
		}else{	
			out.println("해당 사원번호는 존재하지 않습니다.");
		}
				
		//out.println(sql);
		

	}catch(Exception ex){
		out.println(ex.getMessage());

	}finally {
		if (rs !=null)
			rs.close();
		if(pstmt !=null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
	




%>
</body>
</html>