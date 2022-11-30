<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Sistema Integrado - Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/bootstrap/css/bootstrap.min.css'/>" >
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
    </head>
    <body>
        <div class="text-md-left mt-3 pb-3">
            <!-- Grid column -->
            <div class="col-md-12 text-center">
                <img src="<c:url value="/imagenes/Error404.png"/>" class="img-fluid" width="650" height="80"/>
            </div>
        </div>
        <div class="text-center">
            <div class="titulo">¡Error 500!</div>
            <c:out value="${mensaje}" escapeXml="false"/>
            <br>
            <br>
            <a class="volver" href="javascript:history.back();">Volver</a>
        </div>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.slim.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap/js/bootstrap.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>    
    </body>
</html>
