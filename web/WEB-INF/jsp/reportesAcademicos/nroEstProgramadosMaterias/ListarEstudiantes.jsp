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
                                    <h5 class="text-right">Fecha : <fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-4">
                                <div class="col text-center">
                                    <h2 style="text-align: center;">Nro. DE ESTUDIANTES APROBADOS, REPROBADOS Y ABANDONOS</h2>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>Tipo Evaluacion:: </strong><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/><br>
                                        <strong>Programa:: </strong><c:out value="${datosPrograma.programa}"/><br>
                                        <strong>Plan:: </strong><c:out value="${datosPrgPlan.id_plan}"/>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <strong>Periodo:: </strong><c:out value="${periodo}"/> - <c:out value="${gestion}"/><br>
                                    <strong>Area:: </strong><c:out value="${datosFacultad.facultad}"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div id="no-more-tables">
                                        <table class="table table-striped" border="1" cf>
                                            <thead class="cf">
                                                <tr>
                                                    <th rowspan="2">Nro</th>
                                                    <th rowspan="2">Nivel</th>
                                                    <th rowspan="2">Sigla</th>
                                                    <th rowspan="2">Materia</th>
                                                    <th rowspan="2">Grupo</th>
                                                    <th >Nro. Aprobados</th>
                                                    <th colspan="2">Nro. Reprobados</th>
                                                    <th colspan="2">Nro. Abandonos</th>
                                                    <th rowspan="2">TOTAL PROGRAMADOS</th>
                                                </tr>
                                                <tr>
                                                    <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                        <th><c:out value="${ltsexos.tipo_sexo}"/></th>
                                                        </c:forEach>
                                                        <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                        <th><c:out value="${ltsexos.tipo_sexo}"/></th>    
                                                        </c:forEach>
                                                        <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                        <th><c:out value="${ltsexos.tipo_sexo}"/></th>    
                                                        </c:forEach>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:set var="total" value="0"/>
                                                <c:set var="totalAprob" value="0"/>
                                                <c:set var="totalReprob" value="0"/>
                                                <c:set var="totalAband" value="0"/>
                                                <c:forEach var="lmateria" items="${lMaterias}" varStatus="contador">
                                                    <tr>
                                                        <td data-title="NRO."><c:out value="${contador.count}"/></td>   
                                                        <td data-title="NIVEL"><c:out value="${lmateria.nivel_academico}"/></td>
                                                        <td data-title="SIGLA"><c:out value="${lmateria.sigla}"/></td>
                                                        <td data-title="MATERIA"><c:out value="${lmateria.materia}"/></td>
                                                        <td data-title="GRUPO"><c:out value="${lmateria.grupo}"/></td>

                                                        <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                            <c:set var="cont" value="0"/>
                                                            <c:forEach var="lestudiante" items="${lEstudiantes}" varStatus="contador">
                                                                <c:if test="${lmateria.id_materia == lestudiante.id_materia && lmateria.id_grupo == lestudiante.id_grupo && lestudiante.id_tipo_sexo == ltsexos.id_tipo_sexo}">
                                                                    <td data-title='"FEMENINO"-"MASCULINO"'  ><c:out value="${lestudiante.aprobados}"/></td>
                                                                    <c:set var="cont" value="${cont+1}"/> 
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${cont == '0'}">
                                                                <td align="center">0</td>
                                                            </c:if>
                                                        </c:forEach>

                                                        <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                            <c:set var="cont" value="0"/>
                                                            <c:forEach var="lestudiante" items="${lEstudiantes}" varStatus="contador">
                                                                <c:if test="${lmateria.id_materia == lestudiante.id_materia && lmateria.id_grupo == lestudiante.id_grupo && lestudiante.id_tipo_sexo == ltsexos.id_tipo_sexo}">
                                                                    <td><c:out value="${lestudiante.reprobados}"/></td>
                                                                    <c:set var="cont" value="${cont+1}"/> 
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${cont == '0'}">
                                                                <td align="center">0</td>
                                                            </c:if>
                                                        </c:forEach>

                                                        <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                            <c:set var="cont" value="0"/>
                                                            <c:forEach var="lestudiante" items="${lEstudiantes}" varStatus="contador">
                                                                <c:if test="${lmateria.id_materia == lestudiante.id_materia && lmateria.id_grupo == lestudiante.id_grupo && lestudiante.id_tipo_sexo == ltsexos.id_tipo_sexo}">
                                                                    <td ><c:out value="${lestudiante.abandonos}"/></td>
                                                                    <c:set var="cont" value="${cont+1}"/> 
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${cont == '0'}">
                                                                <td align="center">0</td>
                                                            </c:if>
                                                        </c:forEach>

                                                        <td data-title="TOTAL PROGRAMADOS"><c:out value="${lmateria.numero}"/></td>
                                                    </c:forEach>
                                                <tr>
                                                    <td class="colb" colspan="5">
                                                        TOTALES:
                                                    </td>
                                                    <c:set var="total" value="0"/> 
                                                    <c:set var="c" value="0"/> 
                                                    <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                        <c:set var="cont" value="0"/>
                                                        <c:forEach var="lestudiante" items="${lEstudiantes}">
                                                            <c:if test="${lestudiante.id_tipo_sexo == ltsexos.id_tipo_sexo}">
                                                                <c:set var="cont" value="${cont+lestudiante.aprobados}"/> 
                                                                <c:set var="total" value="${total+lestudiante.aprobados}"/> 
                                                            </c:if>
                                                        </c:forEach>
                                                        <td class="colb" align="center"><c:out value="${cont}"/></td>   
                                                        <c:set var="c" value="${c+1}"/> 
                                                    </c:forEach>

                                                    <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                        <c:set var="cont" value="0"/>
                                                        <c:forEach var="lestudiante" items="${lEstudiantes}">
                                                            <c:if test="${lestudiante.id_tipo_sexo == ltsexos.id_tipo_sexo}">
                                                                <c:set var="cont" value="${cont+lestudiante.reprobados}"/> 
                                                                <c:set var="total" value="${total+lestudiante.reprobados}"/> 
                                                            </c:if>
                                                        </c:forEach>
                                                        <td class="colb" align="center"><c:out value="${cont}"/></td>   
                                                        <c:set var="c" value="${c+1}"/> 
                                                    </c:forEach>

                                                    <c:forEach var="ltsexos" items="${lTiposSexos}">
                                                        <c:set var="cont" value="0"/>
                                                        <c:forEach var="lestudiante" items="${lEstudiantes}">
                                                            <c:if test="${lestudiante.id_tipo_sexo == ltsexos.id_tipo_sexo}">
                                                                <c:set var="cont" value="${cont+lestudiante.abandonos}"/> 
                                                                <c:set var="total" value="${total+lestudiante.abandonos}"/> 
                                                            </c:if>
                                                        </c:forEach>
                                                        <td class="colb" align="center"><c:out value="${cont}"/></td>   
                                                        <c:set var="c" value="${c+1}"/> 
                                                    </c:forEach>
                                                    <td class="colb" align="center">
                                                        <c:out value="${total}"/> Programados
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/nroEstProgramadosMaterias/Entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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