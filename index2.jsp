<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ece-Sec-B</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
   
   <div class="header">
     <h1><font size="40px" face="cursive">ECE SEC-B STUDENT LIST</font></h1>
     
    
   
  
    <div class="topnav" >
    <form method="POST"  action="edit.jsp">
     <table>
            <col width="50%" />
           
            <col width="800px" />
             <tr>
             <td ><a href="addstudent.jsp">ADD STUDENT</a></td>
             <td align="right" style="padding-right:10px">ENTER SCH-ID
             <input type="text" name="sclid1" value="enter sch-id to edit"  /> 
             <input type="submit" value="Edit"  />
             <input type="button" value="Delete"  onclick="openPage('deletecnf.jsp');" />
             </td>
              
            
        </tr>
      </table>
      </form>
      
      
   </div>
 
 
 
   
   
  <script type="text/javascript">
   function openPage(pageURL)
  {
  window.location.href = pageURL;
  }
  </script>
    
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
	<div class="table" >
      <table style="color:#333; background-color:#EBFBF6;border-radius:20px;"  align="center" border="0px">
      <tr>
      
        <td style="padding:20px; font-size:40px;" align="center"  colspan="4"><font face = "Comic sans MS">STUDENT DETAILS</font></td>
     
      </tr>
	  <tr>
	    <td style="padding: 10px 40px; font-size:20px;color:#333">SCL-ID</td>
	    <td style="padding: 10px 40px; font-size:20px;color:#333">FIRST_NAME</td>
	    <td style="padding: 10px 40px; font-size:20px;color:#333">LAST_NAME</td>
	    <td style="padding: 10px 40px; font-size:20px;color:#333">EMAIL</td>
	 </tr>
	
	<% 
	int k=0;
	while(rs.next())
	{  k++;
		%>	
     <tr>
	   <td style="color:black"><font face="verdana"><%=rs.getString("sclid") %></font></td>
	   <td style="color:black"><font face="verdana"><%=rs.getString("fname") %></font></td>
	   <td style="color:black"><font face="verdana"><%=rs.getString("lname") %></font></td>
	   <td style="color:black"><font face="verdana"><%=rs.getString("email") %></font></td>
	 </tr>
	 
	<%
	
	}
	%>
	
	<tr><td colspan="4">TOTAL <%=k %></td></tr>
	
    <%
 }
 catch(Exception e)
 {
  e.printStackTrace();
 }

%>
 
 
 </table>
</div> 

</div>

</body>
</html>