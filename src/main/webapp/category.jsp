
<%@page import="java.awt.Button"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"



    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<style>  
.table{

  width: 1000px;
  height: 80px;
  
}


.button1{
background-color:#D11A2A;
border: none;
 padding: 14px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
}

.button2{
background-color:#00AB66;
border: none;
 padding: 14px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
}






</style>

<title>Insert title here</title>
</head>
<body>



<%
String id = request.getParameter("userid");
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


<h1>  ALL Category IN MYCART </h1>

<form class = "table">
<table  id="myTable" border="1">
<tr>
<th> categoryId<th>
<th>categoryDescription</th>
<th>categoryTitle</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from category";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("categoryId") %></td>
<td><%=resultSet.getString("categoryDescription") %></td>
<td><%=resultSet.getString("categoryTitle") %></td>



</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
</table>

</form>





</body>
</html>