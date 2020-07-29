<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>user list</title>
<link rel="stylesheet" href="studentdetails.css" type="text/css">


</head>
<body style="background-image:url(compass.jpg)">
   
   <div class="header">
  
     <h1><font size="40px" face="cursive">Happy Users</font></h1>
     
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
  
    <div class="topnav" >
    <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li class="selected" style="font-size:20px;" ><a href="index.jsp">LogOut</a></li>
          <li style="font-size:20px;"><a href="index.jsp"></a></li>
          <li><a href="another_page.html"></a></li>
          <li style=" font-size:20px;" ><a href="WelcomeAdmin.jsp">AdminPage</a></li>
          <li><a href="another_page.html"></a></li>
          <li><a href="another_page.html"></a></li>
          <li style="font-size:20px;" ><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
      
   </div>
 
 
 
   
   
  <script type="text/javascript">
			function openPage(pageURL) {
				window.location.href = pageURL;
			}
		</script>
    
         <%
             	try {

             		String scl = request.getParameter("sclid1");
             		Class.forName("com.mysql.jdbc.Driver");

             		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce", "root", "1234");

             		Statement st = con.createStatement();

             		String query = "select * from temp_table";

             		ResultSet rs = st.executeQuery(query);
             		String UserName = "";
             		String Mobile= "";
             		String Address= "";
             		String Gender= "";
             		String Email="";
             		String password="";
             %>
	<div id="table" align="center">
      <table style="padding:20px; color:#333; background-color:#A4F0F3;border-radius:20px;"  align="center" border="0px">
      <tr>
      
        <td style="padding:20px; font-size:40px;" align="center"  colspan="5"><font face = "Comic sans MS">PRODUCT DETAILS</font></td>
     
      </tr>
	  <tr >
	    <td style="padding: 10px 50px; font-size:25px;color:#333">User Name</td>
	    <td style="padding: 10px 50px; font-size:25px;color:#333">Mobile No</td>
	    <td style="padding: 10px 50px; font-size:25px;color:#333">Address</td>
	    <td style="padding: 10px 50px; font-size:25px;color:#333">Gender</td>
	    <td style="padding: 10px 50px; font-size:25px;color:#333">Email</td>
	    <td style="padding: 10px 50px; font-size:25px;color:#333">Password</td>
	    <td style="padding: 10px 50px; font-size:25px;color:#333"></td>
	 </tr>
	
	    <%
			    int k = 0;
				while(rs.next()) {
					
		%>	
     <tr>
	   <td style="padding:10px 50px;color:black"><font face="verdana"><%=rs.getString("USERNAME") %></font></td>
	   <td style="padding:10px 50px;color:black"><font face="verdana"><%=rs.getString("MOBILE_NO")%></font></td>
	   <td style="padding:10px 50px;color:black"><font face="verdana"><%=rs.getString("ADDRESS")%></font></td>
	   <td style="padding:10px 50px;color:black"><font face="verdana"><%=rs.getString("GENDER")%></font></td>
	   <td style="padding:10px 50px;color:black"><font face="verdana"><%=rs.getString("e_mail")%></font></td>
	   <td style="padding:10px 50px;color:black"><font face="verdana"><%=rs.getString("password")%></font></td>
	  
	
       
	
      <td><a href="DeleteUsers.jsp?id=<%=rs.getString("userid") %>"><button type="button" class="delete">Delete</button></a></td>
	 </tr>
	<%
	k++;
	 		}
	%>
	
	<tr><td colspan="5">TOTAL <%=k%></td></tr>
	
    <%
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    %>
 
 
 </table>
</div> 

</div>


</body>
</html>