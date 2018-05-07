<%-- 
    Document   : Index
    Created on : May 5, 2018, 11:37:18 AM
    Author     : Charles-Antoine
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page session="true" %>
<%@ page import="Models.Game" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <title>GameOTron</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color: black">
        <div class="container" style="background-color: graytext">
                            <%@include file="navbar.jsp" %>
            <h1 class="text-center">Welcome to the Game-O-Tron!</h1>
            <h4 class="text-center">The number 1456 game site in the world!</h4>
            <hr>
            <div class="row text-center">
                <c:forEach items="${Game.All()}" var="g">
                <div class="col-sm-4" style="border:solid;padding: 0px; margin: auto; height: 300px">
                    <h5><c:out value="${g.getNom()}" /></h5>
                    <span>Rating: <c:out value="${g.getRating()}"/></span>
                    <form action="display" method="post">
                        <button type="submit" name="idgame" value="<c:out value="${g.getId()}"/>">
                            <img src="images/<c:out value="${g.getPhoto()}" />" style="width: 150px"/>
                        </button>
                            
                    </form>
                </div>
                </c:forEach> 
        </div>
        </div>

        
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    </body>
</html>
