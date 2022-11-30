<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="imagetoolbar" content="no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">  
    </head>
    <body class="app sidebar-mini rtl">
        <c:if test="${!empty id_rol}">
            <main id="contenedor" class="app-content3">
                <div class="app-title">
                    <div>
                        <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                        <p>${sigla} - ${materia} GRUPO ${grupo} </p>
                        <p><c:out value="${programa}"/> </p>
                    </div>
                    <ul class="app-breadcrumb breadcrumb">
                        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                        <li class="breadcrumb-item">${fase}</li>
                    </ul>
                </div>

                <div class="row">
                    <div class="col-sm-12"> 
                        <div class="tile">
                            <div class="row">
                                <div class="col-md-12 order-md-2 mb-12">
                                    <h4 class="mb-3">Actualizar usuario y contraseña</h4>
                                    <form id="registrarusuario" class="bootstrap-form needs-validation" method='post' action="<c:url value='/UsuariosCursosMoodle.fautapo'/>" novalidate>
                                        <div class="mb-3">
                                            <label for="username">Usuario</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">@</span>
                                                </div>
                                                <input id="username" name="usuario" type="text" onkeyup="javascript:this.value = this.value.toLowerCase();" value="${correo}" readonly class="form-control" 
                                                       data-validate="none" 
                                                       data-error="erroruser" 
                                                       data-stringlenght="6" 
                                                       data-stringlenghterror="Debe introducir como minimo 6 digitos" 
                                                       placeholder="Nombre de usuario"
                                                       data-estado="false">
                                                <div class="invalid-feedback">
                                                    <span id="erroruser">Necesita definir un usuario.</span>
                                                </div>   
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="firstName">Nombres</label>
                                                <input type="text" class="form-control" id="nombres" name="nombres" placeholder="" value="${nombre}" readonly required>
                                                <div class="invalid-feedback">
                                                    Necesita introducir su nombre.
                                                </div> 
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="lastName">Apellidos</label>
                                                <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="" value="${apellidos}" readonly required>
                                                <div class="invalid-feedback">
                                                    Necesita introducir su apellido.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="contrasenia">Contraseña</label>
                                                <input type="password" class="form-control" id="contrasenia" placeholder="" value=""  data-validate="none"  
                                                       data-error="errorpassword" 
                                                       data-stringlenght="8" 
                                                       data-stringlenghterror="Debe introducir como minimo 8 digitos" 
                                                       data-stringlenghterrorpassword="La contraseña debería tener al menos 8 caracteres 1 alfabeto y 1 número: por razones de seguridad" 
                                                       placeholder="Contraseña"
                                                       data-estado="false">
                                                <div class="invalid-feedback">
                                                    <span id="errorpassword">Validar su contraseña.</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="repetircontrasenia">Repetir contraseña</label>
                                                <input type="password" class="form-control" id="repetircontrasenia" name="password"
                                                       placeholder="Repetir contraseña" value="" 
                                                       data-validate="revalidate" 
                                                       data-error="errorrevalidate"  
                                                       data-stringerror="Debe introducir como minimo introducir de nueva la contrseña anterior" 
                                                       data-input="#contrasenia"  
                                                       data-estado="false">
                                                <div class="invalid-feedback">
                                                    <span id="errorrevalidate">Validar su contraseña.</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="correo">Correo</label>
                                            <input type="email" class="form-control" id="correo" name="correo" value="${correo}" placeholder="you@example.com" readonly required>
                                            <div class="invalid-feedback">
                                                Registrar un correo electronico valido.
                                            </div>
                                        </div>
                                        <input type="hidden" name="idnumber" value="${idnumber}">
                                        <input type="hidden"  name="aux" value="${aux}">
                                        <input type="hidden"  name="gestion" value="${gestion}">
                                        <input type="hidden"  name="periodo" value="${periodo}">
                                        <input type="hidden"  name="nombres" value="${nombres}">
                                        <input type="hidden"  name="avanzado" value="${avanzado}">
                                        <input type="hidden"  name="clave" value="${clave}">
                                        <hr class="mb-4"> 
                                        <button name="enviarregistro" onclick="Submit()" data-loading="<i class='fas fa-spinner fa-spin'></i> Registrando" class="btn btn-primary btn-lg btn-block" type="button">Continuar con el registro</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </c:if>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script> 
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/bootstrap-notify.min.js'/>"></script>
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script>
        <script>
                                            document.oncontextmenu = function () {
                                                return false;
                                            }
                                            function Submit()
                                            {
                                                var $this = $("#enviarregistro");
                                                $this.html($this.data('loading'));
                                                $this.prop("disabled", true);
                                                document.getElementById("registrarusuario").submit();
                                            }
        </script>
    </body>
</html>
