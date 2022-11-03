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

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>pId</td>
<td>pName</td>
<td>pDesc</td>
<td> pPrice</td>
<td>pQuantity</td>
<td>pDiscount</td>
<td>delete</td>

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
<td><%=resultSet.getString("pId") %></td>
<td><%=resultSet.getString("pName") %></td>
<td><%=resultSet.getString("pDesc") %></td>
<td><%=resultSet.getString("pPrice") %></td>
<td><%=resultSet.getString("pDiscount") %></td>
<td><%=resultSet.getString("pQuantity") %></td>
<td><a href="delete.jsp?pId=<%=resultSet.getString("pId") %>"><button type="button"  class="delete">Delete</button></a></td>
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