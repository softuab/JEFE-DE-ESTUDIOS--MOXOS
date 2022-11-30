<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Buscar Persona</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/personas/entrada.fautapo'/>" method="post">
      <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
      <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
      <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </form>
    </td>
</tr>
</table>
<div class="centro">
  <table class="tabla">
  <tr>
    <th colspan="9">INFORMACION ENCONTRADA</th>
  </tr>
  <tr>
    <th>1er. Apellido</th>
    <th>2do. Apellido</th>
    <th>Nombres</th>
    <th>C.I.</th>
    <th>Inicializar Solicitud</th>
  </tr>
  <c:forEach var="lista" items="${lPersonas}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${lista.paterno}"/></td>
      <td><c:out value="${lista.materno}"/></td>
      <td><c:out value="${lista.nombres}"/></td>
      <td><c:out value="${lista.dip}"/></td>
      <td>
        <form name="fnuevo<c:out value='${contador.count}'/>" action="<c:url value='/listarDatosPersona.fautapo'/>" method="post">
	<input type="hidden" name="id_persona" value="<c:out value='${lista.id_persona}'/>">
	<input type="hidden" name="id_item" value="<c:out value='${lista.id_item}'/>">
	<input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
	<input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
        <div> <a class="agregar" href="javascript:document.fnuevo<c:out value='${contador.count}'/>.submit();"> Solicitud</a> </div>
        </form>
      </td>
      
    </tr>
  </c:forEach>
  </table>
</div>

<%@ include file="../../Inferior.jsp" %>