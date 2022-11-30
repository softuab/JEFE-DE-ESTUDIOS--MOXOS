<%@ include file="../Superior.jsp" %>
<div class="titulo"> Admin. Retroceder Fase  Por Programa</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<form name="forma" method="POST" action='<c:url value="/retrocederFaseDesignacionModificar/modificarFaseDocente.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Programa</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosPrograma.programa}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Docente</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosDocente.nombre_completo}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo evaluacion</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosAsignacion.tipo_evaluacion}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Gestion</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosAsignacion.gestion}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Periodo</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosAsignacion.periodo}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Fase</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosAsignacion.fase}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Sigla<font color="red">-</font>Materia</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosAsignacion.sigla}"/><font color="red">-</font> <c:out value="${datosAsignacion.materia}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Grupo</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosAsignacion.grupo}"/></td>
    </tr>
    
	   <tr>
      <td colspan="2" class="etiqueta"> Observaciones ::</td>
      <td colspan="2">
	 <textarea name='observacion' cols='20' rows='1'><c:out value="${datosAsignacion.observacion}"/></textarea>
      </td>
    </tr>

	</table>
  <center>
     <input type="submit" class="aceptar" name='accion1' value='Aceptar'>
  </center>
  <input type="hidden" name="id_asignacion"     value='<c:out value="${datosAsignacion.id_asignacion}"/>'>
  <input type="hidden" name="id_programa"       value='<c:out value="${datosPrograma.id_programa}"/>'>
  <input type="hidden" name="id_facultad"       value='<c:out value="${datosFacultad.id_facultad}"/>'>
</form>
<%@ include file="../Inferior.jsp" %>