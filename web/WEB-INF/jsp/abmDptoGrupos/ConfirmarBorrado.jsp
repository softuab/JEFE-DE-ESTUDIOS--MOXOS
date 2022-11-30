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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Administraci&oacute;n de Grupos - Eliminar</h1>
                    <p><c:out value="${programa.programa}"/> Plan: <c:out value="${datosPrgPlan.id_plan}"/> Tipo Evaluacion: <c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/> Gestíon: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form:form method="post" modelAttribute="model"  action="${pageContext.request.contextPath}/grupos/registrarBorrado.fautapo">
                            <form:hidden path="id_programa"/>
                            <form:hidden path="id_tipo_evaluacion"/>
                            <form:hidden path="id_prg_plan"/>
                            <form:hidden path="gestion"/>
                            <form:hidden path="periodo"/> 
                            <form:hidden path="id_dpto_grupo"/> 
                            <form:hidden path="id_materia"/> 
                            <form:hidden path="id_grupo"/> 
                            <form:hidden path="id_dpto_grupo"/> 
                            <form:hidden path="cupo_max"/>
                            <form:hidden path="horas"/>
                            <form:hidden path="nro_resolucion"/>
                            <input type="hidden" name="id_departamento" value='<c:out value="${id_departamento}"/>'>
                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Materia</label>
                                <div class="col-md-8">
                                    <c:out value="${materia.materia}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Grupo</label>
                                <div class="col-md-8">
                                    <c:out value="${grupito.grupo}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Cupo Actual</label>
                                <div class="col-md-8">
                                    <c:out value="${cupo_actual}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Cupo M&aacute;ximo</label>
                                <div class="col-md-8">
                                    <c:out value="${model.cupo_max}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Horas</label>
                                <div class="col-md-8">
                                    <c:out value="${model.horas}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Nro. Resoluci&oacute;n</label>
                                <div class="col-md-8">
                                    <c:out value="${model.nro_resolucion}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Fecha Resoluci&oacute;n</label>
                                <div class="col-md-8">
                                    <c:out value="${model.fec_resolucion}"/>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit'  value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/grupos/listarGrupos.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
                            <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
                            <input type="hidden" name="id_prg_plan" value='<c:out value="${id_prg_plan}"/>' >
                            <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${id_tipo_evaluacion}"/>' >
                            <input type="hidden" name="id_programa" value='<c:out value="${id_programa}"/>' >
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
        <script src="<c:url value="/Public/Js/app/grupo/maingrupo.js"/>" type="module"></script>
    </body>
</html>