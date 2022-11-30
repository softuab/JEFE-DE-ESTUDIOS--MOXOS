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
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp;Listar Asignaci&oacute;n Docente</h1>
                    <p>Docente:: <c:out value="${datosDocente.nombre_completo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <h3 class="title">Listar Asignaci&oacute;n Docente</h3>
                            <input type="hidden" name="id_docente" value='<c:out value="${datos.id_docente}"/>' >
                        </div>
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table id="tablaMateria" class="table table-hover table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nro.</th>
                                            <th>GESTION</th>
                                            <th>PERIODO</th>
                                            <th>CARRERA</th>
                                            <th>SIGLA</th>
                                            <th>MATERIA</th>
                                            <th>GRUPO</th>
                                            <th>CARGA HORARIA SEMANAL</th>
                                            <th>NRO. RESOLUCION</th>	
                                            <th>TIPO DE DOCENTE</th>
                                            <th>DEDICACION</th>
                                            <th>TIPO DE EVALUACION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="datos" items="${lAsignaciones}" varStatus="contador">
                                            <!-- ********** Esto es para el efecto ************ -->
                                            <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> >

                                                    <td><c:out value="${contador.count}"/></td>
                                                <td><c:out value="${datos.gestion}"/></td>
                                                <td><c:out value="${datos.periodo}"/></td>
                                                <td><c:out value="${datos.departamento}"/></td>
                                                <td><c:out value="${datos.sigla}"/></td>
                                                <td><c:out value="${datos.materia}"/></td>
                                                <td><c:out value="${datos.grupo}"/></td>
                                                <td><c:out value="${datos.total_horas}"/></td>
                                                <td><c:out value="${datos.nro_resolucionhcu}"/></td>




                                                <td><c:out value="${datos.tipo_docente}"/></td>
                                                <td><c:out value="${datos.tipo_asignacion}"/></td>
                                                <td><c:out value="${datos.tipo_evaluacion}"/></td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
        <script type="text/javascript">$('#tablaMateria').DataTable();</script>
    </body>
</html>