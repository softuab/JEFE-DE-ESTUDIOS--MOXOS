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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Adm. Est Materias Optativas</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <div class="row">
                                <div class="col">
                                    <form name="forma" id="forma" method='post' action="<c:url value='/nuevoRegistroMateriaOptativa.fautapo'/>">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                                        <input type="hidden" name="id_programa" value="${id_programa}" />
                                        <input type="hidden" name="id_plan" value="${id_plan}" />
                                        <input type="hidden" name="id_prg_plan" value="${id_prg_plan}" />
                                        <input type="hidden" name="id_materia" value="${id_materia}"/>
                                        <p><a class="btn btn-primary icon-btn" href="javascript: document.forma.submit()"><i class="fa fa-plus"></i>Nuevo</a></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tile-body">
                            <form method="post" action="<c:url value='/listarOptativas.fautapo'/>" name ="formularioTodo" class="row form-horizontal">
                                <input type="hidden" name="id_programa" value="${id_programa}" />
                                <input type="hidden" name="_condicion" value="todo" />
                                <input type="hidden" name="id_plan" value="${id_plan}-${id_prg_plan}" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                            </form>
                            <form method="post" action="<c:url value='/listarOptativas.fautapo'/>" name="formulario" class="row form-horizontal">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                                <input type="hidden" name="id_programa" value="${id_programa}" />
                                <input type="hidden" name="id_plan" value="${id_plan}-${id_prg_plan}" />
                                <div class="form-group col-md-3">
                                    <label class="control-label">Filtro ::</label>
                                    <select class="form-control" name="_campo">
                                        <c:forEach var="nombresCampos" items="${listaNombresCampos}">
                                            <option value="<c:out value='${nombresCampos.id}'/>" <c:if test='${nombresCampos.id == campo}'>selected="selected"</c:if> ><c:out value="${nombresCampos.value}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Condicion ::</label>
                                    <select class="form-control" name='_condicion'>
                                        <c:forEach var="nombrescondiciones" items="${listarCondiciones}">
                                            <option value="<c:out value='${nombrescondiciones.id}'/>" <c:if test='${nombrescondiciones.id == condicion}'>selected="selected"</c:if> ><c:out value="${nombrescondiciones.value}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Buscar ::</label>
                                    <input class="form-control" type="text" name="_filtro" value="<c:out value='${filtro}'/>" />
                                </div>
                                <div class="form-group col-md-3 align-self-end">
                                    <a href="javascript: document.formulario.submit();" class="btn btn-primary"><i class="fa fa-filter"></i>Filtrar </a>
                                    <a href="javascript: document.formularioTodo.submit();" class="btn btn-primary"><i class="fa fa-border"></i>Todo </a>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col table-responsive">
                                    <table id="tablagrupo" class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>R.U.</th> 
                                                <th>NOMBRE COMPLETO</th>
                                                <th>CARRERA</th>
                                                <th>PLAN</th>
                                                <th>MATERIA</th>
                                                <th>OPERACION</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="lista" items="${listaRegistros}" varStatus="contador">
                                                <tr>
                                                    <td> <c:out value='${lista.id_estudiante}' /></td>
                                                    <td> <c:out value='${lista.nombres}' /></td>
                                                    <td> <c:out value='${lista.programa}' /></td>
                                                    <td> <c:out value='${lista.id_plan}' /></td>
                                                    <td> <c:out value='${lista.materia}' /></td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Operacion
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                                <form name="formedit${contador.count}" id="formedit${contador.count}" method='post' action="<c:url value='/editarRegistroMateriaOptativa.fautapo'/>">
                                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                                                                    <input type="hidden" name="id_estudiante" value="${lista.id_estudiante}" />
                                                                    <input type="hidden" name="id_programa" value="${lista.id_programa}" />
                                                                    <input type="hidden" name="id_prg_plan" value="${id_prg_plan}" />
                                                                    <input type="hidden" name="id_plan" value="${lista.id_plan}" />
                                                                    <input type="hidden" name="id_est_materiaoptativa" value="${lista.id_est_materiaoptativa}" />
                                                                    <input type="hidden" name="nombre_estudiante" value="${lista.nombres}" />
                                                                    <input type="hidden" name="id_materia" value="${lista.id_materia}" />
                                                                </form>
                                                                <a class="dropdown-item" href="javascript: document.formedit${contador.count}.submit()">Modificar</a>
                                                                <a class="dropdown-item delete" href="#" data-csrf="${_csrf.token}"
                                                                   data-id_est_materiaoptativa="${lista.id_est_materiaoptativa}"
                                                                   data-url="${pageContext.request.contextPath}/AjaxEliminarMateriaOptativa.fautapo"
                                                                   >Eliminar</a>
                                                            </div>
                                                        </div>
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
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/sweetalert.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/app/electiva/eliminar.js'/>" type="module"></script>
        <script type="text/javascript"> $('#tablagrupo').DataTable();</script>
    </body>
</html>


