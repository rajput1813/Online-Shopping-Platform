<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ece-Sec-B</title>
 <style>
     <%@ include file="studentprofile.css"%>
  </style>
</head>
<body>

  
      <table style=" color:white; background-color:#FF335F;  border-radius:20px;"  align="center" border="0px">
      <tr>
      
        <td style="padding:20px; font-size:50px; color:white" align="center"  colspan="4"><font face = "Comic sans MS">HEY! <%=session.getAttribute("uname").toString()%> </font></td>
     
      </tr>
      <tr>
      
        <td style="padding:5px; font-size:30px;" align="center"  colspan="4"><font face = "Comic sans MS">Following Products have been purchased</font></td>
     
      </tr>
  
       <% 

   try {	
	
	String scl=session.getAttribute("uname").toString();
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	
	Statement st=con.createStatement();
	int uid=Integer.parseInt(session.getAttribute("u_id").toString());
	String query="select * from product where product_id IN (select p_id from purchased where u_id='"+uid+"')";
	
	ResultSet rs = st.executeQuery(query);
	String name="";

	
	   Statement st2=con.createStatement();
	while(rs.next())
	{
		name=rs.getString("product_name");
	
		if(name!=null)
		{	
			
		      
			 
	    %>
	
	   <tr>
	   <td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
	   PRODUCT NAME : <%=name %></font><br />
	   </td></tr>
	
	
		   
	    <tr>
<td>Brand</td><td><%=rs.getString("brand") %></td>
</tr>
<tr>
<td>Price</td><td><%=rs.getString("price") %></td>
</tr>
<tr>
<td>Description</td><td><%=rs.getString("discreption") %></td>
</tr>

	    <% 
	   }
	 
		
	
	
    }
	

   
	
	
    
 }
 catch(Exception e)
 {
  e.printStackTrace();
 }

%>
    </table>
  
<a href="ManageBankAccount.jsp">Go Back</a>
</body>
</html>
	