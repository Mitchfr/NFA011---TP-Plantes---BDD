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
				// recuperation des données saisie par l'utilisateur
	String idCli = request.getParameter("numCli");
	String nom = request.getParameter("nom");
	String prenom = request.getParameter("prenom");
	String adresse = request.getParameter("adresse");
	int cp = Integer.parseInt(request.getParameter("cp"));
	String ville = request.getParameter("ville");
	String mail = request.getParameter("email");
	String tel = request.getParameter("tel");
	String mdp = request.getParameter("mdp");
			
    Statement instruction = conn.createStatement();
	   			
				    // création de la requette pour modifier un client	
	String  SQL = "UPDATE plantes_clients SET nom_cli='"+nom+"',prenom_cli='"+prenom+"',adr_cli='"+adresse+"',cp_cli='"+cp+"',ville_cli='"+ville+"',ville_cli='"+ville+"',email_cli='"+mail+"',mpasse_cli='"+mdp+"',tel_cli='"+tel+"'"+"WHERE id_cli='"+idCli+"'";		

					// message pour dire que l'enregistrement est ok
	out.println("<h2>BRAVO l'enregistrement à été modifié</h2>");
	instruction.executeUpdate(SQL);
 
%>
<BR>
		<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>