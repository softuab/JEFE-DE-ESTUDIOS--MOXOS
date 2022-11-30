<%@ include file="../Superior.jsp" %>

<div class=titulo>Reporte de Correspondencia Despachadas por Fechas</div>  
<table class="tabla" border="0" width='95%' align='center'>
  <tr>
    <th align="center">NRO</th>
    <th align="center">ID TRAMITE</th>
    <th align="center">DESTINATARIO</th>
    <th align="center">REMITENTE</th>
    <th align="center">FECHA REGISTRO</th>
  </tr>
  <c:forEach var="referencias" items="${correspFecha}" varStatus="contador">      
  <tr>
    <td align="center"><c:out value="${contador.index + 1 }"/></td> 
    <td align="center"> <c:out value="${referencias.id_tramite}"/></td>
    <td> <c:out value="${referencias.usuario_para}"/></td>
    <td> <c:out value="${referencias.valor}"/></td>
    <td align="center"><fmt:formatDate value="${referencias.fec_registro}" pattern="yyyy-MM-dd"/> </td>
  </c:forEach>  
</table>
<%@ include file="../Inferior.jsp" %>
