<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/bootstrap.duallistbox.css'/>" rel="stylesheet">
    </head>
    <body class="app sidebar-mini rtl">
        <c:if test="${!empty id_rol}">
            <main id="contenedor" class="app-content3">
                <div class="app-title">
                    <div>
                        <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                        <p> ${materia} </p>
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
                                    <c:if test="${mensajeerror == null}">
                                        <form id="demoform">
                                            <select multiple="multiple" size="30" name="duallistbox_demo1[]" title="duallistbox_demo1[]">
                                                <c:set var="contadorA" value="1"/>
                                                <c:forEach var="datos" items="${listaNotas.pageList}" varStatus="contador"> 
                                                    <option value='${datos.ru}-${datos.nombres}-${datos.usuario}-${datos.id_persona}-${datos.registrado?1:0}-${datos.registradomoodle?1:0}'>${datos.nombres_completos}</option>  
                                                </c:forEach>   
                                            </select>  
                                            <input type="hidden" id="periodo"      value="<c:out value="${periodo}"/>">    
                                            <input type="hidden" id="gestion"     value="<c:out value="${gestion}"/>">
                                            <input type="hidden" id="id_programa"        value="<c:out value="${id_programa}"/>">
                                            <input type="hidden" id="materia"      value="<c:out value="${materia}"/>">
                                            <input type="hidden" id="idcurso"      value="<c:out value="${idcurso}"/>">
                                            <input type="hidden" id="idcursomoodle"      value="<c:out value="${idcursomoodle}"/>">
                                            <input type="hidden" id="id_grupo"      value="<c:out value="${id_grupo}"/>">
                                            <input type="hidden" id="id_materia"      value="<c:out value="${id_materia}"/>">
                                            <button id="enviarregistro" data-loading="<i class='fas fa-spinner fa-spin'></i> Matriculando" type="submit" class="btn btn-primary btn-block">Matricular</button>
                                        </form>
                                        <form id="idlistaestudiantes" action="<c:url value='/ListarEstudiantesMatriculados.fautapo'/>"  method='post'>
                                            <input type="hidden" name="fase"      value="<c:out value="${datosAsignacion.fase}"/>"> 
                                            <input type="hidden" name="nombres"      value="<c:out value="${nombres}"/>"> 
                                            <input type="hidden" name="programa"      value="<c:out value="${programa}"/>"> 
                                            <input type="hidden" name="periodo"      value="<c:out value="${periodo}"/>">    
                                            <input type="hidden" name="gestion"     value="<c:out value="${gestion}"/>">
                                            <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
                                            <input type="hidden" name="materia"      value="<c:out value="${materia}"/>">
                                            <input type="hidden" name="idcurso"      value="<c:out value="${idcurso}"/>">
                                            <input type="hidden" name="idcursomoodle"      value="<c:out value="${idcursomoodle}"/>">
                                            <input type="hidden" name="id_grupo"      value="<c:out value="${id_grupo}"/>">
                                            <input type="hidden" name="id_materia"      value="<c:out value="${id_materia}"/>">
                                        </form>
                                    </c:if>
                                </div>
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
        <script src="<c:url value='/Public/Js/plugins/bootstrap-notify.min.js'/>"></script>
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script> 
        <script src="<c:url value="/Public/Js/jquery.bootstrap-duallistbox.js"/>"></script>  
        <script>
            var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox({
                moveOnSelect: false
            });
            $("#demoform").submit(function (e) {
                e.preventDefault();
                var value = $('[name="duallistbox_demo1[]"]').val();
                var $this = $("#enviarregistro");
                $this.html($this.data('loading'));
                $this.prop("disabled", true);
                var res = value.toString().split(",");

                var jsonArray = [];
                for (i = 0; i < res.length; i++) {
                    var resjson = res[i].split("-");
                    var data = {
                        ru: resjson[0],
                        nombres: resjson[1],
                        usuario: resjson[2],
                        id_persona: resjson[3],
                        registrado: resjson[4], 
                        registradomoodle: resjson[5]
                    };
                    jsonArray.push(data);

                }
                var myJSON = JSON.stringify(jsonArray);
                var data = {
                    seleccionados: myJSON,
                    idcursomoodle: $("#idcursomoodle").val(),
                    idcurso: $("#idcurso").val(),
                    id_programa: $("#id_programa").val(),
                    materia: $("#materia").val(),
                    gestion: $("#gestion").val(),
                    periodo: $("#periodo").val(),
                    id_grupo: $("#id_grupo").val(),
                    id_materia: $("#id_materia").val()
                };
                $.ajax({
                    type: "post",
                    url: "<c:url value='/MatricularEstudianteMateria.fautapo'/>",
                    dataType: "json",
                    success: function (response) {
                        if (response.error == "") {
                            $("#idlistaestudiantes").submit();
                        } else {
                            swal("Error!", response.mensaje, "error");
                        }
                    },
                    data: data
                });

                return false;
            }
            );
        </script>
    </body>
</html>

