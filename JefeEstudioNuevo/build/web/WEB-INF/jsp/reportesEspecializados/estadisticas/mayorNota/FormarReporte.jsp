<%@page import="java.util.Date"%>
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableResponsive.css'/>">
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <section class="invoice">
                            <c:if test="${fn:length(datos)>0}">
                                <div class="row md-4">
                                    <div class="col-2">
                                        <img src="<c:url value='/imagenes/logo.png'/>" width="35%;" alt=""/>
                                    </div>
                                    <div class="col-7">
                                        <h2 style="text-align: center;"><strong>UNIVERSIDAD AUT&Oacute;NOMA DEL BENI <br />&ldquo;JOS&Eacute; BALLIVI&Aacute;N&rdquo;</strong></h2>
                                        <h3 style="text-align: center;"><strong>TRINIDAD - BENI - BOLIVIA</strong></h3>
                                    </div>
                                    <div class="col-3">
                                        <c:set var="today" value="<%=new Date()%>"/>
                                        <h5 class="text-right">Fecha :<fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                    </div>
                                </div>
                                <hr>
                                <div class="row mb-4">
                                    <div class="col text-center">
                                        <h3 style="text-align: center;">ESTUDIANTES CON LA MAYOR NOTA</h3>
                                    </div>
                                </div>
                                <div class="row md-4">
                                    <div class="col-6">
                                        <address>
                                            <strong>Area:: </strong><c:out value="${datosFacultad.facultad}"/><br>
                                            <strong>Tipo de Evaluaci&oacute;n :: </strong><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/><br>
                                            <strong>Periodo ::</strong> <c:out value="${periodo}"/> - <c:out value="${gestion}"/>
                                        </address>
                                    </div>
                                    <div class="col-6">
                                        <address>
                                            <strong>Programa ::</strong> <c:out value="${programa.programa}"/><br>
                                            <strong>Plan :: </strong> <c:out value="${datosPrgPlan.id_plan}"/>
                                        </address>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div id="no-more-tables">
                                            <table class="table table-striped" border="1" cf>
                                                <thead class="cf">
                                                    <tr>
                                                        <c:forEach var="lista" items="${etiquetas}" varStatus="contador2" begin="${desde}">
                                                            <th><c:out value="${etiquetas[contador2.index]}" escapeXml="False"/></th>
                                                            </c:forEach>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach varStatus="filas" begin="0" end="${fn:length(datos)-1}">
                                                        <tr>
                                                            <c:forEach var="lista1" items="${etiquetas}" varStatus="columnas" begin="${desde}">
                                                                <c:out value='${datos[filas.index][columnas.index]}' escapeXml='false'/>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div> 
                                <div class="row d-print-none mt-2">
                                    <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/estadisticaEspecializada/mayorNota/listarCondiciones.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
                                </div>
                            </c:if>
                            <c:if test="${fn:length(datos)==0}">
                                <div class="container">
                                    <div class="Card-Informacion">
                                        <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                            <div class="card-header text-center"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;AVISO</div>
                                            <div class="card-body text-secondary">
                                                <p class="card-text text-center">
                                                    No hay registros para mostrar<br><br>
                                                    <a class="btn btn-primary" href="#" id="btnsalir">Volver</a>
                                                </p>
                                                <form method="post" id="frmsalir" modelAttribute="modal" action="${pageContext.request.contextPath}/estadisticaEspecializada/mayorNota/listarCondicionesVolver.fautapo">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </section>
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
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>