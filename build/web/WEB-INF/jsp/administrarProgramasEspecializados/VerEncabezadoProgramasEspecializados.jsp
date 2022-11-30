<%@ include file="../Superior.jsp" %>

<br>
<div><a class="volver" href="<c:url value="/listarMisPendientesLimbo.fautapo"><c:param name="id_proceso" value="${id_proceso}"/><c:param name="aplicacion" value="${aplicacion}"/></c:url>" target="cuerpo"> Volver</a></div>

<table class="tabla">
  <tr>
    <th colspan="5">DATOS GENERALES</th>
  </tr>
  <tr>
    <th>#</th>
    <th>PROCESO</th>
    <th>ACTIVIDAD</th>
    <th>REFERENCIAS</th>
    <th>INGRESO</th>
  </tr>
  <tr>
    <td align="center"><c:out value="${datosTramite.id_tramite}"/> </a></td>			   
    <td><c:out value="${datosTramite.proceso}"/></td>
    <td><c:out value="${datosTramite.actividad}"/></td>
    <td>
      <c:forEach var="referencias" items="${lReferencias}">
        <b><c:out value="${referencias.campo}"/> : </b><c:out value="${referencias.valor}"/><br>
      </c:forEach>
    </td>
    <td><fmt:formatDate value="${datosTramite.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/></td>
  </tr>
</table>

<%@ include file="../Inferior.jsp" %>