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
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Admin. Retroceder fase</h1>
                    <p>Carrera: <c:out value="${fcldepartamento}"/>  Tipo Evaluacion:<c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/> Gestíon: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <c:if test="${ empty datosAsignacion}">
                            <div class="Card-Informacion">
                                <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                    <div class="card-header"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;AVISO</div>
                                    <div class="card-body text-secondary">  
                                        <p class="card-text"> 
                                            No existen materias para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/> y tipo de evaluacion </div>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${ !empty datosAsignacion}">
                        <div class="table-responsive">
                            <table id="tablagrupo" class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th align="center">NRO</th>
                                        <th align="center">CARRERA/PROGRAMA</th>
                                        <th align="center">GRUPO</th>
                                        <th align="center">SIGLA</th>
                                        <th align="center">MATERIA</th>
                                        <th align="center">DOCENTE</th>
                                        <th align="center">FASE</th>
                                        <th align="center">RETROCEDER FASE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="asignacion" items="${datosAsignacion}" varStatus="contador">
                                        <tr>
                                            <td><c:out value="${contador.count}"/></td>
                                            <td><c:out value="${asignacion.programa}"/> </td>
                                            <td class="text-center"> <c:out value="${asignacion.grupo}"/></td>
                                            <td><c:out value="${asignacion.sigla}"/></td>
                                            <td><c:out value="${asignacion.materia}"/></td>
                                            <td> <c:out value="${asignacion.nombres}"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${asignacion.id_fase >= 1000}"><label class="control-label col-md-3"><span class="text-danger"><c:out value="${asignacion.fase}"/></span></c:when>
                                                        <c:otherwise><span ><c:out value="${asignacion.fase}"/></span></c:otherwise>
                                                    </c:choose>
                                            </td>
                                            <td>
                                                <c:if test="${asignacion.id_fase <=1000}">
                                                    <form name='forma<c:out value="${contador.count}"/>' method='post' action="<c:url value='/confirmarModificarFaseDocente.fautapo'/>">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                                                        <input type=hidden name="id_asignacion"         value="<c:out value="${asignacion.id_asignacion}"/>"> 
                                                        <input type=hidden name="departamento"          value="<c:out value='${fcldepartamento}'/>">
                                                        <input type=hidden name="id_departamento"       value="<c:out value="${id_departamento}"/>"> 
                                                        <!--<input type=hidden name="id_tipo_evaluacion"    value="<c:out value="${id_tipo_evaluacion}"/>"> -->
                                                        <input type=hidden name="id_tipo_evaluacion"    value="<c:out value="${datosTipoEvaluacion.id_tipo_evaluacion}"/>"> 
                                                        <input type=hidden name="tipo_evaluacion"       value="<c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/>"> 
                                                        <input type=hidden name="id_facultad"           value="<c:out value='${id_facultad}'/>">
                                                        <input type=hidden name="facultad"              value="<c:out value='${datosFacultad.facultad}'/>">
                                                        <input type=hidden name="id_materia"            value="<c:out value="${asignacion.id_materia}"/>"> 
                                                        <input type=hidden name="materia"               value="<c:out value="${asignacion.materia}"/>">
                                                        <input type=hidden name="id_grupo"              value="<c:out value="${asignacion.id_grupo}"/>">
                                                        <input type=hidden name="grupo"                 value="<c:out value="${asignacion.grupo}"/>">    
                                                        <input type=hidden name="id_programa"           value="<c:out value="${asignacion.id_programa}"/>">
                                                        <input type=hidden name="programa"              value="<c:out value="${asignacion.programa}"/>">
                                                        <input type=hidden name="id_fase"               value="<c:out value="${asignacion.id_fase}"/>">
                                                        <input type=hidden name="fase"                  value="<c:out value="${asignacion.fase}"/>">
                                                        <input type=hidden name="gestion"               value="<c:out value="${gestion}"/>">
                                                        <input type=hidden name="periodo"               value="<c:out value="${periodo}"/>">
                                                        <input type=hidden name="nombres"               value="<c:out value="${asignacion.nombres}"/>">
                                                        <input type=hidden name="id_docente"            value="<c:out value="${asignacion.id_docente}"/>">
                                                        <input type=hidden name="id_tipo_docente"       value="<c:out value="${asignacion.id_tipo_docente}"/>">
                                                        <input type=hidden name="id_modelo_ahorro"      value="<c:out value="${asignacion.id_modelo_ahorro}"/>">
                                                        <a class="btn btn-primary" href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Retroceder</a>   
                                                    </form>
                                                </c:if>
                                                <c:if test="${asignacion.id_fase > 1000}">
                                                    <span class="text-danger">Libreta Cerrada</span>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
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
        <script type="text/javascript">$('#tablagrupo').DataTable();</script>
    </body>
</html>