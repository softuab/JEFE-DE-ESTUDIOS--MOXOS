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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Cerrar Libretas Por Programa Materia</h1>
                    <p><c:out value="${programa.programa}"/> Plan: <c:out value="${datosPrgPlan.id_plan}"/> Tipo Evaluacion: <c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/> Gestíon: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <h3 class="title">Lista de Materias </h3>
                            <form name="forma" action="nuevoRegistro.fautapo" method="post">
                                <input type="hidden" name="id_programa"   value="<c:out value='${id_programa}'/>">
                                <input type="hidden" name="id_prg_plan"   value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                <input type="hidden" name="gestion"       value="<c:out value='${gestion}'/>">
                                <input type="hidden" name="periodo"       value="<c:out value='${periodo}'/>">	
                            </form>
                        </div>
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table id="tablaMateria" class="table table-hover table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>NIVEL ACAD&Eacute;MICO</th>
                                            <th>SIGLA</th>
                                            <th>MATERIA</th>
                                            <th>GRUPO</th>
                                            <th>DOCENTE</th>
                                            <th>FASE</th>
                                            <th>CERRAR LIBRETA</th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="listado1" items="${listarplanestudios.pageList}" varStatus="contador">
                                        <tr>
                                            <td valign="top" align="center"><c:out value="${listado1.nivel_academico}"/>
                                            <td valign="top"><c:out value="${listado1.sigla}"/> </td>
                                            <td valign="top"><c:out value="${listado1.materia}"/></td>
                                            <td valign="top">
                                                <c:if test="${listado1.nro_asignaciones > 0}">
                                                    <c:forEach var="lista" items="${listado1.materias}" >
                                                        <c:out value="${lista.grupo}"/><br>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${listado1.nro_asignaciones == 0 }">
                                                    <div class="text-danger">--</div>
                                                </c:if>
                                            </td>
                                            <td valign="top">
                                                <c:if test="${listado1.nro_asignaciones > 0}">
                                                    <c:forEach var="lista" items="${listado1.materias}" >
                                                        <c:out value="${lista.nombres}"/><br>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${listado1.nro_asignaciones == 0}">
                                                    <div class="text-danger">--</div>
                                                </c:if>
                                            </td>
                                            <td valign="top">
                                                <c:if test="${listado1.nro_asignaciones > 0}">
                                                    <c:forEach var="lista" items="${listado1.materias}" >
                                                        <c:out value="${lista.fase}"/><br>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${listado1.nro_asignaciones == 0}">
                                                    <div class="text-danger">--</div>
                                                </c:if>
                                            </td>
                                            <td valign="top">
                                                <c:if test="${listado1.nro_asignaciones > 0}">
                                                    <c:forEach var="lista" items="${listado1.materias}" >
                                                        <c:if test="${(lista.id_asignacion != 0) && (lista.id_fase < 1000)}">
                                                            <div class="text-danger">NO HABILITADO<br></div> 
                                                            </c:if>
                                                            <c:if test="${(lista.id_asignacion != 0) && (lista.id_fase == 7000)}">
                                                            <div class="text-danger">LIBRETA CERRADA<br></div>
                                                            </c:if>
                                                            <c:if test="${(lista.id_asignacion != 0) && (lista.id_fase == 1000)}">
                                                            <form name="fcerrar<c:out value='${lista.id_asignacion}'/>" action="<c:url value='/cerrarLibretasProgramasMaterias/confirmarListadoCierreLibreta.fautapo'/>" method="post">
                                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                                <input type="hidden" name="id_asignacion"        value="<c:out value='${lista.id_asignacion}'/>">
                                                                <input type="hidden" name="gestion"              value="<c:out value='${gestion}'/>">
                                                                <input type="hidden" name="periodo"              value="<c:out value='${periodo}'/>">
                                                                <input type="hidden" name="id_materia"           value="<c:out value='${lista.id_materia}'/>">	  
                                                                <input type="hidden" name="id_modelo_ahorro"     value="<c:out value='${lista.id_modelo_ahorro}'/>">	  
                                                                <input type="hidden" name="id_grupo"             value="<c:out value='${lista.id_grupo}'/>">	  
                                                                <input type="hidden" name="id_docente"           value="<c:out value='${lista.id_docente}'/>">	  
                                                                <input type="hidden" name="id_fase"              value="<c:out value='${lista.id_fase}'/>">	  
                                                                <input type="hidden" name="id_tipo_evaluacion"   value="<c:out value='${lista.id_tipo_evaluacion}'/>">	  	  
                                                                <input type="hidden" name="id_programa"          value="<c:out value='${programa.id_programa}'/>">	  
                                                                <input type="hidden" name="nombreDocente"          value="<c:out value='${lista.nombres}'/>">
                                                                <input type="hidden" name="id_prg_plan"   value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                                                <input type="hidden" name="id_plan"   value="<c:out value='${datosPrgPlan.id_plan}'/>">
                                                                <a class="btn btn-primary modificar" href="javascript:document.fcerrar<c:out value='${lista.id_asignacion}'/>.submit();">CERRAR LIBRETA</a> <br>
                                                            </form>  
                                                        </c:if> 
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${listado1.nro_asignaciones == 0}">
                                                    <div class="text-danger">NO HABILITADO</div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
    <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/main.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
    <script type="text/javascript">$('#tablaMateria').DataTable();</script>
</html>