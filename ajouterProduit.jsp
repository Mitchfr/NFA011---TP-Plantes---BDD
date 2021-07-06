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



<form class="form-horizontal" action="ajout_produit_ok.jsp" method="post" name="ajouter_produit.jsp">
<fieldset>

<!-- Form Name -->

<p class="h2">Ajout d'un produit</h2>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="libelle_court">Libellé Cout</label> 
  <div class="col-md-2">
  <input id="libelle_court" name="libelle_court" type="text" placeholder="Entrer un libellé cour" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="libelle_long">Chemin de la photo</label>  
  <div class="col-md-4">
  <input id="libelle_long" name="libelle_long" type="text" placeholder="Entrez un libellé long" class="form-control input-md">
    
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="prenom">Chemin de la photo</label>  
  <div class="col-md-8">
  <input id="chemin_photo" name="chemin_photo" type="text" placeholder="Entrez le chemin de la photo" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-1 control-label" for="adresse">Quantité</label>  
  <div class="col-md-1">
  <input id="quantite" name="quantite" type="text" placeholder="Entrez la quantite" class="form-control input-md">
    
  </div>
</div>


<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="validation"></label>
  <div class="col-md-8">
    <button id="validation" type="submit" name="validation" class="btn btn-success">Valider</button>
 
  </div>
</div>

</fieldset>
</form>

<p class='h4'><a href='accueil.jsp'>Retour page d'accueil</p>		<!-- retour à la page d'acceuil -->
</body>
</html>