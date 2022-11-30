<%@ include file="../../../Superior.jsp" %>
<div class="titulo">Pago de Cajas</div>

<br>
<form name="forma" id="forma" method="post" action="registrarTransaccion.fautapo">
  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
  <input type="hidden" name="total" value="<c:out value="${total}"/>">
  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
<div class="centro">
  <table class="tabla">
  <tr>
    <th colspan="2">Matr&iacute;cula Pre Universitaria</th>
  </tr>
  <tr>
    <th>Concepto</th>
    <th>Costo</th>
  </tr>
  <c:forEach var="lista" items="${listaConceptos}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" <!-- Est&acute;tico :( --></c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${lista.concepto}"/></td>
      <td><c:out value="${lista.costo}"/></td>
    </tr>
  </c:forEach>
  <tr>
    <th>TOTAL</th>
    <td><c:out value="${total}"/></td>
  </tr>
  </table>
  <input type="submit" value="Registrar">
</div>
</form>
<%@ include file="../../../Inferior.jsp" %>