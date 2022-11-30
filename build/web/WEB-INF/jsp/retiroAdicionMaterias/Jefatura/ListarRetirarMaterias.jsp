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
                                        <strong>CARRERA:: </strong><c:out value="${datosPrograma.programa}"/><br>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>TIPO PROGRAMACION:: </strong>
                                        <c:forEach var="parametro" items="${lParametros}" >
                                            <c:out value="${parametro.tipo_programacion}"/><br>
                                        </c:forEach>
                                        <strong>TIPO EVALUACI&Oacute;N:: </strong><c:out value="${datosTipoEval.tipo_evaluacion}"/><br>
                                        <strong>GESTION:: </strong> <c:out value="${gestion}"/><br>
                                        <strong>PERIODO:: </strong> <c:out value="${periodo}"/><br>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col table-responsive">
                                    <form name='forma' method="post" action=<c:url value="/retiroAdicionMateriasJefe/confirmarAccionProgramacionMaterias.fautapo"/> >
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                        <input type=hidden name="id_tipo_periodo"    value=<c:out value="${id_tipo_periodo}"/> >
                                        <input type=hidden name="id_estudiante"      value=<c:out value="${datosEstudiante.id_estudiante}"/> >
                                        <input type=hidden name="gestion"            value=<c:out value="${gestion}"/> >
                                        <input type=hidden name="periodo"            value=<c:out value="${periodo}"/> >
                                        <input type=hidden name=accion               value='<c:out value="${accion}"/>' >
                                        <input type=hidden name=total_materias       value="0"> 
                                        <input type=hidden name="id_tipo_evaluacion" value=<c:out value="${id_tipo_evaluacion}"/> >
                                        <h3><strong>RETIRO DE MATERIAS</strong></h3>
                                        <table  class="table table-striped cf">
                                            <thead  class="cf">
                                                <tr class="text-center">
                                                    <th>¿DESEA RETIRAR?</th>
                                                    <th>NIVEL</th>
                                                    <th>SIGLA</th>
                                                    <th>MATERIA</th>
                                                    <th>GRUPO</th>
                                                    <th>TIPO EVALUACION</th>
                                                    <th>PARALELO/GRUPO</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="nombremateria" value=""/>  
                                                <c:forEach var="materias" items="${lMateriasRetiro}" varStatus="contador">
                                                    <c:if test="${materias.id_modelo_ahorro > 0}">
                                                        <c:if test="${materias.materia != nombremateria}">
                                                            <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> >   
                                                                    <td data-title="¿DESEA RETIRAR?"></td>
                                                                    <td data-title="NIVEL"><b><c:out value="${materias.nivel_academico}"/></b></td>
                                                                <td data-title="SIGLA"><b><c:out value="${materias.sigla}"/></b></td>
                                                                <td data-title="MATERIA"><strong><c:out value="${materias.materia}"/></strong></td>
                                                                <td data-title="GRUPO"> </td>
                                                                <td data-title="TIPO EVALUACION"> </td>
                                                                <td data-title="PARALELO/GRUPO"> </td>
                                                                <c:set var="nombremateria" value="${materias.materia}"/>
                                                            </tr>
                                                        </c:if>
                                                    </c:if>
                                                    <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> >
                                                            <td  data-title="¿DESEA RETIRAR?" align=center>
                                                                <div class="toggle-flip">
                                                                    <label>
                                                                        <input type="checkbox" name="materia" VALUE="<c:out value="${materias.id_programacion}"/>:<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_modelo_ahorro}"/>:<c:out value="${materias.id_grupo}"/>"><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                                </label>
                                                            </div>
                                                        </td>

                                                        <c:if test="${materias.id_modelo_ahorro > 0}">
                                                            <td class="colb" align=center> --
                                                            </td>
                                                            <td class="colb" align=center> --
                                                            </td>  
                                                            <td class="colb">
                                                                <c:out value="${materias.modelo_ahorro}"/>
                                                            </td>
                                                            <td data-title="GRUPO" class="colb" align=center>
                                                                <c:out value="${materias.grupo}"/>
                                                            </td>
                                                            <td class="colb" align=center>
                                                                <c:out value="${materias.nombres}"/>
                                                            </td>  
                                                        </c:if>
                                                        <c:if test="${ materias.id_modelo_ahorro <= 0}">
                                                            <td data-title="NIVEL" align=center>
                                                                <b><c:out value="${materias.nivel_academico}"/></b>
                                                            </td>
                                                            <td  data-title="SIGLA" align=center>
                                                                <b><c:out value="${materias.sigla}"/></b>
                                                            </td>
                                                            <td data-title="MATERIA">
                                                                <b><c:out value="${materias.materia}"/></b>
                                                            </td>
                                                            <td data-title="GRUPO" align=center>
                                                                <b><c:out value="${materias.grupo}"/></b>
                                                            </td>  
                                                            <td data-title="TIPO EVALUACION" align=center>
                                                                <b><c:out value="${materias.tipo_evaluacion}"/></b>
                                                            </td>  
                                                            <td data-title="PARALELO/GRUPO" align=center>
                                                                <b><c:out value="${materias.nombres}"/></b>
                                                            </td>  
                                                        </c:if>
                                                        </td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="tile-footer">
                                            <div class="row">
                                                <div class="col-md-8 col-md-offset-3">
                                                    <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/retiroAdicionMateriasJefe/listarAccionProgramacionMaterias.fautapo">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id_programa" value='<c:out value="${datosPrograma.id_programa}"/>' >
                                        <input type="hidden" name="id_estudiante" value='<c:out value="${datosEstudiante.id_estudiante}"/>' >
                                        <input type=hidden name="gestion"             value=<c:out value="${gestion}"/> >
                                        <input type=hidden name="periodo"             value=<c:out value="${periodo}"/> >
                                        <input type=hidden name="id_tipo_evaluacion"  value=<c:out value="${id_tipo_evaluacion}"/> >
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
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>

