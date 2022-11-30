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
                            <form name="forma" class="unlock-form" action="<c:url value="/IndexKardexPersonal.fautapo"/>" method="POST">     
                                <input type="hidden" name="id_persona" value='${id_persona}' /> 
                                <button type="submit" class="btn btn-primary icon-btn"><i class="fas fa-home"></i></button>
                            </form>
                            <h3 class="title">Idiomas y Lenguas originarias</h3>
                            <div class="tile-title-w-btn">
                                <input class="form-control mr-sm-2" type="search" id="buscardetalleidioma" placeholder="Buscar titulo"  onkeyup="filterlist('buscardetalleidioma', 'listidioma')">
                                <form name="forma" class="unlock-form" action="<c:url value="/NuevoIdiomaLenguas.fautapo"/>" method="POST">     
                                    <input type="hidden" name="id_persona" value='${id_persona}' /> 
                                    <input type="hidden" name="id_persona_kardex" value='${id_persona_kardex}' /> 
                                    <input type="hidden" name="root" value='total' /> 
                                    <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-plus"></i></button>
                                </form>
                            </div>
                            <div class="tile-body">
                                <ul class="list-unstyled" id="listidioma">
                                    <c:forEach var="detalle" items="${idiomas}"> 
                                        <li class="media" id="li${detalle.id_idioma}">
                                            <img src="${detalle.imageBase64}" class="align-self-center mr-3 rounded-circle"  alt="">
                                            <div class="media-body">
                                                <h5 class="mt-0 mb-1">${detalle.descripcion_idioma}</h5>
                                                <p>
                                                    <b>Lee el idioma?</b>&nbsp;${detalle.lee ? 'SI' : 'NO'}<br>
                                                    <b>Escribe el idioma?</b>&nbsp;${detalle.escribe ? 'SI' : 'NO'}<br>
                                                    <c:if test="${id_rol==8}">
                                                        <c:if test="${detalle.aprobado}">
                                                            <b>El documento se encuentro?</b>&nbsp;<span class="badge badge-success">Aprobado</span><br>
                                                        </c:if>
                                                        <c:if test="${!detalle.aprobado}">
                                                            <b>El documento se encuentro?</b>&nbsp;<span class="badge badge-danger">Sin aprobar</span><br>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${id_rol!=8}">
                                                    <div class="toggle-flip">
                                                        <label>
                                                            Desea aprobar el documento? <input type="checkbox" name="chk${detalle.id_idioma}" data-idioma="${detalle.id_idioma}" onclick="actualizaraprobacion(this)" <c:out value="${detalle.aprobado ? 'checked': ''}"/>><span class="flip-indecator" data-toggle-on="SI" data-toggle-off="NO"></span>
                                                        </label>
                                                    </div> 
                                                </c:if>
                                                </p>
                                                <div class="text-right">
                                                    <div class="btn-group" role="group" aria-label="Basic example">
                                                        <form name="forma"  action="<c:url value="/FileDownloadController.fautapo"/>" method="GET">
                                                            <input type="hidden" name="name" value='${detalle.url_idioma}' /> 
                                                            <input type="hidden" name="directorio" value='idiomas' /> 
                                                            <button class="btn btn-primary" type="submit"><i class="fas fa-download"></i></button>
                                                        </form>
                                                        &nbsp;
                                                        <form name="forma"  action="<c:url value="/ModificarIdiomaLenguas.fautapo"/>" method="GET">
                                                            <input type="hidden" name="id_idioma" value='${detalle.id_idioma}' />
                                                            <input type="hidden" name="id_persona" value='${id_persona}' />
                                                            <button class="btn btn-primary" type="submit"><i class="fas fa-user-edit"></i></button>
                                                        </form>
                                                        &nbsp; 
                                                        <button class="btn btn-primary" data-idioma="${detalle.id_idioma}" data-name="li${detalle.id_idioma}" onclick="deleteitem(this, 'li${detalle.id_idioma}')" type="submit"><i class="far fa-trash-alt"></i></button>

                                                    </div>
                                                </div>
                                            </div>
                                        </li>   
                                    </c:forEach> 
                                </ul>
                            </div>
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
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script> 
        <script src="<c:url value="/Public/Js/filtermedia.js"/>"></script>
        <script>
                                                            function actualizaraprobacion(input) {
                                                                var data = {
                                                                    id_idioma: $(input).data("idioma"),
                                                                    estado: $(input).prop('checked')
                                                                };
                                                                $.get('./ModificarEstadoAprobacionDocumentoIdioma.fautapo', data, function (data)
                                                                {
                                                                    if (data.status !== "success") {
                                                                        swal("Oops", 'Tuvimos problemas con servidor espere un momento por favor.', "error");
                                                                    }
                                                                }).fail(function (jqXHR, textStatus, errorThrown) {
                                                                    if (jqXHR.status === 0) {
                                                                        swal("Oops", 'No conectarse: Verifique la red.', "error");
                                                                    } else if (jqXHR.status == 404) {
                                                                        swal("Oops", 'Página solicitada no encontrada [404]', "error");
                                                                    } else if (jqXHR.status == 500) {
                                                                        swal("Oops", 'Error interno del servidor [500].', "error");
                                                                    } else if (textStatus === 'parsererror') {
                                                                        swal("Oops", 'El análisis JSON solicitado ha fallado.', "error");
                                                                    } else if (textStatus === 'timeout') {
                                                                        swal("Oops", 'Error de tiempo de espera.', "error");
                                                                    } else if (textStatus === 'abort') {
                                                                        swal("Oops", 'Solicitud de Ajax abortada.', "error");
                                                                    } else {
                                                                        swal("Oops", 'Error no detectado:' + jqXHR.responseText, "error");
                                                                    }

                                                                });
                                                            }
                                                            function deleteitem(input) {
                                                                var data = {
                                                                    id_idioma: $(input).data("idioma"),
                                                                    name: $(input).data("name")
                                                                };
                                                                swal({
                                                                    title: "¿Desea continuar con la eliminacion del registro?",
                                                                    text: "Presiona aceptar para continuar..",
                                                                    icon: "warning",
                                                                    buttons: {
                                                                        cancel: {
                                                                            text: "Cancelar",
                                                                            value: true,
                                                                            visible: true,
                                                                            className: 'btn btn-danger',
                                                                        },
                                                                        Registrar: {
                                                                            text: "Aceptar",
                                                                            value: "Eliminar",
                                                                            className: 'btn btn-primary',
                                                                        }
                                                                    },
                                                                }).then((value) => {
                                                                    switch (value) {
                                                                        case "Eliminar":

                                                                            $.get('./EliminarIdiomaLenguas.fautapo', data, function (data)
                                                                            {
                                                                                if (data.status === "success") {
                                                                                    var item = document.getElementById(data.id);
                                                                                    item.parentNode.removeChild(item);
                                                                                } else {
                                                                                    swal("Oops", 'Tuvimos problemas con servidor espere un momento por favor.', "error");
                                                                                }
                                                                            }).fail(function (jqXHR, textStatus, errorThrown) {
                                                                                if (jqXHR.status === 0) {
                                                                                    swal("Oops", 'No conectarse: Verifique la red.', "error");
                                                                                } else if (jqXHR.status == 404) {
                                                                                    swal("Oops", 'Página solicitada no encontrada [404]', "error");
                                                                                } else if (jqXHR.status == 500) {
                                                                                    swal("Oops", 'Error interno del servidor [500].', "error");
                                                                                } else if (textStatus === 'parsererror') {
                                                                                    swal("Oops", 'El análisis JSON solicitado ha fallado.', "error");
                                                                                } else if (textStatus === 'timeout') {
                                                                                    swal("Oops", 'Error de tiempo de espera.', "error");
                                                                                } else if (textStatus === 'abort') {
                                                                                    swal("Oops", 'Solicitud de Ajax abortada.', "error");
                                                                                } else {
                                                                                    swal("Oops", 'Error no detectado:' + jqXHR.responseText, "error");
                                                                                }

                                                                            });
                                                                            break;
                                                                        default:
                                                                    }
                                                                });
                                                            }
        </script>
    </body>
</html>