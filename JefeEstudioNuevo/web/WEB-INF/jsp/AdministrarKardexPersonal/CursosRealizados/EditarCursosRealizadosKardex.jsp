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
                            <form name="forma"  class="form-horizontal" action="<c:url value="/RegistrarModificarCursos.fautapo"/>" method="POST"  enctype="multipart/form-data">     
                                <input type="hidden" name="id_persona" value='${id_persona}' /> 
                                <input type="hidden" name="id_persona_kardex" value='${detalles.id_persona_kardex}' /> 
                                <input type="hidden" name="id_cursos_realizados" value='${detalles.id_cursos_realizados}' />  
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Tipo de asistencia<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <select class="form-control" name="tipoorganizacion" id="tipoorganizacion" aria-describedby="tipoorganizacionHelp">
                                            <optgroup label="Seleccionar el tipo de asistencia">
                                                ${detalleorganizacion}
                                            </optgroup> 
                                        </select>
                                        <small class="form-text text-muted" id="tipoorganizacionHelp">Tipo de evento a la que se asistio.</small>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Tipo de evento<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <select class="form-control" name="tipo_eventos" id="tipo_eventos" aria-describedby="tipo_eventosHelp">
                                            <optgroup label="Seleccionar el tipo de evento">
                                                ${detalleevento}
                                            </optgroup> 
                                        </select>
                                        <small class="form-text text-muted" id="tipo_eventosHelp">Seleccionar el tipo evento como participo.</small>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Universidad/Institucion educativa<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="expedido_institucion" type="text" value="${detalles.expedido_institucion}" aria-describedby="expedido_institucionHelp">
                                        <small class="form-text text-muted" id="expedido_institucionHelp">Univerisdad o Institucion donde trabajo.</small>
                                    </div>
                                </div>      
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Descripcion del curso o evento<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="detalle" type="text" value="${detalles.detalle}" aria-describedby="detalleHelp">
                                        <small class="form-text text-muted" id="detalleHelp">Descripcion del evento o cursos.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Numero del titulo<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="nrotitulo" type="text" value="${detalles.nrotitulo}" aria-describedby="nrotituloHelp">
                                        <small class="form-text text-muted" id="nrotituloHelp">Numero del titulo del curso o evento.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Horas academicas</label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="horas_academicas" type="text" value="${detalles.horas_academicas}" aria-describedby="horas_academicasHelp">
                                        <small class="form-text text-muted" id="horas_academicasHelp">Detallar las horas academicas del curso.</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Duracion</label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="duracion" type="text" value="${detalles.duracion}" aria-describedby="duracionHelp">
                                        <small class="form-text text-muted" id="duracionHelp">Duracion del curso.</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fecha de evento<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control calendar" name="fechapresentacion" id="fechapresentacion" type="text" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${detalles.fechapresentacion}" />" aria-describedby="fechapresentacionHelp" readonly> 
                                        <small class="form-text text-muted" id="fechapresentacionHelp">Fecha en la se realizo el evento.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fotocopia del certificado de del evento<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control-file" name="url_cursos" id="url_experiencia" type="file" aria-describedby="url_cursosHelp"  accept="image/x-png,image/gif,image/jpeg">
                                        <small class="form-text text-muted" id="url_cursosHelp">Cargar imagen de fotocopia del certificado de del evento</small>
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
        <script>
            $('.calendar').datepicker({
                format: "dd/mm/yyyy",
                autoclose: true,
                locale: 'es',
                todayHighlight: true
            });
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