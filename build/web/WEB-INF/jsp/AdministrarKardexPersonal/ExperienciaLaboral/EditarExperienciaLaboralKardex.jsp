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
                            <form name="forma"  class="form-horizontal" action="<c:url value="/RegistrarModificarExperiencia.fautapo"/>" method="POST"  enctype="multipart/form-data">     
                                <input type="hidden" name="id_persona" value='${id_persona}' /> 
                                <input type="hidden" name="id_persona_kardex" value='${detalles.id_persona_kardex}' /> 
                                <input type="hidden" name="id_experiencia_laboral" value='${detalles.id_experiencia_laboral}' />  
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Tipo de experiencia laboral<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <select class="form-control" name="tipo_experiencia_laboral" id="tipo_experiencia_laboral">
                                            <optgroup label="Seleccionar experiencia laboral">
                                                ${detalleexperiencia}
                                            </optgroup> 
                                        </select>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Universidad/Institucion educativa<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="institucion" type="text" value="${detalles.institucion}" aria-describedby="institucionHelp">
                                        <small class="form-text text-muted" id="institucionHelp">Univerisdad o Institucion donde trabajo.</small>
                                    </div>
                                </div>      
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Corgo o Funcion<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="cargoocupado" type="text" value="${detalles.cargoocupado}" aria-describedby="cargoocupadoHelp">
                                        <small class="form-text text-muted" id="cargoocupadoHelp">Cargo o funcion que realizaba.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Descripcion del cargo<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <textarea class="form-control" name="detalle" id="detalle" rows="3" aria-describedby="detalleHelp">${detalles.detalle}</textarea>
                                        <small class="form-text text-muted" id="detalleelp">Descripcion del cargo o detallar la designacion.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Referencias<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="refrencia" type="text" value="${detalles.refrencia}" aria-describedby="refrenciaHelp">
                                        <small class="form-text text-muted" id="refrenciaHelp">Detallar referencias laborales.</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Calificacion de años de servicio</label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="calificacion" type="text" value="${detalles.calificacion}" aria-describedby="calificacionHelp">
                                        <small class="form-text text-muted" id="calificacionHelp">Detallar calificacion de años de servicio.</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Gestion<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="gestion" type="text" value="${detalles.gestion}" aria-describedby="gestionHelp">
                                        <small class="form-text text-muted" id="gestionHelp">Gestion en que inicio el trabajo.</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fecha de inicio de trabajo<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control calendar" name="inicio" id="inicio" type="text" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${detalles.inicio}" />" aria-describedby="inicioHelp" readonly> 
                                        <small class="form-text text-muted" id="inicioHelp">Detallar fecha de inicio laboral.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fecha de fin de trabajo<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control calendar" name="fin" id="inicio" type="text" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${detalles.fin}" />" aria-describedby="finHelp" readonly> 
                                        <small class="form-text text-muted" id="finHelp">Detallar fecha de fin laboral.</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fotocopia del certificado de trabajo o memorandun de designacion<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control-file" name="url_experiencia" id="url_experiencia" type="file" aria-describedby="url_experienciaHelp"  accept="image/x-png,image/gif,image/jpeg">
                                        <small class="form-text text-muted" id="url_experienciaHelp">Cargar imagen de fotocopia del certificado de trabajo o memorandun de designacion</small>
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