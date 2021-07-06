<%@page contentType="text/html" language="java" import="java.sql.*,java.text.*" pageEncoding="UTF-8" errorPage="" %>
<%@page import="java.time.*"%>

<!DOCTYPE html>

<head>
<! -- appel de bootStrap pour la mise en forme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Gestion Plantes</title>
</head>
<body>
  <tbody>

<table class="table table-striped">
  <tbody>
    <tr><td><p class="h1">Bienvenue dans le programme Plantes</td></tr>
        <!-- Affichage du menu -->
<tr><td><a href='afficher.jsp'>1 - Afficher tous les Clients</a></td></tr>
<tr><td><a href='afficherTrie.jsp'>2 - Afficher les client par ordre alphabétique(noms)</a></td></tr>
<tr><td><a href='afficherTrieDate.jsp'>3 - Trier et afficher les clients par date d'inscription (de la plus récente à la plus ancienne)</a></td></tr>
<tr><td><a href='ajouter.jsp'>4 - Ajouter un Client</a></td></tr>
<tr><td><a href='ajouterProduit.jsp'>5 - Ajouter un produit</a></td></tr>
<tr><td><a href='afficher_cmd.jsp'>6 - Afficher toute les commandes</a></td></tr>
<tr><td><a href='afficher_cmd_cli.jsp'>7 - Afficher toute les commandes d'un client (where id cli=?)</a></td></tr>
<tr><td><a href='modifie_cli.jsp'>8 - Modifier un client</a></td></tr>
<tr><td><a href='ajout_cmd.jsp'>9 - Inserer une ligne dans : détail_commande </a></td></tr>
<tr><td><a href='paiement.jsp'>10 - Inserer une ligne dans : paiement</a></td></tr>


</body>
</html>