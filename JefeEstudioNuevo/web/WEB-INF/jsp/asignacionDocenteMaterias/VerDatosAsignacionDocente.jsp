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
                    <h1><i class="far fa-address-card"></i>&nbsp;Asignaci&oacute;n Docente Materias-Carreras</h1>
                    <p>Programa:<c:out value="${programa.programa}"/> Plan: <c:out value="${datosPrgPlan.id_plan}"/>  Gestión:  <c:out value="${gestion}"/>  Periodo:  <c:out value="${periodo}"/>  Materia:  <c:out value="${materia.materia}"/>  Grupo:  <c:out value="${datosDptoGrupo.grupo}"/>  Tipo Evaluacion:  <c:out value="${datosDptoGrupo.tipo_evaluacion}"/></p>
                    <p>${usuario}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="id_programa"         value='<c:out value="${programa.id_programa}"/>' >
                        <input type="hidden" name="programa"            value='<c:out value="${programa.programa}"/>' >
                        <input type="hidden" name="id_prg_plan"         value='<c:out value="${datosPrgPlan.id_prg_plan}"/>' >
                        <input type="hidden" name="gestion"             value='<c:out value="${gestion}"/>' >
                        <input type="hidden" name="periodo"             value='<c:out value="${periodo}"/>' >
                        <input type="hidden" name="id_materia"          value='<c:out value="${materia.id_materia}"/>' >
                        <input type="hidden" name="materia"             value='<c:out value="${materia.materia}"/>' >
                        <input type="hidden" name="id_dpto_grupo"       value='<c:out value="${datosDptoGrupo.id_dpto_grupo}"/>' >
                        <input type="hidden" name="id_tipo_evaluacion"  value='<c:out value="${datosDptoGrupo.id_tipo_evaluacion}"/>' >
                        <input type="hidden" name="id_asignacion"       value='<c:out value="${datosAsignacion.id_asignacion}"/>' >
                        <input type="hidden" name="id_plan"            value="<c:out value="${datosPrgPlan.id_plan}"/>">	
                        <input type="hidden" name="accion"              value='<c:out value="${accion}"/>' >
                        <div class="form-group row">
                            <h3>Datos Docentes</h3>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Docente</label>
                            <div class="col-md-8">
                                <c:out value = "${lDocentesTodos.nombre_completo}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Tipo Docente</label>
                            <c:out value = "${cod.tipo_docente}"/>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Tipo Asignaci&oacute;n</label>
                            <div class="col-md-8">
                                <c:out value = '${cod.tipo_asignacion}'/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Funci&oacute;n Administrativa</label>
                            <div class="col-md-8">
                                <c:out value = '${cod.descripcion}'/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Fecha Inicio</label>
                            <div class="col-md-3">
                                <fmt:formatDate value="${datosAsignacion.fec_inicio2}" pattern="yyyy-MM-dd"/>
                            </div>
                            <label class="control-label col-md-1">Fecha Fin</label>
                            <div class="col-md-4">
                                <fmt:formatDate value="${datosAsignacion.fec_fin2}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Observaciones </label>
                            <div class="col-md-8">
                                <c:out value="${datosAsignacion.observacion}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <h3>Datos Resoluciones</h3>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3"> Honorable Consejo de Carrera</label>
                            <div class="col-md-8">
                                <c:out value="${datosAsignacion.nro_resolucionhcc}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3"> Honorable Consejo Facultativo.</label>
                            <div class="col-md-8">
                                <c:out value="${datosAsignacion.nro_resolucionhcf}" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3">Honorable Consejo Universitario</label>
                            <div class="col-md-3">
                                <c:out value="${datosAsignacion.nro_resolucionhcu}"/>
                            </div>
                            <label class="control-label col-md-1">Fecha Resolucion</label>
                            <div class="col-md-4">
                                <fmt:formatDate value="${datosAsignacion.fec_resolucion}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                        <div class="tile-footer">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3">
                                    <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href='javascript:history.back();'><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                </div>
                            </div>
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
    </body>
</html>