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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Asignacion Docente Materias-Carreras</h1>
                    <p>Carrera: <c:out value="${programa.programa}"/> Plan: <c:out value="${datosPrgPlan.id_plan}"/> Gestión: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/> Tipo Evaluación: <c:out value="${datosTipoEval.tipo_evaluacion}"/></p>
                    <div>
                        Avanzar Designación :
                        <c:if test="${iResultadoFaseResolucion == 0}" >
                            <a class="btn btn-primary" href="javascript:document.formaFases<c:out value='${lista.gestion}'/>.submit();">Avanzar fase</a>
                            <form name="formaFases<c:out value="${contador.count}"/>" action="<c:url value="/avanzarFaseDesignacion.fautapo"/>" method="post" >
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="id_programa"        value="<c:out value="${programa.id_programa}"/>">
                                <input type="hidden" name="id_dpto_grupo"  value="<c:out value='${lista.id_dpto_grupo}'/>">
                                <input type="hidden" name="id_asignacion"  value="<c:out value='${lista.id_asignacion}'/>">
                                <input type="hidden" name="id_prg_plan"     value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
                                <input type="hidden" name="id_plan"        value="<c:out value="${datosPrgPlan.id_plan}"/>">
                                <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
                                <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>' >   
                                <input type="hidden" name="iResultadoFaseResolucion" value='<c:out value="${iResultadoFaseResolucion}"/>' >   
                            </form>
                        </c:if>
                        <c:if test="${iResultadoFaseResolucion != 0}" > 
                            <td class="etiqueta"><c:out value="Fase Avanzada"/>
                            </c:if>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <h3 class="title">Lista de Materias</h3>
                        </div>
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table id="tablaMateria" class="table table-hover table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>NIVEL ACAD&Eacute;MICO</th>
                                            <th>SIGLA</th>
                                            <th>MATERIA</th>
                                            <th>GRUPO</th>
                                            <th>DOCENTE</th>
                                            <th>ASIGNACI&Oacute;N </th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="listado1" items="${listarplanestudios.pageList}" varStatus="contador">
                                            <tr <c:if test="${(contador.count mod 2) == 0}"></c:if> >
                                                <td valign="top" align="center"><c:out value="${listado1.nivel_academico}"/>
                                                <td valign="top"> <c:out value="${listado1.sigla}"/>  </td>
                                                <td valign="top"><c:out value="${listado1.materia}"/></td>
                                                <td valign="top">
                                                    <c:if test="${listado1.nro_grupos > 0}">
                                                        <c:forEach var="lista" items="${listado1.grupos}" >
                                                            <p><c:out value="${lista.grupo}"/></p>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro != -1}">
                                                        <span  class=" text-danger">Sin grupos</span>
                                                    </c:if>
                                                    <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro == -1}">
                                            <center> -- </center>
                                            </c:if>      
                                        </td>
                                        <td valign="top">
                                            <c:if test="${listado1.nro_grupos > 0}">
                                                <c:forEach var="lista" items="${listado1.grupos}" >
                                                    <p><c:out value="${lista.nombres}"/></p>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro != -1}">
                                                <font color="red">Sin grupos</font>
                                            </c:if>
                                            <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro == -1}">
                                            <center> -- </center>
                                            </c:if> 
                                        <td valign="top">
                                            <c:if test="${listado1.nro_grupos > 0}">
                                                <c:forEach var="lista" items="${listado1.grupos}" >
                                                    <c:if test="${lista.id_asignacion == 0}">
                                                        <a class="btn btn-primary btn-sm agregar" href="javascript:document.fnuevo<c:out value='${lista.id_dpto_grupo}'/>.submit();">Nuevo</a>
                                                        <form name="fnuevo<c:out value='${lista.id_dpto_grupo}'/>" action="<c:url value='/docentes/nuevoAsignacionDocente.fautapo'/>" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" name="id_dpto_grupo" value="<c:out value='${lista.id_dpto_grupo}'/>">
                                                            <input type="hidden" name="id_asignacion" value="<c:out value='${lista.id_asignacion}'/>">
                                                            <input type="hidden" name="id_prg_plan"   value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                                            <input type="hidden" name="id_programa"   value='<c:out value="${programa.id_programa}"/>' >
                                                            <input type="hidden" name="gestion"       value="<c:out value='${gestion}'/>">
                                                            <input type="hidden" name="periodo"       value="<c:out value='${periodo}'/>">	  
                                                            <input type="hidden" name="accion"         value="Nuevo">
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${lista.id_asignacion != 0 && iResultadoFaseResolucion == 0 }" >
                                                        <a class="btn btn-primary btn-sm modificar" href="javascript:document.fmodificar<c:out value='${lista.id_dpto_grupo}'/>.submit();"> Modificar</a> 
                                                        <a class="btn btn-primary btn-sm eliminar" href="javascript:document.feliminar<c:out value='${lista.id_dpto_grupo}'/>.submit();"> Eliminar</a>
                                                        <form name="fmodificar<c:out value='${lista.id_dpto_grupo}'/>" action="<c:url value='/docentes/nuevoAsignacionDocente.fautapo'/>" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" name="id_dpto_grupo"  value="<c:out value='${lista.id_dpto_grupo}'/>">
                                                            <input type="hidden" name="id_asignacion"  value="<c:out value='${lista.id_asignacion}'/>">
                                                            <input type="hidden" name="id_prg_plan"    value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                                            <input type="hidden" name="id_programa"    value='<c:out value="${programa.id_programa}"/>' >
                                                            <input type="hidden" name="gestion"        value="<c:out value='${gestion}'/>">
                                                            <input type="hidden" name="periodo"        value="<c:out value='${periodo}'/>">	  
                                                            <input type="hidden" name="accion"         value="Modificar">
                                                        </form>   
                                                        <form name="feliminar<c:out value='${lista.id_dpto_grupo}'/>" action="<c:url value='/docentes/nuevoAsignacionDocente.fautapo'/>" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" name="id_dpto_grupo"  value="<c:out value='${lista.id_dpto_grupo}'/>">
                                                            <input type="hidden" name="id_asignacion"  value="<c:out value='${lista.id_asignacion}'/>">
                                                            <input type="hidden" name="id_prg_plan"    value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                                            <input type="hidden" name="id_programa"    value='<c:out value="${programa.id_programa}"/>' >
                                                            <input type="hidden" name="gestion"        value="<c:out value='${gestion}'/>">
                                                            <input type="hidden" name="periodo"        value="<c:out value='${periodo}'/>">	  
                                                            <input type="hidden" name="accion"         value="Eliminar">	  
                                                            <div>  </div>
                                                        </form> 
                                                    </c:if>
                                                    <c:if test="${lista.id_asignacion != 0 && iResultadoFaseResolucion !=0 }" >
                                                        <a class="btn btn-primary btn-sm modificar" href="javascript:document.fmodificar<c:out value='${lista.id_dpto_grupo}'/>.submit();"> Ver Datos</a>
                                                        <form name="fmodificar<c:out value='${lista.id_dpto_grupo}'/>" action="<c:url value='/docentes/nuevoAsignacionDocente.fautapo'/>" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" name="id_dpto_grupo"  value="<c:out value='${lista.id_dpto_grupo}'/>">
                                                            <input type="hidden" name="id_asignacion"  value="<c:out value='${lista.id_asignacion}'/>">
                                                            <input type="hidden" name="id_prg_plan"    value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                                            <input type="hidden" name="id_programa"    value='<c:out value="${programa.id_programa}"/>' >
                                                            <input type="hidden" name="gestion"        value="<c:out value='${gestion}'/>">
                                                            <input type="hidden" name="periodo"        value="<c:out value='${periodo}'/>">	  
                                                            <input type="hidden" name="accion"         value="Modificar">
                                                        </form> 
                                                    </c:if>	
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro != -1}">
                                                <div class="text-danger">Sin grupos</div>
                                            </c:if>
                                            <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro == -1}">
                                            <center> -- </center>
                                            </c:if>      
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
    </body>
    <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
    <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/main.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
    <script type="text/javascript">$('#tablaMateria').DataTable();</script>
</html>