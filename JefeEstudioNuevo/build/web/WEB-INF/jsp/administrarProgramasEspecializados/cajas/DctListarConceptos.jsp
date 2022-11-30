<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<form name="forma" id="forma" method="post" action="dctRegistrarTransaccion.fautapo" >
  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
  <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
  <input type="hidden" name="total" value="<c:out value="${total}"/>">
  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">

<table class="tabla">
  <tr>
    <th>Nombre</th>
    <td class="colb">
      <c:out value="${docente.nombres}"/>&nbsp;<c:out value="${docente.paterno}"/>&nbsp;<c:out value="${docente.materno}"/>
    </td>
    <th>Gesti&oacute;n</th>
    <td class="colb"><c:out value="${periodo}"/>-<c:out value="${gestion}"/></td>
    <th>Fecha</th>
    <td class="colb"><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></td>
  </tr>
</table>
<br>
<c:if test="${!empty descuento}">
  <h4> Tipo de descuento : <c:out value="${descuento.tipo_descuento}"/> </h4>
</c:if>
<table class="tabla">
  <tr>
    <th colspan="5"><c:out value="${datosPerfil.perfil}"/></th>
  </tr>
  <tr>
    <th>Concepto</th>
    <th>Precio/Unit. (Bs.)</th>
    <th>Cantidad</th>
    <th>Descuento</th>
    <th>Monto (Bs.)</th>
  </tr>
  <c:forEach var="lista" items="${listaConceptos}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
      <td><c:out value="${lista.concepto}"/></td>
      <td align="right"><c:out value="${lista.costo}"/></td>
      <td align="center"><c:out value="${lista.cantidad}"/></td>
      <td align="right"><c:out value="${lista.descuento}"/></td>
      <td align="right"><c:out value="${lista.pagado}"/></td>
    </tr>
  </c:forEach>
  <tr>
    <th colspan="4">Son:: <c:out value="${literal}"/></th>
    <td class="colb" align="right"><b><c:out value="${total}"/></b></td>
  </tr>
  <tr>
    <td colspan="5" align="center"><input type="submit" class='aceptar' value="Registrar"></td>
  </tr>
</table>

</form>

<%@ include file="../../Inferior.jsp" %>