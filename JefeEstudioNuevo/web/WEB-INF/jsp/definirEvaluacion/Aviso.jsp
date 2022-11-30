<%@ include file="../Superior.jsp" %>

<script language='JavaScript' SRC="./validar.js"> </script>
<div class="titulo">Definir Evaluaci&oacute;n</div>
<br>
<table class="tabla" border="0">
  <tr>
    <th>CARRERA/PROGRAMA</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <c:if test="{!empty materia_ahorro}"> <th>MATERIA AHORRO</th></c:if>
    <th>GRUPO</th>
    <th>GESTI&Oacute;N</th>
    <th>PERIODO</th>
    <th>FASE ACTUAL</th>
  <tr>    
    <td align="center"><c:out value="${programa}"/></td>
    <td align="center"><c:out value="${datosAsignacion.sigla}"/></td>    
    <td align="center"><c:out value="${materia}"/></td>    
    <c:if test="{!empty materia_ahorro}"><td class="colb" align="center"><c:out value="${materia_ahorro}"/></td></c:if>
    <td align="center"><c:out value="${datosAsignacion.grupo}"/></td>
    <td align="center"><c:out value="${datosAsignacion.gestion}"/></td>
    <td align="center"><c:out value="${datosAsignacion.periodo}"/></td>
    <td class="colb" align="center"><c:out value="${datosAsignacion.fase}"/></td>
   </tr>
</table>
<br>  

<table width="30%" class="formulario" align="center"> 
  <form name="volver" method="POST" action='<c:url value="/definirEvaluacion/listarAsignaciones.fautapo"/>'>
  <tr>
    <th>AVISO !!</th>
  </tr>
  <tr>
    <td align="center"><c:out value="${mensaje}" escapeXml="false"/></td>
  </tr>
  <tr>
    <td align="center"><input class="volver" type="submit"  value="Volver"></td>
  </tr>
	  <input type="hidden" name="gestion"            value="<c:out value='${datosAsignacion.gestion}'/>">
          <input type="hidden" name="periodo"           value="<c:out value='${datosAsignacion.periodo}'/>">
          <input type="hidden" name="id_asignacion"      value="<c:out value='${id_asignacion}'/>">    
          <input type="hidden" name="id_programa"        value="<c:out value='${id_programa}'/>">
	  <input type="hidden" name="bandera"            value="1">
  </form>
</table>    

<%@ include file="../Inferior.jsp" %>