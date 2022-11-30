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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Programaci&oacute;n de materias</h1>
                    <p>Gestión:<c:out value='${gestion}'/> Periodo: <c:out value='${periodo}'/> Programa: <c:out value='${datosPrograma.programa}'/>
                    <p>${usuario}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile"> 
                        <section class="invoice">
                            <div class="row mb-4">
                                <div class="col-6">
                                    <h2 class="page-header">Programaci&oacute;n de materias</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col alert alert-light" role="alert">
                                    <p style="text-align: center;"><strong>REGLAMENTO DE PROMOCI&Oacute;N Y PROGRAMACI&Oacute;N DE ASIGNATURAS</strong><br /><strong>DE LA UNIVERSIDAD AUT&Oacute;NOMA DEL BENI &ldquo;JOS&Eacute; BALLIVI&Aacute;N&rdquo;</strong></p>
                                    <p><strong>CAP&Iacute;TULO III</strong></p>
                                    <p><strong>PROGRAMACI&Oacute;N</strong></p>
                                    <ul>
                                        <li style="text-align: justify;">Las asignaturas se programar&aacute;n al inicio de cada gesti&oacute;n acad&eacute;mica (sistema anual) o semestre acad&eacute;mico en fechas estipuladas en el Calendario Acad&eacute;mico de la UAB&rdquo;JB&rdquo;.</li>
                                        <li style="text-align: justify;">Para la programaci&oacute;n de asignaturas, la UAB&rdquo;JB&rdquo; adopta la modalidad de vencimiento por gesti&oacute;n acad&eacute;mica o semestre acad&eacute;mico (en sujeci&oacute;n al Art. 4&deg; del presente reglamento).</li>
                                        <li style="text-align: justify;">Las asignaturas del Plan de Estudios que no tenga prerrequisitos, s&oacute;lo ser&aacute;n programadas si el estudiante ha alcanzado el nivel del semestre donde &eacute;stas se encuentren.</li>
                                        <li style="text-align: justify;">La programaci&oacute;n de asignaturas es funci&oacute;n de la Jefatura de Estudios, quien ser&aacute; el &uacute;nico responsable de la misma.</li>
                                        <li style="text-align: justify;">Se programaran asignaturas hasta de tres niveles consecutivos en carreras con el sistema semestral, y hasta 2 niveles consecutivos en carreras con en el sistema anual de acuerdo al plan de estudio y tomando en cuenta los prerequisitos establecidos.</li>
                                        <li style="text-align: justify;">Cuando existan tres asignaturas de arrastres y &eacute;stas correspondan a dos gestiones o dos periodos semestrales consecutivos; s&oacute;lo se programar&aacute;n &eacute;stas en una gesti&oacute;n acad&eacute;mica o semestre.</li>
                                        <li style="text-align: justify;">La programaci&oacute;n de la asignatura de Modalidad de Graduaci&oacute;n, se efectuar&aacute; en el &uacute;ltimo ciclo o periodo y para su defensa deber&aacute;n haber sido aprobadas todas las otras asignaturas del Plan de estudios (Resoluci&oacute;n No. 141/2006 del H.C.U.).is</li>
                                    </ul>
                                    <hr style="border-top: 1px solid black;">
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
                                        </c:forEach><br>
                                        <strong>TIPO EVALUACI&Oacute;N:: </strong><c:out value="${datosTipoEval.tipo_evaluacion}"/><br>
                                        <strong>GESTION:: </strong> <c:out value="${gestion}"/><br>
                                        <strong>PERIODO:: </strong> <c:out value="${periodo}"/><br>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <form method="post" name="formulario" action=<c:url value="/inscripcionMateriasAutomatica/confirmarProgramacionMaterias.fautapo"/> >
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type=hidden name="id_periodo"    value=<c:out value="${id_periodo}"/> >
                                        <input type=hidden name="id_estudiante" value=<c:out value="${datosEstudiante.id_estudiante}"/> >
                                        <input type=hidden name="gestion"       value='<c:out value="${gestion}"/>' >
                                        <input type=hidden name="periodo"       value='<c:out value="${periodo}"/>' >
                                        <input type="hidden" name="id_tipo_programacion" value="<c:out value='${id_tipo_programacion}'/>"> 
                                        <input type="hidden" name="id_tipo_evaluacion" value="<c:out value='${id_tipo_evaluacion}'/>">
                                        <input type="hidden" name="id_modelo_ahorro" value="<c:out value='-1000000'/>">
                                        <div id="no-more-tables">
                                            <table  class="table table-striped cf">
                                                <thead class="cf">
                                                    <tr class="text-center">
                                                        <th>NIVEL</th>
                                                        <th>SIGLA</th>
                                                        <th>MENCION</th>
                                                        <th>MATERIA</th>
                                                        <th>PARALELO/GRUPO</th>
                                                        <th>¿DESEA PROGRAMAR?</th>
                                                        <th>OBSERVACION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="nombremateria" value=""/>
                                                    <c:set var="colordt" value=""/>
                                                    <c:forEach var="materias" items="${lMaterias}" varStatus="contador">
                                                        <c:if test="${materias.id_modelo_ahorro > 0}">
                                                            <c:if test="${materias.materia != nombremateria}">
                                                                <tr class="text-left">
                                                                    <td data-title="NIVEL"><strong><c:out value="${materias.nivel_academico}"/></strong></td>
                                                                    <td  data-title="SIGLA"><strong><c:out value="${materias.sigla}"/></strong></td>
                                                                    <td  data-title="MENCION"><strong><c:out value="${materias.mencion}"/></strong></td>
                                                                    <td  data-title="MATERIA"><strong><c:out value="${materias.materia}"/></strong></td>
                                                                    <td  data-title="PARALELO/GRUPO"></td>
                                                                    <td  data-title="¿DESEA PROGRAMAR?"></td>
                                                                    <td  data-title="OBSERVACION"></td>
                                                                    <c:set var="nombremateria" value="${materias.materia}"/>
                                                                </tr>
                                                            </c:if>
                                                        </c:if>
                                                        <tr>
                                                            <c:if test="${materias.id_modelo_ahorro <= 0 }">
                                                                <td data-title="NIVEL" class="text-left"><strong><c:out value="${materias.nivel_academico}"/></strong></td>
                                                                        <c:if test="${materias.id_tipo_materia != 3}">
                                                                    <td class="text-left"  data-title="SIGLA"><strong><c:out value="${materias.sigla}"/></strong></td>
                                                                    <td class="text-left" data-title="MENCION"><strong><c:out value="${materias.mencion}"/></strong></td>
                                                                        </c:if>
                                                                        <c:if test="${materias.id_tipo_materia == 3}">
                                                                    <td data-title="PARALELO/GRUPO">&nbsp;</td>
                                                                    <td data-title="¿DESEA PROGRAMAR?">&nbsp;</td>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${materias.id_modelo_ahorro > 0}">
                                                                <td class="text-left" data-title="NIVEL">--</td>
                                                                <td class="text-left" data-title="SIGLA">-- </td>
                                                                <td class="text-left" data-title="MENCION"> --</td>    
                                                                <td class="text-left" data-title="PARALELO/GRUPO"><c:out value="${materias.modelo_ahorro}"/></td>
                                                            </c:if>
                                                            <c:if test="${materias.id_modelo_ahorro <= 0}">
                                                                <td class="text-left" data-title="MATERIA"><strong><c:if test="${materias.id_tipo_materia == 3}">&nbsp; &nbsp; &nbsp;</c:if><c:out value="${materias.materia}"/></strong></td>
                                                            </c:if>
                                                            <td class="text-left" data-title="PARALELO/GRUPO">
                                                                <c:if test="${materias.id_estado == 'A'}">
                                                                    <span class="badge badge-primary">PARALELO &nbsp;<c:out value="${materias.grupo}"/></span>
                                                                </c:if>
                                                                <c:if test="${materias.id_estado != 'A'}">
                                                                    <c:if test="${materias.cupo_restante > '0'}">
                                                                        <div class="form-group">
                                                                            <select  class="form-control" id='id_grupo:<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_modelo_ahorro}"/>' name='id_grupo:<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_modelo_ahorro}"/>'>
                                                                                <c:forEach var="grupos" items="${materias.grupos}">
                                                                                    <option  value="<c:out value="${grupos.id_grupo}"/>">
                                                                                        <c:out value="${grupos.nombre_completo}"/>&nbsp; <c:out value="${grupos.grupo}"/>(<c:out value="${grupos.cupo_restante}"/>)
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div> 
                                                                    </c:if>
                                                                </c:if>
                                                            </td>
                                                            <td data-title="¿DESEA PROGRAMAR?" class="text-left" >
                                                                <c:if test="${materias.id_estado == 'A'}">
                                                                    <span class="badge badge-primary">PROGRAMADO</span>
                                                                </c:if>
                                                                <c:if test="${materias.id_estado != 'A'}">
                                                                    <c:if test="${materias.cupo_restante > '0'}">
                                                                        <div class="toggle-flip">
                                                                            <label>
                                                                                <input type="checkbox" name="materia" VALUE="<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_modelo_ahorro}"/>"><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                                            </label>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${materias.cupo_restante == '0'}">
                                                                        <span class="badge badge-warning">Sin plazas</span>  
                                                                    </c:if>
                                                                </c:if>
                                                            </td>
                                                            <td class="text-left" data-title="OBSERVACION">
                                                                <c:forEach var="materiasEst" items="${lMateriasEst}" varStatus="contador">
                                                                    <c:if test="${materias.id_materia == materiasEst.id_materia}">
                                                                        <c:if test="${materias.id_estado != 'A'}">
                                                                            <span class="badge badge-danger">SIN PROGRAMAR</span>
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="row">
                                                <div class="col-md-8 col-md-offset-3">
                                                    <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form method="post" id="frmsalir" modelAttribute="model" action="${pageContext.request.contextPath}/inscripcionMateriasAutomatica/comprobarEntrada1.fautapo">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
                                        <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
                                        <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
                                        <input type="hidden" name="id_departamento" value='<c:out value="${id_departamento}"/>'>
                                        <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${id_tipo_evaluacion}"/>'>
                                    </form>
                                </div>
                            </div>
                            <c:if test="${!empty mensaje }">
                                <div class="row">
                                    <div class="col">
                                        <div class="Card-Informacion">
                                            <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                                <div class="card-header text-center"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;AVISO</div>
                                                <div class="card-body text-secondary">  
                                                    <p class="card-text text-center"> 
                                                        <c:out value="${mensaje}"/><br><br>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
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
