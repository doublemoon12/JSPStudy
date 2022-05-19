<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*, java.util.*, java.text.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>	<!-- 한글 처리 -->

<%@ include file = "dbconn_oracle.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>폼의 값을 받아서 DataBase에 값을 넣어주는 파일</title>
</head>
<body>
<%	
	//폼에서 넘긴 변수를 받아서 저장.
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");

	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String ymd = myformat.format(yymmdd);
	
	String sql = null;
	Statement st = null;
	int cnt = 0;		// Insert가 잘되었는지 그렇지 않은지 확인하는 변수.
	
	try {
		
		sql = "INSERT INTO guestboard ( name, email, inputdate,";
		sql = sql + "subject, content)";
		sql = sql + " values ('"  + na + "','" + em ;
		sql = sql + "','" + ymd + "','" + sub + "','" + cont + "')" ;
		st = conn.createStatement();
		 cnt = st.executeUpdate(sql);	  //cnt > 0 : Insert 성공

		 
		
		//out.println (sql);
		//if(true) return;	//
		
		
		if(cnt > 0){
			out.println("데이터가 성공적으로 입력 되었습니다.");
		}else{
			out.println("데이터가 입력되지 않았습니다. ");
		}
		st.close();
		conn.close();
		
	}catch (Exception ex){
		out.println (ex.getMessage());
	}finally{
		if (st != null)
			st.close();
		if (conn != null)
			conn.close();
	}


%>
 
<jsp:forward page = "dbgb_show.jsp" />



</body>
</html>