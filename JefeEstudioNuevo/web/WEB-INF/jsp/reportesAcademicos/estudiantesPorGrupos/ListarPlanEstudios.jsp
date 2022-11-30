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
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.min.css'/>"> 
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>Estudiantes por Grupos</h1>
                    <p>Programa: <c:out value="${datosPrograma.programa}"/> Plan: <c:out value="${datosPrgPlan.id_plan}"/> Tipo Evaluacion: <c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/> Gestión: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form:form method="post" modelAttribute="model" action="${pageContext.request.contextPath}/listarEstudianteforma.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
                            <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
                            <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${id_tipo_evaluacion}"/>'>
                            <input type="hidden" name="id_prg_plan" value='<c:out value="${id_prg_plan}"/>'>
                            <div class="tile-body">
                                <div class="table-responsive">
                                    <table id="tablagrupo" class="table table-hover table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>?</th>
                                                <th>MENCION</th>
                                                <th>NIVEL</th>
                                                <th>SIGLA</th>
                                                <th>MATERIA</th>
                                                <th>GRUPO</th>
                                                <th>NRO. PROGRAMADOS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="nivel_academico_ant" value="0"/>
                                            <c:forEach var="lista" items="${lMateriasPlan}" varStatus="contador">
                                                <c:if test="${nivel_academico_ant != lista.nivel_academico}">
                                                    <tr>
                                                        <td colspan="6">NIVEL :: <c:out value="${lista.nivel_academico}"/></td>
                                                    </tr>
                                                </c:if>

                                                <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> >
                                                    <td class="colb"><input type="radio" name="id_materia" value="<c:out value="${lista.id_materia}"/>:<c:out value="${lista.id_modelo_ahorro}"/>:<c:out value="${lista.id_grupo}"/>"></td>
                                                    <td><c:out value="${lista.mencion}"/></td>
                                                    <td><c:out value="${lista.nivel_academico}"/></td>
                                                    <td><c:out value="${lista.sigla}"/></td>
                                                    <td><c:out value="${lista.materia}"/></td>
                                                    <td align="center"><c:out value="${lista.grupo}"/></td>
                                                    <td align="center"><c:out value="${lista.numero}"/></td>
                                                </tr>
                                                <c:set var="nivel_academico_ant" value="${lista.nivel_academico}"/>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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
                        <form method="post" id="frmsalir" modelAttribute="model" action="${pageContext.request.contextPath}/estudiantesPorGrupos/ListarProgramasPlanes.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
                            <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
                            <input type="hidden" name="id_departamento" value='<c:out value="${id_departamento}"/>'>
                            <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
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
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>