<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
  <%@ page import = "java.sql.*, java.util.*" %>
  <% request.setCharacterEncoding("EUC-KR"); %>		<!-- Form에서 넘겨주는 한글 처리 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>form에서 넘겨받은 값을 DB에 insert 하는 페이지</title>
</head>
<body>
<%@include file ="db_conn_oracle.jsp" %>		<!-- Connection 객체 -->
<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String con = request.getParameter("content");
	String ymd = (new java.util.Date()).toLocaleString(); //현재 시스템의 로케일(한국)
	
	//폼에서 넘긴 변수가 잘 넘어오는지 확인
	/*
	out.println(na + "<p>");
	out.println(em + "<p>");
	out.println(sub + "<p>");
	out.println(con + "<p>");
	out.println(ymd + "<p>");
	*/
	
	String sql = null;
	Statement st = null;	//Statement : sql 구문을 실행하는 객체
					//conn 객체에서 자동으로 커밋 구문이 적용되어 있음.
	int cnt = 0;	//insert, update, delete 가 잘 적용되었는지 확인
					// cnt > 0  :  잘 적용된것
	
	try{
		sql = "insert into guestboard2 (name,email,inputdate,subject,content)";
		sql = sql + " values('" +na +"','" + em + "','" + ymd  ;
		sql = sql +  "','" + sub + "','" + con + "')";
		
		st = conn.createStatement();	//st : statement 객체 활성화 (XE, hr2,1234)
		
		cnt = st.executeUpdate(sql);   //insert, update, delete 문인 경우
		
		/*
		if(cnt > 0){
			out.println("DB에 잘 insert가 되었습니다.");
		}else {
			out.println("DB에 잘 insert가 되지 않았습니다.");
		}
		*/
		
		
		//out.println(sql);		
		//if(true) return;
		
		
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(st !=null)
			st.close();
		if(conn !=null)
			conn.close();
	}

%>
<!--  insert 완료되면 이 페이지로 이동. -->
<jsp:forward page = "dbgb_show.jsp" />




</body>
</html>