<%-- 
    Document   : index
    Created on : Apr 25, 2018, 11:35:42 AM
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
    
    <body style="background-color: gray">
        <div class="container">
        <%@include file="navbar.jsp" %>
        <div class="text-center">
            <h1>Bienvenue sur le site des figurines!</h1>
            <h4>Je sais pas vraiment quoi mettre comme titre je suis pas tres imaginatif... :P</h4>
        </div>
        <div class="row" style="; margin:auto;margin-top: 10%">
            <div class="text-center col-sm-3" style=" border: solid ; width: 25%">
                <form action="choseCat" method="post">
                    <label>Categorie</label>
                    <br>
                    <select  name="Categorie" style="width: 15em">
                        <c:forEach items="${Categorie.All()}" var="c">
                                <option  <c:if test="${sessionScope.CatChosed==c.getIdCat()}">
                                        selected
                                </c:if> value="${c.getIdCat()}">${c.getNom()}</option>
                          </c:forEach> 
                    </select>
                    <hr>
                    <input type="submit" name="Lookout" value="Lookout!">
                </form>
            </div>
            <c:if test="${sessionScope.CatChosed!=null}">   
                <div class ="text-center col-sm-4" style=" border: solid">
                    <form action="choseFig" method="post">
                        <label>Figurine</label>
                        <br>
                        <select id="figurine" name="Figurine" multiple="5" style="width: 15em">
                            <c:forEach items="${sessionScope.figurines}" var="f">
                                <option value="${f.getId()}">${f.getNom()}</option>
                              </c:forEach> 
                        </select>
                        <hr>
                    <input type="submit" name="Choisir" value="Chose">
                </form>
                </div>
                <c:if test="${sessionScope.figChosed!=null}">  
                    <div class="col-sm-2">
                        <img src="images/<c:out value="${sessionScope.figChosed.getPhoto()}" />" style="width: 150px"/>
                    </div>
                    <div class="col-sm-3">
                        <form action="addtoCart" method="post">
                            <p>Nom: <c:out value="${sessionScope.figChosed.getNom()}" /></p>
                            <p>Prix: <c:out value="${sessionScope.figChosed.getPrix()}" /></p>
                            <p>Description: <c:out value="${sessionScope.figChosed.getDescription()}" /></p>
                            <p>Quantite disponible: <c:out value="${sessionScope.figChosed.getQuantite()}" /></p>
                        <hr>
                    <input type="submit" name="Add" value="Add to Cart!">
                </form>
                    </div>
                </c:if>
            </c:if>
        </div>
        </div>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    </body>
</html>

