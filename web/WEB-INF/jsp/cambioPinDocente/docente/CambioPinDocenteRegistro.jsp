<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/CambiarPin.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/AnalizarPassword.css'/>"> 
    </head>
    <body class="app sidebar-mini rtl">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
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
                                    <form action="<c:url value="/cambioPinDocente/registrarNuevoPin.fautapo"/>" method="POST">
                                        <input type="hidden" name="csrfPreventionSalt" value="<c:out value='${csrfPreventionSalt}'/>"/>
                                        <p>

                                            <input type=password placeholder="Nueva contraseña" name="nueva_clave" class="strong-password"/>
                                        </p>
                                        <p>

                                            <input type=password placeholder="Confirmar nueva contraseña" name="conf_nueva_clave" class="strong-password"/>
                                        </p>
                                        <input type="submit" class="submit-button locked"  value="Modificar" class="aceptar">
                                        <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>  
                                    </form>

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
        </main>>
    </div>>
    <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
    <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/main.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/pschecker.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/Public/App/maincambiarpin/cambiarpin.js'/>"></script>
</body>
</html>
