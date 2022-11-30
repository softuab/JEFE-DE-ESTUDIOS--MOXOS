<%@page import="java.util.Date"%>
<jsp:useBean id="now" class="java.util.Date" />
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
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Impresion Boletas de Programación</h1>
                    <p>${nombres}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <section class="invoice">
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
                            <div class="row mb-4">
                                <div class="col text-center">
                                    <h3 style="text-align: center;">PROGRAMACIÓN DE MATERIAS</h3>
                                    <h3 style="text-align: center;">Datos del alumno</h3>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-4">
                                    <address>
                                        <strong>RU:: </strong><c:out value="${datosEstudiante.id_estudiante}"/><br>
                                        <strong>TIPO:: </strong><c:out value="${datosEstudiante2.tipo_estudiante}"/><br>
                                    </address>
                                </div>
                                <div class="col-4">
                                    <address>
                                        <strong>CI:: </strong><c:out value="${datosEstudiante2.dip}"/><br>
                                        <strong>PLAN:: </strong><c:out value="${datosEstudiante.id_plan}"/><br>
                                    </address>
                                </div>
                                <div class="col-4">
                                    <adress>
                                        <strong>ESTUDIANTE:: </strong><c:out value="${datosEstudiante2.nombres}"/> &nbsp; <c:out value="${datosEstudiante2.paterno}"/>  &nbsp;  <c:out value="${datosEstudiante2.materno}"/><br>
                                        <strong>PROGRAMA:: </strong> <c:out value="${datosPrograma.programa}"/>
                                    </adress>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col">
                                    <div class="text-center">
                                        <h3>Materias Programadas  Gesti&oacute;n: <c:out value="${periodo}"/>-<c:out value="${gestion}"/></h3>
                                    </div>
                                    <div class="table-responsive" id="no-more-tables">
                                        <table class="table table-striped" border="1" cf>
                                            <thead class="cf">
                                                <tr class="text-center">
                                                    <th>NRO.</th>
                                                    <th>EVALUACI&Oacute;N</th>
                                                    <th>NIVEL</th>
                                                    <th>SIGLA</th>
                                                    <th>MATERIA</th>
                                                    <th>GRUPO</th>
                                                    <th>FECHA</th>
                                                    <th>DOCENTE</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="lista" items="${lProgramacion}" varStatus="contador">
                                                    <tr>
                                                        <td data-title="NRO."><c:out value="${contador.count}"/></td>
                                                        <td data-title="EVALUACI&Oacute;N"><c:out value="${lista.tipo_evaluacion}"/></td>
                                                        <td data-title="NIVEL"><c:out value="${lista.nivel_academico}"/></td>
                                                        <td data-title="SIGLA"><c:out value="${lista.sigla}"/></td>
                                                        <td data-title="MATERIA"><c:out value="${lista.materia}"/></td>
                                                        <td data-title="GRUPO"><c:out value="${lista.grupo}"/></td>
                                                        <td data-title="FECHA"><fmt:formatDate value="${lista.fec_modificacion}" pattern="${formatoFecha}"/></td>
                                                        <td data-title="DOCENTE"><c:out value="${lista.nombres}"/></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <p><strong><fmt:formatDate value="${now}" pattern="${formatoFecha} ${formatoHora}"/> &nbsp; [<c:out value="${cliente.nombres}"/>]</strong></p>
                                    </div>  
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/inscripcionMateriasAutomatica/entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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