<%@ include file="../../Superior.jsp"%>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <th colspan="9">RESULTADO DE LA BUSQUEDA</th>
  </tr>
  <tr>
    <th>Nro.</th>
    <th align="left"> C.I.</th>
    <th align="left"> Ap. Paterno</th>
    <th align="left"> Ap. Materno</th>
    <th align="left"> Nombres</th>
    <th></th>
  </tr>
  <c:forEach var="lista" items="${lPstPersonas}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td> <c:out value="${contador.count}"/></td>
      <td> <c:out value="${lista.dip}"/></td>
      <td> <c:out value="${lista.paterno}"/></td>
      <td> <c:out value="${lista.materno}"/></td>
      <td> <c:out value="${lista.nombres}"/></td>
      <td>
      <c:if test="${(lista.id_estado == 'A') || (lista.id_estado == 'E')}">
        <form name="fregistra<c:out value='${contador.count}'/>" action="<c:url value='/buscarPostulanteHabilitado/ListarDatosPostulante.fautapo'/>" method="post">
          <input type="hidden" name="id_proceso"    value="<c:out value='${datosProceso.id_proceso}'/>">
          <input type="hidden" name="id_tramite"    value="<c:out value='${id_tramite}'/>">
          <input type="hidden" name="id_postulante" value="<c:out value='${lista.id_postulante}'/>">
          <div> <a class="agregar" href="javascript:document.fregistra<c:out value='${contador.count}'/>.submit();"> Registrar</a> </div>
        </form>
      </c:if>
      <c:if test="${lista.id_estado == 'P'}">
        <font color="red">No Habilitado</font>
      </c:if>
      </td>
    </tr>
  </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>