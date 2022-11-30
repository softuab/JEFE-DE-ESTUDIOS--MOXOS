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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;<c:out value="${tabla.etiqueta}" /></h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <div class="row">
                                <div class="col">
                                    <form name="forma" id="forma" method='post' action="<c:url value='/dibRap/nuevoRegistro.fautapo'/>">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                        <input type="hidden" name="t" value="<c:out value='${tabla.id_tabla}' />" />
                                        <input type="hidden" name="e" value="<c:out value='${id_enlace}' />" />
                                        <input type="hidden" name="c" value="" id="c" />
                                        <input type="hidden" name="p" value="<c:out value='${permiso}' />" />
                                        <input type="hidden" name="_f" value="<c:out value='${tabla.condicion}' />" />
                                        <input type="hidden" name="a" value="<c:out value='${id_actividad}' />" />
                                        <input type="hidden" name="n" value="1" />
                                        <input type="hidden" name="_botoncillo" value="" />
                                        <input type="hidden" name="_order" value="<c:out value='${tabla.campo}' />" />
                                        <input type="hidden" name="_order_ant" value="" />
                                        <p><a class="btn btn-primary icon-btn" href="javascript: document.forma.submit()"><i class="fa fa-plus"></i>Nuevo</a></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tile-body"> 
                            <form class="row form-horizontal" name="formulario">
                                <input type="hidden" name="t" value="<c:out value='${tabla.id_tabla}' />" />
                                <input type="hidden" name="e" value="<c:out value='${id_enlace}' />" />
                                <input type="hidden" name="c" value="" id="c" />
                                <input type="hidden" name="p" value="<c:out value='${permiso}' />" />
                                <input type="hidden" name="_f" value="<c:out value='${tabla.condicion}' />" />
                                <input type="hidden" name="a" value="<c:out value='${id_actividad}' />" />
                                <input type="hidden" name="n" value="1" />
                                <input type="hidden" name="_botoncillo" value="" />
                                <input type="hidden" name="_order" value="<c:out value='${tabla.campo}' />" />
                                <input type="hidden" name="_order_ant" value="" />
                                <div class="form-group col-md-3">
                                    <label class="control-label">Filtro ::</label>
                                    <select class="form-control" name="_campo">
                                        <c:forEach var="nombresCampos" items="${listaNombresCampos}">
                                            <option value="<c:out value='${nombresCampos.campo}'/>" <c:if test='${nombresCampos.campo == campo}'>selected="selected"</c:if> ><c:out value="${nombresCampos.etiqueta}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Condición ::</label>
                                    <select class="form-control" name='_condicion'>
                                        <optgroup label="Similitud">
                                            <option value=" like " <c:if test='${condicion == " like "}'>selected="selected"</c:if> >incluye</option>
                                            </optgroup>
                                            <optgroup label="Simples">
                                                <option value=" = " <c:if test='${condicion == " = "}'>selected="selected"</c:if> >=</option>
                                            <option value=" > " <c:if test='${condicion == " > "}'>selected="selected"</c:if> >&gt;</option>
                                            <option value=" < " <c:if test='${condicion == " < "}'>selected="selected"</c:if> >&lt;</option>
                                            </optgroup>
                                            <optgroup label="Combinaciones">
                                                <option value=" >= " <c:if test='${condicion == " >= "}'>selected="selected"</c:if> >&gt;=</option>
                                            <option value=" <= " <c:if test='${condicion == " <= "}'>selected="selected"</c:if> >&lt;=</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label class="control-label">Buscar ::</label>
                                        <input class="form-control" type="text" name="_filtro" value="<c:out value='${filtro}'/>" />
                                </div>
                                <div class="form-group col-md-3 align-self-end">
                                    <a href="#" class="btn btn-primary" onClick="javascript: document.formulario.action = ''; document.formulario._botoncillo.value = 'filtro'; document.formulario.submit();"><i class="fa fa-filter"></i>Filtrar </a>
                                    <a href="#" class="btn btn-primary" onClick="javascript: document.formulario.action = ''; document.formulario._botoncillo.value = 'todo'; document.formulario.submit();"><i class="fa fa-border"></i>Todo </a>
                                </div>
                            </form> 
                            <div class="row">
                                <div class="col">
                                    <form name="formulariosiguiente">
                                        <input type="hidden" name="t" value="<c:out value='${tabla.id_tabla}' />" />
                                        <input type="hidden" name="e" value="<c:out value='${id_enlace}' />" />
                                        <input type="hidden" name="c" value="" id="c" />
                                        <input type="hidden" name="p" value="<c:out value='${permiso}' />" />
                                        <input type="hidden" name="_f" value="<c:out value='${tabla.condicion}' />" />
                                        <input type="hidden" name="a" value="<c:out value='${id_actividad}' />" />
                                        <input type="hidden" name="n" value="1" />
                                        <input type="hidden" name="_botoncillo" value="" />
                                        <input type="hidden" name="_order" value="<c:out value='${tabla.campo}' />" />
                                        <input type="hidden" name="_order_ant" value="" />
                                        <div class="bs-component">
                                            <ul class="pagination">
                                                <c:if test='${tabla.pagina > 1}'>
                                                    <li class="page-item"> <a  class="page-link" href="#" OnClick="javascript: document.formulariosiguiente.action = ''; document.formulariosiguiente._botoncillo.value = 'principio'; document.formulariosiguiente.n.value = '1'; document.formulariosiguiente.submit();">&laquo; Principio</a></li>
                                                    <li class="page-item"> <a  class="page-link" href="#" OnClick="javascript: document.formulariosiguiente.action = ''; document.formulariosiguiente._botoncillo.value = 'anterior'; document.formulariosiguiente.n.value = '<c:out value="${tabla.pagina - 1}"/>'; document.formulariosiguiente.submit();">&lsaquo; Anterior</a></li>
                                                    </c:if>
                                                <li class="page-item disabled"><a class="page-link" href="#"><c:out value="${(paginacion * (tabla.pagina - 1)) + 1}"/> - <c:out value="${(paginacion * (tabla.pagina - 1)) + fn:length(listaRegistros)}"/> de <c:out value="${totalRegistros}"/></a></li>
                                                    <c:if test='${tabla.pagina < totalPaginas}'>
                                                    <li class="page-item"> <a  class="page-link" href="#" OnClick="javascript: document.formulariosiguiente.action = ''; document.formulariosiguiente._botoncillo.value = 'siguiente'; document.formulariosiguiente.n.value = '<c:out value="${tabla.pagina + 1}"/>'; document.formulariosiguiente.submit();">Siguiente</a></li>
                                                    <li class="page-item"> <a  class="page-link" href="#" OnClick="javascript: document.formulariosiguiente.action = ''; document.formulariosiguiente._botoncillo.value = 'final'; document.formulariosiguiente.n.value = '<c:out value="${totalPaginas}"/>'; document.formulariosiguiente.submit();">Final</a></li>
                                                    </c:if>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col table-responsive">
                                    <table id="tablagrupo" class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <c:forEach var="campos" items="${listaNombresCampos}" varStatus="contador1">
                                                    <th>
                                                        <c:out value="${campos.etiqueta}"/>
                                                    </th>
                                                </c:forEach>
                                                <c:if test='${fn:indexOf(permiso, "m") > -1}'>
                                                    <th>MODIFICAR</th>
                                                    </c:if>
                                                    <c:if test='${fn:indexOf(permiso, "b") > -1}'>
                                                    <th>ELIMINAR</th>
                                                    </c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="lista" items="${listaRegistros}" varStatus="contador">
                                                <tr>
                                                    <c:forEach begin="0" end="${nro_campos - 1}" var="i">
                                                        <td><c:out value='${matrizDatos[contador.index][i]}' escapeXml="false"/></td>
                                                    </c:forEach>
                                                    <c:if test='${fn:indexOf(permiso, "m") > -1}'>
                                                        <td>
                                                            <a class="btn btn-primary" href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action = '<c:url value="/dibRap/modificaRegistro.fautapo"/>';
                                                                    document.forma.c.value = '<c:out value="${listaValoresPrimarios[contador.index].valores}"/>'">Modificar</a>
                                                        </td>
                                                    </c:if>
                                                    <c:if test='${fn:indexOf(permiso, "b") > -1}'>
                                                        <td>
                                                            <a class="btn btn-danger" href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action = '<c:url value="/dibRap/confirmarBorrado.fautapo"/>';
                                                                    document.forma.c.value = '<c:out value="${listaValoresPrimarios[contador.index].valores}"/>'">Eliminar</a>
                                                        </td>
                                                    </c:if>
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
        <script type="text/javascript">$('#tablagrupo').DataTable();</script>
    </body>
</html>
