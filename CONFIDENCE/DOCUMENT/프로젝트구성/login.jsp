<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%!
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:company:@localhost:1521:company";
	String uid = "system";
	String upw = "1234";
	String query = "SELECT * FROM MemberInfo";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		out.println("sdf");
	try{		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
		while(resultSet.next()) {
			String id = resultSet.getString("userid");
			String pw = resultSet.getString("userpw");
			String name = resultSet.getString("userName");
			String address1 = resultSet.getString("address1");
			
			out.println("아이디 : "+id+", 비밀번호 : "+pw+", 이름  : "+name+", 전화번호 : "+address1+"<br/>");
			
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally{
		try{
			if(resultSet != null){resultSet.close();}
			if(statement != null){resultSet.close();}
			if(connection != null){resultSet.close();}
		}catch(Exception e2) {
			e2.printStackTrace();
		}
	}
	
	
	%>
</body>
</html>