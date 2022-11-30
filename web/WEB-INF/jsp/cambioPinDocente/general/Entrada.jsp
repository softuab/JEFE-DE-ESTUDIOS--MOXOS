<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>
<script language='JavaScript' SRC="./validar.js">  </script>

<div class="titulo">Cambio Clave (PIN) Docente - Autoridad</div>
<br>

<form name="forma" action="<c:url value="buscarDocente.fautapo"/>" method="POST">
  <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
  <table class="formulario" border="0">
    <tr>
      <th colspan="3">Introduzca los datos</th>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Usuario</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${usuario}"/> </td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Clave</td>
      <td class="etiqueta">::</td>
      <td>
        <input type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'>
      </td>
    </tr>
    <tr>
      <td colspan=3 align=center><input class="siguiente" type="submit" value="Buscar"></td>
    </tr>
    </table>
</form>

<%@ include file="../../Inferior.jsp" %>