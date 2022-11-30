<%@ include file="../../SuperiorCajas.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table width="90%">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito' >
        <div> <a href="javascript:document.fvolver.submit();">
        <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion" width="50" height="50"></a></div>
      </form>
    </td>
    <td width="72%" align="center">
      <table width="100%" heigth="100%" cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><font size="5"><b><c:out value='${datosInstitucion.institucion}'/></font></td>
        <tr>
        <tr>
          <td align="center"><font size="3"><b><c:out value='${datosInstitucionsede.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></b></font></td>
        <tr>
        </tr>
        <!--  <td align="center"><font size="2"><c:out value='${datosInstitucion.actividad}'/></font></td>  -->
        </tr>
      </table>
    </td>
    <td width="14%">
      <font size="2">Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a></font> 
    </td>
  </tr>
</table>
<hr>
<center>
<table>
  <tr>
    <td colspan="2"><font size="5"><b>REIMPRESION - CERTIFICADO <c:out value="${datosTransaccion.nro_recibo}"/></font></b></td>
  </tr>
</table>
</center>
<br>

<table class="tabla2">
  <tr>
    <th>Estudiante</th>
    <td>
      <c:out value="${estudiante.nombres}"/> <c:out value="${estudiante.paterno}"/> <c:out value="${estudiante.materno}"/>
    </td>
    <th>RU</th>
    <td><c:out value="${estudiante.id_estudiante}"/></td>
    <th>Gesti&oacute;n</th>
    <td><c:out value="${datosTransaccion.periodo}"/>-<c:out value="${datosTransaccion.gestion}"/></td>
  </tr>
  <tr>
    <th>Programa</th>
    <td><c:out value="${estudiante.programa}"/>
    <th>Plan</th>
    <td><c:out value="${estudiante.id_plan}"/>
    <th>Fecha de Pago</th>
    <td><fmt:formatDate value="${datosTransaccion.fec_pago}" pattern="${formatoFecha} ${formatoHora}"/></td>
  </tr>
  <c:if test="${!empty descuento}">
    <tr>
      <td><h4> Tipo de descuento : <c:out value="${descuento.tipo_descuento}"/> </h4></td>
    </tr>
  </c:if>
</table>
<br>

<c:set var="_id_perfil_ant" value="0" />
<table class="tabla">
  <c:forEach var="lista" items="${lDetalles}" varStatus="contador">
    <c:if test="${lista.id_perfil != _id_perfil_ant}">
      <c:set var="_id_perfil_ant" value="${lista.id_perfil}"/>
      <tr>
        <th colspan="5"><c:out value="${lista.perfil}"/></th>
      </tr>
      <c:if test="${contador.count == 1}">
        <tr>
          <th>Concepto</th>
          <th>Precio/Unit. (Bs.)</th>
          <th>Cantidad</th>
          <th>Descuento</th>
          <th>Monto (Bs.)</th>
        </tr>
      </c:if>
    </c:if>
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

<table class="tabla2" width="100%">
  <tr>
    <td align="center">
      ...............................................
      <br><c:out value="${datosTransaccion.nombres}"/>
      <br><b>Encargado(a) de cajas</b>
    </td>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>
