<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Administrar Estudiante Antiguo  Documentos</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/estudianteAntiguoDocumentos/entrada.fautapo'/>" method="post">
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
    <th>Estado<br>de Estudiante</th>
    <th>Registrar Datos</th>
  </tr>
  <c:if test="${!empty datosEstudiante}"> 
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${datosEstudiante.paterno}"/></td>
      <td><c:out value="${datosEstudiante.materno}"/></td>
      <td><c:out value="${datosEstudiante.nombres}"/></td>
      <td><c:out value="${datosEstudiante.dip}"/></td>
      <td><c:out value="${datosEstudiante.programa}"/></td>
      <td><c:if test="${datosEstudiante.id_estado !='A'}"><blink><c:out value="${datosEstudiante.estado}"/></blink></c:if> <c:if test="${datosEstudiante.id_estado =='A'}"><c:out value="${datosEstudiante.estado}"/> </c:if></td>
      <td>
        <form name="fnuevo<c:out value='${contador.count}'/>" action="<c:url value='/estudianteAntiguoDocumentos/modificarEstudiante.fautapo'/>" method="post">
          <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
          <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
          <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
	  <input type="hidden" name="id_estudiante" value="<c:out value='${datosEstudiante.id_estudiante}'/>">
          <div> <a class="agregar" href="javascript:document.fnuevo<c:out value='${contador.count}'/>.submit();"> Ver Datos</a> </div>
        </form>
      </td>
    </tr>
  </c:if>
  </table>
</div>


<%@ include file="../../Inferior.jsp" %>