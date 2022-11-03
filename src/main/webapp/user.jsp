<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mycart";
String userid = "root";
String password = "Root";
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


<table border="1">
<tr>
<th>User Id</th>
<th>Address</th>
<th>Gmail</th>
<th>Name</td>
<th>Password</th>
<th>Phone No</th>
<th>delete</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from user";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("user_id") %></td>
<td><%=resultSet.getString("user_address") %></td>
<td><%=resultSet.getString("user_email") %></td>
<td><%=resultSet.getString("user_name") %></td>
<td><%=resultSet.getString("user_password") %></td>
<td><%=resultSet.getString("user_phone") %></td>
<td><a href="delete.jsp?user_id=<%=resultSet.getString("user_id") %>"><button type="button"  class="delete">Delete</button></a></td>
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