<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Administrar Estudiante Nuevo</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>
<table class="tabla">
  <tr>
    <th>GESTION</th>
    <th>PERIODO</th>
    <th>TIPO DE <br>ADMISION</th>
  </tr>
    <td><c:out  value="${gestion}"/></td>
    <td><c:out  value="${periodo}"/></td>
    <td><c:out  value="${datosTipoAdm.tipo_admision}"/></td>
  </tr>
</table>
<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/estudianteNuevoPost/entrada.fautapo'/>" method="post">
      <input type="hidden" name="id_proceso"                value="<c:out value='${id_proceso}'/>">
      <input type="hidden" name="id_tramite"                value="<c:out value='${id_tramite}'/>">
      <input type="hidden" name="titulo"                    value="<c:out value='${titulo}'/>">
      <input type="hidden" name="gestion"                   value="<c:out value='${gestion}'/>">
      <input type="hidden" name="periodo"                   value="<c:out value='${periodo}'/>">
      <input type="hidden" name="dip"                       value="<c:out value='${dip}'/>">
      <input type="hidden" name="nombre"                    value="<c:out value='${nombre}'/>">
      <input type="hidden" name="id_tipo_admision_entrada"  value="<c:out value='${datosTipoAdm.id_tipo_admision}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
</tr>
</table>

<table class="tabla">
  <tr>
    <th colspan="11">INFORMACION ENCONTRADA EN ESTUDIANTES</th>
  </tr>
  <tr>
    <th>Nro.</th>
    <th>R.U.</th>
    <th>Nombres</th>
    <th>DIP</th>
    <th>Programa<br>(Carrera)</th>
    <th>Fecha de Insripci&oacute;n</th>
    <th>Estado</th>
    <th>Registrar</th>
  </tr>
  <c:forEach var="lista" items="${lEstudiantes}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${contador.count}"/></td>
      <td><c:out value="${lista.id_estudiante}"/></td>
      <td><c:out value="${lista.paterno}"/>&nbsp;<c:out value="${lista.materno}"/>&nbsp;<c:out value="${lista.nombres}"/></td>
      <td><c:out value="${lista.dip}"/></td>
      <td><c:out value="${lista.programa}"/></td>
      <td><fmt:formatDate value="${lista.fec_inscripcion}" pattern="dd/MM/yyyy"/></td>
      <td>
        <c:if test="${lista.id_estado == 'A'}"> Activo</c:if>
	<c:if test="${lista.id_estado == 'B'}"><font color="red">Bloqueado</font></c:if>
      </td>
      <td>
        <form name="fnuevo<c:out value='${contador.count}'/>" action="<c:url value='/estudianteNuevoPost/nuevoEstudianteAdmisionEspecial.fautapo'/>" method="post">
        <input type="hidden" name="id_proceso"                value="<c:out value='${id_proceso}'/>">
        <input type="hidden" name="id_tramite"                value="<c:out value='${id_tramite}'/>">
        <input type="hidden" name="titulo"                    value="<c:out value='${titulo}'/>">
	<input type="hidden" name="id_estudiante"             value="<c:out value='${lista.id_estudiante}'/>">
        <input type="hidden" name="gestion"                   value="<c:out value='${gestion}'/>">
        <input type="hidden" name="periodo"                   value="<c:out value='${periodo}'/>">
	<input type="hidden" name="id_tipo_admision_entrada"  value="<c:out value='${datosTipoAdm.id_tipo_admision}'/>">
        <div> <a class="agregar" href="javascript:document.fnuevo<c:out value='${contador.count}'/>.submit();"> Registrar</a> </div>
        </form>
      </td>
    </tr>
  </c:forEach>
</table>


<%@ include file="../../Inferior.jsp" %>