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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Inscripci&oacute;n de materias</h1>
                    <p>Gestión:<c:out value='${gestion}'/> Periodo: <c:out value='${periodo}'/> Programa: <c:out value='${datosPrograma.programa}'/> Tipo Evaluación: <c:out value='${datosTipoEval.tipo_evaluacion}'/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="table-responsive">
                            <table id="tablagrupo" class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>RU</th>
                                        <th>DIP</th>
                                        <th>NOMBRES</th>
                                        <th>PROGRAMA</th> 
                                        <th>VER</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
                                        <tr>
                                            <td><c:out value="${datos.id_estudiante}"/></td>
                                            <td><c:out value="${datos.dip}"/></td>        
                                            <td><c:out value="${datos.paterno}"/>&nbsp;<c:out value="${datos.materno}"/> &nbsp;<c:out value="${datos.nombres}"/></td>
                                            <td><c:out value="${datos.programa}"/></td>
                                            <td>
                                                <a class="btn btn-primary" href="javascript: document.forma<c:out value="${contador.count}"/>.submit()">Ver datos</a>
                                                <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/retiroAdicionMateriasJefe/listarAccionProgramacionMaterias.fautapo"/>'>  
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <input type="hidden" name="id_periodo"           value="<c:out value="${id_periodo}"/>"/>
                                                    <input type="hidden" name="id_estudiante"        value="<c:out value="${datos.id_estudiante}"/>"/> 
                                                    <input type=hidden   name="gestion"              value='<c:out value="${gestion}"/>' >
                                                    <input type=hidden   name="periodo"              value='<c:out value="${periodo}"/>' >
                                                    <input type=hidden   name="id_programa"          value='<c:out value="${id_programa}"/>' >
                                                    <input type="hidden" name="id_tipo_programacion" value="<c:out value='${id_tipo_programacion}'/>"> 
                                                    <input type="hidden" name="id_tipo_evaluacion"   value="<c:out value='${id_tipo_evaluacion}'/>"> 
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
    </body>
</html>
