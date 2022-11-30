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
        <title>Ingreso - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
    </head>
    <body>
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>

        <section class="lockscreen-content">
            <div class="lock-box">
                <h4 class="text-center user-name">${usuario}</h4>
                <p class="text-center text-muted">
                    ${acceso.acceso}<br>
                    <c:choose>
                        <c:when test="${cliente.id_universidad > 0}">Universidad</c:when>
                        <c:when test="${cliente.id_facultad > 0}">Facultad</c:when>
                        <c:when test="${cliente.id_programa > 0}">Programa</c:when>
                        <c:when test="${cliente.id_departamento > 0}">Departamento</c:when>
                        <c:when test="${tipo.id_tipo_evaluacion > 0}">Tipo de Evaluacion</c:when>
                    </c:choose>   
                </p>
                <form name="forma" class="unlock-form" action="<c:url value="/ListarProcesoDocumentacionDocentesPrograma.fautapo"/>" method="POST">     
                    <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
                    <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
                    <input type="hidden" name="id_programa" value='<c:out value="${cliente.id_programa}"/>' >
                    <div class="form-group row">
                        <label class="control-label col-md-3">Plan:</label>
                        <div class="col-md-9">
                            <select class="form-control" name="id_plan" id="id_plan">
                                <optgroup label="Seleccionar plan">
                                    ${planes}
                                </optgroup> 
                            </select> 
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">Tipo de Evaluaci&oacute;n</label>
                        <div class="col-md-9">
                            <select class="form-control" name="id_tipo_evaluacion" id="id_tipo_evaluacion">
                                <optgroup label="Seleccionar tipo evaluacion">
                                    ${evaluaciones}
                                </optgroup> 
                            </select> 
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
        <script src="<c:url value='/Public/Js/plugins/bootstrap-datepicker.min.js'/>"></script> 
    </body>
</html>
