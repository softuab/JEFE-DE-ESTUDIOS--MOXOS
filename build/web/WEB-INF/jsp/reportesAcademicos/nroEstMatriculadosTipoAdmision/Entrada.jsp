<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="./validar.js">  </script>
<div class="titulo">N&uacute;mero de Matriculados por Tipo de Admisi&oacute;n</div>
<br>

<body onload='inicio(document.forma.gestion)'>
  <form name=forma action="<c:url value="/nroEstMatriculadosTipoAdmision/ListarMatriculados.fautapo"/>" method="POST" target="_blank">
    <table class="formulario">
      <tr>
        <th colspan=3 align="center">INTRODUZCA LOS DATOS</th>
      </tr>
      <tr>
        <td class="etiqueta">Usuario</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${usuario}" /></td>
      </tr>
      <tr>
        <td class="etiqueta">Gesti&oacute;n</td>
        <td class="etiqueta">::</td>
        <td><input type="text" name="gestion" value='<c:out value="${gestion}" />' onblur='validar(gestion,"9")' size="4" maxlength="4"></td>
      </tr>
      <tr>
        <td class="etiqueta">Periodo</td>
        <td class="etiqueta">::</td>
        <td><input type="text" name="periodo" value='<c:out value="${periodo}" />' onblur='validar(periodo,"9")' size="1" maxlength="1"> </td>
      </tr>
      <tr>
    </table>
    <center>
      <input class="siguiente" type="submit" value="Buscar">
    </center>
  </form>
</body>

<%@ include file="../../Inferior.jsp" %>


