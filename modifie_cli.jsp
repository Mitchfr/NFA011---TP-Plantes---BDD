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
<form class="form-horizontal" action="modifie_cli_ok.jsp" method="post" name="modif_cli.jsp" name="formcli">
<fieldset>
<div class="form-group">
  <label class="col-md-4 control-label" for="selectbasic">Clients</label>


<%
	  
	  	out.println("<div class='col-md-4'>");
    	out.println("<select id='selectbasic' name='selectbasic' class='form-control'>");
		try {
			
					// création de la requette pour affichr la base plante
			Statement statement = conn.createStatement();
			ResultSet resultat = statement.executeQuery("select * from plantes_clients;");
					// on boucle tant qu'il y a des enregistrements
			while(resultat.next()) {	
			
				int check=resultat.getInt("isdeleted_cli");			// On attribue la variable 'check'  avec la valeur de "isdeleted_cli"
				if (check==0) {										// si check est = à 0 le client peut étre affiché. S'il est à 1 c'est que le client est considéré comme supprimé
								// on va chercher les donnees de la base client
					int id = resultat.getInt("id_cli");
					String nom = resultat.getString("nom_cli");
					String prenom = resultat.getString("prenom_cli");
							// on affiche une liste deroulante avec l'id , le nom et prenom
					out.println("<option id='liste' value='"+id+"'>"+nom+"   "+prenom+"</option>");
				
		
				}

			}
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