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
        <META name="_csrf" content="${_csrf.token}"/>
        <META name="_csrf_header" content="${_csrf.headerName}"/>
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>">  
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i> Administraci&oacute;n de Grupos</h1>
                    <p>Programa: <c:out value="${programa.programa}"/> Plan: <c:out value="${datosPrgPlan.id_plan}"/> Tipo Evaluacion: <c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/> Gestíon: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12"> 
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <h3 class="title">Grupos</h3>
                            <form name="forma" action='<c:url value="/grupos/nuevoRegistro.fautapo"/>' method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" id="id_dpdto_grupo" name="id_dpdto_grupo" value="">
                                <input type="hidden" name="id_programa"        value="<c:out value="${programa.id_programa}"/>">
                                <input type="hidden" name="id_prg_plan"        value="<c:out value="${id_prg_plan}"/>">
                                <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
                                <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
                                <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
                                <input type="hidden" name="id_departamento" value='<c:out value="${id_departamento}"/>'>
                                <p><a class="btn btn-primary icon-btn" href="javascript: document.forma.submit()"><i class="fa fa-plus"></i>Nuevo grupo</a></p>
                            </form>
                        </div>
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table id="tablagrupo" class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Materia</th><th>Grupo</th><th>Cupo Actual</th><th>Cupo M&aacute;ximo</th>
                                            <th>Horas</th><th>Nro. Resoluci&oacute;n</th><th>Fecha Resoluci&oacute;n</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="grupo" items="${lGrupos}" varStatus="cont">
                                            <tr>
                                                <td><c:out value="${grupo.materia}"/></td>
                                                <td><c:out value="${grupo.grupo}"/></td>
                                                <td><c:out value="${grupo.cupo_actual}"/></td>
                                                <td><c:out value="${grupo.cupo_max}"/></td>
                                                <td><c:out value="${grupo.horas}"/></td>
                                                <td><c:out value="${grupo.nro_resolucion}"/></td>
                                                <td><c:out value="${grupo.fechita}"/></td>
                                                <td>
                                                    <form name="formaeditar${cont.count}" action='<c:url value="/grupos/modificaRegistro.fautapo"/>' method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                        <input type="hidden"  name="id_dpto_grupo" value="${grupo.id_dpto_grupo}">
                                                        <input type="hidden" name="id_programa"        value="<c:out value="${programa.id_programa}"/>">
                                                        <input type="hidden" name="id_prg_plan"        value="<c:out value="${id_prg_plan}"/>">
                                                        <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
                                                        <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
                                                        <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
                                                        <input type="hidden" name="id_departamento" value='<c:out value="${id_departamento}"/>'>
                                                    </form>
                                                    <form name="formaeliminar${cont.count}" action='<c:url value="/grupos/confirmarBorrado.fautapo"/>' method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                        <input type="hidden"  name="id_dpto_grupo" value="${grupo.id_dpto_grupo}">
                                                        <input type="hidden" name="id_programa"        value="<c:out value="${programa.id_programa}"/>">
                                                        <input type="hidden" name="id_prg_plan"        value="<c:out value="${id_prg_plan}"/>">
                                                        <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
                                                        <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
                                                        <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
                                                        <input type="hidden" name="id_departamento" value='<c:out value="${id_departamento}"/>'>
                                                    </form>
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            Operacion
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="javascript: document.formaeditar${cont.count}.submit()">Modificar</a>
                                                            <a class="dropdown-item" href="javascript: document.formaeliminar${cont.count}.submit()">Eliminar</a>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-menu"></div>
                                                </td>
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
    </form>
    <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
    <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/main.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
    <script type="text/javascript">$('#tablagrupo').DataTable();</script>
</body>
</html>