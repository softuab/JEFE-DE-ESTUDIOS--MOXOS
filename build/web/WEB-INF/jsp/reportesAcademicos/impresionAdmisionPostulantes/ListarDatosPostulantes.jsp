<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Ver Datos Postulantes</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/postulantes/entradaBuscarPst.fautapo'/>" method="post">
      <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
      <input type="hidden" name="periodo"  value="<c:out value='${periodo}'/>">
      <input type="hidden" name="nombre"  value="<c:out value='${nombre}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
</tr>
</table>

<table class="tabla">
  <tr>
    <th colspan="9">INFORMACION ENCONTRADA </th>
  </tr>
  <tr>
    <th>Nro</th>
    <th>R.P.</th>
    <th>Nombres</th>
    <th>C.I.</th>
    <th>Programa<br>(Carrera)</th>
    <th>Gesti&oacute;n</th>
    <th>Periodo</th>
    <th>Tipo Admisi&oacute;n</th>
    <th>SITUACION</th>
  </tr>
  <c:forEach var="lista" items="${lPostulantes}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${contador.count}"/></td>
      <td><c:out value="${lista.id_postulante}"/></td>
      <td><c:out value="${lista.paterno}"/>&nbsp;<c:out value="${lista.materno}"/>&nbsp;<c:out value="${lista.nombres}"/></td>
      <td><c:out value="${lista.dip}"/></td>
      <td><c:out value="${lista.programa}"/></td>
      <td><c:out value="${lista.gestion}"/></td>
      <td><c:out value="${lista.periodo}"/></td>
      <td><c:out value="${lista.tipo_admision}"/></td>
      <td>
        <c:if test="${lista.id_estado == 'A'}">
        <form name="fnuevo<c:out value='${contador.count}'/>" action="<c:url value='/postulantes/verDatosPostulante.fautapo'/>" method="post" target="_blank">
	<input type="hidden" name="id_postulante" value="<c:out value='${lista.id_postulante}'/>">
        <div> <a class="agregar" href="javascript:document.fnuevo<c:out value='${contador.count}'/>.submit();"> Certificado Habilitaci&oacute;n</a> </div>
        </form>
	</c:if>
	<c:if test="${(lista.id_estado == 'P') &&(lista.id_tipo_admision > 2 )}">
	 <font color="red"> No Habilitado <br> </font>
	 <form name="fsolicitud<c:out value='${contador.count}'/>" action="<c:url value='/postulantes/verDatosPostulante.fautapo'/>" method="post" target="_blank">
	  <input type="hidden" name="id_postulante" value="<c:out value='${lista.id_postulante}'/>">
          <div> <a class="agregar" href="javascript:document.fsolicitud<c:out value='${contador.count}'/>.submit();"> Solicitud</a> </div>
        </form>
	</c:if>
	<c:if test="${(lista.id_estado == 'E') &&(lista.id_tipo_admision > 2 )}">
	 <font color="red"> Inscrito <br> </font>
	 <form name="fsolicitud2<c:out value='${contador.count}'/>" action="<c:url value='/postulantes/verDatosPostulante.fautapo'/>" method="post" target="_blank">
	  <input type="hidden" name="id_postulante" value="<c:out value='${lista.id_postulante}'/>">
          <div> <a class="agregar" href="javascript:document.fsolicitud2<c:out value='${contador.count}'/>.submit();"> Solicitud</a> </div>
        </form>
	</c:if>
	<c:if test="${lista.id_estado == 'P'}">
	 <font color="red"> No Habilitado</font>
	</c:if>
      </td>
    </tr>
  </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>