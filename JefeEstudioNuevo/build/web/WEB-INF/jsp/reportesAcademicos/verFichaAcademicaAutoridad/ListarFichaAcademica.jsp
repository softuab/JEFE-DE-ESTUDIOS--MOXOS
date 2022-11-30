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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Ver Ficha Acad&eacute;mica</h1>
                    <p>${usuario}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <section class="invoice">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>R.U:: </strong><c:out value="${datosEstudiante.id_estudiante}"/><br>
                                        <strong>Estudiante:: </strong> <c:out value="${datosEstudiante2.nombres}"/> &nbsp; 
                                        <c:out value="${datosEstudiante2.paterno}"/> &nbsp;
                                        <c:out value="${datosEstudiante2.materno}"/>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>Programa:: </strong><c:out value="${datosPrograma.programa}"/><br>
                                        <strong>Plan::</strong><c:out value="${datosEstudiante.id_plan}"/>
                                    </address>
                                </div>
                            </div>
                            <div class="text-center">

                                <h4>Listado de Materias Convalidadas Autom&aacute;ticamente</h4>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div id="no-more-tables">
                                        <table class="table table-striped" border="1">
                                            <thead class="cf">
                                                <tr>
                                                    <th>NRO.</th>
                                                    <th>GESTION</th>
                                                    <th>PLAN</th>
                                                    <th>NIVEL</th>
                                                    <th>SIGLA</th>
                                                    <th>MATERIA</th>
                                                    <th>TIPO EVAL</th>
                                                    <th>NOTA</th>
                                                    <th>OBSERVACION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="lista" items="${lFichaAcademica}" varStatus="contador">
                                                    <!-- ********** Esto es para el efecto ************ -->
                                                    <tr <c:if test="${(contador.count mod 2) == 0}"></c:if>>

                                                            <td data-title="NRO."><c:out value="${contador.count}"/></td>
                                                        <td data-title="GESTION"><c:out value="${lista.periodo}"/>-<c:out value="${lista.gestion}"/></td>
                                                        <td data-title="PLAN"><c:out value="${lista.id_plan}"/></td>
                                                        <td data-title="NIVEL"><c:out value="${lista.nivel_academico}"/></td>
                                                        <td data-title="SIGLA"><c:out value="${lista.sigla}"/></td>
                                                        <td data-title="MATERIA"><c:out value="${lista.materia}"/></td>
                                                        <td data-title="TIPO EVALUACION"><c:out value="${lista.tipo_evaluacion}"/></td>

                                                        <c:if test="${(lista.id_estado == 'R') || (lista.id_estado == 'D')}" >
                                                            <td data-title="NOTA"><font color="red"><c:out value="${lista.nota}"/></font></td>	
                                                            <td data-title="OBSERVACION"><font color="red"><c:out value="${lista.estado}"/></td>

                                                        </c:if>    

                                                        <c:if test="${lista.id_estado == 'A'}">
                                                            <td data-title="NOTA"><c:out value="${lista.nota}"/></td>
                                                            <td data-title="OBSERVACION"><c:out value="${lista.estado}"/></td>
                                                        </c:if>

                                                        <c:if test="${lista.id_estado == 'C'}">
                                                            <td data-title="NOTA"><c:out value="${lista.nota}"/></td>
                                                            <td data-title="OBSERVACION"><c:out value="${lista.estado}"/></td>
                                                        </c:if>

                                                    </tr>
                                                </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <br>
                                <h4>Listado de Materias Convalidadas Autom&aacute;ticamente</h4>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div id="no-more-tables">
                                        <table class="table table-striped" border="1">
                                            <thead class="cf">
                                            <th>NRO.</th>
                                            <th>GESTION</th>
                                            <th>NIVEL</th>	
                                            <th>SIGLA</th>
                                            <th>MATERIA</th>
                                            <th>NOTA</th>
                                            <th>TIPO EVAL</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="lista1" items="${lFichaAcademicaConvalidada}" varStatus="contador">
                                                    <tr>
                                                        <td data-title="NRO."><c:out value="${contador.count}"/></td>
                                                        <td data-title="GESTION"><c:out value="${lista1.periodo}"/>-<c:out value="${lista1.gestion}"/></td>    
                                                        <td data-title="NIVEL"><c:out value="${lista1.nivel_academico}"/></td>
                                                        <td data-title="SIGLA"><c:out value="${lista1.sigla}"/></td>
                                                        <td data-title="MATERIA"><c:out value="${lista1.materia}"/></td>
                                                        <td data-title="NOTA"><c:out value="${lista1.nota}"/></td>
                                                        <td data-title="TIPO EVALUACION"><c:out value="${lista1.tipo_evaluacion}"/></td>
                                                    </tr>
                                                </c:forEach> 
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/verFichaAcademicaAutoridad/entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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

