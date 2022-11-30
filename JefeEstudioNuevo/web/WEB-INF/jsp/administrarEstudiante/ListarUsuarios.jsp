<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head> 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="imagetoolbar" content="no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META name="_csrf" content="${_csrf.token}"/>
        <META name="_csrf_header" content="${_csrf.headerName}"/>
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Administrar Usuarios Estudiante</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <c:if test="${result !=null}">
                        <div class="alert ${result.status} alert-dismissible fade show" role="alert">
                            <strong>Aviso!</strong> ${result.message}.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-title-w-btn"> 
                            <a class="btn btn-primary icon-btn" href="<c:url value="/estudiante/FormularioRegistroEstudiante.fautapo"><c:param name="accion" value="add"/></c:url>"><i class="fa fa-plus"></i>Nuevo</a>
                            </div>
                            <div class="row"> 
                                <form class="col" name="forma" id="forma" method='GET' action="${pageContext.request.contextPath}/estudiante/listarUsuariosFiltrar.fautapo"> 
                                <input type="hidden" name="pagina" value='<c:out value="${model.pagina}"/>' >
                                <input type="hidden" name="id_usuario_estudiante" value='<c:out value="${model.id_usuario_estudiante}"/>' >
                                <input type="hidden" name="nro_pagina" value="<c:out value="${model.nro_pagina}"/>" >
                                <div class="row">
                                    <div class="col">
                                        <label class="form-label" for="form1">Buscar usuario</label>
                                        <div class="input-group mb-3">
                                            <input type="search" name="nombreUsuario" class="form-control" value="${model.nombreUsuario}" />
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form> 
                        </div>
                        <div class="row">
                            <div class="col">
                                <nav aria-label="paginacion">
                                    <ul class="pagination">
                                        <c:if test='${model.pagina > 1}'>
                                            <li class="page-item text-right"><a class="page-link" href="<c:url value="/estudiante/listarUsuariosFiltrar.fautapo"><c:param name="pagina" value="1"/><c:param name="nombreUsuario" value="${model.nombreUsuario}"/><c:param name="nro_pagina" value="${model.nro_pagina}"/></c:url>"> &lt;&lt; Primera P&aacute;gina</a></li>
                                            <li class="page-item text-right"><a class="page-link" href="<c:url value="/estudiante/listarUsuariosFiltrar.fautapo"><c:param name="pagina" value="${model.pagina - 1}"/><c:param name="nombreUsuario" value="${model.nombreUsuario}"/><c:param name="nro_pagina" value="${model.nro_pagina}"/></c:url>">&lt; Anterior</a></li>
                                            </c:if> 
                                        <li class="page-item text-right"><a class="page-link" href="<c:url value="/estudiante/listarUsuariosFiltrar.fautapo"><c:param name="pagina" value="${model.pagina+1}"/><c:param name="nombreUsuario" value="${model.nombreUsuario}"/><c:param name="nro_pagina" value="${model.nro_pagina}"/></c:url>" >Siguiente ></a></li>
                                        </ul>
                                    </nav> 
                                </div>
                            </div>
                            <div class="tile-body">
                                <div class="table-responsive">
                                    <table id="tablagrupo" class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nro</th><th>USUARIO</th><th>PERSONA</th>
                                                <th>CORREO</th><th>CELULAR</th><th>MODIFICAR</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="lista" items="${lUsuarios}" varStatus="contador">
                                            <tr>
                                                <td class="text-center"><c:out value="${contador.count}"/></td>
                                                <td><c:out value = "${lista.id_usuario_estudiante}"/></td>
                                                <td><c:out value = "${lista.nombre_completo}"/></td> 
                                                <td><c:out value = "${lista.correo}"/></td>
                                                <td>${lista.celular}</td>
                                                <td>
                                                    <div class="dropdown">
                                                        <button class="btn bg-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            Acciones
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="<c:url value="/estudiante/ConfirmarBorrado.fautapo"><c:param name="accion" value="${lista.nombre_completo}"/><c:param name="id_usuario_estudiante" value="${lista.id_usuario_estudiante}"/><c:param name="id_persona" value="${lista.id_persona}"/></c:url>">Eliminar Usuario</a>
                                                            <a class="dropdown-item" href="<c:url value="/estudiante/FormularioRegistroEstudiante.fautapo"><c:param name="accion" value="edit"/><c:param name="id_usuario_estudiante" value="${lista.id_usuario_estudiante}"/><c:param name="id_persona" value="${lista.id_persona}"/></c:url>">Cambiar Contrase&#241;a</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/sweetalert.min.js'/>"></script>
        <script>
            $(".alert").delay(4000).slideUp(1000, function () {
                $(this).alert('close');
            });
        </script>
    </body>
</html>