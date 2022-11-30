<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Sistema Integrado - Gran Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/bootstrap/css/bootstrap.min.css'/>" >
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>" >
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>" ></script>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.slim.min.js'/>" ></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>    
    </head>
    
        <div class="text-md-left mt-3 pb-3">
            <!-- Grid column -->
            <div class="col-md-12 text-center">
                <img src="<c:url value="/imagenes/Error404.png"/>" class="img-fluid" width="650" height="80"/>
            </div>
        </div>
        <div class="text-center">
            <div class="titulo">¡Error 404!</div>
            <c:out value="${mensaje}" escapeXml="false"/>
            <br>
            <br>
            <a class="volver" href="javascript:history.back();">Volver</a>
        </div>
   
</html>