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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Registrar Mencion</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <c:if test="${!empty error}">
                            <div class="row">
                                <div class="col">
                                    <div class="alert alert-danger" role="alert">
                                        <ol>
                                            <c:forEach var="error" items="${error}" varStatus="cont">
                                                <li>${error}</li>
                                                </c:forEach>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </c:if>                                                                                                                   
                        <form:form modelAttribute="formulario" cssClass="form-horizontal" method="post" action="${pageContext.request.contextPath}/RegistrarMencionEstudiante.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                            <input type="hidden" id="id_programa" name="id_programa" value="${id_programa}" />
                            <form:hidden path="id_estudiante"/>
                            <form:hidden path="nombre_estudiante"/>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Estudiante Universitario ::</label>
                                <div class="col-md-9">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <span  id="nombreestudiante">${formulario.nombre_estudiante}</span><br/>
                                            <form:errors path="id_estudiante" cssClass="invalid"></form:errors>
                                            </div>
                                            <div class="col-md-4">
                                                <button class="btn btn-primary w-100"  type='button' onclick="abrirbuscador();"><i class="fa fa-fw fa-lg fa-search"></i>Buscar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Carrera ::</label>
                                    <div class="col-md-9"><span id="nombreestudiante">${programa}</span></div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Plan ::</label>
                                <div class="col-md-9">
                                    <form:select path="id_plan" data-url="${pageContext.request.contextPath}/AjaxListarMenciones.fautapo"   cssClass="form-control">
                                        <option>Elija una opcion</option>
                                        <c:forEach var="plan" items="${planes}" varStatus="cont">
                                            <option value="${plan}"  <c:if test="${plan==formulario.id_plan}">selected="true"</c:if>>${plan}</option>
                                        </c:forEach>
                                    </form:select>
                                    <form:errors path="id_plan" cssClass="invalid"></form:errors>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Mencion ::</label>
                                    <div class="col-md-9">
                                    <c:if test="${lmenciones==null}">
                                        <form:select path="id_mencion" cssClass="form-control"></form:select>
                                    </c:if>
                                    <c:if test="${lmenciones!=null}">
                                        <form:select path="id_mencion" cssClass="form-control">
                                            <c:forEach var="mencion" items="${lmenciones}" varStatus="cont">
                                                <option value="${mencion.id_mencion}"  <c:if test="${mencion.id_mencion==formulario.id_mencion}">selected="true"</c:if>>${mencion.mencion}</option>
                                            </c:forEach>
                                        </form:select>
                                    </c:if>
                                    <form:errors path="id_mencion" cssClass="invalid"></form:errors>
                                    </div>
                                </div>
                                <div class="tile-footer">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-3">
                                            <button class="btn btn-primary"><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                        </form:form>
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/listarMenciones.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="_condicion" value="todo" />
                            <input type="hidden" name="id_programa" value="${id_programa}" />
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalEstudiante" tabindex="-1" aria-labelledby="modalEstudianteLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <input type="hidden" name="id_programa" value="${id_programa}" />
                            <h5 class="modal-title" id="modalEstudianteLabel">Buscar Estudiante</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="input-group">
                                        <input type="text" id="buscarElementos" class="form-control" placeholder="Buscar estudiante">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button" id="btnbuscar" data-url="${pageContext.request.contextPath}/AjaxListarEstudiantesMencion.fautapo">
                                                <i class="fa fa-fw fa-lg fa-search"></i> Buscar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <table class="table table-sm table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>RU</th>
                                                <th>NOMBRE COMPLETO</th>
                                            </tr>
                                        </thead>
                                        <tbody id="listaTabla" style="cursor: pointer;">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="cerrarbuscador();">Close</button>
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
        <script src="<c:url value='/Public/Js/app/mencion/main.js'/>" type="module"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
        <script type="text/javascript">
                                $('#tablagrupo').DataTable();
                                function abrirbuscador() {
                                    $('#modalEstudiante').modal('show');
                                }
                                function cerrarbuscador() {
                                    $('#buscarElementos').val('');
                                    document.getElementById('listaTabla').innerHTML = '';
                                    $('#modalEstudiante').modal('hide');
                                }
                                function seleccionarfila(value)
                                {
                                    var id_estudiante = document.getElementById('tdru' + value);
                                    var nombre = document.getElementById('tdnombre' + value);
                                    document.getElementById('nombreestudiante').innerHTML = nombre.getAttribute("data-nombre");
                                    document.getElementById('nombre_estudiante').value = nombre.getAttribute("data-nombre");
                                    document.getElementById('id_estudiante').value = id_estudiante.getAttribute("data-id");
                                    $('#buscarElementos').val('');
                                    document.getElementById('listaTabla').innerHTML = '';
                                    $('#modalEstudiante').modal('hide');
                                }

        </script>
    </body>
</html>
