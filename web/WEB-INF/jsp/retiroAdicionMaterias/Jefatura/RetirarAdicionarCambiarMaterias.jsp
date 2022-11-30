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
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Retiro y adici&oacute;n de materias</h1>
                    <p>${usuario}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <section class="invoice">
                            <div class="row mb-4">
                                <div class="col-6">
                                    <h2 class="page-header">Retiro y adici&oacute;n de materias</h2>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>RU:: </strong> <c:out value="${datosEstudiante.id_estudiante}"/><br>
                                        <strong>NOMBRE:: </strong> <c:out value="${datosPersona.paterno}"/> &nbsp; <c:out value="${datosPersona.materno}"/> &nbsp; <c:out value="${datosPersona.nombres}"/><br>
                                        <strong>PLAN:: </strong><c:out value="${datosEstudiante.id_plan}"/><br>
                                        <strong>PROGRAMA:: </strong><c:out value="${datosPrograma.programa}"/><br>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>TIPO EVALUACI&Oacute;N:: </strong><c:out value="${datosTipoEval.tipo_evaluacion}"/><br>
                                        <strong>GESTION:: </strong> <c:out value="${gestion}"/><br>
                                        <strong>PERIODO:: </strong> <c:out value="${periodo}"/><br>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <form method=post action=<c:url value="/retiroAdicionMateriasJefe/listarProgramacionMaterias.fautapo"/> >
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type=hidden name="id_tipo_periodo"     value=<c:out value="${id_tipo_periodo}"/> >
                                        <input type=hidden name="id_estudiante"       value=<c:out value="${datosEstudiante.id_estudiante}"/> >
                                        <input type=hidden name="id_programa"         value=<c:out value="${datosEstudiante.id_programa}"/> >
                                        <input type=hidden name="gestion"             value=<c:out value="${gestion}"/> >
                                        <input type=hidden name="periodo"             value=<c:out value="${periodo}"/> >
                                        <input type=hidden name="id_tipo_evaluacion"  value=<c:out value="${id_tipo_evaluacion}"/> >
                                        <div class="row mt-3 text-center">
                                            <div class="col"><strong>SELECCIONE  UNA  ACCI&Oacute;N</strong></div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-6">
                                                <button class="btn btn-primary" style=" width: 100%" type=submit name="accion" value="Retiro"><span style="font-size:1.5vw">¿Desea retirar la materia? presione aqui.</span></button>
                                            </div>
                                            <div class="col-6">
                                                <button class="btn btn-primary" style=" width: 100%"  type=submit name="accion" value="Cambio de grupo"><span style="font-size:1.5vw">¿Desea cambiar el grupo? presione aqui.</span></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </section>
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
    </body>
</html>