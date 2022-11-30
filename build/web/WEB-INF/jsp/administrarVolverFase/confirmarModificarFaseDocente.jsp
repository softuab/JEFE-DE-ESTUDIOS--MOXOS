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
                    <h1><i class="far fa-address-card"></i> Admin. Retroceder fase</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form:form method="post" modelAttribute="model"  action="${pageContext.request.contextPath}/modificarFaseDocente.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                            <input type="hidden" name="id_facultad"     value='<c:out value="${id_facultad}"/>'>
                            <input type="hidden" name='id_asignacion'       value='<c:out value="${id_asignacion}"/>'>
                            <input type="hidden" name='id_docente'          value='<c:out value="${id_docente}"/>'>
                            <input type="hidden" name='id_materia'          value='<c:out value="${id_materia}"/>'>
                            <input type="hidden" name='id_grupo'            value='<c:out value="${id_grupo}"/>'>
                            <input type="hidden" name='gestion'             value='<c:out value="${gestion}"/>'>
                            <input type="hidden" name='periodo'             value='<c:out value="${periodo}"/>'>
                            <input type="hidden" name='id_fase'             value='<c:out value="${id_fase}"/>'>
                            <input type="hidden" name='id_tipo_evaluacion'  value='<c:out value="${id_tipo_evaluacion}"/>'>
                            <input type="hidden" name='id_departamento'     value='<c:out value="${id_departamento}"/>'>
                            <input type="hidden" name='id_programa'         value='<c:out value="${id_programa}"/>'>
                            <input type="hidden" name='id_modelo_ahorro'    value='<c:out value="${id_modelo_ahorro}"/>'>
                            <input type="hidden" name='id_tipo_docente'     value='<c:out value="${id_tipo_docente}"/>'>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Docente</label>
                                <div class="col-md-8">
                                    <c:out value="${docente}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Programa</label>
                                <div class="col-md-8">
                                    <c:out value="${programa}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Tipo evaluacion</label>
                                <div class="col-md-8">
                                    <c:out value="${tipo_evaluacion}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Gestion</label>
                                <div class="col-md-8">
                                    <c:out value="${gestion}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Periodo</label>
                                <div class="col-md-8">
                                    <c:out value="${periodo}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Fase</label>
                                <div class="col-md-8">
                                    <c:out value="${fase}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Materia</label>
                                <div class="col-md-8">
                                    <c:out value="${materia}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Grupo</label>
                                <div class="col-md-8">
                                    <c:out value="${grupo}"/>
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
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/listarDocentesAsignadosMaterias.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
                            <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
                            <input type="hidden" name='id_departamento'     value='<c:out value="${id_departamento}"/>'>
                            <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${id_tipo_evaluacion}"/>' >
                            <input type="hidden" name="id_facultad"     value='<c:out value="${id_facultad}"/>'>
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
        <script language="javascript" src="<c:url value='/Public/Js/plugins/select2.min.js'/>"></script>
        <script language="javascript" src="<c:url value='/Public/Js/plugins/sweetalert.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>

</html>
