<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="now" class="java.util.Date"/>
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
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp;Asignaci&oacute;n Auxiliar-Materias</h1>
                    <p>Programa ::<c:out value="${programa.programa}"/>    Plan ::<c:out value="${datosPrgPlan.id_plan}"/>    Gestion ::<c:out value="${gestion}"/>   Periodo ::<c:out value="${periodo}"/></p>
                    <p>Materia ::<c:out value="${materia.materia}"/>  Grupo :: <c:out value="${datosDptoGrupo.grupo}"/>  Tipo Evaluacion ::<c:out value="${datosDptoGrupo.tipo_evaluacion}"/></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form  name="forma"  action="<c:url value="/auxiliares/registrarAsignacionAuxiliar.fautapo"/>" method="post">
                            <input type="hidden" name="id_programa"         value='<c:out value="${programa.id_programa}"/>' >
                            <input type="hidden" name="programa"            value='<c:out value="${programa.programa}"/>' >
                            <input type="hidden" name="id_prg_plan"         value='<c:out value="${datosPrgPlan.id_prg_plan}"/>' >
                            <input type="hidden" name="gestion"             value='<c:out value="${gestion}"/>' >
                            <input type="hidden" name="periodo"             value='<c:out value="${periodo}"/>' >
                            <input type="hidden" name="id_materia"          value='<c:out value="${materia.id_materia}"/>' >
                            <input type="hidden" name="materia"             value='<c:out value="${materia.materia}"/>' >
                            <input type="hidden" name="id_dpto_grupo"       value='<c:out value="${datosDptoGrupo.id_dpto_grupo}"/>' >
                            <input type="hidden" name="id_tipo_evaluacion"  value='<c:out value="${datosDptoGrupo.id_tipo_evaluacion}"/>' >
                            <input type="hidden" name="id_asignacion"       value='<c:out value="${datosAsignacion.id_asignacion}"/>' >
                            <input type="hidden" name="id_plan"            value="<c:out value="${datosPrgPlan.id_plan}"/>">	
                            <input type="hidden" name="accion"              value='<c:out value="${accion}"/>' >
                            <div class="form-group row">
                                <label class="control-label col-md-3">Auxiliar</label>
                                <div class="col-md-8">
                                    <select  data-anterior="${datosAsignacion.id_docente}" class="form-control" id='id_docente' name ='id_docente' required="">
                                        <option value="-1">Elija una opci&oacute;n...</option>
                                        <c:forEach var = "cod" items = "${lDocentesTodos}" varStatus = "docentec">
                                            <option value="<c:out value = "${cod.id_docente}"/>" <c:if test="${cod.id_docente==datosAsignacion.id_docente}">selected=true</c:if>><c:out value = "${cod.nombre_completo}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Tipo Auxiliar</label>
                                <div class="col-md-8">
                                    <select data-anterior="${datosAsignacion.id_tipo_docente}" class="form-control" id='id_tipo_docente' name='id_tipo_docente'>
                                        <option value="-1">Elija una opci&oacute;n...</option>
                                        <c:forEach var = "cod" items = "${lTiposDocentes}" varStatus = "tipo_docentec">
                                            <option value="<c:out value = "${cod.id_tipo_docente}"/>" <c:if test="${cod.id_tipo_docente==datosAsignacion.id_tipo_docente}"> selected="true"</c:if>><c:out value = "${cod.tipo_docente}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Tipo Asignaci&oacute;n </label>
                                <div class="col-md-8">
                                    <select  data-anterior="${datosAsignacion.id_tipo_asignacion}" class="form-control" id = 'id_tipo_asignacion' name = 'id_tipo_asignacion'>
                                        <option value="-1">Elija una opci&oacute;n...</option>
                                        <c:forEach var="cod" items="${lTiposAsignaciones}" varStatus="asignacionc">
                                            <option value="<c:out value = "${cod.id_tipo_asignacion}"/>"  <c:if test="${cod.id_tipo_asignacion==datosAsignacion.id_tipo_asignacion}"> selected="true"</c:if>><c:out value = '${cod.tipo_asignacion}'/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3"> Fecha Inicio</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="date" name="fec_inicio" id="fec_inicio"  value="<fmt:formatDate value="${datosAsignacion.fec_inicio2}" pattern="yyyy-MM-dd"/>"/>
                                </div>
                                <label class="control-label col-md-1">Fecha Fin</label>
                                <div class="col-md-4">
                                    <input class="form-control" type="date" name="fec_fin" id="fec_fin" value="<fmt:formatDate value="${datosAsignacion.fec_fin2}" pattern="yyyy-MM-dd"/>"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3"> Nro Resoluci&oacute;n</label>
                                <div class="col-md-3">
                                    <input type="text"  class="form-control" name='nro_resolucion'  value='<c:out value="${datosAsignacion.snro_resolucion}"/>' size="10">
                                </div>
                                <label class="control-label col-md-1">Fecha Resolucion </label>
                                <div class="col-md-4">
                                    <input  class="form-control" type="date" name="fec_resolucion" value="<fmt:formatDate value="${datosAsignacion.fec_resolucion}" pattern="yyyy-MM-dd"/>" />  
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Carga Horaria</label>
                                <div class="col-md-8">
                                    <input  class="form-control" type="number" name='carga_horaria'  value="<c:out value="${datosAsignacion.carga_horaria}"/>"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">Observaciones</label>
                                <div class="col-md-8">
                                    <div class="form-outline">
                                        <textarea name='observacion' class="form-control" id="textAreaExample2" rows="2"><c:out value="${datosAsignacion.observacion}"/> </textarea>
                                        <label class="form-label" for="textAreaExample2"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit'  value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/auxiliares/listarMateriasProgramaPlan.fautapo">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
                            <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
                            <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
                            <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${datosAsignacion.id_tipo_evaluacion}"/>' > 
                            <input type="hidden" name="id_prg_plan"     value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
        <script language="JavaScript">

            function fguardar()
            {
                if ((document.forma.id_docente.value != 0) && (document.forma.id_tipo_docente.value != 0) && (document.forma.id_tipo_asignacion.value != "") && (document.forma.nro_resolucion.value != "") && (document.forma.fec_inicio.value != "") && (document.forma.fec_fin.value != "") && (document.forma.fec_resolucion.value != ""))
                {
                    document.forma.submit();
                } else
                {
                    alert("Los campos con (*), son obligatorios");
                }
            }
            iniciar();
        </script>
    </body>
</html>