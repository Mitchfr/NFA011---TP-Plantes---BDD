<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*,java.util.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>
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
		String datePaie= request.getParameter("datePaie");
        String dateTraitPaie= request.getParameter("dateTraitPaie");
		String dateValidPaie= request.getParameter("dateValidPaie");
	
	
		try {
			//APPEL DE LA PROCEDURE 'nouveau_paiement' qui va ecrire les donnees dans la table paiement
			// cette procedure est completée par un trigger qui mettra la date de validation de la commande 
			// dans la table commande
			// Copie de la procedure
			/*			drop procedure if exists nouvel_cmd;
						delimiter |
						create procedure nouvel_cmd ( id_cli int(11), mont_comm DECIMAL(11,2))
						begin
						insert into Plantes_commande (id_clients_comm,date_comm,montant_comm) values (id_cli,now(),mont_comm);
						END;
						|
						delimiter ;

			*/
         
			String sql = "{call nouveau_paiement (?,?,?,?)}";				//Preparation de la requete
			CallableStatement call = conn.prepareCall(sql);					// appel de la requete

			
			call.setString(1, datePaie);									// date du paiement
            call.setString(2, dateTraitPaie);								// Date de traitement du paiement
            call.setString(3, dateValidPaie);								// Date de validation du paiement
            call.setString(4, formcli);
		
			call.execute();													// execution de la requete

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