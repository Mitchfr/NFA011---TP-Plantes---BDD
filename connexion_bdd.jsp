<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>
<%@page import="java.time.*"%>

<%
			// définition des variable de connexion au à la base 'plantes'
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3308/plantes?useSSL=false&serverTimezone=UTC";
		String login="root";
		String password="";

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");					// appel du driver JDBC
			conn = DriverManager.getConnection(url,login,password);		// transmission des infos de connexion
            System.out.println("Connexion OK");

    	
		} 
        catch (SQLException ex){
			out.println("SQLException:" + ex.getMessage());
			out.println("SQLState: " + ((SQLException) ex).getSQLState());
			out.println("VendorError: " + ((SQLException) ex).getErrorCode());
			
		}
	catch (ClassNotFoundException e){
			out.println(e.getMessage());
		}
 
%>


