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
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp;Promedio de Notas de Estudiantes, por Materia</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form:form modelAttribute="forma" cssClass="form-horizontal" method="post" action="${pageContext.request.contextPath}/estadisticaEspecializada/promedioNotas/formarReporte.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <c:if test="${cliente.id_programa > 0}"><input type="hidden" name="id_programa" value='<c:out value="${cliente.id_programa}"/>'></c:if>
                            <c:if test="${1 > cliente.id_facultad && 1 > cliente.id_programa}">
                                <div class="form-group row">
                                    <td class="etiqueta">Facultad <font color='red'>(*)</font></td>
                                    <td class="etiqueta">::</td>
                                    <td>
                                        <select id="id_facultad" name="id_facultad" onChange="setCargarProgramas(this.options[this.selectedIndex].value)">
                                            <option value="-1">Elija una opci&oacute;n...</option>
                                            <c:forEach var="facultad" items="${lFacultades}" >
                                                <option value="<c:out value="${facultad.id_facultad}"/>"><c:out value="${facultad.facultad}"/></option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </div>
                            </c:if>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Programa</label>
                                <div class="col-md-8">
                                    <c:if test="${1 > cliente.id_programa}">
                                        <select id="id_programa" name="id_programa" disabled="true" onchange="setCargarPlanes(this.options[this.selectedIndex].value)">
                                            <option value="-1">Elija una opci&oacute;n...</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${cliente.id_programa > 0}">
                                        <c:out value="${programa.programa}"/><input type="hidden" name="id_programa" value="<c:out value="${cliente.id_programa}"/>">
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Plan</label>
                                <div class="col-md-8">
                                    <form:select path="id_prg_plan" cssClass="form-control">
                                        <option value="">- Elija una opci&oacute;n -</option>
                                        <c:forEach var="Plan" items="${lPlanesPrograma}">
                                            <option value="<c:out value="${Plan.id_prg_plan}"/>"> <c:out value="${Plan.tipo_grado}"/> - <c:out value="${Plan.id_plan}"/></option>
                                        </c:forEach>
                                    </form:select>
                                    <form:errors path="id_prg_plan" cssClass="invalid"></form:errors>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Tipo de Evaluaci&oacute;n</label>
                                    <div class="col-md-8">
                                    <form:select path="id_tipo_evaluacion" cssClass="form-control">
                                        <option value=""> - Elija una opción - </option>    
                                        <c:forEach var="tipo" items="${lTiposEvaluaciones}">
                                            <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>"> <c:out value="${tipo.tipo_evaluacion}"/> </option>
                                        </c:forEach>
                                    </form:select>
                                    <form:errors path="id_tipo_evaluacion" cssClass="invalid"></form:errors>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Gestion</label>
                                    <div class="col-md-8">
                                    <form:select path="gestion" cssClass="custom-select">
                                        <c:forEach var="i" begin="1990" end="${gestion}">
                                            <c:choose>
                                                <c:when test="${i==gestion}">
                                                    <option selected value="${i}"><c:out value="${i}"/></option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${i}"><c:out value="${i}"/></option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Periodo</label>
                                <div class="col-md-8">
                                    <form:select path="periodo" cssClass="custom-select">
                                        <c:forEach var="i" begin="1" end="2">
                                            <c:choose>
                                                <c:when test="${i==periodo}">
                                                    <option selected value="${i}"><c:out value="${i}"/></option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${i}"><c:out value="${i}"/></option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="<c:url value='/VerCuerpo.fautapo'/>"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    </body>
</html>