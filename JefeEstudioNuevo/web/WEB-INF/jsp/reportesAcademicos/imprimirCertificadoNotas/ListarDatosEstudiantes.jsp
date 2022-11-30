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
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>"> 
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Imprimir Certificado de Notas</h1>
                    <p>GESTION: <c:out value='${gestion}'/> PERIODO: <c:out value='${periodo}'/> PROGRAMA: <c:out value='${datosPrograma.programa}'/> </p>
                    <p>NRO. CERTIFICACION: <c:out value='${nrocertificado}'/> OBSERVACION: <c:out value='${observacion}'/></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="title-body">
                            <div class="table-responsive">
                                <table id="tablaMateria" class="table table-hover table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>RU</th>
                                            <th>DIP</th>
                                            <th>NOMBRES</th>
                                            <th>PROGRAMA</th> 
                                            <th>VER</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
                                            <!-- ********** Esto es para el efecto ************ -->
                                            <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                    <!-- ********** Fin  efecto ************ --> 
                                                    <td><c:out value="${datos.id_estudiante}"/></td>
                                                <td><c:out value="${datos.dip}"/></td>        
                                                <td><c:out value="${datos.paterno}"/>&nbsp;<c:out value="${datos.materno}"/>&nbsp;<c:out value="${datos.nombres}"/></td>
                                                <td><c:out value="${datos.programa}"/></td>
                                                <td>
                                                    <form name=forma<c:out value="${contador.count}"/> method="POST" action="<c:url value="/listarCertificadoNotas1.fautapo"/>">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                        <input type="hidden" name="id_estudiante"        value="<c:out value="${datos.id_estudiante}"/>"/> 
                                                        <input type="hidden" name="gestion"              value='<c:out value="${gestion}"/>' >
                                                        <input type="hidden" name="periodo"              value='<c:out value="${periodo}"/>' >
                                                        <input type="hidden" name="nrocertificado"              value='<c:out value="${nrocertificado}"/>' >
                                                        <input type="hidden" name="observacion"              value='<c:out value="${observacion}"/>' >
                                                        <input type="hidden" name="id_programa"          value='<c:out value="${id_programa}"/>' >
                                                        <input type="hidden" name="todas"                value="<c:out value='${todas}'/>"> 
                                                    </form>
                                                    <a  class="btn btn-primary" href="javascript: document.forma<c:out value="${contador.count}"/>.submit()">Ver datos</a>
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
        <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
    </body>

</html>