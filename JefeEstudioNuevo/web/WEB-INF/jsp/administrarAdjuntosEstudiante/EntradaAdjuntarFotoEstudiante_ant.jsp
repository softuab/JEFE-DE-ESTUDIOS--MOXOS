<%@ include file="../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>

<script language='JavaScript' SRC="./validar.js">  </script>
<body onload='inicio(document.forma.clave)'>
  <div class="titulo">Administrar Adjuntar Fotos Estudiante</div>
  <br>
  <form name=forma action="<c:url value="/estudiante/adjListarFoto.fautapo"/>" method="POST">
    <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
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
        <td class="etiqueta" align="right">Clave</td>
        <td class="etiqueta">::</td>
        <td>
	 <input type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'>
	</td>
      </tr>
      <tr>
        <td colspan=3 align=center><input class="siguiente" type="submit" value="Buscar" ></td>
      </tr>
    </table>
  </form>
</body>


<%@ include file="../Inferior.jsp" %>


