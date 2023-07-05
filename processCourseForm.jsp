<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
  // Sacar la info the la form
  String nombre = request.getParameter("nombre");
  String cedula = request.getParameter("cedula");
  String courseID = request.getParameter("courseID");
  String fecha = request.getParameter("fecha");

  // Database detalles
  String url = "jdbc:mysql://localhost:3306/UsuariosSC";
  String username = "your-username";
  String passwordDB = "your-password";

  // insertar data a tabla CourseRegistry
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, username, passwordDB);
    Statement statement = connection.createStatement();

    // Convertir la data a un string
    String courseDate = "";
    if (fecha.equals("20 de julio")) {
      courseDate = "20 de julio";
    } else if (fecha.equals("24 de octubre")) {
      courseDate = "24 de octubre";
    } else if (fecha.equals("14 de noviembre")) {
      courseDate = "14 de noviembre";
    }

    // crear nuevo UserID
    String queryUserID = "SELECT LPAD(MAX(UserID) + 1, 5, '0') AS NewUserID FROM UserRegistry";
    ResultSet resultUserID = statement.executeQuery(queryUserID);
    String userID = "";
    if (resultUserID.next()) {
      userID = resultUserID.getString("NewUserID");
    }

    // Insertar la data del uuario al CourseRegisty
    String query = "INSERT INTO CourseRegistry (UserID, CourseID, CourseDate, DisplayName, Cedular) VALUES ('" +
                   userID + "', '" + courseID + "', '" + courseDate + "', '" + nombre + "', '" + cedula + "')";
    statement.executeUpdate(query);
    statement.close();
    connection.close();
  } catch (Exception e) {
    e.printStackTrace();
  }

  // Redirgir to home.html
  response.sendRedirect("home.html");
%>

