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

<form class="form-horizontal" action="ajout_ok.jsp" method="post" name="ajouter.jsp">
<fieldset>



<p class="h2">Saisie d'un client</h2>

<!-- Champs NOM -->
<div class="form-group">
  <label class="col-md-4 control-label" for="nom">Nom</label> 
  <div class="col-md-4">
  <input id="nom" name="nom" type="text" placeholder="Entrer le nom" class="form-control input-md">
    
  </div>
</div>

<!-- Champs PRENOM -->
<div class="form-group">
  <label class="col-md-4 control-label" for="prenom">Prénom</label>  
  <div class="col-md-4">
  <input id="prenom" name="prenom" type="text" placeholder="Entrez votre prénom" class="form-control input-md">
    
  </div>
</div>

<!--  Champs ADRESEES -->
<div class="form-group">
  <label class="col-md-4 control-label" for="adresse">Entrez  votre adresse</label>  
  <div class="col-md-8">
  <input id="adresse" name="adresse" type="text" placeholder="Entrez votre  adresse" class="form-control input-md">
    
  </div>
</div>

<!--  Champs CODE POSTAL-->
<div class="form-group">
  <label class="col-md-4 control-label" for="cp">Code Postal</label>  
  <div class="col-md-4">
  <input id="cp" name="cp" type="text" placeholder="Entrez votre code postal" class="form-control input-md">
    
  </div>
</div>

<!--  Champs VILLE -->
<div class="form-group">
  <label class="col-md-4 control-label" for="ville">Ville</label>  
  <div class="col-md-4">
  <input id="ville" name="ville" type="text" placeholder="Entrez votre ville" class="form-control input-md">
    
  </div>
</div>

<!--  Champs E-MAIL -->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">E-Mail</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" placeholder="Entrez votre e-mail" class="form-control input-md">
    
  </div>
</div>

<!--  Champs MOT DE PASSE -->
<div class="form-group">
  <label class="col-md-4 control-label" for="mdp">Mot de passe</label>  
  <div class="col-md-4">
  <input id="mdp" name="mdp" type="text" placeholder="Entrez votre mot de passe" class="form-control input-md">
    
  </div>
</div>

<!--  Champs TELEPHONE -->
<div class="form-group">
  <label class="col-md-4 control-label" for="tel">Téléphone</label>
  <div class="col-md-4">
    <input id="tel" name="tel" type="text" placeholder="Entrez votre téléphone" class="form-control input-md">
    
  </div>
</div>

<!--  VALIDATION  -->
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