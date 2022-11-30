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
                                    <form method="post" action=<c:url value="/retiroAdicionMateriasJefe/registrarAccionProgramacionMaterias.fautapo"/> >
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <!--<input type="hidden" name=id_tipo_periodo       value=<c:out value="${buscarPeriodo.id_tipo_periodo}"/> >-->
                                        <input type="hidden" name="total_materias"      value=<c:out value="${total_materias}"/> >
                                        <input type="hidden" name="gestion"             value=<c:out value="${gestion}"/> >
                                        <input type="hidden" name="periodo"             value=<c:out value="${periodo}"/> >
                                        <input type="hidden" name="id_estudiante"       value=<c:out value="${datosEstudiante.id_estudiante}"/> >
                                        <input type="hidden" name="accion"              value='<c:out value="${accion}"/>' >
                                        <input type="hidden" name="id_tipo_evaluacion"  value='<c:out value="${id_tipo_evaluacion}"/>' >
                                        <div id="no-more-tables">
                                            <c:if test="${tamanio_choque_periodo > 0}">
                                                <h3>Inscripci&oacute;n de materias no permitida</h3>
                                                <table class="table table-striped">
                                                    <tr class="text-center">
                                                        <td>NRO</td>
                                                        <td>SIGLA</td>
                                                        <td>MATERIA</td>
                                                        <c:forEach var="materias" items="${lChoquePeriodos}" varStatus="contador">
                                                        <tr class=colb>
                                                            <td align=center><c:out value="${contador.count}"/></td>
                                                            <td align=center><c:out value="${materias.sigla}"/></td>
                                                            <td><c:out value="${materias.materia}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </c:if>
                                            <c:if test="${tamanio_choque > '0'}">
                                                <h3>Materias con choque de horario</h3>
                                                <table class="table table-striped">
                                                    <tr class="text-center">
                                                        <th>NRO</th>
                                                        <th>SIGLA</th>
                                                        <th>MATERIA</th>
                                                        <th>GRUPO</th>
                                                            <c:forEach var="materias" items="${lChoqueMaterias}" varStatus="contador">
                                                        <tr class="colb">
                                                            <td align=center><c:out value="${contador.count}"/></td>
                                                            <td align=center><c:out value="${materias.sigla}"/>  </td>
                                                            <td><c:if test="${empty materias.modelo_ahorro}"><c:out value="${materias.materia}"/></c:if><c:if test="${!empty materias.modelo_ahorro}"><c:out value="${materias.modelo_ahorro}"/></c:if></td>
                                                            <td><c:out value="${materias.grupo}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </c:if>
                                            <table  class="table table-striped cf">
                                                <thead class="cf">
                                                    <tr class="text-center">
                                                        <th>NRO</th>
                                                        <th>SIGLA</th>
                                                        <th>MATERIA</th>
                                                        <th>GRUPO</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${ accion =='Retiro'}">  
                                                        <c:forEach var="materias" items="${lMaterias}" varStatus="contador">
                                                        <input type=hidden name='materia<c:out value="${contador.index}"/>' value='<c:out value="${materias.id_programacion}"/>:<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_grupo}"/>:<c:out value="${materias.id_modelo_ahorro}"/>' >
                                                        <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> >  
                                                            <td align=center><c:out value="${contador.count}"/></td>
                                                            <td align=center><c:out value="${materias.sigla}"/></td>
                                                            <td><c:out value="${materias.materia}"/></td>
                                                            <td align=center><c:out value="${materias.grupo}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td colspan=5 align=center>
                                                            <c:if test="${tamanio_choque == 0}">
                                                                <input class="aceptar" type=submit value=Confirmar>
                                                            </c:if>
                                                            <c:if test="${(tamanio_choque != '0') || (tamanio_choque_periodo != 0)}">
                                                                <div class="tile-footer text-left">
                                                                    <div class="row">
                                                                        <div class="col-md-8 col-md-offset-3">
                                                                            <button class="btn btn-primary" type='submit' value='Confirmar'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--<input class=" btn btn-primary" type=submit value=Confirmar> &nbsp;<input class="cancelar btn btn-danger" type=button value=Cancelar onClick=javascript:history.back();>-->
                                                            </c:if>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${ accion !='Retiro'}">    
                                                        <c:forEach var="materias" items="${lMaterias}" varStatus="contador">
                                                        <input type=hidden name='materia<c:out value="${contador.index}"/>' value='<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_grupo}"/>:<c:out value="${materias.id_modelo_ahorro}"/>' >
                                                        <!-- ********** Esto es para el efecto ************ -->
                                                        <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> >
                                                            <td align=center><c:out value="${contador.count}"/></td>
                                                            <td align=center><c:out value="${materias.sigla}"/></td>
                                                            <td><c:out value="${materias.materia}"/></td>
                                                            <td align=center><c:out value="${materias.grupo}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td colspan=5 align=center>
                                                            <c:if test="${tamanio_choque == 0}">
                                                                <input class="aceptar" type=submit value="Confirmar">
                                                            </c:if>
                                                            <c:if test="${(tamanio_choque != '0') || (tamanio_choque_periodo != 0)}">
                                                                <div class="tile-footer text-left">
                                                                    <div class="row">
                                                                        <div class="col-md-8 col-md-offset-3">
                                                                            <button class="btn btn-primary" type='submit' value='Confirmar'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--<input class="btn btn-primary" type=submit value=Confirmar>&nbsp; <input class="btn btn-secondary" type=button value=Cancelar href="#" id="btnsalir">  -->
                                                            </c:if>
                                                        </td>
                                                    </c:if>
                                                    </tbody>
                                            </table>
                                        </div>
                                    </form>
                                    <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/retiroAdicionMateriasJefe/listarProgramacionMaterias.fautapo">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
                                        <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
                                        <input type="hidden" name="accion"               value="<c:out value='${accion}'/>"> 
                                        <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${id_tipo_evaluacion}"/>' >
                                        <input type="hidden" name="id_programa" value='<c:out value="${datosPrograma.id_programa}"/>' >
                                        <input type=hidden name="id_estudiante"          value=<c:out value="${datosEstudiante.id_estudiante}"/> >
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