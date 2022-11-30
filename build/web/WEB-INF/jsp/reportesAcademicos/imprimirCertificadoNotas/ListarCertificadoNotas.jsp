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
    <body background="<c:url value='/imagenes/uabcdc4.jpg'/>">
        <main class="app-content3">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <section class="invoice">
                            <form name="fvolver" action="listarProgramasPlanes.fautapo" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="id_programa"        value="<c:out value='${datosPrograma.id_programa}'/>" >
                                <input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
                                <input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">
                                <input type="hidden" name="todas"              value="<c:out value='${todas}'/>">
                                <input type="hidden" name="nrocertificado"            value="<c:out value='${nrocertificado}'/>">
                                <input type="hidden" name="observacion"            value="<c:out value='${observacion}'/>">
                                <div class="row mb-4">
                                    <div class="col-2 ">
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
                                <hr>
                                <div class="row mb-4">
                                    <div class="col text-center">
                                        <h2 style="text-align: center;">CERTIFICADO DE CALIFICACIONES</h2>
                                    </div>
                                </div>
                                <div class="row invoice-info">
                                    <div class="col-6">
                                        <address>
                                            <strong>Facultad::</strong><c:out value="${datosFacultad.facultad}"/><br>
                                            <strong>Carrera::</strong><c:out value="${datosPrograma.programa}"/><br>
                                            <strong>Apellidos y Nombres::</strong> <c:out value="${datosEstudiante2.paterno}"/> &nbsp;
                                            <c:out value="${datosEstudiante2.materno}"/> &nbsp;
                                            <c:out value="${datosEstudiante2.nombres}"/><br>
                                            <strong>C.I.:: </strong><c:out value="${datosEstudiante2.dip}"/>
                                        </address>
                                    </div>
                                    <div class="col-6">
                                        <address>
                                            <strong>NRO.:: </strong><c:out value="${nrocertificado}"/><br>
                                            <strong>Nivel:: </strong><c:out value="${datosGrados.grado_academico}"/><br>
                                            <strong>Plan:: </strong><c:out value="${datosEstudiante2.id_plan}"/><br>
                                            <c:if test="${todas=='Si'}">
                                                <c:if test="${datosPrograma.id_periodo==1}">
                                                    <td><b><font size="2">Periodo Acádemico</font></b></td>
                                                    <td><font size="2"><c:out value="${periodo}"/>/<c:out value="${gestion}"/> </font></td>        
                                                </c:if>    <br>
                                                <c:if test="${datosPrograma.id_periodo==2}">
                                                    <td><b><font size="2">Gestión Acádemica</font></b></td>
                                                    <td><font size="2"><c:out value="${gestion}"/></font></td>        
                                                    </c:if>    
                                                </c:if><br>
                                            <c:if test="${todas=='No'}">
                                                <td><b><font size="2">Periodo Acádemico</font></b></td>
                                                <td><font size="2"><c:out value="${gestion}"/></font></td><br>        
                                                <tr> <td><td><td><td><b><font size="2">Curso de Verano</font></b></td></td></td></td></tr>
                                                        </c:if>  
                                        </address>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <p style="left:40px;" ><strong>Por Tanto::</strong><br>
                                            <strong>De acuerdo al Plan de Estudios vigente Curso las siguientes materias</strong></p>
                                    </div> 
                                </div>
                                <div class="row ">
                                    <div class="col">
                                        <div id="no-more-tables">
                                            <table class="table table-striped" border="1">
                                                <thead class="text-center">
                                                    <tr>
                                                        <th><font size="2">SIGLA</font></th>
                                                        <th><font size="2">NIVEL</font></th>
                                                        <th><font size="2">ASIGNATURA</font></th>
                                                        <th><font size="2">NUMERAL</font></th>
                                                        <th><font size="2">LITERAL</font></th>
                                                        <th><font size="2">TIPO EVALUACION</font></th>
                                                        <th><font size="2">OBSERVACION</font></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="lista" items="${lMateriasNotas}" varStatus="contador">
                                                        <tr>
                                                            <td data-title="SIGLA"><c:out value="${lista.sigla}"/></td>
                                                            <td data-title="NIVEL"><font size="2"><c:out value="${lista.nivel_academico}"/></font></td>      
                                                            <td data-title="ASIGNATURA"><c:out value="${lista.materia}"/></td>
                                                            <!-- <c:if test="${lista.tipo_evaluacion != 'Regular'}">
                                                                   <td><font size="2"><c:out value="${lista.materia}  *"/></font></td>
                                                            </c:if>
                                                            <c:if test="${lista.tipo_evaluacion == 'Regular'}">
                                                                      <td><font size="2"><c:out value="${lista.materia}"/></font></td>
                                                            </c:if>	   -->

                                                            <td data-title="NUMERAL"><font size="2"><fmt:formatNumber value="${lista.nota}" pattern = "#"/></font></td>
                                                            <td data-title="LITERAL"><font size="2"><c:out value="${lista.literal}"/></font></td>
                                                            <td data-title="TIPO EVALUACIÓN"><font size="2"><c:out value="${lista.tipo_evaluacion}"/></font></td>
                                                                <c:if test="${lista.nota >= 51}">
                                                                <td data-title="OBSERVACIÓN"><font size="2">Aprobado</font></td>
                                                                </c:if>	 
                                                                <c:if test="${lista.nota < 51}">
                                                                <td data-title="OBSERVACIÓN"><font size="2">Reprobado</font></td>
                                                                </c:if>	 
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- =========================================== CUERPO FECHAS ========================================================== -->
                                    <table width="90%" align="center" border=0>
                                        <tr>
                                            <td width="100%" align="center"><font size="2">&nbsp;<c:out value='${datosInstitucionsede.localidad}'/>, <fmt:formatDate value="${today}" pattern="${formatoFecha}"/></font></td>
                                        </tr>

                                        <c:if test="${observacion!=''}">
                                            <tr>
                                                <td width="100%" ><font size="2"><b>Observacion:</b>&nbsp;<c:out value='${observacion}'/></font></td>
                                            </tr>
                                        </c:if>
                                    </table>
                                </div>
                                <div class="row invoice-info">
                                    <div class="col-6 text-center" width="35%">
                                        <br><br><br><br><br><br><br><br><br>
                                        <div>
                                            <label>____________________________________<p>SELLO</p></label>    
                                        </div>
                                    </div>
                                    <div class="col-6  " width="35%">
                                        <br><br><br><br><br><br><br><br><br>
                                        <div>
                                            <label>____________________________________<p class="text-center">SELLO</p></label>    
                                        </div>
                                    </div>
                                </div>
                                <div class="row invoice-info">
                                    <div class="col-6 text-center" width="35%">
                                        <br><br><br><br><br><br><br><br><br>
                                        <div>
                                            <label>____________________________________<p>SELLO</p></label>    
                                        </div>
                                    </div>
                                    <div class="col-6 responsive" width="35%">
                                        <br><br><br><br><br><br><br><br><br>
                                        <div>
                                            <label>_____________________________________<p class="text-center">SELLO</p></label>    
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <br>

                                        <h6>ADVERTENCIA:</h6> <h4>NO VALIDO PARA TRAMITES</h4>Las raspaduras, anotaciones o enmiendas <b> INVALIDA ESTE DOCUMENTO</b>
                                        <p>Este Certificad para su validez debe llevar el nombre completo del responsable de los archivos de la Jefatura y/o Dirección de Estudios o Carrera,<br>
                                            del Sr. Decano y del Sr. Vicerrector con su respectivos sellos.<br>
                                            <strong>ESCALA VIGENTE DE CALIFICACIONES, 1 A 100 Y SUS VALORES :</strong><br>
                                            1 a 50 = Reprobados; &nbsp;&nbsp;  51 a 63 = Suficiente; &nbsp;&nbsp;  64 a 76 = Bueno; &nbsp;&nbsp; 77 a 89 = Distinguido; &nbsp;&nbsp;  90 a 100 = Sobresaliente.
                                        </p>
                                    </div>
                                </div>
                                <div class="row d-print-none mt-2">
                                    <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-danger" href="<c:url value="/imprimirCertificadoNotas/entrada.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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