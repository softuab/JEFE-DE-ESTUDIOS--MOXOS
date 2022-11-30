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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Descargar Documentacion Docente</h1>
                    <p>${usuario}</p>
                    <p>${programa.programa}</p>
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
                            <a class="btn bg-primary text-white" href="<c:url value="/Documentos/DescargarDocumentosCarrera.fautapo"><c:param name="id_programa" value="${model.id_programa}"/><c:param name="gestion" value="${model.gestion}"/><c:param name="periodo" value="${model.periodo}"/></c:url>"><i class="fas fa-download"></i> Descargar Documentos</a>
                        </div>
                        <div class="row"> 
                            <form class="col" name="forma" id="forma" method='GET' action="${pageContext.request.contextPath}/Documentos/listarDocentesFiltrar.fautapo"> 
                                <input type="hidden" name="pagina" value='<c:out value="${model.pagina}"/>' >
                                <input type="hidden" name="id_docente" value='<c:out value="${model.id_docente}"/>' >
                                <input type="hidden" name="nro_pagina" value="<c:out value="${model.nro_pagina}"/>" >
                                <input type="hidden" name="gestion" value="<c:out value="${model.gestion}"/>" >
                                <input type="hidden" name="periodo" value="<c:out value="${model.periodo}"/>" >
                                <input type="hidden" name="id_programa" value="<c:out value="${model.id_programa}"/>" >
                                <div class="row">
                                    <div class="col">
                                        <label class="form-label" for="form1">Buscar usuario</label>
                                        <div class="input-group mb-3">
                                            <input type="search" name="nombre_completo" class="form-control" value="${model.nombre_completo}" />
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
                                            <li class="page-item text-right"><a class="page-link" href="<c:url value="/Documentos/listarDocentesFiltrar.fautapo"><c:param name="pagina" value="1"/><c:param name="nombre_completo" value="${model.nombre_completo}"/><c:param name="nro_pagina" value="${model.nro_pagina}"/><c:param name="gestion" value="${model.gestion}"/><c:param name="periodo" value="${model.periodo}"/><c:param name="id_programa" value="${model.id_programa}"/> </c:url>"> &lt;&lt; Primera P&aacute;gina</a></li>
                                            <li class="page-item text-right"><a class="page-link" href="<c:url value="/Documentos/listarDocentesFiltrar.fautapo"><c:param name="pagina" value="${model.pagina - 1}"/><c:param name="nombre_completo" value="${model.nombre_completo}"/><c:param name="nro_pagina" value="${model.nro_pagina}"/><c:param name="gestion" value="${model.gestion}"/><c:param name="periodo" value="${model.periodo}"/><c:param name="id_programa" value="${model.id_programa}"/> </c:url>">&lt; Anterior</a></li>
                                            </c:if> 
                                        <li class="page-item text-right"><a class="page-link" href="<c:url value="/Documentos/listarDocentesFiltrar.fautapo"><c:param name="pagina" value="${model.pagina+1}"/><c:param name="nombre_completo" value="${model.nombre_completo}"/><c:param name="nro_pagina" value="${model.nro_pagina}"/><c:param name="gestion" value="${model.gestion}"/><c:param name="periodo" value="${model.periodo}"/><c:param name="id_programa" value="${model.id_programa}"/> </c:url>" >Siguiente ></a></li>
                                        </ul>
                                    </nav> 
                                </div>
                            </div>
                            <div class="tile-body">
                                <div class="table-responsive">
                                    <table id="tablagrupo" class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>NRO</th>
                                                <th>CARNET</th>
                                                <th>NOMBRE COMPLETO</th>
                                                <th>DESCARGAR</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="lista" items="${lDocentes}" varStatus="contador">
                                            <tr>
                                                <td class="text-center"><c:out value="${contador.count}"/></td>
                                                <td><c:out value = "${lista.dip}"/></td>
                                                <td><c:out value = "${lista.nombre_completo}"/></td> 
                                                <td>
                                                    <a class="btn bg-primary text-white" href="<c:url value="/Documentos/DescargarDocumentos.fautapo"><c:param name="id_persona" value="${lista.id_persona}"/><c:param name="dip" value="${lista.dip}"/></c:url>"><i class="fas fa-download"></i></a>
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