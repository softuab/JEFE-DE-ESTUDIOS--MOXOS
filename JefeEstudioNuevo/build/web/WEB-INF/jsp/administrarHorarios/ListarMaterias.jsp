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
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">  
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Administraci&oacute;n de Horarios</h1>
                    <p>Plan: <c:out value="${datosPrgPlan.id_plan}"/> Tipo Grado: <c:out value="${datosPrgPlan.tipo_grado}"/> Tipo Evaluación: <c:out value="${datosTipoEval.tipo_evaluacion}"/> Gestión: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <h3 class="title">Lista de Materias</h3>
                            <form name='forma<c:out value="${contador.index}"/>' method=post action='<c:url value="/administrarHorarios/listarHorarios.fautapo"/>' >
                                <input type="hidden" name="id_programa"   value="<c:out value='${id_programa}'/>">
                                <input type="hidden" name="id_plan"       value="<c:out value='${datosPrgPlan.id_plan}'/>">
                                <input type="hidden" name="id_prg_plan"   value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                                <input type="hidden" name="gestion"       value="<c:out value='${gestion}'/>">
                                <input type="hidden" name="periodo"       value="<c:out value='${periodo}'/>">	  
                                <input type="hidden" name="bandera"       value='1'>
                            </form>
                        </div>
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table id="tablaMateria" class="table table-hover table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th><div class="clave">NIVEL ACAD&Eacute;MICO</div></th>
                                            <th><div class="clave">SIGLA</div></th>
                                            <th><div class="clave">MATERIA</div></th>
                                            <th><div class="clave">GRUPOS</div></th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="listado1" items="${lPlanEstudios}" varStatus="contador">
                                        <!-- ********** Esto es para el efecto ************ -->
                                        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
                                                                                        <!-- ********** Fin  efecto ************ --> 

                                                                                        <td align="center"><c:out value="${listado1.nivel_academico}"/>
                                            <td>
                                                <c:if test="${listado1.nro_grupos > 0}">
                                                    <form name='forma<c:out value="${contador.index}"/>' method=post action='<c:url value="/administrarHorarios/listarHorarios.fautapo"/>' >
                                                        <input type="hidden" name="id_programa"              value='<c:out value="${datosPrograma.id_programa}"/>' >
                                                        <input type="hidden" name="id_plan"                  value='<c:out value="${datosPrgPlan.id_plan}"/>' >
                                                        <input type="hidden" name="id_prg_plan"              value='<c:out value="${datosPrgPlan.id_prg_plan}"/>' >
                                                        <input type="hidden" name="gestion"                  value='<c:out value="${gestion}"/>' >
                                                        <input type="hidden" name="periodo"                  value='<c:out value="${periodo}"/>' >
                                                        <input type="hidden" name="id_materia"               value='<c:out value="${listado1.id_materia}"/>' >
                                                        <input type="hidden" name="id_modelo_ahorro"         value='<c:out value="${listado1.id_modelo_ahorro}"/>' >
                                                        <input type="hidden" name="id_tipo_evaluacion"       value='<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>' >
                                                        <a href='javascript: document.forma<c:out value="${contador.index}"/>.submit()' >
                                                        </c:if>
                                                        <c:out value="${listado1.sigla}"/>
                                                    </a>
                                            </td>
                                            <td><c:out value="${listado1.materia}"/></td>
                                            <td>
                                                <c:if test="${listado1.nro_grupos > 0}">
                                                    <select name="id_dpto_grupo">
                                                        <c:forEach var="lista" items="${listado1.grupos}" >
                                                            <option value="<c:out value="${lista.id_dpto_grupo}"/>" >
                                                                <c:out value="${lista.grupo}"/>
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    </form>
                                                </c:if>
                                                <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro != -1}">
                                                    <font color="red">Sin grupos</font>
                                                </c:if>
                                                <c:if test="${listado1.nro_grupos == 0 && listado1.id_modelo_ahorro == -1}">
                                            <center> -- </center>
                                            </c:if>      
                                        </td>
                                        </tr>
                                    </c:forEach>
                                </table>
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
        <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
        <script type="text/javascript">$('#tablaMateria').DataTable();</script>
    </body>
</html>


