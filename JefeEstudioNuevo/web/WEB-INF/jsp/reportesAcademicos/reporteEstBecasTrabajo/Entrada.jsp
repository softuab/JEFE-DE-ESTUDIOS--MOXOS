<%@ include file="../../Superior.jsp" %>
<body onload='inicio(document.forma.gestion)'>

<script language='JavaScript' SRC="./validar.js"></script>
  <div class="titulo">Listado de Estudiantes Beca-Trabajo</div>
  <br>
  <form name=forma action="<c:url value="/listarEstBecasTrabajo.fautapo"/>" method="POST">
    <table class="formulario">
      <tr>
        <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
      </tr>
      <tr>
        <td class="etiqueta">Usuario</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${cliente.nombres}" /></td>
      </tr>
      <tr>
        <td class="etiqueta">Gesti&oacute;n <font color="red">(*)</font></td>
        <td class="etiqueta">::</td>
        <td><input type="text" name="gestion" value='<c:out value="${cliente.gestion}" />' onblur='validar(gestion,"9")' size="4" maxlength="4"></td>
      </tr>
      <tr>
        <td class="etiqueta">Periodo <font color="red">(*)</font></td>
        <td class="etiqueta">::</td>
        <td><input type="text" name="periodo" value='<c:out value="${cliente.periodo}" />' onblur='validar(periodo,"9")' size="1" maxlength="1"> </td>
      </tr>
      <tr>
        <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
      </tr>
    </table>
  </form>
</body>

<%@ include file="../../Inferior.jsp" %>