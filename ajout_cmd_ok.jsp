<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>
<%@page import="java.time.*"%>

<%@include file="connexion_bdd.jsp"%> 			
<!DOCTYPE html>

<head>
<! -- appel de bootStrap pour la mise en forme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Gestion Plantes</title>
</head>
<body>


<%
		// recuperation des valeurs du formulaire
	  			String formcli= request.getParameter("selectbasic");			
				String montant= request.getParameter("montant");
			

	
		try {
			//APPEL DE LA PROCEDURE
			String sql = "{call nouvel_cmd (?,?)}";				//Preparation de la requete
			CallableStatement call = conn.prepareCall(sql);			
			call.setString(1, formcli);								
			call.setString(2, montant);
		
			call.execute();											// execution de la requete
	
				out.println("<h2>BRAVO l'enregistrement à été modifié</h2>");

			} catch (Exception ex) {
			out.println("SQLException: " + ex.getMessage());
			out.println("SQLState: " +
			((SQLException) ex).getSQLState());
			out.println("VendorError: " + ((SQLException)
			ex).getErrorCode());
		}



 
%>


<!-- Button (Double) -->

<BR>
	<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>