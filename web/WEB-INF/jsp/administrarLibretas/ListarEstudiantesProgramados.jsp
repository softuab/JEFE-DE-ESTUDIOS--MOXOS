<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page isELIgnored="false" %>
<compress:html>
    <!DOCTYPE html>
    <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="imagetoolbar" content="no">
            <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
            <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
            <META http-equiv="expires" content="0" />
            <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
            <title>Sistema Integrado -  Moxos</title>  
            <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
            <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
            <link href="<c:url value='/Public/TableEditFormat/excel-bootstrap-table-filter-style.css'/>" rel="stylesheet"/>
            <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>">
            <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/CardProfile.css'/>">
            <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableData.css'/>">
            <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/RadioStyle.css'/>" > 
            <link rel="stylesheet" type="text/css" href="<c:url value='/Public/TableEditFormat/tableX.css'/>" rel="stylesheet">

        </head>
        <body class="app sidebar-mini rtl" onload="getLocation()">
            <c:if test="${!empty id_rol}">
                <main id="contenedor" class="app-content3">
                    <div class="app-title">
                        <div>
                            <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                            <p>${datosAsignacion.sigla} - ${materia} GRUPO ${datosAsignacion.grupo} </p>
                            <p><c:out value="${programa}"/> </p>
                        </div>
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                            <li class="breadcrumb-item">${datosAsignacion.fase}</li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-sm-12"> 
                            <div class="tile">
                                <span class="d-block p-2 bg-primary text-white"><i class="fas fa-edit"></i> &nbsp; Administrar Libretas :&nbsp;<c:out value="${datosAsignacion.tipo_evaluacion}"/></span>
                                <div class="row">
                                    <div class="col">
                                        <form id="forma1" name="forma1" method="post">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="inputGroupSelect01">Tipo evaluacion</label>
                                                </div>
                                                <select class="custom-select" name="id_tipo_nota_s" id="idtipodenota">
                                                    <option value=""> Seleccionar Tipo evaluacion </option>
                                                    <c:forEach var = "items" items = "${listaItems}">
                                                        <c:choose>
                                                            <c:when test = "${items.id_tipo_nota == id_tipo_nota}">
                                                                <option  selected value="<c:out value="${items.id_lbr_tipo_nota}"/>:<c:out value="${items.cantidad}"/>"> <c:out value="${items.cantidad}"/> - <c:out value="${items.tipo_nota}"/> <c:out value="${items.ponderacion}"/>% </option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="<c:out value="${items.id_lbr_tipo_nota}"/>:<c:out value="${items.cantidad}"/>"> <c:out value="${items.cantidad}"/> - <c:out value="${items.tipo_nota}"/> <c:out value="${items.ponderacion}"/>%</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <input type="hidden" name="id_asignacion"      value="<c:out value="${datosAsignacion.id_asignacion}"/>">    
                                            <input type="hidden" name="id_tipo_nota_s"     value="<c:out value="${id_tipo_nota_s}"/>">
                                            <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
                                            <input type="hidden" name="id_tipo_grado"      value="<c:out value="${id_tipo_grado}"/>">

                                            <input type="hidden" name="id_materia"         value="<c:out value="${datosAsignacion.id_materia}"/>">
                                            <input type="hidden" name="id_grupo"           value="<c:out value="${datosAsignacion.id_grupo}"/>">
                                            <input type="hidden" name="id_departamento"    value="<c:out value="${datosAsignacion.id_departamento}"/>">
                                            <input type="hidden" name="id_fase"            value="<c:out value="${datosAsignacion.id_fase}"/>">
                                            <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosAsignacion.id_tipo_evaluacion}"/>">
                                            <input type="hidden" name="id_modelo_ahorro"   value="<c:out value="${datosAsignacion.id_modelo_ahorro}"/>">
                                            <input type="hidden" name="materia"            value="<c:out value="${datosAsignacion.materia}"/>">
                                            <input type="hidden" name="gestion"            value="<c:out value="${datosAsignacion.gestion}"/>">
                                            <input type="hidden" name="periodo"            value="<c:out value="${datosAsignacion.periodo}"/>"> 
                                        </form> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div id="alert" class="alert alert-danger invisible" role="alert"></div>
                                    </div>
                                </div>
                                <c:if test="${id_tipo_nota != null && mensajeerror == null}">
                                    <div id="contenido" class="row">
                                        <div class="col">
                                            <c:if test="${mensajeerror != null}">
                                                <div class="Card-Informacion">
                                                    <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                                        <div class="card-header"><i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;AVISO !!</div>
                                                        <div class="card-body text-secondary"> 
                                                            <p class="card-text"> 
                                                                <c:out value="${mensajeerror}"/><br/>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>   
                                            </c:if>
                                            <div id="data-tables" class="table-responsive">
                                                <table id="tablenotas" class="tableX  table-bordered table-striped table-resizable table-condensed table-hover ">
                                                    <thead>
                                                        <tr>	
                                                            <th rowspan="2">No.</th>
                                                            <th rowspan="2">R.U.</th>
                                                            <th rowspan="2">NOMBRE COMPLETO</th>
                                                                <c:forEach var="cantNotas" items="${numItems}" varStatus="contador">
                                                                <th>NOTA <c:out value="${contador.count}"/></th> 
                                                                </c:forEach>
                                                        </tr>  
                                                    </thead>
                                                    <tbody>
                                                        <!-- LISTA DE ESTUDIANTES, EVALUACION REGULAR  -->	
                                                        <c:if test="${id_tipo_grado == 1 && id_tipo_evaluacion != '2'}"> 	
                                                            <c:set var="contadorA" value="1"/>
                                                            <c:forEach var="datos" items="${listaNotas.pageList}" varStatus="contador">
                                                                <c:if test="${!empty datos.notas}">
                                                                    <tr>
                                                                        <td><c:out value="${contadorA}"/></td>
                                                                        <td><c:out value="${datos.id_estudiante}"/></td> 
                                                                        <td><c:out value="${datos.nombres}"/></td> 

                                                                        <c:set var="contadorB" value="1"/> 
                                                                        <c:forEach var="notas" items="${datos.notas}">
                                                                            <c:if test="${notas.nro_nota != nro_nota}">
                                                                                <td data-nronota="${contadorB}" data-estado="${notas.permitidomodificar}" data-nota="${notas.nota}" data-idestudiante="${datos.id_estudiante}" ><c:out value="${notas.nota}"/></td>
                                                                                <c:set var="contadorB" value="${contadorB+1}"/>
                                                                            </c:if>
                                                                        </c:forEach>    
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${!empty datos.notas}">
                                                                    <c:set var="contadorA" value="${contadorA+1}"/>
                                                                </c:if>
                                                            </c:forEach>    
                                                        </c:if>
                                                        <!-- LISTA DE ESTUDIANTES, EVALUACION CONTINUA  -->	
                                                        <c:if test="${id_tipo_grado == 1 && id_tipo_evaluacion == 2}"> 	
                                                            <c:set var="contadorA" value="1"/>
                                                            <c:forEach var="datos" items="${listaNotas.pageList}" varStatus="contador">
                                                                <tr>
                                                                    <c:if test="${!empty datos.notas}">
                                                                        <td><c:out value="${contadorA}"/></td>
                                                                        <td><c:out value="${datos.id_estudiante}"/></td> 
                                                                        <td><c:out value="${datos.nombres}"/></td> 
                                                                    </c:if>
                                                                    <c:set var="contadorB" value="1"/>                                                                
                                                                    <c:forEach var="notas" items="${datos.notas}">
                                                                        <c:if test="${notas.nro_nota != nro_nota}">
                                                                            <td data-nronota="${contadorB}" data-estado="${notas.permitidomodificar}" data-nota="${notas.nota}" data-idestudiante="${datos.id_estudiante}"><c:out value="${notas.nota}"/> </td>
                                                                            <c:set var="contadorB" value="${contadorB+1}"/>
                                                                        </c:if>
                                                                    </c:forEach>    
                                                                </tr>
                                                                <c:if test="${!empty datos.notas}">
                                                                    <c:set var="contadorA" value="${contadorA+1}"/>
                                                                </c:if>
                                                            </c:forEach>    
                                                        </c:if>    	 
                                                        <!-- LISTA DE POSTULANTES  -->	
                                                        <c:if test="${id_tipo_grado == 2}"> 	
                                                            <c:set var="contadorA" value="1"/>
                                                            <c:forEach var="datos" items="${listaNotas.pageList}" varStatus="contador">
                                                                <!-- ********** Esto es para el efecto ************ -->
                                                                <tr>
                                                                    <!-- ********** Fin  efecto segunda instancia************ --> 
                                                                    <c:if test="${!empty datos.notas}">
                                                                        <td><c:out value="${contadorA}"/></td>
                                                                        <td><c:out value="${datos.id_postulante}"/></td> 
                                                                        <td><c:out value="${datos.nombres}"/></td> 
                                                                    </c:if> 
                                                                    <c:set var="contadorB" value="1"/>
                                                                    <c:forEach var="notas" items="${datos.notas}">
                                                                        <c:if test="${notas.nro_nota != nro_nota}">
                                                                            <td data-nronota="${contadorB}" data-estado="${notas.permitidomodificar}" data-nota="${notas.nota}" data-idestudiante="${datos.id_estudiante}"><c:out value="${notas.nota}"/> </td>
                                                                            <c:set var="contadorB" value="${contadorB+1}"/>
                                                                        </c:if>
                                                                    </c:forEach>    
                                                                </tr>
                                                                <c:if test="${!empty datos.notas}">
                                                                    <c:set var="contadorA" value="${contadorA+1}"/>
                                                                </c:if>
                                                            </c:forEach>    
                                                        </c:if>
                                                    </tbody>
                                                </table> 
                                            </div>
                                            <input type="hidden" id="id_asignacion"      value="<c:out value="${datosAsignacion.id_asignacion}"/>">    
                                            <input type="hidden" id="id_tipo_nota_s"     value="<c:out value="${id_tipo_nota_s}"/>">
                                            <input type="hidden" id="id_programa"        value="<c:out value="${id_programa}"/>">
                                            <input type="hidden" id="id_tipo_grado"      value="<c:out value="${id_tipo_grado}"/>">
                                            <input type="hidden" id="ubicacion" name="ubicacion"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col text-right">
                                            <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Presione para ir hacia arriba" data-toggle="tooltip" data-placement="left"><i class="fas fa-chevron-circle-up"></i></a>
                                            </a>
                                        </div>
                                    </div>

                                </c:if>
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
            <script src="<c:url value='/Public/Js/plugins/bootstrap-notify.min.js'/>"></script>
            <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script>
            <script src="<c:url value="/Public/TableEditFormat/jQuery.resizableColumns.js"/>"></script>
            <script src="<c:url value="/Public/TableEditFormat/excel-bootstrap-table-filter-bundle.js"/>"></script>
            <script src="<c:url value="/Public/TableEditFormat/tableX.js"/>"></script>
            <script src="<c:url value="/Public/App/Listarestudiantesprogramados/mainlistarestudiantesprogramados.js"/>"></script>
            <script src="<c:url value='/Public/Js/Blob.min.js'/>" ></script>
            <script src="<c:url value='/Public/Js/FileSaver.min.js'/>" ></script>
            <script src="<c:url value='/Public/Js/xls.core.min.js'/>" ></script>
            <script src="<c:url value='/Public/Js/tableexport.js'/>" ></script>
            <script>
            document.oncontextmenu = function () {
                return false;
            }
            $("#tablenotas").tableExport({
                formats: ["xlsx", "csv"], //Tipo de archivos a exportar ("xlsx","txt", "csv", "xls")
                position: 'button', // Posicion que se muestran los botones puedes ser: (top, bottom)
                bootstrap: false, //Usar lo estilos de css de bootstrap para los botones (true, false)
                fileName: "ListadoEstudiantes", //Nombre del archivo 
            });

            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition,
                            function (error) {
                                $("#ubicacion").val("nulo");
                                var div = document.createElement("div");
                                div.innerHTML = "<table border=0 cellspacing=0 cellpadding=0><tr><td width=100% valign=top ><p align=center><span ><img style='text-align: center;' width=48 height=48 src='<c:url value='/imagenes/Locationicon.png'/>'></span></p><p align=center><span style='font-size:28.0pt;color:red'>AVISO</span></b></p></td></tr><tr><td><p  ALIGN='justify'>Por seguridad al acceder al sistema académico - Moxos en su modulo Docente debe activar el acceso a su geolocalizacion; para detectar accesos indebidos. <a href=''>para mas informacion haga click</a></p> </td></tr></table>";
                                swal({
                                    content: div,
                                    type: "warning"
                                });
                            },
                            {timeout: 30000, enableHighAccuracy: true, maximumAge: 75000});
                } else {
                    $("#ubicacion").val("nulo");
                    var div = document.createElement("div");
                    div.innerHTML = "<table border=0 cellspacing=0 cellpadding=0><tr><td width=100% valign=top ><p align=center><span ><img style='text-align: center;' width=48 height=48 src='<c:url value='/imagenes/Locationicon.png'/>'></span></p><p align=center><span style='font-size:28.0pt;color:red'>AVISO</span></b></p></td></tr><tr><td><p  ALIGN='justify'>La geolocalizacion no esta soportado por el navegador. debe actualizar su navegador en su dispositivo. <a href=''>para mas informacion haga click</a></p> </td></tr></table>";
                    swal({
                        content: div,
                        type: "warning"
                    });
                }
            }
            function showPosition(position) {
                var x = "Latitude: " + position.coords.latitude + " - Longitude: " + position.coords.longitude;
                $("#ubicacion").val(x);
                $('#anuncio').modal('show');
            }
            </script>
        </body>
    </html>
</compress:html>
