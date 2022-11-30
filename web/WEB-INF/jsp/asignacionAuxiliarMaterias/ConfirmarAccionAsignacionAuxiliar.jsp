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
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp;Asignaci&oacute;n Auxiliar Materias</h1>
                    <p>Programa :: <c:out value="${programa.programa}"/>  Plan :: <c:out value="${datosPrgPlan.id_plan}"/> Gestión :: <c:out value="${gestion}"/> Periodo ::<c:out value="${periodo}"/></p>
                    <p>Materia :: <c:out value="${materia.materia}"/>  Grupo:: <c:out value="${datosDptoGrupo.grupo}"/> Tipo Evaluación :: <c:out value="${datosDptoGrupo.tipo_evaluacion}"/></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form  name="forma"  action="<c:url value="/auxiliares/registrarAsignacionAuxiliar.fautapo"/>" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="id_programa"         value='<c:out value="${programa.id_programa}"/>' >
                            <input type="hidden" name="id_prg_plan"         value='<c:out value="${datosPrgPlan.id_prg_plan}"/>' >
                            <input type="hidden" name="gestion"             value='<c:out value="${gestion}"/>' >
                            <input type="hidden" name="periodo"             value='<c:out value="${periodo}"/>' >
                            <input type="hidden" name="id_dpto_grupo"       value='<c:out value="${datosDptoGrupo.id_dpto_grupo}"/>' >
                            <input type="hidden" name="id_tipo_evaluacion"  value='<c:out value="${datosDptoGrupo.id_tipo_evaluacion}"/>' >
                            <input type="hidden" name="id_asignacion"       value='<c:out value="${datosAsignacion.id_asignacion}"/>' >
                            <input type="hidden" name="accion"              value='<c:out value="${accion}"/>' >
                            <div class="form-group row">
                                <h5  class="col-md-3">Confirmar&nbsp;<c:out value="${accion}"/>&nbsp;Asignaci&oacute;n </h5>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Auxiliar ::</label>
                                <div class="col-md-8">
                                    <c:out value="${datosDocente.nombre_completo}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Tipo Docente ::</label>
                                <div class="col-md-8">
                                    <c:out value="${datosAsignacion.tipo_docente}"/> 
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3"> Tipo Asignaci&oacute;n ::</label>
                                <div class="col-md-8">
                                    <c:out value="${datosAsignacion.tipo_asignacion}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Fase Actual de Evaluaci&oacute;n ::</label>
                                <div class="col-md-8">
                                    <c:out value="${datosAsignacion.fase}"/>
                                    <c:if test="${datosAsignacion.id_fase > 0}"> <font color="red"><blink><br> Antes de Eliminar, tenga encuenta que el docente esta<br>en una fase avanzada.</blink> </font>
                                        </c:if>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Fecha Inicio :: </label>
                                <div class="col-md-8">
                                    <fmt:formatDate value="${datosAsignacion.fec_inicio2}" pattern="${formatoFecha}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Fecha Fin :: </label>
                                <div class="col-md-8">
                                    <fmt:formatDate value="${datosAsignacion.fec_fin2}" pattern="${formatoFecha}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Nro Resoluci&oacute;n :: </label>
                                <div class="col-md-8">
                                    <c:out value="${datosAsignacion.nro_resolucion}"/>
                                </div>
                            </div>
                            <div class="form group row">
                                <label class="control-label col-md-3">Fecha Resoluci&oacute;n ::</label>
                                <div class="col-md-8">
                                    <fmt:formatDate value="${datosAsignacion.fec_resolucion}" pattern="${formatoFecha}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3"> Observaciones ::</label>
                                <div class="col-md-8">
                                    <c:out value="${datosAsignacion.observacion}"/>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit'  value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>  
                        </form>
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/auxiliares/listarMateriasProgramaPlan.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="id_programa" value='<c:out value="${id_programa}"/>' >
                            <input type=hidden name="gestion"             value=<c:out value="${gestion}"/> >
                            <input type=hidden name="periodo"             value=<c:out value="${periodo}"/> >
                            <input type="hidden" name="id_prg_plan"     value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                            <input type="hidden" name="id_tipo_evaluacion"  value='<c:out value="${datosDptoGrupo.id_tipo_evaluacion}"/>' >
                        </form>
                    </div>
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
    <script type="text/javascript">$('#tablaMateria').DataTable();</script>
    <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
</body>
</html>