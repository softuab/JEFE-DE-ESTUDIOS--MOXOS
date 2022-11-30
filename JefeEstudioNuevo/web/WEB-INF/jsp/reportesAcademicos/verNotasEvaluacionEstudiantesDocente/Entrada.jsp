<jsp:useBean id="now" class="java.util.Date"/> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <title>Ingreso - Moxos</title> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
    </head>
    <body> 
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <section class="lockscreen-content">
            <div class="lock-box"><img class="rounded-circle user-image" src="${simagen}">
                <h4 class="text-center user-name">${usuario}</h4>
                <p class="text-center text-muted">Reporte Notas Evaluaci&oacute;n Estudiante-Docente</p>
                <form name=forma class="unlock-form" action="<c:url value="listarDctMateriasDocente.fautapo"/>" method="POST">    
                    <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
                    <input type="hidden" name="bandera" value='0' />
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Gestion</label>
                        </div>
                        <select class="custom-select" name="gestion" id="gestion">
                            <c:forEach var = "i" begin = "1990" end = "${gestion}">
                                <c:choose>
                                    <c:when test = "${i == gestion}">
                                        <option  selected value="${i}"><c:out value = "${i}"/></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${i}"><c:out value = "${i}"/></option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Periodo</label>
                        </div>
                        <select class="custom-select" name="periodo" id="periodo">
                            <c:forEach var = "i" begin = "1" end = "2">
                                <c:choose>
                                    <c:when test = "${i == periodo}">
                                        <option  selected value="${i}"><c:out value = "${i}"/></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${i}"><c:out value = "${i}"/></option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' placeholder="Introduzca su contraseña"  class="form-control">
                    <input type="hidden" name="nombres"  value="<c:out value='${usuario}'/>">
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-unlock fa-lg"></i>Ingresar </button>
                    </div>
                </form>
            </div>
        </section>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"</script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>      
    </body>
</html>


