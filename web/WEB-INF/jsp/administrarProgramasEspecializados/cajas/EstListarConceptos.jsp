<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<!--<form name="forma" id="forma" method="post" action="estRegistrarTransaccion.fautapo" >-->
<form name="forma" id="forma" method="post" action="<c:url  value="/cajas/estRegistrarTransaccion.fautapo"/>" >

  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
  <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
  <input type="hidden" name="total" value="<c:out value="${total}"/>">
  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">

<table class="tabla">
  <tr>
    <th>Estudiante</th>
    <td class="colb">
      <c:out value="${estudiante.nombres}"/> <c:out value="${estudiante.paterno}"/> <c:out value="${estudiante.materno}"/>
    </td>
    <th>RU</th>
    <td class="colb"><c:out value="${estudiante.id_estudiante}"/></td>
    <th>Gesti&oacute;n</th>
    <td class="colb"><c:out value="${periodo}"/>-<c:out value="${gestion}"/></td>
  </tr>
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${estudiante.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${estudiante.id_plan}"/>
    <th>Fecha</th>
    <td class="colb"><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></td>
  </tr>
</table>
<br>
<c:if test="${!empty descuento}">
  <h4>Tipo de descuento : <c:out value="${descuento.tipo_descuento}"/></h4>
</c:if>

<c:set var="_id_perfil_ant" value="0" />
<c:set var="_j" value="0" />
<table class="tabla">
  <c:forEach var="lista" items="${listaConceptos}" varStatus="contador">
    <c:if test="${lista.id_perfil != _id_perfil_ant}">
      <c:set var="_id_perfil_ant" value="${lista.id_perfil}"/>
      <tr>
        <th colspan="5"><c:out value="${lPerfiles[_j].perfil}"/></th>
      </tr>
      <tr>
        <th>Concepto</th>
        <th>Precio/Unit. (Bs.)</th>
        <th>Cantidad</th>
        <th>Descuento</th>
        <th>Monto (Bs.)</th>
      </tr>
      <c:set var="_j" value="${_j + 1}"/>
    </c:if>

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