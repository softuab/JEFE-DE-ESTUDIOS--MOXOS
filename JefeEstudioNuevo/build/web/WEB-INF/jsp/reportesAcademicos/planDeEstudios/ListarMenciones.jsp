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
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp;Imprimir Plan De Estudios</h1>
                    <p>Programa: <c:out value='${datosPrograma.programa}'/></p>
                    <p>${usuario}</p>  
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form name='forma' method="post" action="<c:url value="/planDeEstudios/listarPlanEstudios.fautapo"/>">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="id_programa" value="<c:out value='${datosPrograma.id_programa}'/>">
                            <input type="hidden" name="id_estudiante" value="<c:out value='${datosEstudiante.id_estudiante}'/>">
                            <div class="form-group row">
                                <label class="control-label col-md-3">RU</label>
                                <div class="col-sm-9">
                                    <c:out value="${datosEstudiante.id_estudiante}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Estudiante</label>
                                <div class="col-sm-9">
                                    <c:out value="${datosPersona.nombres}"/> &nbsp;
                                    <c:out value="${datosPersona.paterno}"/> &nbsp;
                                    <c:out value="${datosPersona.materno}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Programa</label>
                                <div class="col-sm-9">
                                    <c:out value="${datosPrograma.programa}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Plan</label>
                                <div class="col-sm-9">
                                    <c:out value="${datosEstudiante.id_plan}"/>
                                </div>
                            </div>
                            <c:if test="${!empty datosMencion.mencion}">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Menci&oacute;n del Estudiante</label>
                                    <div class="col-sm-9">
                                        <c:out value="${datosMencion.mencion}"/>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${empty datosMencion.mencion}">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Menci&oacute;n del Estudiante</label>
                                    <div class="col-sm-9">
                                        <select name="id_mencion" class="form-control" required>
                                            <option value="">-- seleccione --</option>
                                            <c:forEach var="lista" items="${lMenciones}">
                                                <option value="<c:out value="${lista.id_mencion}"/>" <c:if test="${lista.id_mencion == datosMencion.id_mencion}"> selected </c:if>>
                                                    <c:out value="${lista.mencion}"/>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${!empty datosMencion.mencion}"> 
                                <input type="hidden" name="id_mencion" value="<c:out value='${datosMencion.id_mencion}'/>">
                            </c:if>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href='<c:url value="/planDeEstudios/Entrada.fautapo"/>'><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
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
    </body>
</html>
