<%@include file="connexion_bdd.jsp"%> 
<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*,java.sql.SQLException,java.io.*,java.util.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>
<%@page import="java.time.*"%>

<!DOCTYPE html>

<head>
<! -- appel de bootStrap pour la mise en forme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Gestion Plantes</title>
</head>
<! -- Construction du tableau pour afficher les donnees -->
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">id_commande</th>
      <th scope="col">id_client</th>
      <th scope="col">Date commande</th>
      <th scope="col">Montant</th>
	  <th scope="col">Date validation</th>


    </tr>
	</thead>
  	<tbody>
<%
   
String formcli= request.getParameter("selectbasic");  			// on recupere le n° de client la la liste d'option

out.println("<BR>");											// passage à la ligne
try {

					// création de la requette pour affichr la base plante
			Statement statement = conn.createStatement();
			ResultSet resultat = statement.executeQuery("select * from plantes_commande  where id_clients_comm='"+formcli+"'");
					// on boucle tant qu'il y a des enregistrements
		
				while(resultat.next()) {	
				
					int check=resultat.getInt("isdeleted_comm");			// On attribue la variable 'check'  avec la valeur de "isdeleted_cli"
					if (check==0) {										// si check est = à 0 le client peut étre affiché. S'il est à 1 c'est que le client est considéré comme supprimé
								
								
									// on va chercher les donnees de la base client
						int id_comm = resultat.getInt("id_comm");						
						String id_clients_comm = resultat.getString("id_clients_comm");
						String dateCom = resultat.getString("date_comm");
						String montant_comm = resultat.getString("montant_comm");
						String dateValidation = resultat.getString("date_validation");	
						if (dateValidation==null){
							dateValidation="00/00/0000";
						}
						

							// on affiche en HTML sous forme de tableau la liste des commandes
					out.println("<tr><td>"+id_comm+"<td>"+id_clients_comm+"<td>"+dateCom+"<td>"+montant_comm+"<td>"+dateValidation+"</td></tr>");
			
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
		