<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">  
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" /> 
        <title>Ingreso - Moxos</title> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
    </head>
    <body>

        <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <c:if test="${!empty id_rol}"> 
            <section class="lockscreen-content">
                <div class="lock-box"><img class="rounded-circle user-image" src="${simagen}">
                    <h4 class="text-center user-name">${nombres}</h4>
                    <p class="text-center text-muted">Cambio clave(PIN) docente</p>
                    <form name="forma" class="unlock-form" action="<c:url value="/cambioPinDocente/avisoCambioPin.fautapo"/>" method="POST">
                        <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
                        <div class="input-group">
                            <input type="password" class="form-control" placeholder="Introducir contraseña antigua" required autofocus name='clave<fmt:formatDate value="${now}"  pattern="yyyyMMddhhmmss" />'>
                        </div>
                        <div class="form-group btn-container">
                            <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-search"></i>&nbsp; Buscar</button>
                        </div>
                    </form>
                </div>
            </section>
        </c:if>

        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"</script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    </body>
</html>
