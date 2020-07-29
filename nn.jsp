<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/";
String database = "e_commerce";
String userid = "root";
String password = "1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>first name</td>
<td>last name</td>
<td>City name</td>
<td>Email</td>
<td>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("category") %></td>
<td><%=resultSet.getString("product_name") %></td>
<td><%=resultSet.getString("price") %></td>
<td><%=resultSet.getString("brand") %></td>
   <%
   String g=resultSet.getString("product_id");
   request.setAttribute("id", g ); %>
<td><a href="delete.jsp?id=<%=resultSet.getString("product_id") %>"><button type="button" class="delete">Delete</button></a></td>

</tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
</html>