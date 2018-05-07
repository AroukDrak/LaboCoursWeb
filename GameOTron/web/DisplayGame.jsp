<%-- 
    Document   : Index
    Created on : May 5, 2018, 11:37:18 AM
    Author     : Charles-Antoine
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://www.paypalobjects.com/api/checkout.js"></script>
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
                <div class="col-sm-4" style="border:solid;padding: 0px; margin: auto; height: 300px">
                    <h5><c:out value="${sessionScope.game.getNom()}" /></h5>
                    <span>Rating: <c:out value="${sessionScope.game.getRating()}"/></span>
                    <img src="images/<c:out value="${sessionScope.game.getPhoto()}" />" style="width: 150px"/>
                            
                </div>
                <div class="col-sm-5" style="border:solid;padding: 0px; margin: auto; height: 300px">
                    <p><c:out value="${sessionScope.game.getDescription()}" /></p>

                    <form action="rate" method="post">
                        <span>Rating: <c:out value="${sessionScope.game.getRating()}"/></span>
                        <br>
                        <button name="rate" type="submit" value="like">
                            <img src="images/like.png" style="width: 35px; height: 35px"/>
                        </button>
                        <button name="rate" type="submit" value="dislike">
                            <img src="images/dislike.jpg" style="width: 35px; height: 35px"/>
                        </button>
                    </form>
                </div>
                            
                <div id="paypal-button-container">
     <script>
        paypal.Button.render({

            env: 'sandbox', // sandbox | production

            // PayPal Client IDs - replace with your own
            // Create a PayPal app: https://developer.paypal.com/developer/applications/create
            client: {
                sandbox:    'AQWf2jDLNUwwuN3RQlnTTsQz_b_CCxemRRKKY19WcBkspFHhud3zUcfAbS4ulzNy1_3DZbBfDKAs6zbE',
                production: '<insert production client id>'
            },

            // Show the buyer a 'Pay Now' button in the checkout flow
            commit: true,

            // payment() is called when the button is clicked
            payment: function(data, actions) {

                // Make a call to the REST api to create the payment
                return actions.payment.create({
                    payment: {
                        transactions: [
                            {
                                amount: { total: <c:out value="${sessionScope.game.getPrix()}"/>, currency: 'CAD' }
                            }
                        ]
                    }
                });
            },

            // onAuthorize() is called when the buyer approves the payment
            onAuthorize: function(data, actions) {

                // Make a call to the REST api to execute the payment
                return actions.payment.execute().then(function() {
                    window.alert('Payment Complete!');
                });
            }

        }, '#paypal-button-container');

    </script>
            </div>
        </div>
        </div>

        
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    </body>
</html>
