<%@include file="connexion_bdd.jsp"%> 
<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>
<%@page import="java.time.*"%>
			
<!DOCTYPE html>

<head>
<! -- appel de bootStrap pour la mise en forme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Gestion Plantes</title>
</head>

<! -- creation du formulaire de saisie -->
<form class="form-horizontal" action="modifie_cli_ok_update.jsp" method="post" name="modifie_cli_ok.jsp">
<fieldset>
<%
   
	String formcli= request.getParameter("selectbasic");			// on recupere dans 'formcli' le n° du client selectionné
				// création de la requette pour affichr la base plante
    Statement instruction = conn.createStatement();
	ResultSet resultat = instruction.executeQuery("select * from plantes_clients where id_cli='"+formcli+"'");      		// requette ou on cherche tous les id_cli qui sont = à formcli
			
	while(resultat.next()) {
					// on recupere les information pour les afficher dans le formulaire de modification
		int id = resultat.getInt("id_cli");
		String nom = resultat.getString("nom_cli");
		String prenom = resultat.getString("prenom_cli");
		String adresse = resultat.getString("adr_cli");
		int cp = resultat.getInt("cp_cli");
		String ville = resultat.getString("ville_cli");
		String mail = resultat.getString("email_cli");
		String mpasse = resultat.getString("mpasse_cli");
		String telephone = resultat.getString("tel_cli");					 
		java.util.Date dateCrea = resultat.getDate("date_crea_cli");
		SimpleDateFormat tempDate = new SimpleDateFormat("dd/MM/yyyy");
		String dateFr = tempDate.format(dateCrea);

				// On affecte les variable ci-dessus au champs du formulaire corrrespondant
		out.println("<div class='form-group'><label class='col-md-4 control-label' for='numCli'>Client n°</label><div class='col-md-4'><input id='numCli' name='numCli' value='"+id+"' type='text'  class='form-control input-md'></div></div>");
		out.println("<div class='form-group'><label class='col-md-4 control-label' for='nom'>Nom</label><div class='col-md-4'><input id='nom' name='nom' value='"+nom+"' type='text'  class='form-control input-md'></div></div>");

		out.println("<div class='form-group'><label class='col-md-4 control-label' for='prenom'>Prénom</label><div class='col-md-4'><input id='prenom' name='prenom' value='"+prenom+"' type='text'  class='form-control input-md'></div></div>");

		out.println("<div class='form-group'><label class='col-md-4 control-label' for='adresse'>Adresse</label><div class='col-md-4'><input id='adresse' name='adresse' value='"+adresse+"' type='text'  class='form-control input-md'></div></div>");

		out.println("<div class='form-group'><label class='col-md-4 control-label' for='cp'>Code postal</label><div class='col-md-4'><input id='cp' name='cp' value='"+cp+"' type='text'  class='form-control input-md'></div></div>");

		out.println("<div class='form-group'><label class='col-md-4 control-label' for='ville'>Ville</label><div class='col-md-4'><input id='ville' name='ville' value='"+ville+"' type='text'  class='form-control input-md'></div></div>");

		out.println("<div class='form-group'><label class='col-md-4 control-label' for='email'>E-Mail</label><div class='col-md-4'><input id='email' name='email' value='"+mail+"' type='text'  class='form-control input-md'></div></div>");

		out.println("<div class='form-group'><label class='col-md-4 control-label' for='mdp'>Mot de passe</label><div class='col-md-4'><input id='mdp' name='mdp' value='"+mpasse+"' type='text'  class='form-control input-md'></div></div>");

		out.println("<div class='form-group'><label class='col-md-4 control-label' for='tel'>Téléphone</label><div class='col-md-4'><input id='tel' name='tel' value='"+telephone+"' type='text'  class='form-control input-md'></div></div>");
	}

%>
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