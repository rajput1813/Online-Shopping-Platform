<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
       <% 

try {	
	
	String scl=request.getParameter("sclid1");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/march","root","1234");
	
	Statement st=con.createStatement();
	
	String query="select * from ecelist";
	
	ResultSet rs = st.executeQuery(query);
	String name="";
	String sclid="";
	String lname="";
	String email="";
	%>
   <table border="1">
	  <tr>
	    <td>SCL-ID</td>
	    <td>FIRST_NAME</td>
	    <td>LAST_NAME</td>
	    <td>EMAIL</td>
	 </tr>
	
	<%
	while(rs.next())
	{
		%>	
     <tr>
	   <td><%=rs.getString("fname") %></td>
	   <td><%=rs.getString("sclid") %></td>
	   <td><%=rs.getString("lname") %></td>
	   <td><%=rs.getString("email") %></td>
	 </tr>
	<%
	}
 }
 catch(Exception e)
 {
  e.printStackTrace();
 }

%>
</table>
</body>
</html>