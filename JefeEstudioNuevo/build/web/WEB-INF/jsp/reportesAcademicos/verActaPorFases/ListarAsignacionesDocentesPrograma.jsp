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
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Reporte Acta Por Fases</h1>
                    <p><c:out value="${datosPrograma.programa}"/> Plan: <c:out value="${id_plan}"/>  Gestíon: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="table-responsive">
                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <table id="tabladesignacion" class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>NRO</th>
                                        <th>MENCION</th>
                                        <th>NIVEL<br>ACADEMICO</th>
                                        <th>GRUPO</th>
                                        <th>SIGLA</th>
                                        <th>MATERIA</th>
                                        <th>DOCENTE</th>
                                        <th>FASE</th>
                                        <th>VER ACTA DE CALIFICACIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="asignacion" items="${lAsignacionDocentesProgramaPlan}" varStatus="contador">
                                        <tr >
                                            <td><c:out value="${contador.count}"/></td>
                                            <td><c:out value="${asignacion.mencion}"/></td>
                                            <td align="center"><c:out value="${asignacion.nivel_academico}"/></td>
                                            <td align="center"><c:out value="${asignacion.grupo}"/></td>
                                            <td><c:out value="${asignacion.sigla}"/></td>
                                            <td><c:out value="${asignacion.materia}"/></td>
                                            <td><c:out value="${asignacion.paterno}"/>&nbsp;<c:out value="${asignacion.materno}"/>&nbsp;<c:out value="${asignacion.nombres}"/></td>
                                            <td><c:out value="${asignacion.fase}"/></td>
                                            <td align="center">
                                                <form name='forma<c:out value="${contador.count}"/>' method='post' action="<c:url value='/actaPorFases/ListarFases.fautapo'/>">
                                                    <c:if test="${(asignacion.id_fase == '1') || (asignacion.id_fase == '1000') || (asignacion.id_fase == '7000')}">
                                                        <a class="btn btn-primary" href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Ver Acta</a>
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                        <input type="hidden" name="id_asignacion" value="<c:out value='${asignacion.id_asignacion}'/>">
                                                        <input type="hidden" name="id_programa"   value="<c:out value="${asignacion.id_programa}"/>">
                                                        <input type="hidden" name="id_plan"       value="<c:out value='${id_plan}'/>">
                                                    </c:if>
                                                    <c:if test="${(asignacion.id_fase != '1') && (asignacion.id_fase != '1000') && (asignacion.id_fase != '7000')}">
                                                        <div class="text-danger">Libreta No Cerrada</div>
                                                    </c:if>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
        <script type="text/javascript">$('#tabladesignacion').DataTable();</script>
    </body>
</html>