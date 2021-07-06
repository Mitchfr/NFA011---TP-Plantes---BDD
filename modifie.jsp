<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>


<%@page import="java.sql.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html>
<head>
<title>Gestion Plantes</title>
</head>
<body>

<%




	
				// Connexion à la base de donnéé
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3308/plantes?useSSL=false&serverTimezone=UTC";
		String login="root";
		String password="";
		

		try {
	
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection(url,login,password);	
			//System.out.println("Connexion OK");
					//  Gestion du menu 
					// on verifie que la personne fait le bon choix de menu
					// sinon, on lui met un message d'erreur
			out.println(" Bienvenue dans le programme Plantes\n");
			out.println("<a href='affiche.jsp'>Afficher les enregistrements Clients</a>");
			


		}
		catch (SQLException ex){
			System.out.println("SQLException" + ex.getMessage());
			System.out.println("SQL State: " + ((SQLException) ex).getSQLState());
			System.out.println("VendorError: " + ((SQLException) ex).getErrorCode());
		}
		catch (ClassNotFoundException e){
			System.out.println(e.getMessage());

   }
		
		

		try {
            Statement statement = conn.createStatement();
            ResultSet resultat = statement.executeQuery("select *from plantes_clients;");
            System.out.println("id_client"+" nom   "+"prénom "+ "     adresse          "+"               cp  "+ "  ville   "+ "   e-mail   "+ " téléphone   "+"  dateCrea  ");
            System.out.println("----------------------------------------------------------------------");
            while(resultat.next()) {	
                
                int check=resultat.getInt("isdeleted_cli");			// On attribue la variable 'check'  avec la valeur de "isdeleted_cli"
                if (check==0) {										// si check est = à 0 le client peut être affiché. S'il est à 1 c'est que le client est considéré comme supprimé
                    int id = resultat.getInt("id_cli");
                    String nom = resultat.getString("nom_cli");
                    String prenom = resultat.getString("prenom_cli");
                    String adresse = resultat.getString("adr_cli");
                    int cp = resultat.getInt("cp_cli");
                    String ville = resultat.getString("ville_cli");
                    String mail = resultat.getString("email_cli");
                    String telephone = resultat.getString("tel_cli");
                    java.util.Date dateCrea = resultat.getDate("date_crea_cli");
                
        
                
                    System.out.println(id+" ->    "+nom+"   "+prenom+"  "+adresse+"                        "+cp+"    "+ville +"   "+mail+"    "+telephone+" "+dateCrea);
        
                }

            }
        }
            System.out.println("\n\n");
            
		} catch (SQLException ex){
			{ System.out.println("SQLException:" + ex.getMessage());
			System.out.println("SQLState: " + ((SQLException) ex).getSQLState());
			System.out.println("VendorError: " + ((SQLException) ex).getErrorCode());
			}
		}

	
	
	
	%>
	<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>


