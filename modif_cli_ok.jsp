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

		try {
            
            String modifli= request.getParameter("selectbasic");
					// création de la requette pour affichr la base plante
			Statement statement = conn.createStatement();
			ResultSet resultat = statement.executeQuery("select * from plantes_clients where id_clients_comm='"+formcli+"'");
					// on boucle tant qu'il y a des enregistrements
			instruction.executeUpdate(SQL);


			
								// on va chercher les donnees de la base client
					int id = resultat.getInt("id_cli");
					String nom = resultat.getString("nom_cli");
					String prenom = resultat.getString("prenom_cli");
					String adresse = resultat.getString("adr_cli");
					int cp = resultat.getInt("cp_cli");
					String ville = resultat.getString("ville_cli");
					String mail = resultat.getString("email_cli");
					String telephone = resultat.getString("tel_cli");
					java.util.Date dateCrea = resultat.getDate("date_crea_cli");
					SimpleDateFormat tempDate = new SimpleDateFormat("dd/MM/yyyy");
					String dateFr = tempDate.format(dateCrea);
				
			
					out.println("<tr><td>"+id+"<td>"+nom+"<td>"+prenom+"<td>"+adresse+"<td>"+cp+"<td>"+ville+"<td>"+mail+"<td>"+telephone+"<td>"+dateFr+"</td></tr>");
		
				out.println("<form class="form-horizontal" action="ajout_ok.jsp" method="post" name="ajouter.jsp">");
                out.println("<fieldset>");

out.println("<p class='h2'>Saisie d'un client</h2>");
out.println("<div class="form-group"><label class="col-md-4 control-label" for="nom">Nom</label><div class="col-md-4"><input id="nom" value="'"+nom+"'" name="nom" type="text" placeholder="Entrer le nom" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class='form-group">
  <label class="col-md-4 control-label" for="prenom">Prénom</label>  
  <div class="col-md-4">
  <input id="prenom" name="prenom" type="text" placeholder="Entrez votre prénom" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="adresse">Entrez  votre adresse</label>  
  <div class="col-md-8">
  <input id="adresse" name="adresse" type="text" placeholder="Entrez votre  adresse" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="cp">Code Postal</label>  
  <div class="col-md-4">
  <input id="cp" name="cp" type="text" placeholder="Entrez votre code postal" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ville">Ville</label>  
  <div class="col-md-4">
  <input id="ville" name="ville" type="text" placeholder="Entrez votre ville" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">E-Mail</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" placeholder="Entrez votre e-mail" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mdp">Mot de passe</label>  
  <div class="col-md-4">
  <input id="mdp" name="mdp" type="text" placeholder="Entrez votre mot de passe" class="form-control input-md">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="tel">Téléphone</label>
  <div class="col-md-4">
    <input id="tel" name="tel" type="password" placeholder="Entrez votre téléphone" class="form-control input-md">
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="validation"></label>
  <div class="col-md-8">
    <button id="validation" type="submit" name="validation" class="btn btn-success">Valider</button>
    <button id="Reset" name="Reset" class="btn btn-danger">Reset</button>
  </div>
</div>

</fieldset>
</form>

			}

	
		} catch (SQLException ex){
			{ out.println("SQLException:" + ex.getMessage());
			out.println("SQLState: " + ((SQLException) ex).getSQLState());
			out.println("VendorError: " + ((SQLException) ex).getErrorCode());
			}
		}
 
%>
	

<BR>
			<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>