<%@page import="java.util.Date"%>
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableResponsive.css'/>">
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <section class="invoice">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row mb-4">
                                <div class="col-2">
                                    <img src="<c:url value='/imagenes/logo.png'/>" width="35%;" alt=""/>
                                </div>
                                <div class="col-7">
                                    <h2 style="text-align: center;"><strong>UNIVERSIDAD AUT&Oacute;NOMA DEL BENI <br />&ldquo;JOS&Eacute; BALLIVI&Aacute;N&rdquo;</strong></h2>
                                </div>
                                <div class="col-3">
                                    <c:set var="today" value="<%=new Date()%>"/>
                                    <h5 class="text-right">Fecha :<fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col text-center">
                                    <h3 style="text-align: center;">HISTORIAL ACADÉMICO</h3>
                                </div>
                            </div>
                            <hr>
                            <div class="row invoice-info">
                                <div class="col-6"> 
                                    <address>
                                        <strong>Facultad:: </strong><c:out value="${datosFacultad.facultad}"/><br>
                                        <strong>Carrera:: </strong><c:out value="${datosPrograma.programa}"/><br>
                                        <strong>Apellidos y Nombres:: </strong> <c:out value="${datosPersona.paterno}"/> &nbsp;
                                        <c:out value="${datosPersona.materno}"/> &nbsp;
                                        <c:out value="${datosPersona.nombres}"/><br>
                                        <strong>Cedula Identidad:: </strong><c:out value="${datosPersona.dip}"/>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>R.U:: </strong><c:out value="${datosEstudiante.id_estudiante}"/><br>
                                        <strong>Nivel:: </strong><c:out value="${datosGrados.grado_academico}"/><br>
                                        <strong>Plan:: </strong><c:out value="${datosEstudiante.id_plan}"/>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div id="no-more-tables">
                                        <table class="table table-striped" border="1" cf>
                                            <thead class="cf">
                                                <tr>
                                                    <th>NRO.</th>
                                                    <th>SIGLA</th>
                                                    <th>MATERIA</th>
                                                    <th>TIPO EVAL</th>
                                                    <th>GESTION</th>
                                                    <th>NOTA</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="nivel_academico_ant" value="0"/>
                                                <c:forEach var="lista" items="${lMaterias}" varStatus="contador">
                                                    <c:if test="${nivel_academico_ant != lista.nivel_academico}">
                                                        <tr>
                                                            <td colspan="6">NIVEL :: <c:out value="${lista.nivel_academico}"/></td>
                                                        </tr>
                                                    </c:if>
                                                    <tr>
                                                        <td data-title="NRO."><c:out value="${contador.count}"/></td>
                                                        <td data-title="SIGLA"><c:out value="${lista.sigla}"/></td>
                                                        <td data-title="MATERIA"><c:out value="${lista.materia}"/></td>
                                                        <td data-title="TIPO EVALUACIÓN"><c:out value="${lista.tipo_evaluacion}"/></td>

                                                        <c:if test="${lista.gestion != 0}">
                                                            <c:if test="${lista.id_tipo_materia == 1}">
                                                                <td data-title="GESTION"><c:out value="${lista.periodo}"/>-<c:out value="${lista.gestion}"/></td>
                                                            </c:if>
                                                            <c:if test="${lista.id_tipo_materia == 2}">
                                                                <td data-title="GESTION"><c:out value="${lista.gestion}"/></td>
                                                            </c:if>
                                                            <td data-title="NOTA"><c:out value="${lista.nota}"/></td>
                                                        </c:if>
                                                        <c:if test="${lista.gestion == 0}">
                                                            <td data-title="GESTION"></td>
                                                            <td data-title="NOTA"></td>
                                                        </c:if>
                                                    </tr>
                                                    <c:set var="nivel_academico_ant" value="${lista.nivel_academico}"/>
                                                </c:forEach>
                                            </tbody>
                                            <br>
                                            <br>
                                            <br>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col text-right">
                                    <br>
                                    <br>
                                    <td align="center" colspan="3" width="8%">_____________________________________</td>
                                </div>
                                <div class="col text-left">
                                    <br>
                                    <br>
                                    <td align="center" colspan="3" width="8%">_____________________________________</td>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col text-left">
                                    <br>
                                    <br>
                                    <br>
                                    <address>
                                        <strong>TOTAL ASIGNATURAS DEL PLAN : <c:out value="${total_materias_plan}"/>&nbsp;&nbsp;&nbsp;</strong>
                                        <strong>TOTAL ASIGNATURAS APROBADAS : <c:out value="${total_materias_aprobadas}"/>&nbsp;&nbsp;&nbsp;  </strong>
                                        <strong>PROMEDIO DE CALIFICACIONES : <c:out value="${promedio}"/></strong>
                                    </address>
                                </div>
                            </div>  
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/imprimirHistorialAcademicoTipoCarrera/entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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


