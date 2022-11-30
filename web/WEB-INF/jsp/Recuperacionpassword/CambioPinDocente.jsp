<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="imagetoolbar" content="no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/bootstrap/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/signin.css'/>" type="text/css">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/CambiarPin.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/AnalizarPassword.css'/>"> 
    </head>
    <body>
        <div class="container">
            <div class="container">
                <div class="text-center">
                    <h5><p>INTRODUCIR NUEVA CLAVE</p></h5>
                </div>
                <p>
                    <span class="error">La contraseña debe tener 8 caracteres de largo</span>
                </p>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="password-container">
                                <form action="<c:url value="RegistrarNuevoPinDocente.fautapo"/>" method="POST">

                                    <p>
                                        
                                        <input type=password placeholder="Nueva contraseña" name="nueva_clave" class="strong-password"/>
                                    </p>
                                    <p>
                                        
                                        <input type=password placeholder="Confirmar nueva contraseña" name="conf_nueva_clave" class="strong-password"/>
                                    </p>
                                    <input type="hidden" id="id_docente" name="id_docente" value="<c:out value="${id_docente}"/>">
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
    </div>>
    <script src="<c:url value='/Public/jquery/jquery-3.3.1.slim.min.js'/>"></script>
    <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>"></script>
    <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/Public/Js/pschecker.js'/>" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            //Demo code
            $('.password-container').pschecker({onPasswordValidate: validatePassword, onPasswordMatch: matchPassword});

            var submitbutton = $('.submit-button');
            var errorBox = $('.error');
            errorBox.css('visibility', 'hidden');
            submitbutton.attr("disabled", "disabled");

            //this function will handle onPasswordValidate callback, which mererly checks the password against minimum length
            function validatePassword(isValid) {
                if (!isValid)
                    errorBox.css('visibility', 'visible');
                else
                    errorBox.css('visibility', 'hidden');
            }
            //this function will be called when both passwords match
            function matchPassword(isMatched) {
                if (isMatched) {
                    submitbutton.addClass('unlocked').removeClass('locked');
                    submitbutton.removeAttr("disabled", "disabled");
                } else {
                    submitbutton.attr("disabled", "disabled");
                    submitbutton.addClass('locked').removeClass('unlocked');
                }
            }
        });
    </script>
</body>
</html>
