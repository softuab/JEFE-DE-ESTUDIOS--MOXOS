<%@ include file="../../Superior.jsp" %>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<br>

<form name="forma" action="<c:url value="/listarDatosPostulante.fautapo"/>" method="POST">
  <table class="formulario">
  <tr>
    <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta" align="right">R.P. <font color='red'>(*)</font> </td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="id_postulante" onblur='validar(this,"9")'></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
  </tr>
  </table>
  <input type="hidden" name="id_proceso" value='<c:out value="${datosProceso.id_proceso}"/>'>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../../Inferior.jsp" %>