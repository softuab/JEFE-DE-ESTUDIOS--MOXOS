<%@ include file="../../Superior.jsp" %>
<body onload='inicio(document.forma.gestion)'>

<script language='JavaScript' SRC="./validar.js"></script>
<body onload='inicio(document.forma.clave)'>
  <div class="titulo">Promedio Acad&eacute;mico de Estudiantes</div>
  <br>
  <form name="forma" method="POST" action='<c:url value="/listarRendimiento.fautapo"/>' target="_blank">
    <table class="formulario">
      <tr>
        <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
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
        <td class="etiqueta">Programa</td>
        <td class="etiqueta">::</td>
        <td><select name="id_programa">
         <c:forEach var="programa" items="${listarProgramas}" varStatus="contadorcito">
	 <option value='<c:out value="${programa.id_programa}"/>:<c:out value="${programa.programa}"/>'>  <c:out value="${programa.programa}"/>  </option>
         </c:forEach>
         </select> </td>
      </tr>
      <tr>
        <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
	<input type="hidden" name="nombres"  value="<c:out value='${usuario}'/>">
      </tr>
    </table>
  </form>
</body>
<%@ include file="../../Inferior.jsp" %>

