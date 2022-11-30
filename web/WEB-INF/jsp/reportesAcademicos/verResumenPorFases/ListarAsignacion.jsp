<%@ include file="../../Superior.jsp" %>

  <div class=titulo>Ver Reporte Acta Por Fases</div>
  <br>
  <tabla>
    <form name=formavolver<c:out value="${contador.count}"/> method="post" action="entrada.fautapo">
      <td>
        <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
          <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
          <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
	  <input type="hidden" name="bandera" value="1">
      </td>
    </form>
  </table>
  <table class="tabla" border="0">
    <tr>
      <th>CODIGO</th>
      <td class="etiqueta" align="center"><c:out value="${id_docente}"/></td>
      <th>DOCENTE</th>
      <td class="etiqueta" align="center"><c:out value="${usuario}"/></td>
      <th>GESTI&Oacute;N</th>
      <td class="etiqueta" align="center"><c:out value="${gestion}"/></td>
      <th>PERIODO</th>
      <td class="etiqueta" align="center"><c:out value="${periodo}"/></td>
    </tr>
  </table>
  <br>
  <c:if test="${ empty lAsignacionMaterias}">
    <center><div class="cuadroAviso" align="center">No existen materias para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/></div></center>
  </c:if>
  <c:if test="${ !empty lAsignacionMaterias}">
    <table class="tabla" border="0">
      <tr>
        <th>NRO</th>
	<th>TIPO EVALUACION</th>
	<th>FASE</th>
	<th>PROGRAMA</th>
	<th>NIVEL<br>ACADEMICO</th>
        <th>GRUPO</th>
        <th>SIGLA</th>
        <th>MATERIA</th>
        <th colspan="3">VER RESUMEN DE CALIFICACIONES</th>
      </tr>
      <c:forEach var="asignacion" items="${lAsignacionMaterias}" varStatus="contador">
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	  <td><c:out value="${contador.count}"/></td>
	  <td><c:out value="${asignacion.tipo_evaluacion}"/></td>
	  <td><c:out value="${asignacion.fase}"/></td>
	  <td><c:out value="${asignacion.programa}"/></td>
	  <td align="center"><c:out value="${asignacion.nivel_academico}"/></td>
          <td align="center"><c:out value="${asignacion.grupo}"/></td>
          <td><c:out value="${asignacion.sigla}"/></td>
	  <td><c:out value="${asignacion.materia}"/></td>
        <form name='forma<c:out value="${contador.count}"/>' method='post' action="listarEvaluacion.fautapo" target="_blank">
          <td align="center">
	    <c:if test="${(asignacion.id_fase == '1') || (asignacion.id_fase == '1000') || (asignacion.id_fase == '7000')}">
            <a href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Ver Calificaciones</a>
	    <input type="hidden" name="id_asignacion" value="<c:out value='${asignacion.id_asignacion}'/>">
            <input type="hidden" name="id_programa"   value="<c:out value="${asignacion.id_programa}"/>">
	    <input type="hidden" name="id_plan"       value="<c:out value='${asignacion.id_plan}'/>">
	    </c:if>
	    <c:if test="${(asignacion.id_fase != '1') && (asignacion.id_fase != '1000') && (asignacion.id_fase != '7000')}">
	      <font color="red"> Libreta no avanzada </font>
	    </c:if>
          </td>
        </form>
      </tr>
    </form>
    </c:forEach>
  </table>
 </c:if>

<%@ include file="../../Inferior.jsp" %>