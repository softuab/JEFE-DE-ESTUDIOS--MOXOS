<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#305496">
        <meta http-equiv="imagetoolbar" content="no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>">
        <link rel="icon" type="image/png" href="<c:url value='/imagenes/logouab.ico'/>">
    </head>
    <body onload="IniciarCuerpo()" class="app sidebar-mini rtl">
        <header class="app-header"><a class="app-header__logo" href="<c:url value='/index.fautapo'/>">Moxos</a>
            <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"> <font size="5"> <i class="fas fa-bars"></i></font></a>
            <ul class="app-nav"> 
                <li class="dropdown">
                    <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications">
                        <span id="status" class="text-success"><i class="fas fa-circle"></i></span>
                    </a>
                </li>
                <li class="dropdown">
                    <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications">
                        <i class="far fa-bell fa-lg"></i></a>
                    <ul class="app-notification dropdown-menu dropdown-menu-right">
                        <li class="app-notification__title">Usted tiene ${cantidadnotificacion} </li>
                        <div class="app-notification__content">
                            <c:forEach var="notificacion" items="${notificaciones}" varStatus="contador">
                                <li>
                                    <a class="app-notification__item" href="${notificacion.url}" target="_blank"><span class="app-notification__icon">
                                            <span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                                        <div>
                                            <p class="app-notification__message">${notificacion.contenido}</p>
                                            <p class="app-notification__message">${notificacion.departamento}</p>
                                            <p class="app-notification__meta"><fmt:formatDate value="${notificacion.fecha_publicacion}" pattern="dd, MMMM yyyy" /></p>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </div>
                        <li class="app-notification__footer"><a href="http://uabjb.edu.bo/uabjb/comunicados" target="_blank">Ver todas las Notificaciones.</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
                    <ul class="dropdown-menu settings-menu dropdown-menu-right">
                        <!-- <li><a class="dropdown-item" href="#" onclick="IrPerfil()"><i class="fa fa-user fa-lg"></i> Perfil</a></li> -->
                        <li><a class="dropdown-item" href="<c:url value="/Logout.fautapo" />" target="_top"><i class="fas fa-sign-out-alt"></i> Salir</a></li>
                    </ul>
                </li>
            </ul>
        </header>
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${simagen}" alt="Docente">
                <div>
                    <p class="app-sidebar__user-name">${snombre}</p>
                    <p class="app-sidebar__user-designation">Administracion Gral.</p>
                </div>
            </div>
            <ul class="app-menu">
                <li>
                    <a class="app-menu__item active" href="<c:url value='/index.fautapo'/>">
                        <i class="app-menu__icon fas fa-tachometer-alt"></i><span class="app-menu__label">Administracion</span>
                    </a>
                </li>
                ${fil}
            </ul>
        </aside>
        <main class="app-content2">
            <div class="frame">
                <iframe id="marco" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen  >
                    Contenido de IFRAME
                </iframe> 
            </div>
        </main>
        <!-- Essential javascripts for application to work-->
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/Menu/Menujs.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/bootstrap-notify.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/sweetalert.min.js"/>"></script>
        <script>
        document.oncontextmenu = function () {
            return false;
        }
        window.addEventListener('online', function () {
            document.getElementById("status").classList.add("text-success");
            document.getElementById("status").classList.remove("text-danger");
            $.notify({
                title: "Retornando conexion : ",
                message: "conectado..!",
                type: 'success',
                icon: 'fas fa-exclamation-triangle'}, {
                allow_dismiss: false,
                placement: {
                    from: "top",
                    align: "right"
                }
            });
        }, false);

        window.addEventListener('offline', function () {
            document.getElementById("status").classList.add("text-danger");
            document.getElementById("status").classList.remove("text-success");
            var div = document.createElement("div");
            div.innerHTML = "<table border=0 cellspacing=0 cellpadding=0><tr><td width=100% valign=top ><p align=center></p><p align=center><span style='font-size:28.0pt;color:red'>AVISO</span></b></p></td></tr><tr><td><p  ALIGN='justify'>No existe conexion, revise su red o su conexion a internet</p> </td></tr></table>";
            swal({
                content: div,
                type: "warning"
            });
        }, false);
        function IniciarCuerpo()
        {
            var ruta = "./VerCuerpo.fautapo";
            $('#marco').attr('src', ruta);
        }
        function IrPerfil() {
            var ruta = "./VerificarYObtenerKardex.fautapo";
            $('#marco').attr('src', ruta);
        }
        </script>
    </body>
</html>