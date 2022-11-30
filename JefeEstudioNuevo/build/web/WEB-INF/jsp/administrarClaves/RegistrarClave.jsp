<%@ include file="../Inferior.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head> 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="imagetoolbar" content="no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/CambiarPin.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/AnalizarPassword.css'/>">
        <style>
            .invalid{
                width: 100%;
                margin-top: .25rem;
                font-size: 80%;
                color: #dc3545;
            }
        </style>
    </head>
    <body class="app sidebar-mini rtl">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; <c:out value="${nombres}" /></h1>
                    <p>Modificacion de contraseña</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">        
                        <div class="row">
                            <div class="col">
                                <p>
                                    <span class="error">La contraseña debe tener 8 caracteres de largo</span>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="password-container">
                                    <form:form method="post" action="${pageContext.request.contextPath}/registrarClave.fautapo" modelAttribute="model" >
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <p>
                                            <form:password path="nueva_clave" cssClass="strong-password" placeholder="Nueva contraseña" ></form:password> 
                                            </p>
                                            <p>
                                            <form:password path="conf_nueva_clave" cssClass="strong-password" placeholder="Nueva contraseña"></form:password>  
                                            <form:errors path="conf_nueva_clave"  cssClass="invalid"/>
                                        </p>
                                        <input type="submit" class="submit-button locked" name="boton" value="Aceptar" class="aceptar">
                                        <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>  
                                    </form:form>
                                </div>
                            </div>
                            <div class="col">
                                <div class="strength-indicator">
                                    <div class="meter">
                                    </div>
                                    Las contraseñas fuertes contienen de 8 a 16 caracteres, no incluyen palabras o nombres comunes,
                                    y combina letras mayúsculas, minúsculas, números y símbolos.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/pschecker.js'/>"></script>
        <script src="<c:url value='/Public/Js/cambiarpin.js'/>"></script>
    </body>
</html>
