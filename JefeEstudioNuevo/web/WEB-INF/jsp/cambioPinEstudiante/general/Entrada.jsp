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
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">  
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body> 
                <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <section class="lockscreen-content">
            <div class="lock-box"><img class="rounded-circle user-image" src="${simagen}">
                <h4 class="text-center user-name"><c:out value="${nombres}" /></h4>
                <p class="text-center text-muted">Cambio Clave (PIN) Estudiante - Autoridad</p>
                 <form method="post" action='<c:url value="/cambioPinEstudianteGeneral/comprobarEntrada.fautapo"/>'>
                     <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
                    <div class="form-group">
                        <input class="form-control" type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' placeholder="Contraseña" autofocus>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block" type="submit" id="boton" name="boton" value="Buscar"><i class="fas fa-search"></i>Buscar </button>
                    </div>
                </form>
               
            </div>
        </section>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script> 
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    </body>
</html>
