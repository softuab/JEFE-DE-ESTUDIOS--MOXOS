<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableResponsive.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/CardProfile.css'/>"> 
    </head>
    <body class="app sidebar-mini rtl">
        <c:if test="${!empty id_rol}">
            <main id="contenedor" class="app-content3">
                <div class="app-title">
                    <div>
                        <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                        <p>${sigla} - ${materia} GRUPO ${grupo} </p>
                        <p><c:out value="${programa}"/> </p>
                        <p>
                            <b>Usuario:</b> &nbsp;&nbsp;${usermoodle.moodle_username}<br/>
                            <b>Contraseña:</b>&nbsp;&nbsp;<span id="pass1">********************</span><button id="pass641" data-pass="${usermoodle.moodle_passwordbase64}" data-encode="false" class="btn btn-light btn-sm" onClick = "mostrarpassword(1, this)"><i id="icon1" class="fas fa-eye"></i> </button>
                            <button  class="btn btn-primary btn-sm" id="formaActualizar1" data-persona="<c:out value="${usermoodle.id_persona_moxos}"/>" data-indice="1"   onclick="modificarpassword(this)" >Cambiar contraseña</button>  
                        </p>
                    </div>
                    <ul class="app-breadcrumb breadcrumb">
                        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                        <li class="breadcrumb-item">${fase}</li>
                    </ul>
                </div>

                <div class="row">
                    <div class="col-sm-12"> 
                        <div class="tile">
                            <div class="row">
                                <div class="col">
                                    <c:if test="${mensajeerror != null}"> 
                                        <form name="forma" action="<c:url value="/CrearCurso.fautapo"/>" method="POST">
                                            <input type=hidden name="id_materia"      value="<c:out value="${id_materia}"/>"> 
                                            <input type=hidden name="id_grupo"         value="<c:out value="${id_grupo}"/>"> 
                                            <input type=hidden name="id_programa"            value="<c:out value="${id_programa}"/>">
                                            <input type=hidden name="gestion"           value="<c:out value="${gestion}"/>">
                                            <input type=hidden name="periodo"              value="<c:out value="${periodo}"/>">    
                                            <input type=hidden name="id_docente"        value="<c:out value="${id_docente}"/>">
                                            <input type=hidden name="apellidos"            value="<c:out value="${persona.paterno} ${persona.materno}"/>">
                                            <input type=hidden name="nombres" value="<c:out value="${persona.nombres}"/>">
                                            <input type=hidden name="id_persona"    value="<c:out value="${persona.id_persona}"/>">
                                            <input type=hidden name="correo"            value="<c:out value="${persona.correo}"/>">
                                            <input type=hidden name="programa"            value="<c:out value="${programa}"/>">
                                            <input type=hidden name="materia"         value="<c:out value="${materia}"/>">
                                            <input type=hidden name="sigla"   value="<c:out value="${sigla}"/>">
                                            <input type=hidden name="grupo"   value="<c:out value="${grupo}"/>">
                                            <button type="submit" class="btn btn-primary" id="btncrear"><i class="fas fa-plus"></i> Crear curso moodle</button> 
                                        </form>
                                    </c:if>
                                </div>
                            </div> 
                            <c:if test="${mensajeerror != null}">
                                <div class="row">
                                    <div class="col">
                                        <div class="Card-Informacion">
                                            <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                                <div class="card-header"><i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;AVISO !!</div>
                                                <div class="card-body text-secondary"> 
                                                    <p class="card-text"> 
                                                        No existe cursos creados para mostrar
                                                    </p>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>  
                            </c:if>
                            <c:if test="${mensajeerror == null}">
                                <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;Matricular Docente</span>
                                <div id="contenido" class="row">
                                    <div class="col"> 
                                        <div id="no-more-tables">  
                                            <table class="col-md-12 table-bordered table-striped table-condensed cf">
                                                <thead class="cf">
                                                    <tr>  
                                                        <th>NOMBRE DEL CURSO</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="asignacion" items="${cursosmoodle}" varStatus="contador">
                                                        <tr>  
                                                            <td data-title="NOMBRE DEL CURSO">
                                                                <b>Facultad: </b><c:out value="${asignacion.facultad}"/><br>
                                                                <b>Carrera: </b><c:out value="${asignacion.programa}"/><br>
                                                                <b>Materia: </b><c:out value="${asignacion.materias}"/><br>
                                                                <b>Paralelo: </b><c:out value="${asignacion.grupo}"/><br>
                                                                <b>Gestion: </b><c:out value="${asignacion.gestion}"/><br>
                                                                <b>Periodo: </b> <c:out value="${asignacion.periodo}"/><br>
                                                                <b>Detalle curso moodle: </b><a href="http://sistemas.uabjb.edu.bo/CursosPregrado" target="_blank"><c:out value="${asignacion.moodle_detallecurso}"/></a><br>
                                                                <c:if test="${asignacion.matricular}">
                                                                    <button type="button" class="btn btn-primary"  
                                                                            data-username="${usermoodle.moodle_username}"
                                                                            data-idnumber="${persona.id_persona}"
                                                                            data-idcurso="${asignacion.id_moodle_cursos}"
                                                                            data-idcursomoodle="${asignacion.id_cursos_moodle}"
                                                                            id="load${contador.index}" onclick="matricularmaestro('${contador.index}');" data-loading="<i class='fas fa-spinner fa-spin'></i> Matriculando">Matricular</button>
                                                                </c:if>
                                                            </td>
                                                        </tr> 
                                                    </c:forEach>
                                                </tbody>
                                            </table> 
                                        </div>

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

                    <div class="modal fade" id="idmodificarusuario">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Actualizar contraseña</h4>
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                </div>
                                <!-- Modal body -->
                                <div id="content" class="modal-body">

                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                                    <button type="button" id="guardardatos" class="btn btn-primary" data-bibliografia="update">Guardar Cambios</button>
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
        <script src="<c:url value="/Public/Js/jquery.base64.min.js"/>"></script> 
        <script>
                                                                                document.oncontextmenu = function () {
                                                                                    return false;
                                                                                }
                                                                                function matricularmaestro(id)
                                                                                {
                                                                                    var $this = $("#load" + id);
                                                                                    $this.html($this.data('loading'));
                                                                                    $this.prop("disabled", true);
                                                                                    var name = "load" + id;
                                                                                    
                                                                                    var data = {
                                                                                        username: $this.data('username'),
                                                                                        idnumber: $this.data('idnumber'),
                                                                                        idcurso: $this.data('idcurso'),
                                                                                        idcursomoodle: $this.data('idcursomoodle')
                                                                                    };
                                                                                    $.ajax({
                                                                                        type: "post",
                                                                                        url: "./MatricularCursoDocente.fautapo",
                                                                                        data: data,
                                                                                        success: function (response) {
                                                                                            if (response.error === 'none') {
                                                                                                document.getElementById(name).className = "btn btn-success";
                                                                                                $this.html('Matriculado con exito');
                                                                                            } else {
                                                                                                swal("Oops", response.error, "error");
                                                                                                document.getElementById(name).className = "btn btn-danger";
                                                                                                $this.html('Matriculado sin exito');
                                                                                            }
                                                                                        },
                                                                                        error: function (data) {
                                                                                            switch (true) {
                                                                                                case (data.status === 200):
                                                                                                    swal("Oops", 'Tu sesión ha expirado', "error");
                                                                                                    document.getElementById(name).className = "btn btn-danger";
                                                                                                    $this.html('Matriculado sin exito');
                                                                                                    break;
                                                                                                case (data.status >= 500 && data.status < 600):
                                                                                                    swal("Oops", 'Ocurrió un error interno en el servidor.', "error");
                                                                                                    document.getElementById(name).className = "btn btn-danger";
                                                                                                    $this.html('Matriculado sin exito');
                                                                                                    break;
                                                                                                case (data.status === 0):
                                                                                                    swal("Oops", "Oops", 'No es posible conectar con el servidor, revisa tu conexión de internet.', "error");
                                                                                                    document.getElementById(name).className = "btn btn-danger";
                                                                                                    $this.html('Matriculado sin exito');
                                                                                                    break;
                                                                                                default:
                                                                                                    swal("Oops", 'Error desconocido de pantalla', "error");
                                                                                                    document.getElementById(name).className = "btn btn-danger";
                                                                                                    $this.html('Matriculado sin exito');
                                                                                                    break;
                                                                                            }
                                                                                        }
                                                                                    });
                                                                                }
                                                                                function mostrarpassword(id, input)
                                                                                {
                                                                                    var encode = $(input).data("encode");
                                                                                    if (encode) {
                                                                                        var getval = $(input).data("pass");
                                                                                        var result = $.base64.encode(getval);
                                                                                        $(input).data("pass", result);
                                                                                        $("#pass" + id).text("********************");
                                                                                        $(input).data("encode", false);
                                                                                        $("#icon" + id).removeClass("fas fa-eye-slash");
                                                                                        $("#icon" + id).addClass("fas fa-eye");
                                                                                    } else {
                                                                                        var getval = $(input).data("pass");
                                                                                        var result = $.base64.decode(getval);
                                                                                        $(input).data("pass", result);
                                                                                        $("#pass" + id).text(result);
                                                                                        $(input).data("encode", false);
                                                                                        $("#icon" + id).removeClass("fas fa-eye");
                                                                                        $("#icon" + id).addClass("fas fa-eye-slash");
                                                                                        $(input).data("encode", true);
                                                                                    }
                                                                                }
                                                                                function modificarpassword(input) {
                                                                                    var data = {
                                                                                        id_persona: $(input).data("persona"),
                                                                                        indice: $(input).data("indice")
                                                                                    };
                                                                                    $.get('./ModificarUsuario.fautapo', data, function (data)
                                                                                    {
                                                                                        $('#content').html(data);
                                                                                        AbrirModal("#idmodificarusuario");
                                                                                    });
                                                                                }
                                                                                function AbrirModal(id)
                                                                                {
                                                                                    $(id).modal({
                                                                                        keyboard: false
                                                                                    });
                                                                                }
                                                                                $("#guardardatos").on("click", function () {
                                                                                    var data = {
                                                                                        idnumber: $("#idnumber").val(),
                                                                                        password: $("#repetircontrasenia").val(),
                                                                                        firstname: $("#firstname").val(),
                                                                                        lastname: $("#lastname").val(),
                                                                                        email: $("#email").val(),
                                                                                        id: $("#iduser").val(),
                                                                                        usuario: $("#usernamemoodle").val(),
                                                                                        indice: $("#indice").val()
                                                                                    };
                                                                                    $.ajax({
                                                                                        type: "post",
                                                                                        url: "./GuardarCambios.fautapo",
                                                                                        data: data,
                                                                                        success: function (response) {
                                                                                            $("#idmodificarusuario .close").click();
                                                                                            $("#pass" + response.indice).html(response.password);
                                                                                            $("#pass64" + response.indice).data("pass", $.base64.encode(response.password));
                                                                                            var name = "icon" + response.indice;
                                                                                            document.getElementById(name).className = "fas fa-eye-slash";
                                                                                        }
                                                                                    });
                                                                                });
        </script>
    </body>
</html>
