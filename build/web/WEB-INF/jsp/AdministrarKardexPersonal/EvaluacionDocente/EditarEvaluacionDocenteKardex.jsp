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
                            <form name="forma"  class="form-horizontal" action="<c:url value="/RegistrarModificarEvaluacion.fautapo"/>" method="POST"  enctype="multipart/form-data">     
                                <input type="hidden" name="id_persona" value='${id_persona}' /> 
                                <input type="hidden" name="id_persona_kardex" value='${detalles.id_persona_kardex}' /> 
                                <input type="hidden" name="id_evaluacion_docente" value='${detalles.id_evaluacion_docente}' />
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Gestion<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="gestion" type="number" value="${detalles.gestion}" aria-describedby="gestionHelp">
                                        <small class="form-text text-muted" id="gestionHelp">Gestion en el que se realico la evaluacion.</small>
                                    </div>
                                </div>    
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Periodo<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <select class="form-control" name="periodo" id="periodo" aria-describedby="periodoHelp">
                                            <optgroup label="Seleccionar periodo">
                                                ${detalleperiodo}
                                            </optgroup> 
                                        </select>
                                        <small class="form-text text-muted" id="periodoHelp">Periodo en el que se realico la evaluacion.</small>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Asignatura o area<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="asignatura" type="text" value="${detalles.asignatura}" aria-describedby="asignaturaHelp">
                                        <small class="form-text text-muted" id="asignaturaHelp">Asignatura o area.</small>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Puntaje<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control" name="puntaje" type="text" value="${detalles.puntaje}" aria-describedby="puntajeHelp">
                                        <small class="form-text text-muted" id="puntajeHelp">Puntaje de la evaluacion.</small>
                                    </div>
                                </div>   
                                <div class="form-group row">
                                    <label class="control-label col-md-3">Fotocopia del la evaluacion<span  class="text-danger font-weight-bold">*</span></label> 
                                    <div class="col-md-8">
                                        <input class="form-control-file" name="url_certificado_evaluacion" id="url_certificado_evaluacion" type="file" aria-describedby="url_certificado_evaluacionHelp"  accept="image/x-png,image/gif,image/jpeg">
                                        <small class="form-text text-muted" id="url_certificado_evaluacionHelp">Cargar imagen de la evaluacion realizada</small>
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
