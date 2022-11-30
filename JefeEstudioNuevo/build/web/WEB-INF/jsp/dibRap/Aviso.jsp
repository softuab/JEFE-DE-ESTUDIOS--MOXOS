<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/signin.css'/>" type="text/css">
    </head>
    <body>
        <div class="container">
            <br>
            <div class="Card-Informacion">
                <div class="card border-secondary mb-3" style="max-width: 18rem;">
                    <div class="card-header text-center"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;AVISO</div>
                    <div class="card-body text-secondary">
                        <p class="card-text text-center">
                            <c:out value="${mensaje}"/><br><br>
                            <a class="btn btn-primary" href="#" id="btnsalir">Aceptar</a>
                        </p>
                        <form method='post' id="frmsalir" action="<c:url value='/dibRap/listarDatos.fautapo'/>">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
                            <input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
                            <input type="hidden" name="p" value="<c:out value='${permiso}' />">
                            <input type="hidden" name="f" value="<c:out value='${condicion}' />">
                            <input type="hidden" name="a" value="<c:out value='${id_actividad}' />">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>

