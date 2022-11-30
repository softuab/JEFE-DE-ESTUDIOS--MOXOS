
<jsp:useBean id="now" class="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">  
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" /> 
        <title>Sistema Integrado - Moxos</title> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/signin.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/bootstrap/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 

    </head>
    <body  class="text-center">

        <form class="form-signin" name='forma' action='<c:url value="VerificarToken.fautapo"/>' method='post' >
            <br/><h1 class="h3 mb-3 font-weight-normal">Recupera tu cuenta</h1><br/>
            <br/><h2 class="h3 mb-3 font-weight-normal"><c:out value="${nombrecompleto}"/></h2><br/>
            <c:set var = "salary" scope = "session" value = "${mensaje}"/>
            <c:if test = "${salary != null}">
                <div class="alert alert-danger" role="alert"><c:out value="${mensaje}"/></div> 
            </c:if> 
                <p class="text-justify">
                    Para restablecer su contraseña, ingrese el código de verificación que se envió a su correo electrónico. 
                </p>
            <label for="inputEmail" class="sr-only">Codigo de verificacion</label>
            <input type="text" class="form-control" placeholder="7E486110-A533-409D-BFBB-029D39F50283" required autofocus name='token'>
           <input type="hidden" id="id_docente" name="id_docente" value="<c:out value="${id_docente}"/>">
            <br/>
           <button class="btn btn-lg btn-primary btn-block" type="submit">Siguiente</button>
        </form>

        <script src="<c:url value='/Public/jquery/jquery-3.3.1.slim.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>"></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>

    </body>
</html>
