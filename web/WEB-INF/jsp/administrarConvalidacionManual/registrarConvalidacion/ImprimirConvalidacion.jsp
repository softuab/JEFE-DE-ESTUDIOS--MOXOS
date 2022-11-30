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
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableResponsive.css'/>">
    </head>
    <body>
        <main class="app-content3">
            <di class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <section class="invoice">
                            <form method="post" action=<c:url value="/convalidacionManual/registrarMateriasConvalidar.fautapo"/> >
                                <div class="row mb-4">
                                    <div class="col-2">
                                        <img src="<c:url value='/imagenes/logo.png'/>" width="35%;" alt=""/>
                                    </div>
                                    <div class="col-7" id="cont1"  width = "100%"  align="center">
                                        <h2 style="text-align: center;"><strong>UNIVERSIDAD AUT&Oacute;NOMA DEL BENI <br />&ldquo;JOS&Eacute; BALLIVI&Aacute;N&rdquo;</strong></h2>
                                    </div>                                   
                                    <div class="col-3">
                                        <c:set var="today" value="<%=new Date()%>"/>
                                        <h5 class="text-right">Fecha : <fmt:formatDate value="${today}" pattern="${formatoFecha}"/></a> </h5>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col text-center">
                                        <h2 style="text-align: center;">CERTIFICADO DE CALIFICACIONES</h2>
                                    </div>
                                </div>
                                <hr>
                                <div class="row mb-4">
                                    <div class="col ">
                                        <table width = "90%" height= "20%" border = 0>
                                            <tr>
                                                <td P ALIGN= justify><font size="2">La carrera de <c:out value="${datosEstudiante.programa}"/> de la Universidad Autónoma del Beni 
                                                    "José Ballivián", certifica que: La(s) materia(s) a continuacion ha(n) sido convalidada(s) en el periodo <c:out value="${periodo}"/>/<c:out value="${gestion}"/>
                                                    mediante Resolucion de Carrera Nº<c:out value="${resolucion}"/> a favor 
                                                    de <c:out value="${datosEstudiante.paterno}"/>&nbsp; <c:out value="${datosEstudiante.materno}"/>&nbsp; <c:out value="${datosEstudiante.nombres}"/> 
                                                    procedente <c:if test="${buscarTipoConv.id_tipo_convalidacion ==1}" >
                                                        de la <c:out value="${datosUniv.universidad}"/>.
                                                    </c:if>
                                                    <c:if test="${buscarTipoConv.id_tipo_convalidacion ==2}" >
                                                        de la Carrera de <c:out value="${datosPrograma.programa}"/>.
                                                    </c:if>
                                                    <c:if test="${buscarTipoConv.id_tipo_convalidacion ==3}" >
                                                        del Plan Origen <c:out value="${plan_origen}"/>.
                                                    </c:if>
                                                </td>

                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div id="no-more-tables">
                                            <table class="table table-striped" border="1">
                                                <thead class="text-center">
                                                    <tr>
                                                        <th><font size="2">Nº</font></th>
                                                        <th><font size="2">Sigla Origen</font></th>
                                                        <th><font size="2">Nombre Materia Origen</font></th>
                                                        <th><font size="2">Nota</font></th> 
                                                        <th><font size="2">Sigla</font></th>	
                                                        <th><font size="2">Convalidada Por</font></th>
                                                        <th><font size="2">Porcentaje</font></th>
                                                        <th><font size="2">Modalidad</font></th>  
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="lista" items="${lMateriasSeleccionadas}" varStatus="contador">
                                                        <tr>
                                                            <td data-title="Nº" align="center"><c:out value="${contador.count}"/></td>
                                                            <td data-title="Sigla Origen"><c:out value="${lista.sigla_origen}"/><input type="hidden" name="nota_origen<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.nota_origen}'/>">
                                                            <td data-title="Nombre Materia Origen"><c:out value="${lista.materia_origen}"/><input type="hidden" name="materia_origen<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.materia_origen}"/>"></td>
                                                            <td data-title="Nota" align="center"><c:out value='${lista.nota_origen}'/><input type="hidden" name="nota_origen<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.nota_origen}'/>">
                                                            <td data-title="Sigla"><c:out value="${lista.sigla}"/><input type="hidden" name="sigla_origen<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.sigla_origen}"/>"></td>
                                                            <td data-title="Convalidada Por"><c:out value="${lista.materia}"/><input type="hidden" name="materia_origen<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.materia_origen}"/>"></td>
                                                            <td data-title="Porcentaje" align="center"><c:out value='${lista.similitud}'/><input type="hidden" name="nota_origen<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.nota_origen}'/>">%</td>

                                                            <c:if test="${lista.id_tipo_materia ==1}" >
                                                                <td data-title="Modalidad">SEMESTRAL</td>
                                                            </c:if>
                                                            <c:if test="${lista.id_tipo_materia ==2}" >
                                                                <td data-title="Modalidad">ANUAL</td>
                                                            </c:if>
                                                            <c:if test="${lista.id_tipo_materia ==3}" >
                                                                <td data-title="Modalidad">VESTIBULAR</td>
                                                            </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row invoice-info">
                                    <div class="col-6 text-center" width="35%">
                                        <br><br><br><br><br><br><br><br><br>
                                        <div>
                                            <label class="control-label">____________________________________<p>Director de Carrera</p></label>    
                                        </div>
                                    </div>
                                    <div class="col-6 " width="35%">
                                        <br><br><br><br><br><br><br><br><br>
                                        <div>
                                            <label class="control-label">____________________________________<p class="text-center">Vice-Rector de Pregrado</p></label>    
                                        </div>
                                    </div>
                                </div>
                                <div class="row d-print-none mt-2">
                                    <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a> <a class="btn btn-secondary" href="<c:url value='/convalidacionManual/entrada.fautapo'/>"><i class="fa fa-ban"></i> Cancelar</a></div>
                                </div>
                            </form>
                        </section>
                    </div>
                </div>
            </di>
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