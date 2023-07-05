<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // sacar la info
  String nombre = request.getParameter("nombre");
  String apellido = request.getParameter("apellido");
  String edad = request.getParameter("edad");
  String password = request.getParameter("password");

  // Database connection details
  String url = "jdbc:mysql://localhost:3306/UsuariosSC";
  String username = "your-username";
  String passwordDB = "your-password";

  // Insertar a tabla UserRegistry
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, username, passwordDB);
    Statement statement = connection.createStatement();
    String query = "INSERT INTO UserRegistry (FirstName, LastName, Age, Password) VALUES ('" +
                   nombre + "', '" + apellido + "', '" + edad + "', '" + password + "')";
    statement.executeUpdate(query);
    statement.close();
    connection.close();
  } catch (Exception e) {
    e.printStackTrace();
  }

  // Redirigir a home.html
  response.sendRedirect("home.html");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Submitted</title>
</head>
<body>
    <h1>Form Submitted</h1>
    <p>Your form data has been successfully submitted.</p>
</body>
</html>
