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
                                    <h3 style="text-align: center;"><strong>TRINIDAD - BENI - BOLIVIA</strong></h3>
                                </div>
                                <div class="col-3">
                                    <c:set var="today" value="<%=new Date()%>"/>
                                    <h5 class="text-right">Fecha: <fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-4">
                                <div class="col text-center">
                                    <h2 style="text-align: center;">ASIGNACION DOCENTE - MATERIAS</h2>
                                </div>
                            </div>
                            <c:if test="${ empty lAsignacionDocentesMateria}">
                                <center><div class="cuadroAviso" align="center">No existen materias para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/></div></center>
                            </c:if><br>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>Carrera:: </strong><c:out value="${datosPrograma.programa}"/><br>
                                        <strong>Plan:: </strong> <c:out value="${id_plan}"/><br>
                                        <strong>Tipo Evaluacion:: </strong>  <c:if test ="${evaluacion == 1}">REGULAR</c:if> 
                                        <c:if test ="${evaluacion == 3}">CURSO DE VERANO</c:if> 
                                        <c:if test ="${evaluacion == 4}">EXAMEN DE MESA</c:if> 
                                        </address>
                                    </div>
                                    <div class="col-6">
                                        <address>
                                            <strong>Facultad:: </strong><c:out value="${datosFacultad.facultad}"/><br>
                                        <strong>Periodo:: <c:out value="${periodo}"/> - <c:out value="${gestion}"/></strong>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="table-responsive" id="no-more-tables">
                                        <table class="table table-striped" border="1" cf>
                                            <thead class="cf">
                                                <tr>
                                                    <th>NRO</th>
                                                    <th>CI</th>
                                                    <th>PATERNO</th>
                                                    <th>MATERNO</th>
                                                    <th>NOMBRES</th>
                                                    <th>FUNCION</th>
                                                    <th>MATERIA</th>
                                                    <th>SIGLA</th>
                                                    <th>NIVEL</th>
                                                    <th>GRUPO</th>
                                                    <th>HRS</th>
                                                    <th>TIPO</th>
                                                    <th>DEDICACION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${ empty lAsignacionDocentesMateria}">
                                                <center><div class="cuadroAviso" align="center">No existen materias para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/></div></center>
                                            </c:if><br>
                                            <c:forEach var="nroasignacion" items="${lNroAsignacionDocentesMateria}" varStatus="contador2">
                                                <tr>
                                                    <td data-title="NRO."><c:out value="${contador2.count}"/></td>
                                                    <td data-title="CI" ><c:out value="${nroasignacion.dip}"/></td>
                                                    <td data-title="PATERNO" ><c:out value="${nroasignacion.paterno}"/></td>
                                                    <td data-title="MATERNO" ><c:out value="${nroasignacion.materno}"/></td>
                                                    <td data-title="NOMBRES"  ><c:out value="${nroasignacion.nombres}"/></td>
                                                    <td data-title="FUNCION" ><c:out value="${nroasignacion.descripcion}"/></td>

                                                    <c:if test="${(nroasignacion.nro_designacion) > 1}"> 
                                                        <td data-title="MATERIA">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.materia}"/><br>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td data-title="SIGLA">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.sigla}"/><br>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td data-title="NIVEL">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.nivel_academico}"/><br>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td data-title="GRUPO">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.grupo}"/><br>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td data-title="HRS">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.hrs_periodo}"/><br>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>

                                                        <td data-title="TIPO">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.tipo_docente}"/><br>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td data-title="DEDICACION" rowspan ><c:out value="${nroasignacion.tipo_asignacion}"/></td>
                                                    <tr>
                                                    </c:if>	
                                                    <c:if test="${(nroasignacion.nro_designacion) <= 1}"> 
                                                        <td data-title="MATERIA">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.materia}"/><br>
                                                                </c:if>
                                                            </c:forEach>  
                                                        </td>
                                                        <td data-title="SIGLA">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.sigla}"/><br>
                                                                </c:if>
                                                            </c:forEach>  
                                                        </td>
                                                        <td data-title="NIVEL">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.nivel_academico}"/><br>
                                                                </c:if>
                                                            </c:forEach>  
                                                        </td>
                                                        <td data-title="GRUPO">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.grupo}"/><br>
                                                                </c:if>
                                                            </c:forEach>  
                                                        </td>
                                                        <td data-title="HORAS">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.hrs_periodo}"/><br>
                                                                </c:if>
                                                            </c:forEach>  
                                                        </td>
                                                        <td data-title="TIPO">
                                                            <c:forEach var="asignacion" items="${lAsignacionDocentesMateria}" varStatus="contador">
                                                                <c:if test = "${(nroasignacion.id_docente) == (asignacion.id_docente)}"> 
                                                                    <c:out value="${asignacion.tipo_docente}"/><br>
                                                                </c:if>
                                                            </c:forEach>  
                                                        </td>
                                                        <td data-title="DEDICACION" ><c:out value="${nroasignacion.tipo_asignacion}"/></td>  	
                                                    <tr>
                                                    </c:if>
                                                </c:forEach>  
                                                </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/asignacionDocentessintitular/verAsignacionDocentes.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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
