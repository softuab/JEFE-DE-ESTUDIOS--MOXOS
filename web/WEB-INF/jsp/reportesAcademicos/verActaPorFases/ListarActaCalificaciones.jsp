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
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp; <c:out value='${datosInstitucion.institucion}'/></h1>
                    <p><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></p>
                    <p><c:out value='${datosInstitucion.actividad}'/></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <section class="invoice">
                            <div class="row mb-4">
                                <div class="col-6">
                                    <h3 class="page-header"> ACTA DE CALIFICACIONES</h3>
                                </div>
                            </div>
                            <div class="row invoice-info">
                                <div class="col-6">
                                    <address>
                                        <strong>TIPO DE ACTA::</strong> <c:out value="${datosFase.fase}"/><br>
                                        <strong>DOCENTE::</strong> <c:out value="${datosDoc.paterno}"/>&nbsp;<c:out value="${datosDoc.materno}"/>&nbsp;<c:out value="${datosDoc.nombres}"/><br>
                                        <strong>SIGLA-MATERIA::</strong> <c:out value="${datosAsignacion.sigla}"/> - <c:out value="${datosAsignacion.materia}"/><br>
                                        <strong>PROGRAMA::</strong>  <c:out value="${datosPrograma.programa}"/><br>
                                        <strong>PLAN ::</strong> <c:out value="${id_plan}"/><br>
                                    </address>
                                </div>
                                <div class="col-6">
                                    <address>
                                        <strong>CODIGO ::</strong> <c:out value="${datosAsignacion.id_docente}"/><br>
                                        <strong>PERIODO ::</strong> <c:out value="${datosAsignacion.periodo}"/> - <c:out value="${datosAsignacion.gestion}"/><br>
                                        <strong>GRUPO::</strong> <c:out value="${datosAsignacion.grupo}"/> <br>
                                        <strong>AREA::</strong> <c:out value="${datosFacultad.facultad}"/> <br>
                                        <strong>NIVEL ACADEMICO::</strong> <c:out value="${datosGrados.grado_academico}"/><br>
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nro</th>
                                                <th>Matricula</th>
                                                <th>R.U.</th>
                                                <th>Apellidos y Nombres</th>
                                                <th>Nota Final</th>      
                                                <th>OBSERVACIONES</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="reprobado" value="0"/>
                                            <c:set var="aprobado" value="0"/>
                                            <c:forEach var="lestudiante" items="${listNotas}" varStatus="contador">
                                                <tr>
                                                    <td><c:out value="${contador.count}"/></td>    
                                                    <td>
                                                        <c:if test="${lestudiante.id_matricula != -1}">
                                                            <c:out value="${lestudiante.id_matricula}"/>
                                                        </c:if>
                                                        <c:if test="${lestudiante.id_matricula == -1}">
                                                            <font color="red"> Estudiante no matriculado </font>
                                                        </c:if>
                                                    </td>    
                                                    <td><c:out value="${lestudiante.id_estudiante}"/></td>    
                                                    <td><c:out value="${lestudiante.nombres}"/></td>    
                                                    <td>
                                                        <c:if test="${lestudiante.nota != -1}">
                                                            <c:out value="${lestudiante.nota}"/>
                                                        </c:if>
                                                        <c:if test="${lestudiante.id_matricula == -1}">
                                                            <font color="red"> Sin Nota</font>
                                                        </c:if>
                                                    </td>    
                                                    <td align="center">
                                                        <c:if test="${lestudiante.nota >= datosPrograma.nota_aprobacion}">
                                                            Aprobado      
                                                            <c:set var="aprobado" value="${aprobado+1}"/>
                                                        </c:if>
                                                        <c:if test="${lestudiante.nota < datosPrograma.nota_aprobacion && lestudiante.nota != 0}">
                                                            Reprobado
                                                            <c:set var="reprobado" value="${reprobado+1}"/>
                                                        </c:if>
                                                        <c:if test="${lestudiante.nota == 0 }">
                                                            Abandono      
                                                            <c:set var="reprobado" value="${reprobado+1}"/>
                                                        </c:if>
                                                    </td>
                                                </tr>  
                                            </c:forEach>    
                                        </tbody>
                                    </table>
                                </div>
                            </div>                            
                            <div class="row d-print-none mt-2">
                                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();"><i class="fa fa-print"></i> Imprimir</a><a class="btn btn-secondary" href="<c:url value="/actaPorFases/verActaCalificaciones.fautapo"/>"><i class="fa fa-ban"></i> Cancelar</a></div>
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
    </body>
</html>
