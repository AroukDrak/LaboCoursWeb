<%-- 
    Document   : cart
    Created on : May 2, 2018, 6:23:47 PM
    Author     : Charles-Antoine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page session="true" %>
<%@ page import="Models.Categorie,Models.Figurine" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <title>Figurines</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <h1 class="text-center">Panier</h1>
        <table style="width:100%" class="table-bordered table-hover">
            <tr>
                <thead>
                    <th>Nom</th>
                    <th>Desc</th> 
                    <th>Prix</th>
                    <th>Categorie</th>
                    <th>Remove</th>
                </thead>
            </tr>
            <tbody>
            <c:if test="${sessionScope.panier.getFigurines()!=null}">
            <c:forEach items="${sessionScope.panier.getFigurines()}" var="f">                             
            <tr>
                <td><c:out value="${f.getNom()}"/></td>
                <td><c:out value="${f.getDescription()}"/></td> 
                <td><c:out value="${f.getPrix()}"/>$</td>
                <td><c:out value="${f.getCategorie().getNom()}"/></td>
            
                <td>
                    <form action="removeFromCart" method="post">
                        <button type="submit" name="remove" value="<c:out value="${f.getId()}"/>">Remove</button>
                    </form>
                </td>
            </tr>
            </c:forEach> 
            </c:if>
            </tbody>
      </table>
        </div>
        
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    </body>
</html>