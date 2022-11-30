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
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>">  
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp;Cambio de Plan de Estudios</h1>
                    <p>RU: <c:out value="${datosEstudiante.id_estudiante}"/> Estudiante:  <c:out value="${datosEstudiante2.nombres}"/> &nbsp; 
                        <c:out value="${datosEstudiante2.paterno}"/> &nbsp;
                        <c:out value="${datosEstudiante2.materno}"/> Programa: <c:out value="${datosPrograma.programa}"/></p>
                    <p>${usuario}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form:form method="post" modelAttribute="model" action="${pageContext.request.contextPath}/registrarCambioPlan.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <form:hidden path="id_estudiante"/>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Plan Actual</label>
                                <div class="col-md-8">
                                    <c:out value="${datosEstudiante.id_plan}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Plan Nuevo</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="id_plan_nuevo" required>
                                        <option value="">-- seleccione --</option>
                                        <c:forEach var="lista" items="${lPlanesEstudio}">
                                            <option value="<c:out value="${lista.plan}"/>"> 
                                                <c:out value="${lista.tipo_grado}"/> - <c:out value="${lista.plan}"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form:form> 
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/cambioBuscarEstudiante.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>
