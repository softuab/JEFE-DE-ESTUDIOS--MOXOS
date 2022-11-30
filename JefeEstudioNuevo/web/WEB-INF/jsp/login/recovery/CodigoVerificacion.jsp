<jsp:useBean id="now" class="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#305496">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" /> 
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <title>Ingreso - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="icon" type="image/png" href="<c:url value='/imagenes/logouab.ico'/>">
        <style>
            .invalid{
                width: 100%;
                margin-top: .25rem;
                font-size: 80%;
                color: #dc3545;
            }
        </style>
    </head>
    <body>

        <section class="material-half-bg">
            <div class="cover"></div>
        </section>

        <section class="login-content">
            <div class="logo">

            </div>
            <div class="login-box">
                <form:form cssClass="login-form" modelAttribute="model" action="${pageContext.request.contextPath}/Recovery.fautapo" method='post'>
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Recupera tu cuenta</h3>
                    <h4 class="h3 mb-3 font-weight-normal text-center"><c:out value="${nombrecompleto}"/></h4>
                    <form:hidden path="id_usr_adm"/>
                    <form:hidden path="nombre_completo"/>
                    <p class="text-justify">
                        Para restablecer su contraseña, ingrese el código de verificación que se envió a su correo electrónico. 
                    </p>
                    <div class="form-group">
                        <label for="inputEmail" class="sr-only">Codigo de verificacion</label>
                        <form:input cssClass="form-control" placeholder="7E486110-A533-409D-BFBB-029D39F50283" path="token"/>
                        <form:errors path="token" cssClass="invalid"/>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Siguiente</button>
                    </div>
                </form:form>
            </div>
        </section>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
    </body>
</html>