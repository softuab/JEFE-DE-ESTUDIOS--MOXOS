<%@ include file="../Superior.jsp" %>

<div class=titulo> Administrar Libretas</div>
<br>
<table class="tabla" border="0">
  <tr>
    <th>CARRERA/PROGRAMA</th>
    <th>SIGLA - MATERIA</th>
    <th>GRUPO</th>
    <th>GESTI&Oacute;N</th>
    <th>PERIODO</th>
  <tr>    
    <td class="etiqueta"><c:out value="${buscarPrograma.programa}"/></td>
    <td class="etiqueta"><c:out value="${datosAsignacion.sigla}"/>&nbsp;<b>-</b>&nbsp;<c:out value="${datosAsignacion.materia}"/></td>    
    <td class="etiqueta" align="center"><c:out value="${datosAsignacion.grupo}"/></td>
    <td class="etiqueta" align="center"><c:out value="${datosAsignacion.gestion}"/></td>
    <td class="etiqueta" align="center"><c:out value="${datosAsignacion.periodo}"/></td>
  </tr>
</table>
<br>
<table class="formulario">
  <tr>
    <th>Aviso!</th>
  </tr>
  <tr>
    <td><c:out value="${mensaje}"/></td>
   </tr>
   <tr>
     <td align="center">
	<form name="formavolver" method="post" action='<c:url value="/definirEvaluacion/listarAsignaciones.fautapo"/>'>
          <div><a class="volver" href="javascript:document.formavolver.submit();"> Volver</a></div>
          <input type="hidden" name="id_docente" value="<c:out value='${datosAsignacion.id_docente}'/>">
          <input type="hidden" name="gestion"    value="<c:out value='${datosAsignacion.gestion}'/>">
          <input type="hidden" name="periodo"    value="<c:out value='${datosAsignacion.periodo}'/>">	  
	  <input type="hidden" name="bandera"    value="1">
        </form>  
    </td>
  </tr>    
</table>

<%@ include file="../Inferior.jsp" %>