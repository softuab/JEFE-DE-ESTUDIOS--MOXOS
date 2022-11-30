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
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Administrar Usuarios</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form:form method="post" modelAttribute="model" action="${pageContext.request.contextPath}/${ruta}">
                            <form:hidden path="tipoEncriptacion"/>
                            <form:hidden path="id_docente"/>
                            <form:hidden path="id_persona"/>
                            <form:hidden path="tipoUsuario"/>
                            <div class="form-group row">
                                <label class="control-label col-md-3" for="form1">Buscar Persona<span class="text-danger">*</label>
                                <div class="input-group mb-3 col-md-9">
                                    <form:errors path="id_persona" cssClass="invalid"/>
                                    <form:input type="search" path="nombre_completo" cssClass="form-control" readonly="true" />
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-primary" onclick="BuscarPersona()"><i class="fas fa-search"></i></button>
                                    </div>
                                </div> 
                            </div> 
                            <div class="form-group row">
                                <label class="control-label col-md-3">Correo o Nombre usuario<span class="text-danger">*</span></label>
                                <div class="col-md-9">
                                    <form:input path="apodo" cssClass="form-control" />
                                    <form:errors path="apodo" cssClass="invalid"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Contrase&#241;a<span class="text-danger">*</span></label>
                                <div class="col-md-9">
                                    <form:password path="clave" cssClass="form-control" />
                                    <form:errors path="clave" cssClass="invalid"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Confirmar contrase&#241;a<span class="text-danger">*</span></label>
                                <div class="col-md-9">
                                    <form:password path="confirmar_clave" cssClass="form-control" />
                                    <form:errors path="confirmar_clave" cssClass="invalid"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Categoria</label>
                                <div class="col-md-9">
                                    <form:input path="categoria" cssClass="form-control" />
                                    <form:errors path="categoria" cssClass="invalid"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Recordatorio<span class="text-danger">*</span> </label>
                                <div class="col-md-9">
                                    <form:input path="recordatorio" cssClass="form-control" />
                                    <form:errors path="recordatorio" cssClass="invalid"/>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="${pageContext.request.contextPath}/docente/retornarlistarUsuarios.fautapo?status=alert-danger&message=Se cancelo el registro del usuario ${model.nombre_completo}" id="btnsalir" ><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div id="buscarpersona" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Buscar persona</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col"> 
                                    <div class="input-group mb-3">
                                        <input type="search" id="buscar" name="buscar" class="form-control" value="" />
                                        <div class="input-group-append">
                                            <button type="button" onclick="Buscar()" class="btn btn-primary"><i class="fas fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="list-group"><button type="button" class="list-group-item list-group-item-action active text-center">NOMBRE COMPLETO</button></div>
                                    <div class="list-group" id="tablapersona"></div>
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
        <script>
                                                var request, row = '';
                                                var tabla = document.getElementById('tablapersona');
                                                function BuscarPersona() {
                                                    document.getElementById('buscar').value = '';
                                                    tabla.innerHTML = '';
                                                    $('#buscarpersona').modal('show');
                                                }
                                                function Buscar() {
                                                    var value = document.getElementById('buscar').value;
                                                    var data = {buscar: value};
                                                    request = $.ajax({url: "./ListarPersonasAjax.fautapo", method: "GET", data: data, datatype: 'json'});
                                                    request.done(function (response) {
                                                        if (response.status === "OK") {
                                                            row = ''
                                                            response.items.forEach(function (item, index) {
                                                                row += '<a href="javascript:Seleccionar(' + item.id_persona + ',\'' + item.nombre_completo + '\')" class="list-group-item list-group-item-action list-group-item-light">' + item.nombre_completo + '</a>';
                                                            });
                                                            tabla.innerHTML = row;
                                                        } else {
                                                            tabla.innerHTML = '<span class="text-danger"> ' + response.message + '</span>';
                                                        }
                                                    });
                                                }
                                                function Seleccionar(id_persona, nombreCompleto)
                                                {
                                                    document.getElementById('id_persona').value = id_persona;
                                                    document.getElementById('nombre_completo').value = nombreCompleto;
                                                    $('#buscarpersona').modal('hide');
                                                }
        </script>
    </body>
</html>