<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>
<script language='JavaScript' SRC="./validar.js"></script>

<div class="titulo">Imprimir Carnet Universitario</div>
<br>

<form name="forma" action="<c:url value="/buscarCarnetUniversitario.fautapo"/>" method="POST">
  <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
  <input type="hidden" name="aplicacion" value='<c:url value="/"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Usuario</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${nombres}" /></td>
    </tr>
    <tr>
      <td class="etiqueta">Gesti&oacute;n</td>
      <td class="etiqueta">::<font color='red'>(*)</font></td>
      <td><input type=text name="gestion" value="<c:out value='${gestion}'/>" size="4" maxlength="8" onblur='validar(this,"9")'/></td>
    </tr>
    <tr>
      <td class="etiqueta">Periodo</td>
      <td class="etiqueta">::<font color='red'>(*)</font></td>
      <td><input type=text name="periodo" value="<c:out value='${periodo}'/>" size="1" maxlength="8" onblur='validar(this,"9")'/></td>
    </tr>
    <tr>
      <td class="etiqueta">RU</td>
      <td class="etiqueta">::<font color='red'>(*)</font></td>
      <td><input type=text name="id_estudiante" maxlength="8" onblur='validar(this,"9")'/></td>
    </tr>
    <tr>
      <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
    </tr>
  </table>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

</body>
<%@ include file="../../Inferior.jsp" %>