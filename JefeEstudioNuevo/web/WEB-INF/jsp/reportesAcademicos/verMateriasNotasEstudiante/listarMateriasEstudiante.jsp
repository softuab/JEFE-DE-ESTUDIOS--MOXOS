<%@ include file="../../Superior.jsp" %>

<div class="titulo">Ver Detalle de notas</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<table class="tabla">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/>
    <th>Estudiante</th>
    <td class="colb"><c:out value="${cliente.nombres}"/>
  </tr>
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosEstudiante.id_plan}"/>
  </tr>
</table>
<br>

<h4>Listado de Materias Cursadas</h4>
<table class="tabla">
  <tr>
    <th>NRO.</th>
    <th>DOCENTE</th>
    <th>GRUPO</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>VER NOTA</th>
  </tr>
  <c:forEach var="lista" items="${lProgramacion}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${contador.count}"/></td>
    <td><c:out value="${lista.nombres}"/></td>
    <td><c:out value="${lista.grupo}"/></td>
    <td><c:out value="${lista.sigla}"/></td>
    <td><c:out value="${lista.materia}"/></td>
    <form name='forma<c:out value="${contador.count}"/>' method='post' action="<c:url value='/verReporteMateriasNotasEstudiante.fautapo'/>">
      <td align="center">     
        <a href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Ver Nota</a>
        <input type=hidden name="gestion"            value="<c:out value="${gestion}"/>">
        <input type=hidden name="periodo"            value="<c:out value="${periodo}"/>">
	<input type=hidden name="id_docente"         value="<c:out value="${lista.id_docente}"/>">
        <input type=hidden name="id_materia"         value="<c:out value="${lista.id_materia}"/>">
        <input type=hidden name="id_estudiante"      value="<c:out value="${datosEstudiante.id_estudiante}"/>">
	<input type=hidden name="id_grupo"           value="<c:out value="${lista.id_grupo}"/>">
	<input type=hidden name="id_modelo_ahorro"   value="<c:out value="${lista.id_modelo_ahorro}"/>">
	<input type=hidden name="materia"            value="<c:out value="${lista.materia}"/>">
	<input type=hidden name="sigla"              value="<c:out value="${lista.sigla}"/>">
      </td>
    </form>
   </tr>
 </c:forEach>
</table>
<%@ include file="../../Inferior.jsp" %>