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
                            <form name="forma"  class="form-horizontal" action="<c:url value="/RegistrarPersonaFormacionAcademicaKardex.fautapo"/>" method="POST"  enctype="multipart/form-data">     
                                <input type="hidden" name="id_persona" value='${id_persona}' /> 
                                <input type="hidden" name="id_persona_kardex" value='${formacion.id_persona_kardex}' /> 
                                <input type="hidden" name="UUID" value='${formacion.UUID}' /> 
                                <input type="hidden" name="root" value='${root}' /> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Tipo de titulo emitido<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <select class="form-control" name="tipotitulo" id="tipotitulo">
                                            <optgroup label="Seleccionar profesion">
                                                ${detalletipotitulo}
                                            </optgroup> 
                                        </select>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Nivel estudio<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <select class="form-control" name="id_nivelestudio" id="id_nivelestudio">
                                            <optgroup label="Seleccionar nivel estudio">
                                                ${nivelestudio}
                                            </optgroup> 
                                        </select>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Area de conocimiento<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <select class="form-control" name="id_profesiones" id="id_profesiones">
                                            <optgroup label="Seleccionar profesion">
                                                ${profesiones}
                                            </optgroup> 
                                        </select>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Universidad/Institucion educativa<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="expedido" type="text" value="${formacion.expedido}" aria-describedby="expedidoHelp">
                                        <small class="form-text text-muted" id="expedidoHelp">Univerisdad o Institucion donde se emitio el titulo.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Titulo academico<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="descripcion" type="text" value="${formacion.descripcion}" aria-describedby="descripcionHelp">
                                        <small class="form-text text-muted" id="descripcionHelp">Descripcion del titulo academico obtenido.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Numero de titulo academico<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="numerotitulo" type="text" value="${formacion.numerotitulo}" aria-describedby="numerotituloHelp">
                                        <small class="form-text text-muted" id="numerotituloHelp">Numero del titulo academico.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fecha de emision del titulo<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control calendar" name="fechaemision" id="fechaemision" type="text" value="<fmt:formatDate pattern = "dd/MM/yyyy" value = "${formacion.fechaemision}" />" aria-describedby="fechaemisionHelp" readonly> 
                                        <small class="form-text text-muted" id="fechaemisionHelp">Fecha del titulo academico en la que fue emitido.</small>
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Es un titulo de formaciona academicda en Educacion superior?<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <div class="toggle-flip"> 
                                            <label>
                                            <input type="checkbox" name="eseducacionsuperor" <c:out value="${formacion.eseducacionsuperor ? 'checked': ''}"/>><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                            </label>
                                        </div> 
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fotocopia del titulo academico<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control-file" name="url_formacion" id="url_formacion" type="file" aria-describedby="url_formacionHelp"  accept="image/x-png,image/gif,image/jpeg">
                                        <small class="form-text text-muted" id="url_formacionHelp">Cargar imagen de fotocopia de del titulo academico</small>
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