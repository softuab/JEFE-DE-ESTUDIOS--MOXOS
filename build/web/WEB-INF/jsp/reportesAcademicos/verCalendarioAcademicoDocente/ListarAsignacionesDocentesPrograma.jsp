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
            <div class=" row">
                <div class="col-md-12">
                    <div class="tile">
                        <section class="invoice" >
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row mb-4">
                                <div class="col-2 " ID="cont1" STYLE="position:center;top:10px;left:50px">
                                    <img src="<c:url value='/imagenes/logo.png'/>" width="35%;" alt=""/>
                                </div>
                                <div class="col-7" id="cont1"  width = "100%"  align="center">
                                    <h2 style="text-align: center;"><strong>UNIVERSIDAD AUT&Oacute;NOMA DEL BENI <br />&ldquo;JOS&Eacute; BALLIVI&Aacute;N&rdquo;</strong></h2>
                                </div>
                                <div class="col-3">
                                    <c:set var="today" value="<%=new Date()%>"/>
                                    <h5 class="text-right">Fecha : <fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col text-center">
                                    <h2 style="text-align: center;">CALENDARIO ACADEMICO</h2>
                                </div>
                            </div>
                            <hr>
                            <div class="row invoice-info">
                                <div class="col-6" width ="90%" height= "20%" border = 0>
                                    <address>
                                        <strong>Carrera::   </strong><c:out value="${datosPrograma.programa}"/><br>
                                        <strong>Periodo:: </strong> <c:out value="${periodo}"/>/<c:out value="${gestion}"/>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>Tipo Evaluación::</strong>
                                        <c:if test ="${evaluacion == 1}">REGULAR</c:if> 
                                        <c:if test ="${evaluacion == 3}">CURSO DE VERANO</c:if> 
                                        <c:if test ="${evaluacion == 4}">EXAMEN DE MESA</c:if> 
                                        </address>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div id="no-more-tables">
                                            <table class="table table striped" border="1" cf>
                                                <thead class="cf">
                                                    <tr>
                                                        <th>NRO</th>
                                                        <th>NIVEL<br>ACADEMICO</th>
                                                        <th>GRUPO</th>
                                                        <th>SIGLA</th>
                                                        <th>MATERIA</th>
                                                        <th>DOCENTE</th>
                                                        <th>C.I.</th>
                                                        <th>TIPO DE NOTA</th>
                                                        <th>NRO. TIPO DE NOTA</th>
                                                        <th>FECHA LIMITE</th>
                                                    </tr> 
                                                </thead>
                                                <tbody>
                                                <c:forEach var="asignacion" items="${lcalificacionCalendario}" varStatus="contador">
                                                    <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                        <td data-title="NRO" ><c:out value="${contador.count}"/></td>
                                                        <td data-title="NIVEL ACADEMICO" align="center"><c:out value="${asignacion.nivel_academico}"/></td>
                                                        <td data-title="GRUPO"align="center"><c:out value="${asignacion.grupo}"/></td>
                                                        <td data-title="SIGLA"><c:out value="${asignacion.sigla}"/></td>
                                                        <td data-title="MATERIA"><c:out value="${asignacion.materia}"/></td>
                                                        <td data-title="DOCENTE"><c:out value="${asignacion.paterno}"/>&nbsp;<c:out value="${asignacion.materno}"/>&nbsp;<c:out value="${asignacion.nombres}"/></td>
                                                        <td data-title="C.I."><c:out value="${asignacion.dip}"/></td>
                                                        <td data-title="TIPO DE NOTA"><c:out value="${asignacion.tipo_nota}"/></td>
                                                        <td data-title="NRO. TIPO DE NOTA"><c:out value="${asignacion.nro_tipo_nota}"/></td>
                                                        <td data-title="FECHA LIMITE"><c:out value="${asignacion.fecha_limite}"/></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/calendarioAcademicoDocente/verActaCalificaciones.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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