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
			// on recupère les informations saisies dans le formulaire
	String nom = request.getParameter("nom");
	String prenom = request.getParameter("prenom");
	String adresse = request.getParameter("adresse");
	int cp = Integer.parseInt(request.getParameter("cp"));
	String ville = request.getParameter("ville");
	String mail = request.getParameter("email");
	String tel = request.getParameter("tel");
	String mdp = request.getParameter("mdp");


				// création de la requette pour afficher la base plante
    Statement instruction = conn.createStatement();
	String  SQL = "INSERT INTO plantes_clients(nom_cli,prenom_cli,adr_cli,cp_cli,ville_cli,date_crea_cli,email_cli,mpasse_cli,tel_cli)"+"VALUES('"+nom+"','"+prenom+"','"+adresse+"','"+cp+"','"+ville+"',now(),'"+mail+"','"+mdp+"','"+tel+"')";
				// message pour dir que l'enregistrement est ok
	out.println("<h2>BRAVO l'enregistrement à été ajouté</h2>");
	instruction.executeUpdate(SQL);
 
%>
<BR>
		<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>