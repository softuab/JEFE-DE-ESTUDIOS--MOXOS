<%@ include file="../../../Superior.jsp" %>

<div class="titulo"><c:out value="${proceso.proceso}"/></div>
<br>

<form name="forma" action="listarMaterias.fautapo" method="POST">
  <table class="formulario">
  <tr>
    <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta" align="right">RU <font color='red'>(*)</font> </td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="id_estudiante" onblur='validar(this,"9")'></td>
  </tr>
  <tr>
    <td class="etiqueta">Gesti&oacute;n <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="gestion" value='<c:out value="${gestion}" />' onblur='validar(gestion,"9")' size="4" maxlength="4"></td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="periodo" value='<c:out value="${periodo}" />' onblur='validar(periodo,"9")' size="1" maxlength="1"> </td>
  </tr>
  <tr>
    <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
  </tr>
  </table>
  <input type="hidden" name="id_proceso" value='<c:out value="${proceso.id_proceso}"/>'>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../../../Inferior.jsp" %>