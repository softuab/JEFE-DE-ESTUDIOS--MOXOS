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
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row mb-4">
                                <div class="col-2">
                                    <img src="<c:url value='/imagenes/logo.png'/>" width="35%;" alt=""/>
                                </div>
                                <div class="col-7">
                                    <h2 style="text-align: center;"><strong>UNIVERSIDAD AUT&Oacute;NOMA DEL BENI <br />&ldquo;JOS&Eacute; BALLIVI&Aacute;N&rdquo;</strong></h2>
                                    <h3 style="text-align: center;"><strong>TRINIDAD - BENI - BOLIVIA</strong></h3>
                                </div>
                                <div class="col-3">
                                    <c:set var="today" value="<%=new Date()%>"/>
                                    <h5 class="text-right">Fecha : <fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col text-center">
                                    <h3 style="text-align: center;">N&Uacute;MERO DE MATRICULADOS</h3>
                                    <h3 style="text-align: center;">Periodo::<c:out value="${periodo}"/> - <c:out value="${gestion}"/></h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div id="no-more-tables">
                                        <table  class="table table-striped" border="1" cf>
                                            <thead  class="cf">
                                                <tr>
                                                    <th>NRO.</th>
                                                    <th>FACULTAD</th>
                                                    <th>PROGRAMA</th>
                                                    <th>EST.MATRICULADOS</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="total" value="0"/>
                                                <c:forEach var="lestudiante" items="${lEstudiantes}" varStatus="contador">
                                                    <tr>          
                                                        <td data-title="NRO."><c:out value="${contador.count}"/></td>   
                                                        <td data-title="FACULTAD"><c:out value="${lestudiante.facultad}"/></td>		  
                                                        <td data-title="PROGRAMA"><c:out value="${lestudiante.programa}"/></td>
                                                        <td data-title="EST. MATRICULADOS"><c:out value="${lestudiante.cantidad}"/></td>
                                                        <c:set var="total" value="${total+lestudiante.cantidad}"/>
                                                        <c:set var="cont" value="1"/>
                                                        </td>            
                                                    </tr>   	
                                                </c:forEach> 
                                            </tbody>
                                            <tr>
                                                <td class="colb" colspan="3">
                                                    TOTAL MATRICULADOS:
                                                </td>
                                                <td class="colb">
                                                    <c:out value="${total}"/> Matriculados
                                                </td> 
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a>
                                    <a class="btn btn-danger" href="<c:url value="/nroEstudiantesMatriculados/Entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
                            </div>
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
    </body>
</html>