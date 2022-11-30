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
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">  
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Administraci&oacute;n de Horarios</h1>
                    <p>${usuario}</p>  
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/administrarHorarios/listarMaterias.fautapo"/>'>
                            <input type="hidden" name="gestion"     value="<c:out value='${gestion}'/>">
                            <input type="hidden" name="periodo"     value="<c:out value='${periodo}'/>">
                            <c:if test="${cliente.id_facultad > 0}"><input type="hidden" name="id_facultad" value='<c:out value="${cliente.id_facultad}"/>'></c:if>
                            <c:if test="${cliente.id_programa > 0}"><input type="hidden" name="id_programa" value='<c:out value="${cliente.id_programa}"/>'></c:if>
                            <c:if test="${cliente.id_departamento > 0}"><input type="hidden" name="id_departamento" value='<c:out value="${cliente.id_departamento}"/>'></c:if>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Gesti&oacute;n</label>
                                    <div class="col-md-8">
                                    <c:out value="${gestion}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Periodo</label>
                                <div class="col-md-8">
                                    <c:out value="${periodo}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <c:choose>
                                    <c:when test="${cliente.id_universidad > 0}"><label class="control-label col-md-3">Universidad</label><div class="col-md-8"> <c:out value="${acceso.acceso}"/> </div></c:when>
                                    <c:when test="${cliente.id_facultad > 0}"><label class="control-label col-md-3">Facultad</label><div class="col-md-8"> <c:out value="${acceso.acceso}"/> </div></c:when>
                                    <c:when test="${cliente.id_programa > 0}"><label class="control-label col-md-3">Programa</label><div class="col-md-8"> <c:out value="${acceso.acceso}"/> </div></c:when>
                                    <c:when test="${cliente.id_departamento > 0}"><label class="control-label col-md-3">Departamento</label><div class="col-md-8"> <c:out value="${acceso.acceso}"/> </div></c:when>
                                </c:choose>
                            </div>
                            <c:if test="${fn:length(acceso.listaFacultades) > 0}">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Facultad</label>
                                    <div class="col-md-8">
                                        <select name="id_facultad" id="id_facultad" class="form-control" onChange="poblar(this.name, this.options[this.selectedIndex].value)"></select>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${fn:length(acceso.listaProgramas) > 0}">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Programa</label>
                                    <div class="col-md-8">
                                        <select name="id_programa" id="id_programa" class="form-control" onChange="poblar(this.name, this.options[this.selectedIndex].value)"></select>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${fn:length(acceso.listaPlanes) > 0}">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Plan</label>
                                    <div class="col-md-8">
                                        <select name="id_prg_plan" class="form-control" id="id_prg_plan" required>
                                            <option value=""> - Elija una opción - </option>    
                                            <c:forEach var="plan" items="${acceso.listaPlanes}" varStatus="pln">
                                                <option value="<c:out value="${plan.id_prg_plan}"/>" ><c:out value="${plan.tipo_grado}"/> - <c:out value="${plan.id_plan}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Tipo de Evaluaci&oacute;n</label>
                                <div class="col-md-8">
                                    <select name="id_tipo_evaluacion" class="form-control" required>
                                        <option value=""> - Elija una opción - </option>    
                                        <c:forEach var="tipo" items="${lTiposEvaluaciones}">
                                            <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>"> <c:out value="${tipo.tipo_evaluacion}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit' value='Siguiente'  onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href='javascript:history.back();'><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script> 
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    </body>
</html>


