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
                        <p>Lista de designaciones de materias por el periodo ${periodo}/ ${gestion} para creacion de cursos virtuales</p>
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
                                                <th>EVALUACION</th>
                                                <th>CARRERA/PROGRAMA</th>
                                                <th>GRUPO</th>
                                                <th>SIGLA</th>
                                                <th>MATERIA</th>
                                                <th>MATERIA AHORRO</th>
                                                <th>ADMINISTRACION</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="asignacion" items="${datosAsignacion}" varStatus="contador">
                                                <!-- ********** Esto es para el efecto ************ -->

                                                <c:if test="${asignacion.id_tipo_evaluacion == 1}">

                                                    <tr> 
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
                                                        <c:if test="${asignacion.id_modelo_ahorro < 0}">
                                                            <td data-title="MATERIA AHORRO">
                                                                ---
                                                            </td>
                                                        </c:if>    
                                                        <c:if test="${asignacion.id_modelo_ahorro > 0}">
                                                            <c:forEach var="asignacionahorro" items="${asignacion.materia_ahorro}">
                                                                <td data-title="MATERIA AHORRO">
                                                                    <c:out value="${asignacionahorro.modelo_ahorro}"/>
                                                                </td>
                                                            </c:forEach>
                                                        </c:if> 
                                                        <td data-title="ACCION">
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    <font  size="1" >Administracion</font>
                                                                </button>
                                                                <div class="dropdown-menu dropdown-menu-right">
                                                                    <form name='formalistamoodle${contador.count}' method='post' action="<c:url value='/ListarCursosMoodle.fautapo'/>">
                                                                        <a class="dropdown-item" href='javascript:document.formalistamoodle${contador.count}.submit();'>Crear Aula virtual</a>
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
                                                                        <input type=hidden name="programa"   value="<c:out value="${asignacion.programa}"/>">
                                                                        <input type=hidden name="sigla"    value="<c:out value="${asignacion.sigla}"/>"> 
                                                                        <input type=hidden name="fase"    value="<c:out value="${asignacion.fase}"/>">
                                                                        <c:forEach var="asignacionahorro" items="${asignacion.materia_ahorro}">
                                                                            <input type=hidden name="modelo_ahorro"      value="<c:out value="${asignacionahorro.modelo_ahorro}"/>">
                                                                        </c:forEach>  
                                                                        <input type=hidden name="id_tipo_grado"      value="<c:out value="${asignacion.id_tipo_grado}"/>">
                                                                    </form>
                                                                    <div class="dropdown-divider"></div>
                                                                    <form name='formaLibretas<c:out value="${contador.count}"/>' method='post' action='<c:url value="/AdministrarCursosListarAlumnosProgramados.fautapo"/>'>
                                                                        <a class="dropdown-item" href='javascript:document.formaLibretas<c:out value="${contador.count}"/>.submit();'>Matricular Estudiante</a>
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
                                                                        <input type=hidden name="id_modelo_ahorro"   value="<c:out value="${asignacion.id_modelo_ahorro}"/>">
                                                                        <input type=hidden name="id_departamento"    value="<c:out value="${asignacion.id_departamento}"/>">	    
                                                                        <c:forEach var="asignacionahorro" items="${asignacion.materia_ahorro}">
                                                                            <input type=hidden name="modelo_ahorro"      value="<c:out value="${asignacionahorro.modelo_ahorro}"/>">
                                                                        </c:forEach>  
                                                                        <input type=hidden name="id_tipo_grado"      value="<c:out value="${asignacion.id_tipo_grado}"/>">
                                                                        <input type=hidden name="avanzado"            value="<c:out value="${avanzado}"/>">
                                                                    </form>
                                                                    <div class="dropdown-divider"></div>
                                                                    <form name='formamatricula<c:out value="${contador.count}"/>' method='post' action='<c:url value="/ListarEstudiantesMatriculados.fautapo"/>'>
                                                                        <a class="dropdown-item" href='javascript:document.formamatricula<c:out value="${contador.count}"/>.submit();'>Matriculados</a>
                                                                        <input type="hidden" name="fase"      value="<c:out value="${asignacion.fase}"/>"> 
                                                                        <input type="hidden" name="nombres"      value="<c:out value="${nombres}"/>"> 
                                                                        <input type="hidden" name="programa"      value="<c:out value="${asignacion.programa}"/>"> 
                                                                        <input type="hidden" name="periodo"      value="<c:out value="${periodo}"/>">    
                                                                        <input type="hidden" name="gestion"     value="<c:out value="${gestion}"/>">
                                                                        <input type="hidden" name="id_programa"        value="<c:out value="${asignacion.id_programa}"/>">
                                                                        <input type="hidden" name="id_grupo"      value="<c:out value="${asignacion.id_grupo}"/>">
                                                                        <input type="hidden" name="id_materia"      value="<c:out value="${asignacion.id_materia}"/>">
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </td> 
                                                    </tr> 
                                                </c:if>
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