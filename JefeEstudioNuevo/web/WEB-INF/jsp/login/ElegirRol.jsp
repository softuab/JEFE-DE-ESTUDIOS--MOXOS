<jsp:useBean id="now" class="java.util.Date"/> 
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
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" /> 
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <title>Ingreso - Moxos</title> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>">
        <link rel="icon" type="image/png" href="<c:url value='/imagenes/logouab.ico'/>">
    </head>
    <body>
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <section class="lockscreen-content">
            <div class="lock-box"> 
                <img class="rounded-circle user-image" src="${simagen}">
                <h4 class="text-center user-name">BIENVENIDO</h4>
                <p class="text-center text-muted">
                    Seleccionar el rol deseado  
                </p>
                <form method="post" action="${pageContext.request.contextPath}/CambiarRol.fautapo">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <select class="form-control" name="id_rol" id="id_rol">
                                    <optgroup label="Seleccionar rol">
                                        <c:forEach var="roles" items="${cliente.roles}">
                                            <OPTION value="<c:out value='${roles.id_rol}' />"><c:out value="${roles.rol}"/>
                                            </c:forEach>
                                    </optgroup> 
                                </select> 
                            </div>
                        </div>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-unlock fa-lg"></i>Ingresar </button>
                    </div>
                </form>
            </div>
        </section>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/bootstrap-datepicker.min.js'/>"></script> 
    </body>
</html>