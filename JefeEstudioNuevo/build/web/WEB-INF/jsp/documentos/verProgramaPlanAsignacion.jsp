<jsp:useBean id="now" class="java.util.Date"/> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="es">
    <head>  
        <meta charset="UTF-8">  
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" /> 
        <title>Ingreso - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
    </head>
    <body>
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>

        <section class="lockscreen-content">
            <div class="lock-box"> <img class="rounded-circle user-image" src="${simagen}">
                <h4 class="text-center user-name">${usuario}</h4>
                <p class="text-center text-muted">Administrar documentacion docente</p>
                <form:form  method="get" cssClass="unlock-form" modelAttribute="model" action="${pageContext.request.contextPath}/Documentos/verListaDocentesDesignados.fautapo">
                    <form:hidden path="gestion"/>
                    <form:hidden path="periodo"/>
                    <div class="form-group row">
                        <label class="control-label col-md-3">Facultad:</label>
                        <div class="col-md-9">
                            <form:select cssClass="form-control" path="id_facultad" onchange="seleccionarfacultad()"  items="${lFacultades}" itemValue="id_facultad" itemLabel="facultad"></form:select>
                            <form:errors path="id_facultad" cssClass="invalid"></form:errors>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <label class="control-label col-md-3">Carrera:</label>
                            <div class="col-md-9">
                            <form:select cssClass="form-control" path="id_programa"  items="${lProgramas}" itemValue="id_programa" itemLabel="programa"></form:select>
                            <form:errors path="id_programa" cssClass="invalid"></form:errors>
                            </div>
                        </div>
                        <div class="form-group btn-container">
                            <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-unlock fa-lg"></i>Ingresar </button>
                        </div>
                </form:form> 
            </div>
        </section>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script>
            var tabla = document.getElementById('id_programa');
            var row = '';
            function seleccionarfacultad() {
                var value = document.getElementById('id_facultad').value;
                var data = {id_facultad: value};
                request = $.ajax({url: "./ListarProgramasAjax.fautapo", method: "GET", data: data, datatype: 'json'});
                request.done(function (response) {
                    if (response.status === "OK") {
                        row = ''
                        response.items.forEach(function (item, index) {
                            row += "<option value='" + item.id_programa + "'>" + item.programa + "</option>"
                        });
                        tabla.innerHTML = row;
                    } else {
                        tabla.innerHTML = "<option value='-1'>NO ENCONTRADO</option>";
                    }
                });
            }
        </script>

    </body>
</html>
