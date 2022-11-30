<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">
        <link rel="stylesheet" href="<c:url value='/Public/Css/tabs.css'/>" >   
        <link href="<c:url value='/Public/Css/Loader.css'/>" rel="stylesheet"/>
    </head>
    <body class="app sidebar-mini rtl">
        <div class="preloader-background">
            <div class="loader">
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
            </div>
        </div>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                    <p>Detalle de Programa Analitico ${periodo}/${gestion} </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div>
                            <table class="col-md-12 table-bordered table-condensed cf">
                                <thead class="thead-dark cf text-center">
                                    <tr class="table-info">
                                        <th colspan="2">DATOS DOCENTE</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td width="40%">FACULTAD:</td>
                                        <td width="60%"><c:out value="${programaAnalitico.facultad}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">CARRERA:</td>
                                        <td width="60%"><c:out value="${programaAnalitico.departamento}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">ASIGNATURA:</td>
                                        <td width="60%"><c:out value="${programaAnalitico.sigla}"/> - <c:out value="${programaAnalitico.materia}"/></td>
                                    </tr>
                                    <tr>
                                        <td  width="40%">DOCENTE:</td>
                                        <td width="60%"><c:out value="${programaAnalitico.nombres}"/> <c:out value="${programaAnalitico.paterno}"/> <c:out value="${programaAnalitico.materno}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">CELULAR:</td>
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.celular}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">CORREO:</td>
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.correo}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">GESTION ACADEMICA:</div>
                                        <td width="60%"><c:out value="${periodo}"/> / <c:out value="${gestion}"/></td>
                                    </tr>
                                </tbody>
                            </table>  
                        </div>
                        <div>
                            <table class="col-md-12 table-bordered table-condensed cf">
                                <thead class="thead-dark cf text-center">
                                    <tr class="table-info">
                                        <th colspan="2">DATOS MATERIA</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td width="40%">AREA</td>
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.area}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">SIGLA ASIGNATURA</td>
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.sigla}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">NIVEL (AÑO O SEMESTRE)</td> 
                                        <td width="60%"><c:out value="${nivel_academico}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">CICLO</td>  
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.tipo_materia}"/></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">PRE-REQUISITO</td>
                                        <td width="60%">${htmlrequisito}</td>
                                    </tr>
                                    <tr>
                                        <td width="40%">HORAS TEORICAS/SEMANA</td> 
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.hrs_teoricas}"/> Hrs.</td>
                                    </tr>
                                    <tr>
                                        <td width="40%">HORAS PRACTICAS/SEMANA</td> 
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.hrs_practicas}"/> Hrs.</td>
                                    </tr>
                                    <tr>
                                        <td width="40%">TOTAL HORAS ACADEMICAS/SEMANA</td> 
                                        <td width="60%"><c:out value="${programaAnaliticoDatosMateria.hrs_teoricas + programaAnaliticoDatosMateria.hrs_practicas}"/> Hrs.</td>
                                    </tr>                                    
                                    <tr>
                                        <td width="40%">TOTAL HORAS TRABAJADAS/SEMANA</td> 
                                        <td width="60%"><c:out value="${(programaAnaliticoDatosMateria.hrs_teoricas + programaAnaliticoDatosMateria.hrs_practicas)*4 }"/> Hrs.</td>
                                    </tr>
                                    <tr>
                                        <td width="40%">TOTAL HORAS ACADEMICAS/SEMESTRE</td> 
                                        <td width="60%"><c:out value="${(programaAnaliticoDatosMateria.hrs_teoricas + programaAnaliticoDatosMateria.hrs_practicas)*19}"/> Hrs.</td>
                                    </tr>
                                    <tr>
                                        <td width="40%">TOTAL HORAS TRABAJADAS/SEMESTRE</td> 
                                        <td width="60%"></td>
                                    </tr>
                                    <tr>
                                        <td width="40%">TOTAL CREDITOS</td>  
                                        <td width="60%"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col">
                                <form method='post' action="<c:url value='RegistrarProgramaAnalitico.fautapo'/>">  
                                    <input type=hidden name="id_docente"    value="<c:out value="${id_docente}"/>">
                                    <input type=hidden name="id_persona"    value="<c:out value="${id_persona}"/>">
                                    <input type=hidden name="id_asignacion"    value="<c:out value="${id_asignacion}"/>">
                                    <input type=hidden name="id_plan"    value="<c:out value="${id_plan}"/>">
                                    <input type=hidden name="id_grupo"    value="<c:out value="${id_grupo}"/>">
                                    <input type=hidden name="id_materia"    value="<c:out value="${id_materia}"/>">
                                    <input type=hidden name="gestion"    value="<c:out value="${gestion}"/>">
                                    <input type=hidden name="periodo"    value="<c:out value="${periodo}"/>">
                                    <input type=hidden name="nombres"    value="<c:out value="${nombres}"/>">
                                    <input type=hidden name="materia"    value="<c:out value="${materia}"/>">
                                    <input type=hidden name="grupo"    value="<c:out value="${grupo}"/>">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Detalle grado academico(M. Sc. Ing.)</label>
                                        <input type="text" class="form-control" name="nro_resolucion" placeholder="M. Sc. Ing.">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Perfil Académico y Laboral.</label>
                                        <textarea class="form-control" name="observacion" rows="3"></textarea>
                                    </div>
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-primary">Elaborar Programa Analitico</button>
                                    </div>
                                </form>
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
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                $('.preloader-background').delay(1700).fadeOut('slow');
                $('.loader').delay(1700).fadeOut();
            });
        </script>
    </body>
</html>
