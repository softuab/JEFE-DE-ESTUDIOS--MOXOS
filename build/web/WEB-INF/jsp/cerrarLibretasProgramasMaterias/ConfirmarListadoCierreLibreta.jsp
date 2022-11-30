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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Lista de Estudiantes en Libretas para el Cierre</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <section class="invoice">
                            <div class="row invoice-info">
                                <div class="col">
                                    <address>
                                        <strong>Materia:</strong> <c:out value="${datosAsignacion.materia}"/><br>
                                        <strong>Gestión:</strong> <c:out value="${gestion}"/><br>
                                        <strong>Periodo:</strong> <c:out value="${periodo}"/><br>
                                        <strong>Tipo Evaluación:</strong>  <c:out value="${datosTipoEval.tipo_evaluacion}"/><br>
                                        <strong>Docente: </strong> <c:out value="${nombresDocente}"/><br>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nro</th>
                                                <th>R.U.</th>
                                                <th>Nombres</th>
                                                <th>Nro de Matricula</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty lEstudiantesParaCierre}">
                                                <tr>
                                                    <td colspan="4" class="text-center">
                                                        No existen estudiantes para el cierre de libreta
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:if test="${!empty lEstudiantesParaCierre}">
                                                <c:forEach var="lista" items="${lEstudiantesParaCierre}" varStatus="contador">
                                                    <tr>
                                                        <td><c:out value="${contador.count}"/></td>
                                                        <td><c:out value="${lista.id_estudiante}"/></td>
                                                        <td>
                                                            <c:out value="${lista.nombres}"/>
                                                            <c:if test="${lista.nombres == ''}">
                                                                <span class="text-danger"> No esta habilitado como estudiante </span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${lista.id_matricula != 0}">
                                                                <c:out value="${lista.id_matricula}"/>
                                                            </c:if>
                                                            <c:if test="${lista.id_matricula == 0}">
                                                                <span class="text-danger"> No Matriculado </span>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text">
                                    <a class="btn btn-primary" href="javascript:document.forma.submit();"><i class="fa fa-check"></i> Aceptar</a>      
                                    <a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i> Cancelar</a>
                                    <form name="forma" action="<c:url value='/cerrarLibretasProgramasMaterias/registrarCerrarLibreta.fautapo'/>" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id_asignacion"        value="<c:out value='${datosAsignacion.id_asignacion}'/>">
                                        <input type="hidden" name="gestion"              value="<c:out value='${gestion}'/>">
                                        <input type="hidden" name="periodo"              value="<c:out value='${periodo}'/>">
                                        <input type="hidden" name="id_materia"           value="<c:out value='${datosAsignacion.id_materia}'/>">	  
                                        <input type="hidden" name="id_modelo_ahorro"     value="<c:out value='${datosAsignacion.id_modelo_ahorro}'/>">	  
                                        <input type="hidden" name="id_grupo"             value="<c:out value='${datosAsignacion.id_grupo}'/>">	  
                                        <input type="hidden" name="id_docente"           value="<c:out value='${datosAsignacion.id_docente}'/>">	  
                                        <input type="hidden" name="id_fase"              value="<c:out value='${datosAsignacion.id_fase}'/>">	  
                                        <input type="hidden" name="id_tipo_evaluacion"   value="<c:out value='${datosAsignacion.id_tipo_evaluacion}'/>">	  	  
                                        <input type="hidden" name="id_departamento"      value="<c:out value='${datosAsignacion.id_departamento}'/>">                                  
                                    </form>
                                    <form  method=post id="frmsalir" action="${pageContext.request.contextPath}/cerrarLibretasProgramasMateriasVolver/listarMateriasProgramaPlan.fautapo">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id_programa"   value="<c:out value='${programa.id_programa}'/>">
                                        <input type="hidden" name="id_prg_plan"   value="<c:out value='${id_prg_plan}'/>">
                                        <input type="hidden" name="gestion"       value="<c:out value='${gestion}'/>">
                                        <input type="hidden" name="periodo"       value="<c:out value='${periodo}'/>">	  
                                        <input type="hidden" name="id_tipo_evaluacion"   value="<c:out value='${datosAsignacion.id_tipo_evaluacion}'/>">
                                        <input type="hidden" name="id_plan"   value="<c:out value='${datosPrgPlan.id_plan}'/>">
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
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>