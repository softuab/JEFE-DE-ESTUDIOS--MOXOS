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
                        <form:form modelAttribute="formulario" cssClass="form-horizontal" method="post" action="${pageContext.request.contextPath}/registrarMencionEstudiante.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                            <form:hidden path="id_programa"/>
                            <form:hidden path="id_estudiante"/>
                            <form:hidden path="nombre_estudiante"/>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Estudiante Universitario ::</label>
                                <div class="col-md-9">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span  id="nombreestudiante">${formulario.nombre_estudiante}</span><br/>
                                            <form:errors path="id_estudiante" cssClass="invalid"></form:errors>
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
                                    <form:select path="id_plan" data-url="${pageContext.request.contextPath}/AjaxListarMenciones.fautapo" cssClass="form-control">
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
                                            <button class="btn btn-primary" ><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
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
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
        <script src="<c:url value='/Public/Js/app/mencion/edit.js'/>" type="module"></script>

    </body>
</html>
