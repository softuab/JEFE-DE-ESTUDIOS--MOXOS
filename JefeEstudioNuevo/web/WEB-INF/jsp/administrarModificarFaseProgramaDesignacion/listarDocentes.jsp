<%@ include file="../Superior.jsp" %>

<c:if test="${!empty id_rol}">
  <div class=titulo>Admin. Retroceder fase</div>
  <div class="volver"><a href="javascript:history.back();">Volver</a></div>
  <br>
  <table class="tabla" border="0">
    <tr>
      <th>FACULTAD</th>
      <th>DEPARTAMENTO</th>
      <th>TIPO DE EVALUACION</th>
      <th>GESTI&Oacute;N</th>
      <th>PERIODO</th>
    </tr>
    <tr>
      <td class="etiqueta" align="center"><c:out value="${datosFacultad.facultad}"/></td>
      <td class="etiqueta" align="center"><c:out value="${fcldepartamento}"/></td>
      <td class="etiqueta" align="center"><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/></td>
      <td class="etiqueta" align="center"><c:out value="${gestion}"/></td>
      <td class="etiqueta" align="center"><c:out value="${periodo}"/></td>
    </tr>
  </table>
  <br>
  <c:if test="${ empty datosAsignacion}">
    <center><div class="cuadroAviso" align="center">No existen materias para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/> y tipo de evaluacion </div></center>
  </c:if>
  <c:if test="${ !empty datosAsignacion}">
    <table class="tabla" border="0">
      <tr>
        <th align="center">NRO</th>
	<th align="center">CARRERA/PROGRAMA</th>
        <th align="center">GRUPO</th>
        <th align="center">SIGLA</th>
        <th align="center">MATERIA</th>
	<th align="center">DOCENTE</th>
	<th align="center">FASE</th>
        <th align="center">RETROCEDER FASE</th>
      </tr>
      <c:forEach var="asignacion" items="${datosAsignacion}" varStatus="contador">
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	<td>
          <c:out value="${contador.count}"/>
        </td>
        <td>
          <c:out value="${asignacion.programa}"/>
        </td>
        <td align="center">
          <c:out value="${asignacion.grupo}"/>
        </td>
        <td>
          <c:out value="${asignacion.sigla}"/>
        </td>
	<td>
          <c:out value="${asignacion.materia}"/>
        </td>
	<td>
          <c:out value="${asignacion.nombres}"/>
        </td>
	<td>
	 <c:if test="${asignacion.id_fase >= 1000}" >
	   <font color="red"> 
	 </c:if> 
          <c:out value="${asignacion.fase}"/>
	 <c:if test="${asignacion.id_fase >= 1000}">
	  </font> 
	 </c:if> 
        </td>
	<c:if test="${asignacion.id_fase <=1000}">
        <form name='forma<c:out value="${contador.count}"/>' method='post' action="<c:url value='/retrocederFaseDesignacionModificar/confirmarModificarFaseDocente.fautapo'/>">
          <td align="center">     
            <a href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Retroceder</a>
	    <input type=hidden name="id_asignacion"         value="<c:out value="${asignacion.id_asignacion}"/>"> 
	    <input type=hidden name="departamento"          value="<c:out value='${fcldepartamento}'/>">
	    <input type=hidden name="id_departamento"       value="<c:out value="${id_departamento}"/>"> 
	    <input type=hidden name="id_tipo_evaluacion"    value="<c:out value="${id_tipo_evaluacion}"/>"> 
	    <input type=hidden name="tipo_evaluacion"       value="<c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/>"> 
	    <input type=hidden name="id_facultad"           value="<c:out value='${id_facultad}'/>">
	    <input type=hidden name="facultad"              value="<c:out value='${datosFacultad.facultad}'/>">
	    <input type=hidden name="id_materia"            value="<c:out value="${asignacion.id_materia}"/>"> 
            <input type=hidden name="materia"               value="<c:out value="${asignacion.materia}"/>">
            <input type=hidden name="id_grupo"              value="<c:out value="${asignacion.id_grupo}"/>">
            <input type=hidden name="grupo"                 value="<c:out value="${asignacion.grupo}"/>">    
            <input type=hidden name="id_programa"           value="<c:out value="${asignacion.id_programa}"/>">
	    <input type=hidden name="programa"              value="<c:out value="${asignacion.programa}"/>">
            <input type=hidden name="id_fase"               value="<c:out value="${asignacion.id_fase}"/>">
	    <input type=hidden name="fase"                  value="<c:out value="${asignacion.fase}"/>">
            <input type=hidden name="gestion"               value="<c:out value="${gestion}"/>">
            <input type=hidden name="periodo"               value="<c:out value="${periodo}"/>">
	    <input type=hidden name="nombres"               value="<c:out value="${asignacion.nombres}"/>">
            <input type=hidden name="id_docente"            value="<c:out value="${asignacion.id_docente}"/>">
	    <input type=hidden name="id_tipo_docente"       value="<c:out value="${asignacion.id_tipo_docente}"/>">
            <input type=hidden name="id_modelo_ahorro"      value="<c:out value="${asignacion.id_modelo_ahorro}"/>">
          </td>
        </form>
	</c:if>
	<c:if test="${asignacion.id_fase > 1000}">
	  <font color="red"> Libreta Cerrada 
	</c:if>
      </tr>
    </form>
    </c:forEach>
  </table>
 </c:if>
</c:if>

<%@ include file="../Inferior.jsp" %>