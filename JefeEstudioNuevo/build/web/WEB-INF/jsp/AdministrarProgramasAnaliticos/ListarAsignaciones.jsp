<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableResponsive.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/CardProfile.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>">
    </head>
    <body class="app sidebar-mini rtl">
        <c:if test="${!empty id_rol}">
            <main class="app-content3">
                <div class="app-title">
                    <div>
                        <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                        <p>Lista de materias para elaborar programa analitico ${periodo}/${gestion} </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;Administrar Libretas</span>
                            <div id="no-more-tables">      
                                <c:if test="${ empty datosAsignacion}">
                                    <div class="Card-Informacion">
                                        <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                            <div class="card-header"><i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;AVISO !!</div>
                                            <div class="card-body text-secondary"> 
                                                <p class="card-text"> 
                                                    No existen materias asignadas para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/>                                    
                                                </p>
                                            </div>
                                        </div>
                                    </div> 
                                </c:if>
                                <c:if test="${ !empty datosAsignacion}">
                                    <table class="col-md-12 table-bordered table-striped table-condensed cf">
                                        <thead class="cf">
                                            <tr>
                                                <th>FASE</th>
                                                <th>EVALUACION</th>
                                                <th>CARRERA/PROGRAMA</th>
                                                <th>GRUPO</th>
                                                <th>SIGLA</th>
                                                <th>MATERIA</th>
                                                <th>PLAN DE ESTUDIO</th>
                                                <th>ADMINISTRACION</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="asignacion" items="${datosAsignacion}" varStatus="contador">
                                                <!-- ********** Esto es para el efecto ************ -->
                                                <tr>
                                                    <!-- ********** Fin  efecto ************ --> 
                                                    <td data-title="FASE">
                                                        <c:out value="${asignacion.fase}"/>
                                                    </td>
                                                    <td data-title="EVALUACION">
                                                        <c:out value="${asignacion.tipo_evaluacion}"/>
                                                    </td>
                                                    <td data-title="CARRERA/PROGRAMA">
                                                        <c:out value="${asignacion.programa}"/>
                                                    </td>
                                                    <td data-title="GRUPO">
                                                        <c:out value="${asignacion.grupo}"/>
                                                    </td>
                                                    <td data-title="SIGLA">
                                                        <c:out value="${asignacion.sigla}"/>
                                                    </td>
                                                    <td data-title="MATERIA">
                                                        <c:out value="${asignacion.materia}"/>
                                                    </td>
                                                    <td data-title="PLAN">
                                                        <c:out value="${asignacion.id_plan}"/>
                                                    </td>

                                                    <td data-title="ACCION">
                                                        <a class="btn btn-primary" href='javascript:document.formaEvaluaciones${contador.count}.submit();'> <i class="fas fa-cog"></i></a>
                                                        <a class="btn btn-primary" href='javascript:document.formaimprimir${contador.count}.submit();'>  <i class="fas fa-file-pdf"></i></a>
                                                        <form name='formaEvaluaciones<c:out value="${contador.count}"/>' method='post' action="<c:url value='InicioElaboracionProgramaAnalitico.fautapo'/>">
                                                            <input type=hidden name="id_asignacion"      value="<c:out value="${asignacion.id_asignacion}"/>"> 
                                                            <input type=hidden name="id_materia"         value="<c:out value="${asignacion.id_materia}"/>"> 
                                                            <input type=hidden name="materia"            value="<c:out value="${asignacion.materia}"/>">
                                                            <input type=hidden name="id_grupo"           value="<c:out value="${asignacion.id_grupo}"/>">
                                                            <input type=hidden name="grupo"              value="<c:out value="${asignacion.grupo}"/>">    
                                                            <input type=hidden name="id_programa"        value="<c:out value="${asignacion.id_programa}"/>">
                                                            <input type=hidden name="id_fase"            value="<c:out value="${asignacion.id_fase}"/>">
                                                            <input type=hidden name="id_tipo_evaluacion" value="<c:out value="${asignacion.id_tipo_evaluacion}"/>">
                                                            <input type=hidden name="tipo_evaluacion"    value="<c:out value="${asignacion.tipo_evaluacion}"/>">
                                                            <input type=hidden name="gestion"            value="<c:out value="${gestion}"/>">
                                                            <input type=hidden name="periodo"            value="<c:out value="${periodo}"/>">
                                                            <input type=hidden name="id_docente"         value="<c:out value="${asignacion.id_docente}"/>">
                                                            <input type=hidden name="id_plan"   value="<c:out value="${asignacion.id_plan}"/>">
                                                            <input type=hidden name="id_departamento"    value="<c:out value="${asignacion.id_departamento}"/>">
                                                            <input type=hidden name="id_mencion"    value="<c:out value="${asignacion.id_mencion}"/>">

                                                        </form>
                                                        <form name='formaimprimir<c:out value="${contador.count}"/>' method='post' action="<c:url value='InicioElaboracionProgramaAnalitico.fautapo'/>">
                                                            <input type=hidden name="id_asignacion"      value="<c:out value="${asignacion.id_asignacion}"/>"> 
                                                            <input type=hidden name="id_materia"         value="<c:out value="${asignacion.id_materia}"/>"> 
                                                            <input type=hidden name="materia"            value="<c:out value="${asignacion.materia}"/>">
                                                            <input type=hidden name="id_grupo"           value="<c:out value="${asignacion.id_grupo}"/>">
                                                            <input type=hidden name="grupo"              value="<c:out value="${asignacion.grupo}"/>">    
                                                            <input type=hidden name="id_programa"        value="<c:out value="${asignacion.id_programa}"/>">
                                                            <input type=hidden name="id_fase"            value="<c:out value="${asignacion.id_fase}"/>">
                                                            <input type=hidden name="id_tipo_evaluacion" value="<c:out value="${asignacion.id_tipo_evaluacion}"/>">
                                                            <input type=hidden name="tipo_evaluacion"    value="<c:out value="${asignacion.tipo_evaluacion}"/>">
                                                            <input type=hidden name="gestion"            value="<c:out value="${gestion}"/>">
                                                            <input type=hidden name="periodo"            value="<c:out value="${periodo}"/>">
                                                            <input type=hidden name="id_docente"         value="<c:out value="${asignacion.id_docente}"/>">
                                                            <input type=hidden name="id_plan"   value="<c:out value="${asignacion.id_plan}"/>">
                                                            <input type=hidden name="id_departamento"    value="<c:out value="${asignacion.id_departamento}"/>">
                                                            <input type=hidden name="id_mencion"    value="<c:out value="${asignacion.id_mencion}"/>">
                                                        </form>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </c:if>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    </body>
</html>