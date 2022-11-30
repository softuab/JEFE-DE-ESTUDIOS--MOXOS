<%@ include file="../Superior.jsp" %>
<script language = 'JavaScript' SRC="./validar.js">  </script>
<jsp:useBean id="now" class="java.util.Date"/>
<div class="titulo">Asignaci&oacute;n Docente Materias Carreras</div>

<script language='JavaScript' SRC="../ajax.js"></script>
<tabla>
  <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/asignaciontribunal/listarMateriasProgramaPlan.fautapo"/>'>
    <td>
      <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
      <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
      <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
      <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">	
      <input type="hidden" name="id_prg_plan"        value="<c:out value="${datosPrgPlan.id_prg_plan}"/>">	
      <input type="hidden" name="id_plan"            value="<c:out value="${datosPrgPlan.id_plan}"/>">	
      <input type="hidden" name="id_materia"         value="<c:out value="${id_materia}"/>">	 
      <input type="hidden" name="id_dpto_grupo"      value='<c:out value="${datosDptoGrupo.id_dpto_grupo}"/>' >
      <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${datosDptoGrupo.id_tipo_evaluacion}"/>' >
      <input type="hidden" name="id_asignacion"      value='<c:out value="${datosAsignacion.id_asignacion}"/>' >     
    </td>
  </form>
</table>

<br>
<table class="tabla">
  <tr>
    <th>PROGRAMA/CARRERA</th>
    <th>PLAN</th>
    <th>GESTI&Oacute;N</th>
    <th>PERIODO</th>
    <th>MATERIA</th>
    <th>GRUPO</th>
    <th>TIPO EVALUACION</th>
  </tr>
  <tr align="center">
    <td class="etiqueta"><c:out value="${programa.programa}"/>
    <td class="etiqueta"><c:out value="${datosPrgPlan.id_plan}"/>
    <td class="etiqueta"><c:out value="${gestion}"/>
    <td class="etiqueta"><c:out value="${periodo}"/>
    <td class="etiqueta"><c:out value="${materia.materia}"/>
    <td class="etiqueta"><c:out value="${datosDptoGrupo.grupo}"/>
    <td class="etiqueta"><c:out value="${datosDptoGrupo.tipo_evaluacion}"/>
  </tr>
</table>

<br>
<form  name=forma  action="<c:url value="/docentes/registrarAsignacionDocente.fautapo"/>" method=post>
  <input type="hidden" name="id_programa"         value='<c:out value="${programa.id_programa}"/>' >
  <input type="hidden" name="id_prg_plan"         value='<c:out value="${datosPrgPlan.id_prg_plan}"/>' >
  <input type="hidden" name="gestion"             value='<c:out value="${gestion}"/>' >
  <input type="hidden" name="periodo"             value='<c:out value="${periodo}"/>' >
  <input type="hidden" name="id_dpto_grupo"       value='<c:out value="${datosDptoGrupo.id_dpto_grupo}"/>' >
  <input type="hidden" name="id_tipo_evaluacion"  value='<c:out value="${datosDptoGrupo.id_tipo_evaluacion}"/>' >
  <input type="hidden" name="id_asignacion"       value='<c:out value="${datosAsignacion.id_asignacion}"/>' >
  <input type="hidden" name="accion"              value='<c:out value="${accion}"/>' >
  <table class="formulario">
    <tr>
      <th colspan="4">Confirmar&nbsp;<c:out value="${accion}"/>&nbsp;Asignaci&oacute;n </th>
    </tr>
    <tr>
      <td colspan="2" class="etiqueta" colspan="2"> Docente ::</td>
      <td colspan="2"><c:out value="${datosDocente.nombre_completo}"/></td>
    </tr>
    <tr>
       <td colspan="2" class="etiqueta"  colspan="2"> Tipo Docente ::</td>
       <td colspan="2"> <c:out value="${datosAsignacion.tipo_docente}"/> </td>
    </tr>
    <tr>
      <td colspan="2" class="etiqueta" colspan="2"> Tipo Asignaci&oacute;n ::</td>
      <td colspan="2"><c:out value="${datosAsignacion.tipo_asignacion}"/>
      </td>
    </tr>     
    <tr>
      <td colspan="2" class="etiqueta" colspan="2"> Fase Actual de Evaluaci&oacute;n ::</td>
      <td colspan="2">
       <c:out value="${datosAsignacion.fase}"/>
       <c:if test="${datosAsignacion.id_fase > 0}"> <font color="red"><blink><br> Antes de Eliminar, tenga encuenta que el docente esta<br>en una fase avanzada.</blink> </font>
       </c:if>
      </td>
    </tr>     
    <tr>
      <td class="etiqueta"> Fecha Inicio :: </td>
      <td><fmt:formatDate value="${datosAsignacion.fec_inicio2}" pattern="${formatoFecha}"/></td>
      <td class="etiqueta"> Fecha Fin ::</td>
      <td><fmt:formatDate value="${datosAsignacion.fec_fin2}" pattern="${formatoFecha}"/></td>
    </tr>   	
    <tr>
      <td class="etiqueta"> Nro Resoluci&oacute;n :: </td>
      <td><c:out value="${datosAsignacion.nro_resolucion}"/></td>
      <td class="etiqueta"> Fecha Resoluci&oacute;n ::</td>
      <td ><fmt:formatDate value="${datosAsignacion.fec_resolucion}" pattern="${formatoFecha}"/></td>
    </tr>
    <tr>
      <td colspan="2" class="etiqueta"> Observaciones ::</td>
      <td colspan="2">
	 <c:out value="${datosAsignacion.observacion}"/>
      </td>
    </tr>
    <tr>
      <th colspan="4"><input class="aceptar" type="button" value='Aceptar' onClick="fguardar();"></th>
    </tr>
  </table>
</form>

<script language="JavaScript">
  
  function fguardar()
  {
    if((document.forma.id_asignacion.value!=0) && (document.forma.id_asignacion.value!="") && (document.forma.accion.value !=""))
    {
      document.forma.submit();
    }
    else
    {
      alert("Los campos con (*), son obligatorios");
    }
  }
  iniciar();
</script>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   

<%@ include file="../Inferior.jsp" %>