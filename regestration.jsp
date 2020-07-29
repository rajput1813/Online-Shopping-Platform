<%@page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AvengersHere</title>


</head>
<body>
<div class="flex-container">
    <div class="container">
        <h1>KIND INFO</h1>
        <form method="POST">
            <textarea name="area">Some text...</textarea>
            <button>Submit</button>
        </form>
    </div>
</div>


  
        <% 

try {	
	String joinus=request.getParameter("area");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","1234");
	
	
	
	String sql="insert into exp(exp) values (?)";
	
	PreparedStatement st=con.prepareStatement(sql);
	
	st.setString(1,joinus);

	
	int row=st.executeUpdate();
	
	
 }
 catch(Exception e)
 {
  e.printStackTrace();
 }

%>
</body>
</html>