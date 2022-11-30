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
                    <h1><i class="far fa-address-card"></i>&nbsp; Admin. Retroceder fase</h1>
                    <p>${nombres}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form name='forma' method="post" action='<c:url value="/listarDocentesAsignadosMaterias.fautapo"/>'>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
                            <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
                            <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
                            <input type="hidden" name="id_departamento" value='<c:out value="${cliente.id_departamento}"/>' >
                             <input type="hidden" name="id_facultad" value='<c:out value="${cliente.id_facultad}"/>' >
                            <div class="form-group row">
                                <c:choose>
                                    <c:when test="${cliente.id_universidad > 0}"><label class="control-label col-md-3">Universidad</label><div class="col-md-8"> <c:out value="${acceso.acceso}"/> </div></c:when>
                                    <c:when test="${cliente.id_facultad > 0}"><label class="control-label col-md-3">Facultad</label><div class="col-md-8"> <c:out value="${acceso.acceso}"/> </div></c:when>
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
                            <c:if test="${fn:length(acceso.listaDepartamentos) > 0}">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Departamento</label>
                                    <div class="col-md-8">
                                        <select name="id_departamento" id="id_departamento" class="form-control" onChange="poblar(this.name, this.options[this.selectedIndex].value)"></select>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${fn:length(lListarTiposEvaluaciones) > 0}">
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Tipo de Evaluaci&oacute;n</label>
                                    <div class="col-md-8">
                                        <select name="id_tipo_evaluacion" class="form-control" required>
                                            <option value=""> - Elija una opción - </option>
                                            <c:forEach var="tipo" items="${lListarTiposEvaluaciones}">
                                                <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>"> <c:out value="${tipo.tipo_evaluacion}"/></option>
                                            </c:forEach>     
                                        </select>
                                    </div>
                                </div>
                            </c:if>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary"  href="javascript:history.back();"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
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