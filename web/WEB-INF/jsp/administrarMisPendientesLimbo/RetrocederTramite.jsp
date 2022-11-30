<%@ include file="../Superior.jsp" %>

<div class="titulo"> Retroceder proceso de negocio</div>
<div><a class="volver" href="<c:url value="/listarMisPendientesLimbo.fautapo?"></c:url>">Volver</a></div>      
<br>

<form name="forma" method="POST" action='<c:url value="/retrocederTramiteLimbo.fautapo"/>'>
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Nro. de proceso de negocio</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${id_tramite}"/>
    </tr>
    <tr>
      <td class="etiqueta">Observaci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td>
      <textArea name="proveido" rows="10" cols="20" maxlength="10"></textarea>
      </td>
    <tr>
  </table>
  <center>
     <input type="submit" class="aceptar" value="Aceptar" onclick="document.forma.accion.value='Grabar'">
  </center>
  <input type=hidden name="accion" value=''>
  <input type=hidden name='id_tramite'        value='<c:out value="${id_tramite}"/>' >
  <input type=hidden name='id_proceso'        value='<c:out value="${id_proceso}"/>' >
  <input type=hidden name='id_actividad'      value='<c:out value="${id_actividad}"/>' >
</form>

<%@ include file="../Inferior.jsp" %>