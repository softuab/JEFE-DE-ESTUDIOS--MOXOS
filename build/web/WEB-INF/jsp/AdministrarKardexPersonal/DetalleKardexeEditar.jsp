<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">  
    </head>
    <body class="app sidebar-mini rtl">
        <c:if test="${!empty id_rol}">
            <main class="app-content3">
                <div class="app-title">
                    <div>
                        <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1> 
                    </div>
                </div>
                <div class="row"> 
                    <div class="col-sm-12">
                        <div class="tile">
                            <div class="row">
                                <div class="col">
                                    <c:if test = "${error.count > 0}">
                                        <div class="alert alert-danger" role="alert"> 
                                            <ol>
                                                <c:forEach var="value" items="${error.error}" >
                                                    <li>${value}</li>
                                                </c:forEach> 
                                            </ol>
                                        </div>
                                    </c:if> 
                                </div>
                            </div>
                            <form name="forma" class="unlock-form" action="<c:url value="/EditarPersonaKardex.fautapo"/>" method="POST"  enctype="multipart/form-data">     
                                <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                <b>1.- Informacion personal</b><br><hr>
                                <div class="row">
                                    <div class="col-md-3 order-md-2 mb-3"> 
                                        <div class="form-group">
                                            <label for="nombre">Nombre</label> 
                                            <input class="form-control" name="nombre" type="text" placeholder="Nombre" value="${kardex.nombre}">
                                        </div>
                                    </div> 
                                    <div class="col-md-3 order-md-2 mb-3">
                                        <div class="form-group">
                                            <label for="segundonombre">Segundo nombre</label> 
                                            <input class="form-control" name="segundonombre" type="text" placeholder="Segundo nombre" value="${kardex.segundonombre}">
                                        </div></div>
                                    <div class="col-md-3 order-md-2 mb-3">
                                        <div class="form-group">
                                            <label for="apellidopaterno">Apellido paterno</label> 
                                            <input class="form-control" name="apellidopaterno" type="text" placeholder="Apellido paterno" value="${kardex.apellidopaterno}">
                                        </div></div>
                                    <div class="col-md-3 order-md-2 mb-3">
                                        <div class="form-group">
                                            <label for="apellidomaterno">Apellido materno</label> 
                                            <input class="form-control" name="apellidomaterno" type="text" placeholder="Apellido materno" value="${kardex.apellidomaterno}">
                                        </div></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 order-md-2 mb-6">
                                        <div class="form-group">
                                            <label for="id_localidad">Lugar de nacimiento</label> 
                                            <select class="form-control" name="id_localidad" id="id_localidad" aria-describedby="localidadHelp" >
                                                <optgroup label="Seleccionar Ciudades">
                                                    ${localidades}
                                                </optgroup> 
                                            </select>
                                            <small class="form-text text-muted" id="localidadHelp">Si no encuentra la localidad comunicar con DTIC para registrarlo.</small>
                                        </div>
                                    </div>
                                    <div class="col-md-2 order-md-2 mb-2">
                                        <div class="form-group">
                                            <label for="fechanacimiento">Fecha nacimiento</label> 
                                            <input class="form-control calendar" name="fechanacimiento" id="fechanacimiento" type="text" placeholder="Select Date" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechanacimiento}" />" readonly >
                                        </div>
                                    </div>
                                    <div class="col-md-2 order-md-2 mb-2">
                                        <div class="form-group">
                                            <label for="estadocivil">Estado Civil</label> 
                                            <select class="form-control" name="estadocivil" id="estadocivil">
                                                <optgroup label="Seleccionar estado civil">
                                                    ${estadocivil}
                                                </optgroup> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-2 order-md-2 mb-2">
                                        <div class="form-group">
                                            <label>Sexo</label> 
                                            <div class="toggle-flip">
                                                <label>
                                                    <input type="checkbox" name="sexo" <c:out value="${kardex.sexo ? 'checked': ''}"/>><span class="flip-indecator" data-toggle-on="HOMBRE" data-toggle-off="MUJER"></span>
                                                </label>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <b>2.- Información identificación personal</b><br><hr>
                                <div class="row">
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="tipodocumento">Tipo documento</label> 
                                            <select class="form-control" name="tipodocumento" id="tipodocumento">
                                                <optgroup label="Seleccionar tipo documento">
                                                    ${tipodocumento}
                                                </optgroup> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="numerodocumento">Numero de documento</label> 
                                            <input class="form-control" name="numerodocumento" type="text" placeholder="Numero de documento" value="${kardex.numero}">
                                        </div></div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="alfanumerico">Codigo alfanumerico</label> 
                                            <input class="form-control" name="alfanumerico" type="text" placeholder="Codigo alfanumerico" value="${kardex.alfanumerico}" aria-describedby="alfanumericoHelp">
                                            <small class="form-text text-muted" id="alfanumericoHelp">Codgo asignado al final del numero de documento.</small>
                                        </div>
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="id_localidad">Emision de documento</label> 
                                            <select class="form-control" name="emision_documento" id="emision_documento" aria-describedby="emisiondocumentoHelp" >
                                                <optgroup label="Seleccionar Ciudades">
                                                    ${ciudad}
                                                </optgroup> 
                                            </select>
                                            <small class="form-text text-muted" id="emisiondocumentoHelp">Ciudad en donde se emitio el documento.</small>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="fechanacimiento">Fecha de Expiración de documento</label> 
                                            <input class="form-control calendar" name="fechaexpiracioncarnet" id="fechaexpiracioncarnet" type="text" placeholder="Seleccionar fecha" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechaexpiracioncarnet}" />" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="exampleInputFile">Fotocopia de carnet identidad</label>
                                            <input class="form-control-file" name="imagecarnetidentidad" id="imagecarnetidentidad" type="file" aria-describedby="imagecarnetidentidadHelp" size="51200?"  accept="image/x-png,image/gif,image/jpeg">
                                            <small class="form-text text-muted" id="imagecarnetidentidadHelp">Cargar imagen de fotocopia del documento identificacion</small>
                                        </div>
                                    </div> 
                                </div>
                                <b>3.- Información de Servicio militar(opcional mujeres)</b><br><hr>
                                <div class="row">
                                    <div class="col-md-2 order-md-2 mb-2"> 
                                        <div class="form-group">
                                            <label for="numerolibreta">Numero de Libreta</label> 
                                            <input class="form-control" name="numerolibreta" type="text" placeholder="Numero de Libreta" value="${kardex.numerolibreta}">
                                        </div>
                                    </div> 
                                    <div class="col-md-2 order-md-2 mb-2">
                                        <div class="form-group">
                                            <label for="matriculalibreta">Matricula de Libreta</label> 
                                            <input class="form-control" name="matriculalibreta" type="text" placeholder="Matricula de Libreta" value="${kardex.matriculalibreta}">
                                        </div></div> 
                                    <div class="col-md-2 order-md-2 mb-2">
                                        <div class="form-group">
                                            <label for="escalon">Escalon</label> 
                                            <input class="form-control" name="escalon" type="text" placeholder="Escalon" value="${kardex.escalon}">
                                        </div>
                                    </div>
                                    <div class="col-md-2 order-md-2 mb-2">
                                        <div class="form-group">
                                            <label for="aserviciomilitar">Año de Servicio</label> 
                                            <input class="form-control" name="aserviciomilitar" type="text" placeholder="Año de Servicio" value="${kardex.aserviciomilitar}">
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="imagelibretamilitar">Fotocopia de libreta de servicio militar</label>
                                            <input class="form-control-file" name="imagelibretamilitar" id="imagelibretamilitar" type="file" aria-describedby="imagelibretamilitarHelp"  accept="image/x-png,image/gif,image/jpeg">
                                            <small class="form-text text-muted" id="imagelibretamilitarHelp">Cargar imagen de fotocopia de la libreta identificacion</small>
                                        </div>
                                    </div> 
                                </div>
                                <b>4.- Información academica pregrado actual</b><br><hr>
                                <div class="row">
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="id_nivelestudio">Nivel estudio</label> 
                                            <select class="form-control" name="id_nivelestudio" id="id_nivelestudio">
                                                <optgroup label="Seleccionar nivel estudio">
                                                    ${nivelestudio}
                                                </optgroup> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="id_profesiones">Profesion</label> 
                                            <select class="form-control" name="id_profesiones" id="id_profesiones">
                                                <optgroup label="Seleccionar profesion">
                                                    ${profesiones}
                                                </optgroup> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="universidad">Universidad</label> 
                                            <input class="form-control" name="universidad" type="text" placeholder="Universidad" value="${kardex.universidad}" aria-describedby="universidadHelp">
                                            <small class="form-text text-muted" id="universidadHelp">Universidad donde se emitio el titulo provision nacional.</small>
                                        </div>
                                    </div> 
                                </div> 
                                <div class="row">
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group"> 
                                            <div class="form-group">
                                                <label for="numerotituloprovision">Numero de titulo</label> 
                                                <input class="form-control" name="numerotituloprovision" type="text" placeholder="Numero de titulo" value="${kardex.numerotituloprovision}""> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="fechatituloprofesion">Fecha de emision de titulo</label> 
                                            <input class="form-control calendar" name="fechatituloprofesion" id="fechatituloprofesion" type="text" placeholder="Seleccionar fecha" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechatituloprofesion}" />" aria-describedby="fechatituloprofesionHelp" readonly>
                                            <small class="form-text text-muted" id="fechatituloprofesionHelp">La fecha de titulo de provicion nacional debe ser mayor a 2 años.</small>
                                        </div> 
                                    </div> 
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="imagen">Fotocopia legalizada de provicion nacional</label>
                                            <input class="form-control-file" name="imagen" id="imagen" type="file" aria-describedby="imagenHelp"  accept="image/x-png,image/gif,image/jpeg">
                                            <small class="form-text text-muted" id="imagenHelp">Cargar imagen de la fotocopia legalizado de provicion nacional</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="id_colegio_profesionales">Colegio de profesionales</label> 
                                            <select class="form-control" name="id_colegio_profesionales" id="id_colegio_profesionales">
                                                <optgroup label="Seleccionar colegio profesionales">
                                                    ${colegioprofesionales}
                                                </optgroup> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group"> 
                                            <div class="form-group">
                                                <label for="numeroregistroprofesionales">Numero de registro de colegio profesional</label> 
                                                <input class="form-control" name="numeroregistroprofesionales" type="text" placeholder="Numero de registro de colegio profesional" value="${kardex.numeroregistroprofesionales}""> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <div class="form-group">
                                            <label for="prefijo_profesional">Etiqueta de presentacion profesional</label> 
                                            <input class="form-control" name="prefijo_profesional" id="prefijo_profesional" type="text" placeholder="Etiqueta de presentacion profesional" value="${kardex.prefijo_profesional}" aria-describedby="prefijoprofesionalHelp">
                                            <small class="form-text text-muted" id="prefijoprofesionalHelp">Prefijo profesional de acuerdo a su grado academico(M.Sc Lic.).</small>
                                        </div> 
                                    </div> 
                                </div> 
                                <b>5.- Información laboral</b><br><hr>
                                <div class="row">
                                    <div class="col-md-3 order-md-2 mb-3">
                                        <div class="form-group">
                                            <label for="id_banco">Tipo de NUA</label> 
                                            <select class="form-control" name="tiponua" id="tiponua">
                                                <optgroup label="Seleccionar tipo NUA">
                                                    ${tiponuas}
                                                </optgroup> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-2 mb-3">
                                        <div class="form-group">
                                            <label for="nua">NUA</label> 
                                            <input class="form-control" name="nua" type="text" placeholder="NUA" value="${kardex.nua}">
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-2 mb-3">
                                        <div class="form-group">
                                            <label for="id_banco">Entidad Financiera</label> 
                                            <select class="form-control" name="id_banco" id="id_banco">
                                                <optgroup label="Seleccionar Bancos">
                                                    ${bancos}
                                                </optgroup> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-2 mb-3">
                                        <div class="form-group">
                                            <label for="cuentacorriente">Numero de cuenta</label> 
                                            <input class="form-control" name="cuentacorriente" type="text" placeholder="Numero de cuenta" value="${kardex.cuentacorriente}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label>Jubilado</label> 
                                            <div class="toggle-flip">
                                                <label>
                                                    <input type="checkbox" name="jubilado" <c:out value="${kardex.jubilado ? 'checked': ''}"/>><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                </label>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label for="nua">Numero de REM</label> 
                                            <input class="form-control" name="ren" type="text" placeholder="Numero de REM" value="${kardex.ren}">
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label>Capacidades diferentes</label> 
                                            <div class="toggle-flip">
                                                <label>
                                                    <input type="checkbox" class="checkbox" name="discapacidad" <c:out value="${kardex.discapacidad ? 'checked': ''}"/> ><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                </label>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label for="nua">Numero de CODEPEDI</label> 
                                            <input class="form-control" name="nrodiscpacitado" type="text" placeholder="Numero de CODEPEDI" value="${kardex.nrodiscpacitado}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label>1178</label> 
                                            <div class="toggle-flip">
                                                <label>
                                                    <input type="checkbox" name="ley1178" <c:out value="${kardex.ley1178 ? 'checked': ''}"/>><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                </label>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label for="nua">Numero de certificado 1178</label> 
                                            <input class="form-control" name="nrotitulo" type="text" placeholder="Numero de certificado 1178" value="${kardex.nrotitulo}">
                                        </div>
                                    </div> 
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label for="nua">Promedio de 1178</label> 
                                            <input class="form-control" name="nrotitulo" type="number" placeholder="Promedio de 1178" value="${kardex.promedio}">
                                        </div>
                                    </div> 
                                    <div class="col-md-3 order-md-3 mb-3"> 
                                        <div class="form-group">
                                            <label for="fechacurso1178">Fecha de emision de 1178</label> 
                                            <input class="form-control calendar" name="fechacurso1178" id="fechacurso1178" type="text" placeholder="Seleccionar fecha" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechacurso1178}" />" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 order-md-6 mb-6">
                                        <div class="form-group">
                                            <label for="nua">Detalle de idioma Nativo</label> 
                                            <input class="form-control" name="idiomanativo" type="text" placeholder="Detalle de idioma Nativo" value="${kardex.idiomanativo}">
                                        </div>
                                    </div> 
                                    <div class="col-md-6 order-md-6 mb-6"> 
                                        <div class="form-group">
                                            <label for="fechaemision">Fecha de emision idioma Nativo</label> 
                                            <input class="form-control calendar" name="fechaemision" id="fechaemision" type="text" placeholder="Seleccionar fecha" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechaemision}" />" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label>Certificación del Sippase</label> 
                                            <div class="toggle-flip">
                                                <label>
                                                    <input type="checkbox" name="sippase" <c:out value="${kardex.sippase ? 'checked': ''}"/>><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                </label>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label for="fechaemision">Fecha de emision de Sippase</label> 
                                            <input class="form-control calendar" name="fechaemisionsippase" id="fechaemisionsippase" type="text" placeholder="Seleccionar fecha" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechaemisionsippase}" />" readonly>
                                        </div>
                                    </div> 
                                    <div class="col-md-3 order-md-3 mb-3">
                                        <div class="form-group">
                                            <label for="nua">Numero de SSU</label> 
                                            <input class="form-control" name="numerodeseguro" type="text" placeholder="Numero de SSU" value="${kardex.numerodeseguro}">
                                        </div>
                                    </div> 
                                    <div class="col-md-3 order-md-3 mb-3"> 
                                        <div class="form-group">
                                            <label>Sindicato</label> 
                                            <div class="toggle-flip">
                                                <label>
                                                    <input type="checkbox" name="sindicato" <c:out value="${kardex.sindicato ? 'checked': ''}"/>><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                </label>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <b>6.- Contacto</b><br><hr>
                                <div class="row"> 
                                    <div class="col-md-6 order-md-2 mb-6">
                                        <div class="form-group">
                                            <label for="telefonocelular">Telefono/Celular</label> 
                                            <input class="form-control" name="telefonocelular" type="text" placeholder="Telefono/Celular" value="${kardex.telefonocelular}">
                                        </div>
                                    </div> 
                                    <div class="col-md-6 order-md-2 mb-6">
                                        <div class="form-group">
                                            <label for="correoinsitucional">Correo Electronico</label> 
                                            <input class="form-control" name="correoinsitucional" type="email" placeholder="Correo Electronico" value="${kardex.correoinsitucional}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 order-md-2 mb-12">
                                        <div class="form-group">
                                            <label for="direccion">Direccion</label>
                                            <textarea class="form-control" name="direccion" id="direccion" rows="3">${kardex.direccion}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="tile-footer">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Registrar</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="javascript:history.back();"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
            </main>
        </c:if>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script> 
        <script src="<c:url value='/Public/Js/plugins/bootstrap-datepicker.min.js'/>"></script> 
        <script src="<c:url value='/Public/Js/plugins/select2.min.js'/>"></script> 
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script>
        <script>
            $('.calendar').datepicker({
                format: "dd/mm/yyyy",
                autoclose: true,
                locale: 'es',
                todayHighlight: true
            });
            $('select').select2();
            $(".form-control-file").change(function (e) {
                var file;
                if ((file = this.files[0])) {
                    var sizeByte = this.files[0].size;
                    var sizekiloBytes = parseInt(sizeByte / 1024);
                    if (sizekiloBytes > $('.form-control-file').attr('size')) {
                        swal("Oops", 'El tamaño supera el limite permitido!', "error");
                        $(this).val('');
                    }
                }
            });
        </script>
    </body>
</html>