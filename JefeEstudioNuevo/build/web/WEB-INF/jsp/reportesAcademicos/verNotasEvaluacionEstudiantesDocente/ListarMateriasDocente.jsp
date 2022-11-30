<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
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
    <body  class="app sidebar-mini rtl">
        <c:if test="${!empty id_rol}">
            <main class="app-content3">
                <div class="app-title">
                    <div>
                        <h1><i class="far fa-address-card"></i>&nbsp; ${usuario}</h1>
                        <p>Lista de reporte notas evaluacion Estudiantes - Docente ${periodo}/${gestion} </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <c:if test="${ empty lDatosAsignacion}">
                                <div class="Card-Informacion">
                                    <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                        <div class="card-header"><i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;AVISO !!</div>
                                        <div class="card-body text-secondary"> 
                                            <p class="card-text"> 
                                                No existen materias asignadas para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/><br/>
                                            </p>
                                        </div>
                                    </div>
                                </div>    
                            </c:if>
                            <c:if test="${ !empty lDatosAsignacion}">
                                <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;Materias asignadas</span>
                                <div id="no-more-tables"> 
                                    <table class="col-md-12 table-bordered table-striped table-condensed cf">
                                        <thead class="cf">
                                            <tr>
                                                <th class="text-center">FASE</th>
                                                <th class="text-center">EVALUACI&Oacute;N</th>
                                                <th class="text-center">CARRERA/PROGRAMA</th>
                                                <th class="text-center">GRUPO</th>
                                                <th class="text-center">SIGLA</th>
                                                <th class="text-center">MATERIA</th>
                                                <th class="text-center">MATERIA AHORRO</th>
                                                <th class="text-center">IMPRIMIR</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="asignacion" items="${lDatosAsignacion}" varStatus="contador">
                                                <!-- ********** Esto es para el efecto ************ -->
                                                <tr>
                                                    <!-- ********** Fin  efecto ************ --> 
                                                    <td  data-title="FASE">
                                                        <c:out value="${asignacion.fase}"/>
                                                    </td>
                                                    <td  data-title="EVALUACIÓN">
                                                        <c:out value="${asignacion.tipo_evaluacion}"/>
                                                    </td>
                                                    <td  data-title="CARRERA/PROGRAMA">
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
                                                    <c:if test="${asignacion.id_modelo_ahorro <= 0}">
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
                                                    <td data-title="IMPRIMIR" class="text-center"> 
                                                        <form name='forma<c:out value="${contador.count}"/>' method="GET" action="<c:url value='/docente/imprimirEvaluacionEstudiantes.fautapo'/>">

                                                            <a class="btn btn-primary" href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'><i class="fas fa-print"></i> </a>
                                                            <input type="hidden" name="nombres"          value="<c:out value='${usuario}'/>">
                                                            <input type=hidden name="id_asignacion"      value="<c:out value="${asignacion.id_asignacion}"/>"> 
                                                            <input type=hidden name="id_materia"         value="<c:out value="${asignacion.id_materia}"/>"> 
                                                            <input type=hidden name="materia"            value="<c:out value="${asignacion.materia}"/>">
                                                            <input type=hidden name="sigla"              value="<c:out value="${asignacion.sigla}"/>">
                                                            <input type=hidden name="id_grupo"           value="<c:out value="${asignacion.id_grupo}"/>">
                                                            <input type=hidden name="grupo"              value="<c:out value="${asignacion.grupo}"/>">    
                                                            <input type=hidden name="id_programa"        value="<c:out value="${asignacion.id_programa}"/>">
                                                            <input type=hidden name="programa"           value="<c:out value="${asignacion.programa}"/>">
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
                                                        </form> 
                                                    </td>

                                                </tr>

                                            </c:forEach>
                                        </tbody>
                                    </table> 
                                </div>
                            </c:if>
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