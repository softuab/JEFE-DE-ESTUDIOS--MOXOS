<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Listado del proceso de negocio</div>
<br>

<table class="tabla">
  <tr>
    <th>Nro HOJA <br>DE RUTA </th>
    <th>REFERENCIAS</th>
    <th>ACTIVIDAD</th>
    <th>FECHA</th>
    <th width="150">FIRMA</th>
  </tr>
  <c:forEach var="lista" items="${lTramites}" varStatus="contador">
     <tr>
      <td align="center"><b><c:out value="${lista.correlativo2}"/>/<c:out value="${lista.gestion}"/></b></td>
      <td>
        <c:forEach var="referencias" items="${lista.lista}" >
	  <b><c:out value="${referencias.campo}"/> : </b><c:out value="${referencias.valor}"/><br>
	</c:forEach>
      </td>
      <td><b><c:out value="${lista.actividad}"/></b><br>
          <i><c:out value="${lista.proceso}"/></i>
      </td>
      <td align="center">
        <fmt:formatDate value="${lista.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/>
      </td>
      <td>
      </td>
    </tr>
  </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>