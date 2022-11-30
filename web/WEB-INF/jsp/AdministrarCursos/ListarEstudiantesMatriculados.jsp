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
        <main id="contenedor" class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                    <p>${materia} </p>
                    <p><c:out value="${programa}"/> </p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">${fase}</li>
                </ul>
            </div>

            <div class="row">
                <div class="col-sm-12"> 
                    <div class="tile">   
                        <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;Lista de Estudiantes Matriculados</span>
                        <div id="contenido" class="row">
                            <div class="col"> 
                                <div id="no-more-tables">  
                                    <table class="col-md-12 table-bordered table-striped table-condensed cf">
                                        <thead class="cf">
                                            <tr>  
                                                <th>NOMBRE COMPLETO</th>
                                                <th>USUARIO</th>
                                                <th>CONTRASEÑA</th> 
                                                <th>ADMINISTRACION</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="asignacion" items="${cursosmoodle}" varStatus="contador">
                                                <tr>  
                                                    <td data-title="NOMBRE DEL CURSO">
                                                        <b>Estudiante: </b><c:out value="${asignacion.moodle_nombres_usuario} ${asignacion.moodle_apellidos_usuario}"/><br>
                                                        <b>Facultad: </b><c:out value="${asignacion.facultad}"/><br>
                                                        <b>Carrera: </b><c:out value="${asignacion.programa}"/><br>
                                                        <b>Materia: </b><c:out value="${asignacion.materias}"/><br>
                                                        <b>Paralelo: </b><c:out value="${asignacion.grupo}"/><br>
                                                        <b>Gestion: </b><c:out value="${asignacion.gestion}"/><br>
                                                        <b>Periodo: </b> <c:out value="${asignacion.periodo}"/><br>
                                                        <b>Detalle curso moodle: </b><a href="http://sistemas.uabjb.edu.bo/CursosPregrado" target="_blank"><c:out value="${asignacion.moodle_detallecurso}"/></a><br>
                                                    </td>
                                                    <td data-title="USUARIO">
                                                        <c:if test="${asignacion.moodle_username==''}">
                                                            Sin definir
                                                        </c:if>
                                                        <c:if test="${asignacion.moodle_username!=''}">
                                                            <span id="user${contador.count}"><c:out value="${asignacion.moodle_username}"/></span>
                                                        </c:if>
                                                    </td>
                                                    <td data-title="CONTRASEÑA">
                                                        <span id="pass${contador.count}"><c:out value="${asignacion.moodle_password}"/></span>
                                                    </td>
                                                    <td data-title="ADMINISTRACION">  
                                                        <button  class="btn btn-info" id="formaActualizar${contador.count}" 
                                                                 data-persona="<c:out value="${asignacion.id_persona_moxos}"/>"
                                                                 data-indice="${contador.count}"
                                                                 onclick="modificarpassword(this)" >Cambiar Contraseña</button>  
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
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script> 
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/bootstrap-notify.min.js'/>"></script>
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script> 
        <script src="<c:url value="/Public/App/modificarusuario/modificarusuario.js"/>"></script>  
    </body>
</html>
