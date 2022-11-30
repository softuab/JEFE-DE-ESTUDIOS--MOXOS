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
        <META name="_csrf" content="${_csrf.token}"/>
        <META name="_csrf_header" content="${_csrf.headerName}"/>
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>">
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Modificar Materia Optativa</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <c:if test="${!empty error}">
                            <div class="row">
                                <div class="col">
                                    <div class="alert alert-danger" role="alert">
                                        <ol>
                                            <c:forEach var="error" items="${error}" varStatus="cont">
                                                <li>${error}</li>
                                                </c:forEach>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <form:form modelAttribute="formulario" cssClass="form-horizontal" method="post" action="${pageContext.request.contextPath}/EditarMateriaOptastivaEstudiante.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                            <form:hidden path="id_programa"/>
                            <form:hidden path="id_estudiante"/>
                            <form:hidden path="nombre_estudiante"/>
                            <form:hidden path="id_plan"/>
                            <form:hidden path="id_prg_plan"/>
                            <form:hidden path="id_est_materiaoptativa"/>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Estudiante Universitario ::</label>
                                <div class="col-md-9">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span  id="nombreestudiante">${formulario.nombre_estudiante}</span><br/>
                                            <form:errors path="id_estudiante" cssClass="invalid"></form:errors>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Carrera ::</label>
                                    <div class="col-md-9"><span id="nombreestudiante">${programa}</span></div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Plan ::</label>
                                <div class="col-md-9">${formulario.id_plan}</div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Materia ::</label>
                                <div class="col-md-9">
                                    <form:select path="id_materia" cssClass="form-control">
                                        <c:forEach var="materia" items="${lElectivasPlanDeEstudios}" varStatus="cont">
                                            <option value="${materia.id_materia}"  <c:if test="${materia.id_materia==formulario.id_materia}">selected="true"</c:if>>${materia.materia}(${materia.tipo_materia})</option>
                                        </c:forEach>
                                    </form:select>
                                    <form:errors path="id_materia" cssClass="invalid"></form:errors>
                                    </div>
                                </div>
                                <div class="tile-footer">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-3">
                                            <button class="btn btn-primary" ><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                        </form:form>
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/listarOptativas.fautapo">
                            <input type="hidden" name="id_programa" value="${id_programa}" />
                            <input type="hidden" name="_condicion" value="todo" />
                            <input type="hidden" name="id_plan" value="${id_plan}-${id_prg_plan}" />
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
        <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/app/mencion/edit.js'/>" type="module"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>
