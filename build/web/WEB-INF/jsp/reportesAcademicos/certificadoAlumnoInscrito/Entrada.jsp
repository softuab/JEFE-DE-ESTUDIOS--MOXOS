<%@ include file="../../Superior.jsp" %>
<body onload='inicio(document.forma.id_estudiante)'>
<script language='JavaScript' SRC="./validar.js"></script>

<div class="titulo">Alumno Inscrito</div>
<br>
<form name="forma" action="<c:url value="/inscrito/alumnoInscrito.fautapo"/>" method="POST">
  <table class="formulario">
  <tr>
    <th> INTRODUZCA LOS DATOS </th>
  </tr>  
  <tr>
    <td>
    <fieldset>
      <legend>Introduzca Registro Universitario</legend>
      <table align="right">
        <tr>
          <td class="etiqueta">Usuario</td>
          <td class="etiqueta">::</td>	
          <td><c:out value="${usuario}"/></td>
        </tr>
        <tr>
          <td class="etiqueta">Gesti&oacute;n</td>
          <td class="etiqueta">::<font color='red'>(*)</font></td>
          <td><input type="text" name="gestion" value="<c:out value='${gestion}'/>" size="4" maxlength="4" onblur='validar(this,"9")'/></td>
        </tr>
        <tr>
          <td class="etiqueta">Periodo</td>
          <td class="etiqueta">::<font color='red'>(*)</font></td>
          <td><input type="text" name="periodo" value="<c:out value='${periodo}'/>" size="1" maxlength="1" onblur='validar(this,"9")'/></td>
        </tr>
        <tr>
          <td class="etiqueta">RU</td>
          <td class="etiqueta">::<font color='red'>(*)</font></td>
          <td><input type="text" name="id_estudiante" onblur='validar(this,"9")'/></td>
        </tr>
        <tr>
          <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
        </tr>
      </table>
    </fieldset>
    </td>
  </tr>
  </table>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

</body>
<%@ include file="../../Inferior.jsp" %>