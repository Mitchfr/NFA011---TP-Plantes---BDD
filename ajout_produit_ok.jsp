<%@include file="connexion_bdd.jsp"%> 
<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>
<%@page import="java.time.*"%>
			
<!DOCTYPE html>

<head>
<! -- appel de bootStrap pour la mise en forme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Gestion Plantes</title>
</head>

<%
   

String libelle_court = request.getParameter("libelle_court");
String libelle_long = request.getParameter("libelle_long");
String chemin_photo_prod = request.getParameter("chemin_photo");

String quantite_prod = request.getParameter("quantite");



	

				// création de la requette pour affichr la base plante
       Statement instruction = conn.createStatement();
		String  SQL = "INSERT INTO plantes_produits(libelle_court_prod,libelle_long_prod,chemin_photo_prod,date_crea_prod,quantite_prod)"+"VALUES('"+libelle_court+"','"+libelle_long+"','"+chemin_photo_prod+"',now(),'"+quantite_prod+"')";

            out.println("<h2>BRAVO l'enregistrement à été ajouté</h2>");
			instruction.executeUpdate(SQL);

 
	

%>
<BR>
	<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>