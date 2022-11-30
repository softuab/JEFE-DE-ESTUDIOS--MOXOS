<jsp:useBean id="now" class="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
        <title>Ingreso - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="icon" type="image/png" href="<c:url value='/imagenes/logouab.ico'/>">
    </head>
       <body onload="getLocation()"> 
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <section class="login-content">
            <div class="logo">
            </div>
            <div class="login-box">
                <c:set var = "aviso" scope = "session" value = "${mensaje}"/>
                <c:if test = "${aviso != null}">
                    <div class="alert alert-danger" role="alert"><c:out value="${mensaje}"/></div> 
                </c:if> 
                <form class="login-form" id="forma" name='forma' action='<c:url value="/authentication.fautapo"/>' method='post' >
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="login-head"><img src="<c:url value='/imagenes/jefeestudio.gif'/>" alt=""/></div>
                    <input type="hidden" id="ubicacion" name="ubicacion"/>
                    <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'/>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                            </div>
                            <input type="text"  class="form-control" placeholder="Usuario" required autofocus name='apodo'>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="Contraseña" required  name='clave' >
                        </div>
                        <div> 
                            <img id="captcha_id" name="imgCaptcha" src="captcha.jpg">
                            <a href="javascript:;"
                               title="Cambiar captcha"
                               onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
                                <img src="imagenes/refresh.png" /></a>
                        </div> 
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-user-secret"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Introducir codigo de verificacion" required autofocus name='captcha'>
                        </div>
                        <div class="utility">
                            <p class="semibold-text mb-2"><a href="#" data-toggle="flip">¿Recuperar su contraseña?</a></p>
                        </div>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>Ingresar</button>
                    </div>
                </form>
                <form class="forget-form" id='formarecovery' action='<c:url value="/Recovery.fautapo"/>' method='GET'>
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Recupera tu cuenta</h3>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                            </div>
                            <input type="email"  class="form-control" aria-describedby="emailHelp" placeholder="jefeestudio@uabjb.edu.bo" required autofocus name='correo' id="correo_recovery">
                        </div>
                        <div> 
                            <img id="captcha_id_recovery" name="imgCaptcha" src="captcha.jpg">
                            <a href="javascript:;"
                               title="Cambiar captcha"
                               onclick="document.getElementById('captcha_id_recovery').src = 'captcha.jpg?' + Math.random();  return false">
                                <img src="imagenes/refresh.png" /></a>
                        </div> 

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-user-secret"></i></span>
                            </div>
                            <input  type="text" class="form-control"  placeholder="Introducir codigo de verificacion" required autofocus name='captcha' id='captcha'>
                        </div>
                    </div>
                    <div class="form-group btn-container">
                        <button id="btnrecovery"  data-url="${pageContext.request.contextPath}/ExisteUsuario.fautapo" type="button" class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>Resetear</button>
                        <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Iniciar Sesion</a></p>
                    </div>
                </form>
            </div>
            <div class="modal fade" id="anuncio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <img src="<c:url value='/imagenes/comunicado.png'/>"  class="img-fluid" alt="Responsive image">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Entiendo</button> 
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/sweetalert.min.js"/>"></script>
        <script src="<c:url value="/Public/Js/app/login.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/Public/Js/app/login/main.js"/>" type="module"></script>
    </body>
</html>