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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;<c:out value='${datosInstitucion.institucion}'/></h1>
                    <p><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></p>
                    <p><c:out value='${datosInstitucion.actividad}'/></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">                        
                        <section class="invoice">
                            <div class="row mb-4">
                                <div class="col-6">
                                    <h2 class="page-header">PLAN DE ESTUDIOS</h2>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>RU::</strong> <c:out value="${datosEstudiante.id_estudiante}"/><br>
                                        <strong>CARRERA::</strong> <c:out value="${datosPrograma.programa}"/><br>
                                        <strong>PLAN::</strong><c:out value="${datosEstudiante.id_plan}"/><br>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>ESTUDIANTE::</strong> <c:out value="${datosPersona.nombres}"/> &nbsp; 
                                        <c:out value="${datosPersona.paterno}"/> &nbsp;
                                        <c:out value="${datosPersona.materno}"/><br>
                                        <strong>FACULTAD::</strong> <c:out value="${datosFacultad.facultad}"/><br>
                                        <strong>NIVEL ACADEMICO::</strong> <c:out value="${datosGrados.grado_academico}"/> <br>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-striped table-hover" border="1">
                                        <thead>
                                            <tr>
                                                <th>NIVEL</th>
                                                <th>SIGLA</th>
                                                <th>NOMBRE DE LA ASIGNATURA</th>
                                                <th>H.T.</th>
                                                <th>H.P.</th>
                                                <th>T.H.</th>
                                                <th>PRE-REQUISITO</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="id_mencion_ant" value="0"/>
                                            <c:set var="id_nivel_ant" value="0"/>
                                            <c:forEach var="lista" items="${lPlanDeEstudios}" varStatus="contador">
                                                <c:if test="${(id_mencion_ant != lista.id_mencion) && (lista.id_mencion != 0)}">
                                                    <tr>
                                                        <th colspan="7"  class="bg-secondary text-white">MENCION :: <c:out value="${lista.mencion}"/></th>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${id_nivel_ant != lista.nivel_academico}">
                                                    <tr>
                                                        <td class="bg-dark text-white">NIVEL :: <c:out value="${lista.nivel_academico}"/></td>
                                                        <td class="bg-dark text-white" colspan="6"></td>
                                                    </tr>
                                                </c:if>
                                                <tr>
                                                    <td></td>
                                                    <td valign="top"><c:out value="${lista.sigla}"/></td>
                                                    <td valign="top"><c:out value="${lista.materia}"/></td>
                                                    <td valign="top"><c:out value="${lista.hrs_teoricas}"/></td>
                                                    <td valign="top"><c:out value="${lista.hrs_practicas}"/></td>
                                                    <td valign="top"><c:out value="${lista.hrs_practicas+lista.hrs_teoricas}"/></td>
                                                    <td valign="top"><c:out value="${lista.materias_anteriores}" escapeXml="false"/></td>
                                                </tr>
                                                <c:set var="id_mencion_ant" value="${lista.id_mencion}"/>
                                                <c:set var="id_nivel_ant" value="${lista.nivel_academico}"/>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a> <a class="btn btn-secondary" href="<c:url value="/planDeEstudios/Entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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
    </body>
</html>