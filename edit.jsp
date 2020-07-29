<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EditStudentInfo</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body style="background-color:#B5E407">

 
   <h2>scl-id : <%=request.getParameter("sclid1") %> available details :</h2>
  
   <% 

   try {	
	
	String scl=request.getParameter("sclid1");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/march","root","1234");
	
	Statement st=con.createStatement();
	
	String query="select * from ecelist where sclid='"+scl+"'";
	
	ResultSet rs = st.executeQuery(query);
	String name="";
	String sclid="";
	String lname="";
	String email="";
	while(rs.next())
	{
		name=rs.getString("fname");
	    sclid=rs.getString("sclid");
		lname=rs.getString("lname");
		email=rs.getString("email");
	}
	
	%>
	SCL-ID : <%=sclid %> <br />
	FIRST_NAME : <%=name %><br />
	LAST_NAME : <%=lname %> <br />
	EMAIL : <%=email %><br />
	<%
	
 }
 catch(Exception e)
 {
  e.printStackTrace();
 }

%>

 
    
      <div class="container2">
           <h3>Enter NEW values for Student</h3>
         
           <form method="POST">
             <table>
                  <tr>
                  <td><label>OLD SCL-ID :</label></td>
                  <td><input type="text" name="oldsclid" /></td>
                </tr>
             
                 <tr>
                  <td><label>NEW SCL-ID :</label></td>
                  <td><input type="text" name="sclid2" /></td>
                 </tr>
                
                 <tr>
                  <td><label>FIRST NAME :</label></td>
                  <td><input type="text" name="fname2" /></td>
                </tr>
                
                 <tr>
                  <td><label>LAST NAME :</label></td>
                  <td><input type="text" name="lname2" /></td>
                </tr>
                
                 <tr>
                  <td><label>EMAIL :</label></td>
                  <td><input type="text" name="email2" /></td>
                </tr>
                
                  <tr>
                  <td><label></label></td>
                  <td><input type="submit" value="save" /></td>
                </tr>
             </table>
              
  
     <%  
    
		try {
			   String oldscl;
			   String sclid;
			   String fname;
			   String lname;
			   String email;
			   oldscl=request.getParameter("oldsclid").toString();
			   sclid=request.getParameter("sclid2").toString();
			   fname=request.getParameter("fname2").toString();
			   lname=request.getParameter("lname2").toString();
			   email=request.getParameter("email2").toString();
			  			   
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/march","root","1234");
			
			
	        String sql="UPDATE ecelist SET sclid='"+sclid+"' , fname='"+fname+"' , lname='"+lname+"' ,email='"+email+"' WHERE sclid='"+oldscl+"' "; 
			
			PreparedStatement st=con.prepareStatement(sql);
			
		    int row=st.executeUpdate();
		    
		    if(row>0)
			{
				 response.sendRedirect("thanku2.jsp");
			}
			con.close();
			
		  }
		
		catch (Exception e) 
		
		{
 			e.getStackTrace();
		}
    
        %>
  
    </form>
  </div>
 
</body>
</html>