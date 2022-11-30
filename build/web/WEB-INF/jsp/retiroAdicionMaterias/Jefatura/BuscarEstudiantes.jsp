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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Retiro y adici&oacute;n de materias</h1>
                    <p>Gestión: <c:out value='${gestion}'/> Periodo: <c:out value='${periodo}'/> Programa: <c:out value='${datosPrograma.programa}'/> Tipo Evaluacion: <c:out value='${datosTipoEval.tipo_evaluacion}'/></p>
                    <p>${usuario}</p>  
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form name=forma method="POST" action='<c:url value="/retiroAdicionMateriasJefe/listarAccionProgramacionMaterias.fautapo"/>' >
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
                            <input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">
                            <input type="hidden" name="id_programa"        value="<c:out value='${id_programa}'/>"> 
                            <input type="hidden" name="id_tipo_evaluacion" value="<c:out value='${id_tipo_evaluacion}'/>"> 
                            <div class="form-group row">
                                <label class="control-label col-md-3">Documento</label>
                                <div class="col-md-9">
                                    <select class="custom-select" name="tipobusqueda" id="tipobusqueda">
                                        <option value="id_estudiante">Registro Universitario(RU)</option>
                                        <option value="ci">Cedula de Identidad</option>
                                        <option value="nombre">Nombre Completo</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Datos Estudiantes</label>
                                <div class="col-md-9">
                                    <input class="form-control" type="text" name="busqueda" placeholder="Buscar Estudiante" autofocus required>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button name="forma" class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/retiroAdicionMateriasJefe/comprobarEntrada1.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <!--<input type="hidden" name="id_programa" value='<c:out value="${id_programa}"/>' >-->
                            <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
                            <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
                            <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${id_tipo_evaluacion}"/>' >
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
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>