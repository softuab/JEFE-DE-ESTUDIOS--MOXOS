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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Convalidaci&oacute;n Manual</h1>
                    <p>RU: <c:out value="${datosEstudiante.id_estudiante}"/> Nombres: <c:out value="${datosEstudiante.paterno}"/> &nbsp; <c:out value="${datosEstudiante.materno}"/> &nbsp; <c:out value="${datosEstudiante.nombres}"/></p>
                </div>
            </div>
        </main>
    </body>

    <%@ include file="../../Superior.jsp" %>

    <div class="titulo">Convalidaci&oacute;n Manual</div>
    <div class="volver"><a href="javascript:history.back();">Volver</a></div>
    <br>

    <form method="post" action=<c:url value="/convalidacionManual/registrarMateriasConvalidar.fautapo"/> >
        <table class="tabla">
            <tr>
                <th class=colh>RU </th>
                <th class=colh>NOMBRES</th>
                <th class=colh>PLAN</th>
                <th class=colh>PROGRAMA</th>
                <th class=colh>GESTION</th>
                <th class=colh>PERIODO</th>
            </tr>  
            <tr>
                <td class=colb><c:out value="${datosEstudiante.id_estudiante}"/></td>
                <td class=colb><c:out value="${datosEstudiante.paterno}"/> &nbsp; <c:out value="${datosEstudiante.materno}"/> &nbsp; <c:out value="${datosEstudiante.nombres}"/></td>
                <td class=colb><c:out value="${datosEstudiante.id_plan}"/></td>
                <td class=colb><c:out value="${datosEstudiante.programa}"/></td>
                <td class=colb><c:out value="${gestion}"/></td>
                <td class=colb><c:out value="${periodo}"/></td>
            <tr>  
        </table>
        <br>
        <table class="tabla">
            <tr>
                <th colspan="2" align="center">
                    CONFIRMAR MATERIAS
                </th>
            </tr>    
            <tr>
                <td align="center">
                    <table class="tabla" width="60%">
                        <tr>
                            <th colspan="2">DATOS A CONVALIDAR</th>
                        </tr>    
                        <tr>
                            <td class="etiqueta">R.U. ::</th>
                            <td><c:out value="${datosEstudiante.id_estudiante}"/></td>
                        </tr>
                        <tr>
                            <td class="etiqueta">Tipo de Convalidaci&oacute;n ::</th>
                            <td><c:out value="${buscarTipoConv.tipo_convalidacion}"/>
                            </td>
                        </tr>
                        <c:if test="${buscarTipoConv.id_tipo_convalidacion ==1}" >
                            <tr>
                                <td class="etiqueta">Universidad <font color='red'>(*)</font>::</th>
                                <td>
                                    <c:out value="${datosUniv.universidad}"/>
                                    <input type="hidden" name="id_universidad" value="<c:out value="${datosUniv.id_universidad}"/>">
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${buscarTipoConv.id_tipo_convalidacion ==2}" >
                            <tr>
                                <td class="etiqueta">Programa <font color='red'>(*)</font> ::</td>
                                <td>
                                    <c:out value="${datosPrograma.programa}"/>
                                    <input type="hidden" name="id_programa" value="<c:out value="${datosPrograma.id_programa}"/>">
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${buscarTipoConv.id_tipo_convalidacion ==3}" >
                            <tr>
                                <td class="etiqueta">Plan Origen <font color='red'>(*)</font> ::</td>
                                <td>
                                    <c:out value="${plan_origen}"/>
                                    <input type="hidden" name="plan_origen" value="<c:out value="${plan_origen}"/>">
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td class="etiqueta">Resoluci&oacute;n <font color='red'>(*)</font> ::</td>
                            <td><c:out value="${resolucion}"/>
                                <input type="hidden" name="resolucion" value="<c:out value="${resolucion}"/>">
                            </td>
                        </tr> 
                    </table>
                </td>
            </tr>
            <tr>    
                <td>  
                    <table class="tabla" width="100%">
                        <tr>
                            <th>NRO.</th>
                            <th>SIGLA <br> ORIGEN</th>
                            <th>MATERIA <br> ORIGEN</th>
                            <th>SIGLA<br>ACTUAL</th>
                            <th>MATERIA<br>ACTUAL</th>
                            <th>MODALIDAD<br></th>
                            <th>% SIMILITUD</th>
                            <th>NOTA</th>
                            <th>GESTION</th>
                            <th>PERIODO</th>
                        </tr>
                        <c:forEach var="lista" items="${lMateriasSeleccionadas}" varStatus="contador">
                            <tr>
                                <td><c:out value="${contador.count}"/></td>
                                <td><c:out value="${lista.sigla_origen}"/><input type="hidden" name="sigla_origen<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.sigla_origen}"/>">
                                </td>
                                <td><c:out value="${lista.materia_origen}"/>
                                    <input type="hidden" name="materia_origen<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.materia_origen}"/>"></td>
                                <td><c:out value="${lista.sigla}"/></td>
                                <td><c:out value="${lista.materia}"/>
                                    <input type="hidden" name="id_materia_conv" value="<c:out value="${lista.id_materia}"/>">
                                </td>
                                <td><c:out value='${lista.tipo_materia}'/>
                                    <input type="hidden" name="id_tipo_materia<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.id_tipo_materia}'/>">
                                </td>
                                <td><c:out value='${lista.similitud}'/>
                                    <input type="hidden" name="similitud<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.similitud}'/>">
                                </td>

                                <td><c:out value='${lista.nota_origen}'/>
                                    <input type="hidden" name="nota_origen<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.nota_origen}'/>">
                                </td>
                                <td><c:out value="${gestion}"/></td>
                                <td><c:out value="${periodo}"/></td>
                            </tr>  
                        </c:forEach>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" value="Guardar" class="agregar" >
                    <input type="hidden" name="id_estudiante"  value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
                    <input type="hidden" name="gestion"  value="<c:out value="${gestion}"/>" >
                    <input type="hidden" name="periodo"  value="<c:out value="${periodo}"/>" >
                    <input type="hidden" name="id_tipo_convalidacion"  value="<c:out value="${buscarTipoConv.id_tipo_convalidacion}"/>" >
                </td>
            </tr>
        </table>       
    </form>

    <script language="JavaScript">
        //Esto es para el calendario
        var calFormat = "<c:out value='${formatoFecha}'/>";
        //Fin para calendario
        var variables = new Array();
        h = 0;
        function fguardar()
        {
            if ((document.forma.id_plan.value != 0) && (document.forma.id_programa.value != 0) && (document.forma.nombres.value != "") && (document.forma.dip.value != "") && (document.forma.direccion.value != "") && (document.forma.fec_nacimiento.value != "") &&
                    (document.forma.id_tipo_sexo.value != "") && (document.forma.id_tipo_estado_civil.value != "") && (document.forma.id_tipo_empresa_telefonica.value != "") &&
                    (document.forma.id_tipo_institucion.value != 0) && (document.forma.id_colegio.value != 0) && (document.forma.id_tipo_turno.value != 0) &&
                    (document.forma.id_tipo_grado.value != "") && (document.forma.id_tipo_admision.value != "") && (document.forma.id_tipo_clasificacion.value != "") && (document.forma.id_tipo_estudiante.value != "") && (document.forma.anio_titulacion.value != "") && (document.forma.id_tipo_descuento.value != "")
                    )
            {
                document.forma.submit();
            } else
            {
                alert("Los campos con (*), son obligatorios");
            }
        }
        iniciar();
    </script>

    <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   
    <%@ include file="../../Inferior.jsp" %>