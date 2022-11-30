<%@ include file="../../Superior.jsp"%>
<div class="titulo">Impresi&oacute;n de solocitud de Admisi&poacute;n</div>
<br>
<form action="<c:url value='/impresionPstSolicitudAdmision/verDatosPostulante.fautapo'/>" method="post">
<table class="formulario">
  <tr>
    <th colspan="3"> BUSCAR POSTULANTE
    </th>
  </tr>     
  <tr>
    <td colspan="3">
    <fieldset>
      <legend>Introduzca el Registro de Postulante</legend>
    <table align=right>
      <tr>
        <td class="etiqueta">R.P.</td>
        <td class="etiqueta">::</td>
        <td><input type=text name="id_postulante" maxlength="8" onblur='validar(id_postulante,"9")' /></td>
        <td><input type=submit name="botonRp" value='Buscar' class="buscar"></td>
      </tr>
    </table>
    </fieldset>
    </td>
  </tr>
  <tr>
    <td colspan="3">
    <fieldset>
      <legend>Introduzca nombres</legend>
      <table align=right>
      <tr>
        <td class="etiqueta">Nombres</td>
        <td class="etiqueta">::</td>
        <td><input type=text name="nombres"/></td>
        <td><input type=submit  value='Buscar' class="buscar"></td>
      </tr>
      </table>
     </fieldset>
    </td>
  </tr>
  <tr>
    <td colspan="3">
    <fieldset>
      <legend>Introduzca DIP</legend>
      <table align=right>
      <tr>
        <td class="etiqueta">DIP</td>
        <td class="etiqueta">::</td>
        <td><input type=text name="dip" onblur='validar(dip,"9")'> </td>
        <td><input type=submit  value='Buscar' class="buscar"></td>
      </tr>
      </table>
     </fieldset>
    </td>
  </tr>
</table>
</form>

<%@ include file="../../Inferior.jsp" %>