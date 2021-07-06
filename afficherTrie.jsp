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
<! -- Construction du tableau pour afficher les donnees -->
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">id_client</th>
      <th scope="col">Nom</th>
      <th scope="col">Prénom</th>
      <th scope="col">Adresse</th>
	  <th scope="col">CP</th>
	  <th scope="col">Ville</th>
	  <th scope="col">E-Mail</th>
	  <th scope="col">Téléphone</th>
	  <th scope="col">Date Création</th>

    </tr>
	</thead>
  	<tbody>
<%

		try {

				// création de la requette pour affichr la base plante
        Statement statement = conn.createStatement();
		ResultSet resultat = statement.executeQuery("select * from plantes_clients ORDER BY nom_cli ASC;");
				// on boucle tant qu'il y a des enregistrements
		while(resultat.next()) {	
			
			int check=resultat.getInt("isdeleted_cli");			// On attribue la variable 'check'  avec la valeur de "isdeleted_cli"
			if (check==0) {										// si check est = à 0 le client peut étre affiché. S'il est à 1 c'est que le client est considéré comme supprimé
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
	
			}

		}

	
		} catch (SQLException ex){
			{ out.println("SQLException:" + ex.getMessage());
			out.println("SQLState: " + ((SQLException) ex).getSQLState());
			out.println("VendorError: " + ((SQLException) ex).getErrorCode());
			}
		}
 
%>
	
	
	</tbody>
</table>
<BR>
		<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>