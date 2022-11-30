<%@ include file="../../SuperiorCajas.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table class="tabla2">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito' >
        <div> <a href="javascript:document.fvolver.submit();">
        <img src="<c:url value='${datosInstitucion.logo}'/>" border="0" alt="logo institucion" width="50" height="70"></a></div>
      </form>
    </td>
    <td width="72%" align="center">
      <table width="100%" cellpading="2" cellspacing="0">
        <tr>
          <td align="center"><font size="4"><b><c:out value='${datosInstitucion.institucion}'/></font></td>
        <tr>
        <tr>
          <td align="center"><font size="2"><b><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></b></font></td>
        <tr>
        </tr>
          <td align="center"><c:out value='${datosInstitucion.actividad}'/></td>
        </tr>
      </table>
    </td>
    <td width="14%">
      Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a>
    </td>
  </tr>
</table>
<hr>

<center>
<table>
  <tr>
    <td colspan="2"><font size="4"><b>RECIBO Nro. &nbsp; <c:out value="${datosTransaccion.nro_recibo}"/></font></b></td>
  </tr>
</table>
</center>
<br>
<table class="tabla2">
  <tr>
    <th>Nombre</th>
    <td>
      <c:out value="${persona.nombres}"/>&nbsp;<c:out value="${persona.paterno}"/>&nbsp;<c:out value="${persona.materno}"/>
    </td>
    <th>Gesti&oacute;n</th>
    <td><c:out value="${periodo}"/>-<c:out value="${gestion}"/></td>
    <th>Fecha de Pago</th>
    <td><fmt:formatDate value="${datosTransaccion.fec_pago}" pattern="${formatoFecha} ${formatoHora}"/></td>
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
  <c:forEach var="lista" items="${lDetalles}" varStatus="contador">
    <tr>
      <td><c:out value="${lista.concepto}"/></td>
      <td align="right"><c:out value="${lista.costo}"/></td>
      <td align="center"><c:out value="${lista.cantidad}"/></td>
      <td align="right"><c:out value="${lista.descuento}"/></td>
      <td align="right"><c:out value="${lista.pagado}"/></td>
    </tr>
  </c:forEach>
  <tr>
    <th colspan="4">Son:: <c:out value="${literal}"/></th>
    <td align="right"><b><c:out value="${datosTransaccion.pagado}"/></b></td>
  </tr>
</table>
<br>

<br><br><br><br>
<table class="tabla2">
  <tr>
    <td align="center">
      ...............................................
      <br><c:out value="${datosTransaccion.nombres}"/>
      <br><b>Encargado(a) de cajas</b>
    </td>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>