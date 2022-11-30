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
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Materias del Plan a Convalidar</h1>
                    <p>Gestión: <c:out value='${gestion}'/> Periodo: <c:out value='${periodo}'/> Programa: <c:out value='${datosPrograma.programa}'/></p>
                    <p>${usuario}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-12 ">
                    <div class="tile">
                        <form:form method="post" modelAttribute="model" action="${pageContext.request.contextPath}/convalidacionManual/listarMateriasConvalidar.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                          <!--  <input type="hidden" name="id_facultad" value="<c:out value='${datosFacultad.id_facultad}'/>">-->
                            <input type="hidden" name="id_programa" value="<c:out value='${datosEstudiante.id_programa}'/>">
                            <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
                            <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
                            <input type="hidden" name="id_tipo_admision" value="<c:out value='${datosEstudiante.id_tipo_admision}'/>">

                            <div class="row mb-4">
                                <div class="col-6">
                                    <h2 class="page-header">Convalidación Manual</h2>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>RU:: </strong><c:out value="${datosEstudiante.id_estudiante}"/><br>
                                        <strong>NOMBRES:: </strong><c:out value="${datosPersona.paterno}"/> &nbsp; <c:out value="${datosPersona.materno}"/> &nbsp; <c:out value="${datosPersona.nombres}"/><br>
                                        <strong>PLAN:: </strong><c:out value="${datosEstudiante.id_plan}"/><br>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>PROGRAMA:: </strong><c:out value="${datosPrograma.programa}"/><br>
                                        <strong>GESTIÓN:: </strong><c:out value="${gestion}"/><br>
                                        <strong>PERIODO:: </strong><c:out value="${periodo}"/><br>
                                    </address>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label><strong>TIPO DE EVALUACION</strong></label>
                                        <select  id="id_tipo_convalidacion" name="id_tipo_convalidacion" class="form-control" required>
                                            <option value="">--Seleccione--</option>
                                            <c:forEach var="lista" items="${lTiposConvalidaciones}" >
                                                <option value='<c:out value="${lista.id_tipo_convalidacion}"/>' <c:if test="${lista.id_tipo_convalidacion ==  id_tipo_convalidacion}">selected</c:if> >
                                                    <c:out value="${lista.tipo_convalidacion}"/> 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>NIVEL</th>
                                                <th>SIGLA</th>
                                                <th>NOMBRE DE LA ASIGNATURA</th>
                                                <th>HORAS</th>
                                                <th>PRE-REQUISITO</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="id_mencion_ant" value="0"/>
                                            <c:set var="id_nivel_ant" value="0"/>
                                            <c:forEach var="lista" items="${lPlanDeEstudios}" varStatus="contador">
                                                <c:if test="${(id_mencion_ant != lista.id_mencion) && (lista.id_mencion != 0)}">
                                                    <tr>
                                                        <th colspan="5">MENCION :: <c:out value="${lista.mencion}"/></th>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${id_nivel_ant != lista.nivel_academico}">
                                                    <tr>
                                                        <td>NIVEL :: <c:out value="${lista.nivel_academico}"/></td>
                                                        <td colspan="4"></td>
                                                    </tr>
                                                </c:if>
                                                <tr>
                                                    <td></td>
                                                    <td valign="top">
                                                        <input class="form-check-input" name="id_materia_conv"   type="checkbox"  id="id_materia_con<c:out value='${lista.id_materia}'/>"  value="<c:out value='${lista.id_materia}'/>">
                                                        <label class="form-check-label" for="id_materia_con<c:out value='${lista.id_materia}'/>">
                                                            <c:out value="${lista.sigla}"/>
                                                        </label>
                                                    </td>
                                                    <td valign="top"><c:out value="${lista.materia}"/></td>
                                                    <td valign="top"><c:out value="${lista.creditos}"/></td>
                                                    <td valign="top"><c:out value="${lista.materias_anteriores}" escapeXml="false"/></td>
                                                </tr>
                                                <c:set var="id_mencion_ant" value="${lista.id_mencion}"/>
                                                <c:set var="id_nivel_ant" value="${lista.nivel_academico}"/>
                                            </c:forEach>
                                        </tbody>
                                    </table>    
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <input type='hidden' name="id_estudiante"  value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
                                    <input type='hidden' name="gestion"  value="<c:out value="${gestion}"/>" >
                                    <input type='hidden' name="periodo"  value="<c:out value="${periodo}"/>" >
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit'  value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/convalidacionManual/seleccionarprograma.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type='hidden' name="id_estudiante"  value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
                            <input type='hidden' name="gestion"  value="<c:out value="${gestion}"/>" >
                            <input type='hidden' name="periodo"  value="<c:out value="${periodo}"/>" >
                            <input type="hidden" name="id_departamento" value='<c:out value="${id_departamento}"/>'>
                            <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
                        </form>
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
        <script language="JavaScript">
            //Esto es para el calendario
            var calFormat = "<c:out value='${formatoFecha}'/>";
            //Fin para calendario
            var variables = new Array();
            h = 0;
            function fguardar()
            {
                if ((document.forma.id_plan.value != 0) && (document.forma.id_programa.value != 0) && (document.forma.nombres.value != "") && (document.forma.dip.value != "") && (document.forma.direccion.value != "") && (document.forma.fec_nacimiento.value != "") &&
                        (document.forma.id_tipo_sexo.value != "") && (document.forma.id_tipo_estado_civil.value != "") && (document.forma.id_tipo_empresa_telefonica.value != "") &&
                        (document.forma.id_tipo_institucion.value != 0) && (document.forma.id_colegio.value != 0) && (document.forma.id_tipo_turno.value != 0) &&
                        (document.forma.id_tipo_grado.value != "") && (document.forma.id_tipo_admision.value != "") && (document.forma.id_tipo_clasificacion.value != "") && (document.forma.id_tipo_estudiante.value != "") && (document.forma.anio_titulacion.value != "") && (document.forma.id_tipo_descuento.value != "")
                        )
                {
                    document.forma.submit();
                } else
                {
                    alert("Los campos con (*), son obligatorios");
                }
            }
        </script>
    </body>
</html>
