<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
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
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.min.css'/>"> 
        <link href="<c:url value='/Public/Css/bienvenida.css'/>" rel="stylesheet"/>
        <link href="<c:url value='/Public/Css/Socialmedia.css'/>" rel="stylesheet"/>
        <link href="<c:url value='/Public/Css/Loader.css'/>" rel="stylesheet"/>
    </head>
    <body>
        <div class="container">
            <div class="preloader-background">
                <div class="loader">
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                </div>
            </div>
            <div class="content text-center">
                <form method="POST" id="submitimagen" enctype="multipart/form-data" action="CargarImagenes.fautapo">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <a href="#" id="subirimagen">
                        <img type="image" id="fotoperfil" name="imageField" src="${simagen}" alt="stack photo" class="img rounded-circle border border-info" width="100" height="100" /> 
                    </a>
                    <input type="text" id="filedocente" name="filedocente"  data-file_types="png|jpg|jpeg" style="display: none" accept="image/png, image/jpeg" onchange="PreviewImage()"/>
                </form>
                <H3>BIENVENIDO</H3>
                <h2>${snombre}</h2>
            </div>
        </div>
        <div id='ss_menu'>
            <div> <i data-url='https://www.youtube.com/channel/UCyVNjeqIEyvWLminDUMW-Jw?view_as=subscriber' class="fab fa-youtube"></i> </div>
            <div><i id="idllamada" data-url='' class="fas fa-phone-volume"></i></div>
            <div><i data-url='https://api.whatsapp.com/send?phone=59172815626&text=Necesito soporte puede ayudarme Ing. Darlin Meneses? soy ${snombre}' class="fab fa-whatsapp"></i></div>
            <div> <i id="idmensaje" data-url="" class="far fa-envelope-open"></i> </div>
            <div> <i data-url='https://www.facebook.com/profile.php?id=100037877328880' class="fab fa-facebook-f"></i></div>
            <div class='menu'>
                <div class='share' id='ss_toggle' data-rot='180'>
                    <div class='circle'></div>
                    <div class='bar'></div>
                </div>
            </div>
        </div>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/bootstrap-notify.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/sweetalert.min.js"/>"></script>
        <script src="<c:url value='/Public/Js/Vercuerpo/mainvercuerpo.js'/>"></script>
        <script src="<c:url value='/Public/Js/Socialmedia.js'/>"></script>
        <script>
                        var isMobile = {
                            Android: function () {
                                return navigator.userAgent.match(/Android/i);
                            },
                            BlackBerry: function () {
                                return navigator.userAgent.match(/BlackBerry/i);
                            },
                            iOS: function () {
                                return navigator.userAgent.match(/iPhone|iPad|iPod/i);
                            },
                            Opera: function () {
                                return navigator.userAgent.match(/Opera Mini/i);
                            },
                            Windows: function () {
                                return navigator.userAgent.match(/IEMobile/i);
                            },
                            any: function () {
                                return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
                            }
                        };
                        if (isMobile.any()) {
                            $("#idmensaje").data("url", "sms:+59172815626?body=${snombre} SOLICITA AYUDA");
                            $("#idllamada").data("url", "wtai://wp/mc;76875328");
                        } else {
                            $("#idmensaje").data("url", "https://mail.google.com/mail/?view=cm&fs=1&to=soporte@uabjb.edu.bo&su=${snombre} SOLICITA AYUDA&body=Sr.%20Ingenniero&bcc=dtic@uabjb.edu.bo.");
                            $("#idllamada").data("url", "http://www.uabjb.edu.bo/uabjb/index.php/page-2/contacto-dtic");
                        }
        </script>
    </body>
</html>