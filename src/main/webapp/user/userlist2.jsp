<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
	<th>번호</th>
	<th>이름</th>
	<th>아이디</th>
	<th>비밀번호</th>	
</tr>
<% 
String id ="root";
String pwd="r1r2r3";
String url="jdbc:mariadb://localhost:3307/ezen";
String diverName = "org.mariadb.jdbc.Driver";

Class.forName(diverName);
Connection con = DriverManager.getConnection(url,id,pwd);
String sql ="SELECT *FROM USER_INFO";
Statement stmt =con.createStatement();
ResultSet rs =stmt.executeQuery(sql);

while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString("UI_NUM")+"</td>");
	out.println("<td><a href='/user/user-view.jsp?uiNum="+ rs.getString("UI_NUM")+"'>" + rs.getString("UI_NAME")+"</a></td>");
	out.println("<td>"+rs.getString("UI_ID")+"</td>");
	out.println("<td>"+rs.getString("CREDAT")+"</td>");
	out.println("</tr>");
}
rs.close();
stmt.close();
con.close();





%>
</table>

</body>
</html>