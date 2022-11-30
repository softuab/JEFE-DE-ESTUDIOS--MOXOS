<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Administrar Estudiante Antiguo</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/estudianteAntiguo/entrada.fautapo'/>" method="post">
      <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
      <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
      <input type="hidden" name="titulo"     value="<c:out value='${titulo}'/>">
      <input type="hidden" name="gestion"    value="<c:out value='${gestion}'/>">
      <input type="hidden" name="periodo"    value="<c:out value='${periodo}'/>">
      <input type="hidden" name="dip"        value="<c:out value='${dip}'/>">
      <input type="hidden" name="nombre"     value="<c:out value='${nombre}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
</tr>
</table>

<div class="centro">
  <table class="tabla">
  <tr>
    <th colspan="8">INFORMACION ENCONTRADA</th>
  </tr>
  <tr>
    <th>1er. Apellido</th>
    <th>2do. Apellido</th>
    <th>Nombres</th>
    <th>C&eacute;dula de Identidad</th>
    <th>Programa (Carrera)</th>
    <th>Registrar Datos</th>
  </tr>
 <c:if test="${empty datosEstudiante}"> 
  <c:forEach var="lista" items="${lEstudiantes}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${lista.paterno}"/></td>
      <td><c:out value="${lista.materno}"/></td>
      <td><c:out value="${lista.nombres}"/></td>
      <td><c:out value="${lista.dip}"/></td>
      <td><c:out value="${lista.programa}"/></td>
      <td>
        <c:if test="${empty lista.id_estado }">
        <form name="fnuevo<c:out value='${contador.count}'/>" action="<c:url value='/estudianteAntiguo/modificarEstudiante.fautapo'/>" method="post">
        <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
        <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
        <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
	<input type="hidden" name="nombre" value="<c:out value='${nombre}'/>">
	<input type="hidden" name="titulo" value="<c:out value='${ru}'/>">
	<input type="hidden" name="id_estudiante" value="<c:out value='${lista.id_estudiante}'/>">
        <div> <a class="agregar" href="javascript:document.fnuevo<c:out value='${contador.count}'/>.submit();"> Registrar Datos</a> </div>
        </form>
	</c:if>
	<c:if test="${(!empty lista.id_estado) && (lista.id_estado == 'M')}">
	 <font color="red"> Matriculado  <c:out value='${gestion}'/> /<c:out value='${periodo}'/> </font>
	</c:if>
      </td>
    </tr>
  </c:forEach>
  </c:if> 
  <c:if test="${!empty datosEstudiante}"> 
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${datosEstudiante.paterno}"/></td>
      <td><c:out value="${datosEstudiante.materno}"/></td>
      <td><c:out value="${datosEstudiante.nombres}"/></td>
      <td><c:out value="${datosEstudiante.dip}"/></td>
      <td><c:out value="${datosEstudiante.programa}"/></td>
      <td>
        <c:if test="${datosEstudiante.id_estado != 'M'}">
        <form name="fnuevo<c:out value='${contador.count}'/>" action="<c:url value='/estudianteAntiguo/modificarEstudiante.fautapo'/>" method="post">
        <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
        <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
        <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
	<input type="hidden" name="id_estudiante" value="<c:out value='${datosEstudiante.id_estudiante}'/>">
        <div> <a class="agregar" href="javascript:document.fnuevo<c:out value='${contador.count}'/>.submit();"> Registrar Datos</a> </div>
        </form>
	</c:if>
	<c:if test="${datosEstudiante.id_estado == 'M'}">
	 <font color="red"> Matriculado  <c:out value='${gestion}'/> /<c:out value='${periodo}'/> </font>
	</c:if>
      </td>
    </tr>
  </c:if>
  </table>
</div>


<%@ include file="../../Inferior.jsp" %>