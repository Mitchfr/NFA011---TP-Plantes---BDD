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

<! -- creation du formulaire de saisie -->
<form class="form-horizontal" action="paiement_ok.jsp" method="post" name="paiement.jsp" name="formcli">
<fieldset>
<div class="form-group">


<%
	out.println("<div class='col-md-4'>");
    out.println("<select id='selectbasic' name='selectbasic' class='form-control'>");
		try {
					// création de la requette pour affichr la base plante
			Statement statement = conn.createStatement();
			ResultSet resultat = statement.executeQuery("select *  from plantes_commande CMD INNER JOIN plantes_clients CLI ON CMD.id_clients_comm=CLI.id_cli;");
					// on boucle tant qu'il y a des enregistrements
			while(resultat.next()) {	
			
				int check=resultat.getInt("isdeleted_cli");			// On attribue la variable 'check'  avec la valeur de "isdeleted_cli"
				if (check==0) {										// si check est = à 0 le client peut étre affiché. S'il est à 1 c'est que le client est considéré comme supprimé
								// on va chercher les donnees de la base client
					int id = resultat.getInt("id_comm");
					int idCli = resultat.getInt("id_clients_comm");
					String nom = resultat.getString("nom_cli");
					
				

									// on ecrit la liste des informations en HTML 
					out.println("<option id='liste' value='"+id+"'>Commande n°: "+id+"    "+nom+"</option>");
				
		
				}

			}

			out.println("</select></div>");
            out.println("<div class='col-md-4'>");
			out.println("<div class='form-group'>");
			
			
            out.println("<label class='col-md-4 control-label' for='datePaie'>Date du paiement</label>");
            out.println("<input id='datePaie' name='datePaie' type='text' placeholder='Entrez la date de  paiement en format yyyy/MM/dd' class='form-control input-md'>");			
			out.println("<label class='col-md-4 control-label' for='dateTraitPaie'>Date de traitement de paie</label>");
			out.println("<input id='dateTraitPaie' name='dateTraitPaie' type='text' placeholder='Entrez la date de traitement de paie format yyyy/MM/dd' class='form-control input-md'>");			
			out.println("<label class='col-md-4 control-label' for='dateValidPaie'>Date de validation de paie</label>");
            out.println("<input id='dateValidPaie' name='dateValidPaie' type='text' placeholder='Entrez la date de validation de paie format yyyy/MM/dd' class='form-control input-md'>");
			out.println("</div>");
	 		out.println("</select></div>");
	

		} catch (SQLException ex){
			{ out.println("SQLException:" + ex.getMessage());
			out.println("SQLState: " + ((SQLException) ex).getSQLState());
			out.println("VendorError: " + ((SQLException) ex).getErrorCode());
			}
		}
 

 
%>
</div>

<!-- Validation du formulaire -->
<div class="form-group">
  <label class="col-md-4 control-label" for="validation"></label>
  <div class="col-md-8">
    <button id="validation" type="submit" name="validation" class="btn btn-success">Valider</button>
  </div>
</div>
</fieldset>
</form>
<BR>
	<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>