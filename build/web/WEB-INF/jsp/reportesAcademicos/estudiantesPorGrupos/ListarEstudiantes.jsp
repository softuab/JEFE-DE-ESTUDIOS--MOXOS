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
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.min.css'/>">  
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
                                    <h5 class="text-right">Fecha : <fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-4">
                                <div class="col text-center">
                                    <h2 style="text-align: center;">LISTADO DE ESTUDIANTES POR GRUPO</h2>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>Tipo de Acta:: </strong><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/><br>
                                        <strong>Plan:: </strong><c:out value="${datosPrgPlan.id_plan}"/><br>
                                        <strong>Materia:: </strong><c:out value="${datosMateria.materia}"/><br>
                                        <strong>Programa:: </strong><c:out value="${datosPrograma.programa}"/>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>Codigo:: </strong><c:out value="${datosMateria.id_materia}"/><br>
                                        <strong>Periodo:: </strong><c:out value="${periodo}"/> - <c:out value="${gestion}"/><br>
                                        <strong>Sigla::</strong> <c:out value="${datosMateria.sigla}"/>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div  id="no-more-tables">
                                        <table class="table table-striped" border="1" cf>
                                            <thead class="cf">
                                                <tr>
                                                    <th>Nro</th>
                                                    <th>R.U.</th>
                                                    <th>NOMBRES</th>
                                                    <th>FECHA PROGRAMACION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="id_grupo_ant" value="0"/>
                                                <c:forEach var="lista" items="${lEstudiantes}" varStatus="contador">
                                                    <c:if test="${id_grupo_ant != lista.id_grupo}">
                                                        <tr>
                                                            <td colspan="4">GRUPO :: <c:out value="${lista.grupo}"/></td>
                                                        </tr>
                                                    </c:if>
                                                    <tr>
                                                        <td data-title="NRO."><c:out value="${contador.count}"/></td>
                                                        <td data-title="R.U."><c:out value="${lista.id_estudiante}"/></td>
                                                        <td data-title="NOMBRES"><c:out value="${lista.nombres}"/></td>
                                                        <td data-title="FECHA PROGRAMACION"><fmt:formatDate value="${lista.fec_modificacion}" pattern="${formatoFecha} ${formatoHora}"/></td>
                                                    </tr>
                                                    <c:set var="id_grupo_ant" value="${lista.id_grupo}"/>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/estudiantesPorGrupos/Entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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