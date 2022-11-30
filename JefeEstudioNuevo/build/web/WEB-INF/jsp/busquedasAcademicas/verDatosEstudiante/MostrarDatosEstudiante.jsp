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
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp;Ver Datos Del Estudiante</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table class="table table-bordered " width="100%">
                                    <tr>
                                        <th class="bg-dark text-white"> DATOS GENERALES</th>
                                        <th class="bg-dark text-white"> DATOS PROGRAMA </th>
                                        <th class="bg-dark text-white"> FOTO ESTUDIANTE</th>
                                    </tr>
                                    <tr>
                                        <td width="40%">
                                            <table class="table table-hover  table-striped" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Ap. Paterno</th>
                                                        <th>Ap. Materno</th>
                                                        <th>Nombres</th>
                                                    </tr>
                                                </thead> 
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosPrs.paterno}'/></td>
                                                        <td><c:out value='${datosPrs.materno}'/></td>
                                                        <td><c:out value='${datosPrs.nombres}'/></td>
                                                    </tr>
                                                </tbody>
                                                <thead>
                                                    <tr>
                                                        <th>DIP</th>
                                                        <th>Sexo</th>
                                                        <th>Estado Civil</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosPrs.dip}'/></td>
                                                        <td><c:out value='${datosEstudiante.tipo_sexo}'/></td>
                                                        <td><c:out value='${datosEstudiante.tipo_estado_civil}'/></td>
                                                    </tr>
                                                </tbody>
                                                <thead>
                                                    <tr>
                                                        <th>Domicilio</th>
                                                        <th>Tel&eacute;fono</th>
                                                        <th>Correo</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosPrs.direccion}'/></td>
                                                        <td><c:out value='${datosPrs.telefono}'/></td>
                                                        <td><c:out value='${datosPrs.correo}'/></td>
                                                    </tr>
                                                </tbody>
                                                <thead>
                                                    <tr>
                                                        <th>Celular</th>
                                                        <th>Empresa Telef&oacute;nica</th>
                                                        <th>Grupo Sanguineo</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosPrs.celular}'/></td>
                                                        <td><c:out value='${datosEstudiante.tipo_empresa_telefonica}'/></td>
                                                        <td><c:out value='${datosPrs.tipo_sanguineo}'/></td>
                                                    </tr>
                                                </tbody>
                                                <tr>
                                                    <th class="bg-dark text-white"> Lugar de Nacimiento</th>
                                                </tr>
                                                <thead>
                                                    <tr>
                                                        <th>Pa&iacute;s Nac.</th>
                                                        <th>Departamento Nac.</th>
                                                        <th>Provincia Nac.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosEstudiante.pais}'/></td>
                                                        <td><c:out value='${datosEstudiante.departamento}'/></td>
                                                        <td><c:out value='${datosEstudiante.provincia}'/></td>
                                                    </tr> 
                                                </tbody>
                                                <thead>
                                                    <tr>
                                                        <th> Localidad Nac.</th>
                                                        <th> Fecha de Nacimiento</th>
                                                        <th></th>
                                                    </tr> 
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosEstudiante.localidad}'/></td>
                                                        <td><c:out value="${datosPrs.fec_nacimiento}"/></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                                <tr>
                                                    <th class="bg-dark text-white">Datos de Bachillerato</th>
                                                </tr>
                                                <thead>
                                                    <tr>
                                                        <th>Tipo Instituci&oacute;n</th>
                                                        <th>Colegio</th>
                                                        <th>Turno</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosCol.tipo_institucion}'/></td>
                                                        <td><c:out value='${datosCol.colegio}'/></td>
                                                        <td><c:out value='${datosCol.tipo_turno}'/></td>
                                                    </tr>
                                                </tbody>
                                                <thead>
                                                    <tr>
                                                        <th>A&ntilde;o de Bachiller</th>	  
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosCol.anio_egreso}'/></td>	  
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                                <tr>
                                                    <th class="bg-dark text-white">Datos Profesionales</th>
                                                </tr>
                                                <thead>
                                                    <tr>
                                                        <th>Titulo Adquirido</th>
                                                        <th>Universidad</th>	 
                                                        <th></th>	  
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosPrs.titulo}'/></td>	  
                                                        <td><c:out value='${datosPrs.nro_seguro_medico}'/></td>
                                                        <td></td>
                                                    </tr> 
                                                </tbody>
                                                <tr>
                                                    <th class="bg-dark text-white" width="40%">Datos Adicionales</th>
                                                </tr>
                                                <thead>
                                                    <tr>
                                                        <th>Nro. Hijos</th>
                                                        <th>Nro. Dependientes</th>
                                                        <td class="colb"></td>		  
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value='${datosPrs.nro_hijos}'/></td>
                                                        <td><c:out value='${datosPrs.nro_dependientes}'/></td>
                                                        <td></td>
                                                    </tr> 
                                                </tbody>
                                            </table>
                                        </td>
                                        <td valign="top" width="40%">
                                            <table class="table table-hover table-bordered table-striped" width="100%">
                                                <tr>
                                                    <th>Fecha de Inscripci&oacute;n ::</th>
                                                    <td><fmt:formatDate value="${datosEstudiante.fec_inscripcion}" pattern="dd/MM/yyyy"/></td>
                                                </tr>
                                                <tr>
                                                    <th>Programa :: </th>
                                                    <td><c:out value="${datosEstudiante.programa}"/></td>
                                                </tr>
                                                <tr>
                                                    <th> Plan ::</th>
                                                    <td><c:out value="${datosEstudiante.id_plan}"/></td>
                                                </tr>
                                                <tr>
                                                    <th>Tipo Grado :: </th>
                                                    <td><c:out value="${datosEstudiante.tipo_grado}"/></td>
                                                </tr>
                                                <tr>
                                                    <th>Tipo Admisi&oacute;n / Trámite Academico Administrativo ::</th>
                                                    <td><c:out value="${datosEstudiante.tipo_admision}"/></td>
                                                </tr>
                                                <tr>
                                                    <th>Tipo Clasificaci&oacute;n ::</th>
                                                    <td>ACTUAL :: <c:out value="${datosClas.tipo_clasificacion}"/> <br>
                                                        INICIAL :: <c:out value="${datosClas.tipo_clasificacion_inicial}"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Tipo de Estudiante</th>
                                                    <td><c:out value="${datosEstudiante.tipo_estudiante}"/></td>
                                                </tr>
                                                <tr>
                                                    <th  colspan="2"> DATOS <br> MATRICULAS ANTERIORES </th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="table table-hover table-bordered table-striped" width="100%">
                                                            <thead>
                                                                <tr>
                                                                    <th class="bg-dark text-white">NRO </th>
                                                                    <th class="bg-dark text-white">Nro. MATRICULA </th>
                                                                    <th class="bg-dark text-white">GESTION </th>
                                                                    <th class="bg-dark text-white">PERIODO </th>
                                                                    <th class="bg-dark text-white">FECHA </th>
                                                                    <th class="bg-dark text-white">ESTADO<br>DE MATRICULA </th>
                                                                </tr> 
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="lMatricula" items="${lMatriculasEstudiante}" varStatus="contador">
                                                                    <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                                        <td> <c:out value='${contador.count}'/> </td>
                                                                        <td> <c:out value='${lMatricula.id_matricula}'/> </td>
                                                                        <td> <c:out value='${lMatricula.gestion}'/> </td>
                                                                        <td> <c:out value='${lMatricula.periodo}'/> </td>  </td>
                                                                        <td> <fmt:formatDate value='${lMatricula.fec_registro}' pattern='dd/MM/yyyy'/> </td>  </td>
                                                                        <td> <font color="red" > <c:out value='${lMatricula.id_estado}'/></font> </td>  </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" align="center" width="20%">
                                            <table class="table" align="center" width="100%">
                                                <c:forEach var="listaFoto" items="${lImagenes}" varStatus="contador">
                                                    <tr>
                                                        <td align="center">
                                                            <img  src='<c:url value="/"/>adjuntosMi/fotosEstudiantes/<c:out value="${listaFoto.adjunto}"/>' width="100" height="100" border="1"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <th>RU : <c:out value='${datosEstudiante.id_estudiante}'/></th>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                <table class="table  table-bordered" table-striped width="100%">
                                    <tr>
                                        <td valign="top" witdh="50%">
                                            <table class="table table-hover table-bordered table-striped" width="100%">
                                                <tr>
                                                    <th class="bg-dark text-white">DOCUMENTOS PRESENTADOS</th>
                                                </tr>
                                                <tr>
                                                    <th class="bg-dark text-white">NRO </th>
                                                    <th class="bg-dark text-white">TIPO DOCUMENTO </th>
                                                    <th class="bg-dark text-white">PRESENT&Oacute; </th>
                                                    <th class="bg-dark text-white">OBSERVACION </th>
                                                </tr>
                                                <c:if test="${empty lPrsDocumentosTodo }">
                                                    <tr>
                                                        <td colspan="4"> <div class="nota"> No tiene documentos registrados </div></td>
                                                    </tr>
                                                </c:if>
                                                <c:forEach var="lDocumento" items="${lPrsDocumentosTodo}" varStatus="contadorClas">
                                                    <tr <c:if test="${(contadorClas.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                        <td><c:out value='${contadorClas.count}'/></td>
                                                        <td><c:out value='${lDocumento.tipo_documento}'/></td>
                                                        <td><c:if test="${lDocumento.presento == true}"> Si</c:if> &nbsp;
                                                            <c:if test="${lDocumento.presento == false}"> No</c:if>
                                                            </td>
                                                            <td><c:out value='${lDocumento.observacion}'/></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                        <td valign="top" witdh="50%">
                                            <table class="table table-hover table-bordered table-striped" width="100%">
                                                <tr>
                                                    <th class="bg-dark text-white">PR&Oacute;RROGAS REALIZADAS</th>
                                                </tr>
                                                <tr>
                                                    <th  class="bg-dark text-white">Nro. </th>
                                                    <th class="bg-dark text-white">DOCUMENTO </th>
                                                    <th class="bg-dark text-white">TIPO COMPROMISO </th>
                                                    <th class="bg-dark text-white">GESTION DE PRORROGA </th>
                                                    <th class="bg-dark text-white">DETALLE</th>
                                                    <th class="bg-dark text-white">FECHA DE VENCIMIENTO </th>
                                                </tr>
                                                <c:if test="${empty lPrsCompromisosTodo }">
                                                    <tr>
                                                        <td colspan="6"> <div class="nota"> No tiene pr&oacute;rrogas registradas </div></td>
                                                    </tr>
                                                </c:if>
                                                <c:forEach var="lCompromisoT" items="${lPrsCompromisosTodo}" varStatus="contadorC">
                                                    <tr <c:if test="${(contadorC.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                        <td><c:out value='${contadorC.count}'/></td>
                                                        <td><c:out value='${lCompromisoT.tipo_documento}'/></td>
                                                        <td><c:out value='${lCompromisoT.tipo_compromiso}'/></td>
                                                        <td><c:out value="${lCompromisoT.gestion}"/> / <c:out value="${lCompromisoT.periodo}"/></td>
                                                        <td><c:out value='${lCompromisoT.observacion}'/> </td>
                                                        <td><c:out value='${lCompromisoT.fec_vencimiento}'/></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  width="50%">
                                            <table class="table table-hover table-striped" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="bg-dark text-white">DATOS DE RECIBOS ACTIVOS</th>
                                                    </tr>
                                                </thead>
                                                <thead>
                                                    <tr>
                                                        <th  class="bg-dark text-white">RECIBO </th>
                                                        <th class="bg-dark text-white">TOTAL </th>
                                                        <th class="bg-dark text-white">GESTION </th>
                                                        <th class="bg-dark text-white">PERIODO </th>
                                                        <th class="bg-dark text-white">FECHA PAGO </th>
                                                        <th class="bg-dark text-white">DETALLE </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${empty lDetalleVentas}">
                                                        <tr>
                                                            <td colspan="6"> <div class="nota"> El estudiante no presenta recibos realizados </div></td>
                                                        </tr>
                                                    </c:if>
                                                    <c:forEach var="lVentas" items="${lDetalleVentas}" varStatus="contadorD">
                                                        <tr <c:if test="${(contadorD.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                            <td><c:out value='${lVentas.nro_recibo}'/></td>
                                                            <td><c:out value='${lVentas.total}'/></td>
                                                            <td><c:out value='${lVentas.gestion}'/></td>
                                                            <td><c:out value='${lVentas.periodo}'/></td>
                                                            <td><fmt:formatDate value='${lVentas.fec_pago}' pattern='dd/MM/yyyy'/></td>
                                                            <td><c:out value='${lVentas.perfil}'/></td>
                                                        </tr>
                                                    </c:forEach>  
                                                </tbody>
                                            </table>
                                        </td>
                                        <td valign="top" colspan="1">
                                            <table class="table table-hover table-striped" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="bg-dark text-white">TRANSACCIONES ENTIDADES FINANCIERAS</th>
                                                    </tr>
                                                </thead>
                                                <thead>
                                                    <tr>
                                                        <th class="bg-dark text-white">ENTIDAD </th>
                                                        <th class="bg-dark text-white">TOTAL</th>
                                                        <th class="bg-dark text-white">GESTION </th>
                                                        <th class="bg-dark text-white">PERIODO </th>
                                                        <th class="bg-dark text-white">FECHA PAGO</th>
                                                        <th class="bg-dark text-white">DETALLE </th>
                                                    </tr> 
                                                </thead>
                                                <tbody>
                                                    <c:if test="${empty lDetalleVentasEntidad}">
                                                        <tr>
                                                            <td colspan="6"> <div class="nota"> El estudiante no presenta transacciones realizadas </div></td>
                                                        </tr>
                                                    </c:if>
                                                    <c:forEach var="lEntidades" items="${lDetalleVentasEntidad}" varStatus="contadorF">
                                                        <tr <c:if test="${(contadorF.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                            <td><c:out value='${lEntidades.perfil}'/></td>
                                                            <td><c:out value='${lEntidades.total}'/></td>
                                                            <td><c:out value='${lEntidades.gestion}'/></td>
                                                            <td><c:out value='${lEntidades.periodo}'/></td>
                                                            <td><c:out value='${lEntidades.nro_recibo}'/></td>
                                                            <td>Matricula Universitaria</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="1">
                                            <table class="table table-hover" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="bg-dark text-white">DEUDAS DEL ESTUDIANTE</th>
                                                    </tr>
                                                </thead>
                                                <thead>
                                                    <tr>
                                                        <th class="bg-dark text-white">NRO </th>
                                                        <th class="bg-dark text-white">TIPO DE DEUDA </th>
                                                        <th class="bg-dark text-white">GESTION </th>
                                                        <th class="bg-dark text-white">PERIODO </th>
                                                        <th class="bg-dark text-white">OBSERVACIÓN </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${empty lDeudasEstudiante }">
                                                        <tr>
                                                            <td colspan="5"> <div class="nota"> El estudiante no presenta tener deudas </div></td>
                                                        </tr>
                                                    </c:if>
                                                    <c:forEach var="lDeudas" items="${lDeudasEstudiante}" varStatus="contadorD">
                                                        <tr <c:if test="${(contadorD.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                            <td><c:out value='${contadorD.count}'/></td>
                                                            <td><c:out value='${lDeudas.tipo_deuda}'/></td>
                                                            <td><c:out value='${lDeudas.gestion}'/></td>
                                                            <td><c:out value='${lDeudas.periodo}'/></td>
                                                            <td><c:if test="${lDeudas.cancelado == true}"> Deuda Cancelada</c:if> &nbsp;
                                                                <c:if test="${lDeudas.cancelado == false}"> Deuda Pendiente</c:if>
                                                                </td>
                                                            </tr>
                                                    </c:forEach> 
                                                </tbody>
                                            </table>
                                        </td>
                                        <td valign="top" colspan="1">
                                            <table class="table table-hover" width="100%">
                                                <tr>
                                                    <th class="bg-dark text-white">DATOS DE AUXILIARIA DE DOCENCIA</th>
                                                </tr>
                                                <tr>
                                                    <th class="bg-dark text-white">GESTION </th>
                                                    <th class="bg-dark text-white">PERIODO </th>
                                                    <th class="bg-dark text-white">SIGLA </th>
                                                    <th class="bg-dark text-white">MATERIA </th>
                                                    <th class="bg-dark text-white">CARGA HORARIA </th>
                                                </tr>
                                                <c:if test="${empty lDetalleAuxiliares}">
                                                    <tr>
                                                        <td colspan="5"> <div class="nota"> El estudiante no presenta Auxiliarias de Docencia </div></td>
                                                    </tr>
                                                </c:if>
                                                <c:forEach var="lAuxiliares" items="${lDetalleAuxiliares}" varStatus="contadorF">
                                                    <tr <c:if test="${(contadorF.count mod 2) == 0}"></c:if> onMouseOver="this.className = 'sobreFila'" onmouseout="this.className = ''">
                                                        <td><c:out value='${lAuxiliares.gestion}'/></td>
                                                        <td><c:out value='${lAuxiliares.periodo}'/></td>
                                                        <td><c:out value='${lAuxiliares.sigla}'/></td>
                                                        <td><c:out value='${lAuxiliares.materia}'/></td>
                                                        <td><c:out value='${lAuxiliares.carga_horaria}'/></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                    </tr>
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
        <script language="javascript" src="<c:url value='/Public/Js/plugins/select2.min.js'/>"></script>
        <script language="javascript" src="<c:url value='/Public/Js/plugins/sweetalert.min.js'/>"></script>
    </body>
</html>