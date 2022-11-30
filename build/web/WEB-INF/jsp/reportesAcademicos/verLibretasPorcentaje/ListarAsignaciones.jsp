<%@ include file="../../Superior.jsp" %>

<c:if test="${!empty id_rol}">
  <div class=titulo>Reporte Detalle de Libretas-Porcentaje</div>
  <br>
  <tabla>
    <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/verLibretaPorcentajes.fautapo"/>'>
      <td>
        <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
          <input type="hidden" name="nombres"            value="<c:out value='${nombres}'/>">
          <input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
          <input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">	  
	  <input type="hidden" name="bandera"             value='1'>
      </td>
    </form>
  </table>
  <div class="H3">Docente</div>
  <table class="tabla" border="0">
    <tr>
      <th>NOMBRES</th>
      <th>GESTI&Oacute;N</th>
      <th>PERIODO</th>
    </tr>
    <tr>
      <td class="etiqueta" align="center"><c:out value="${nombres}"/></td>
      <td class="etiqueta" align="center"><c:out value="${gestion}"/></td>
      <td class="etiqueta" align="center"><c:out value="${periodo}"/></td>
    </tr>
  </table>
  <br>
  <c:if test="${ empty datosAsignacion}">
    <center><div class="cuadroAviso" align="center">No existen materias asignadas para la gesti&oacute;n <c:out value="${gestion}"/>, periodo <c:out value="${periodo}"/></div></center>
  </c:if>
  <c:if test="${ !empty datosAsignacion}">
    <div="H3">Materias asignadas</div>
    <table class="tabla" border="0">
      <tr>
        <th align="center">FASE</th>
        <th align="center">EVALUACI&Oacute;N</th>
        <th align="center">CARRERA/PROGRAMA</th>
        <th align="center">GRUPO</th>
        <th align="center">SIGLA</th>
        <th align="center">MATERIA</th>
	<th align="center">MATERIA AHORRO</th>
        <th align="center" colspan="3">VER LIBRETA</th>
      </tr>
      <c:forEach var="asignacion" items="${datosAsignacion}" varStatus="contador">
        <!-- ********** Esto es para el efecto ************ -->
          <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
        <!-- ********** Fin  efecto ************ --> 
        <td>
          <c:out value="${asignacion.fase}"/>
        </td>
        <td>
          <c:out value="${asignacion.tipo_evaluacion}"/>
        </td>
        <td>
          <c:out value="${asignacion.programa}"/>
        </td>
        <td align="center">
          <c:out value="${asignacion.grupo}"/>
        </td>
        <td align="center">
          <c:out value="${asignacion.sigla}"/>
        </td>
	<td align="center">
          <c:out value="${asignacion.materia}"/>
        </td>
	<c:if test="${asignacion.id_modelo_ahorro <= 0}">
	  <td align="center">
	    ---
	  </td>
	</c:if>    
        <c:if test="${asignacion.id_modelo_ahorro > 0}">
          <c:forEach var="asignacionahorro" items="${asignacion.materia_ahorro}">
	    <td>
              <c:out value="${asignacionahorro.modelo_ahorro}"/>
	    </td>
          </c:forEach>
        </c:if>
        <form name='forma<c:out value="${contador.count}"/>' method='post' action="<c:url value='/listarLibretaEstudiantesPorcentajes.fautapo'/>" target="_blank">
          <td align="center">     
            <a href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Libreta</a>
	    <input type="hidden" name="nombres"          value="<c:out value='${nombres}'/>">
	    <input type=hidden name="id_materia"         value="<c:out value="${asignacion.id_materia}"/>"> 
            <input type=hidden name="materia"            value="<c:out value="${asignacion.materia}"/>">
            <input type=hidden name="id_grupo"           value="<c:out value="${asignacion.id_grupo}"/>">
            <input type=hidden name="grupo"              value="<c:out value="${asignacion.grupo}"/>">    
            <input type=hidden name="id_programa"        value="<c:out value="${asignacion.id_programa}"/>">
            <input type=hidden name="id_fase"            value="<c:out value="${asignacion.id_fase}"/>">
            <input type=hidden name="id_tipo_evaluacion" value="<c:out value="${asignacion.id_tipo_evaluacion}"/>">
            <input type=hidden name="tipo_evaluacion"    value="<c:out value="${asignacion.tipo_evaluacion}"/>">
            <input type=hidden name="gestion"            value="<c:out value="${gestion}"/>">
            <input type=hidden name="periodo"            value="<c:out value="${periodo}"/>">
            <input type=hidden name="id_docente"         value="<c:out value="${asignacion.id_docente}"/>">
            <input type=hidden name="id_modelo_ahorro"   value="<c:out value="${asignacion.id_modelo_ahorro}"/>">
	    <input type=hidden name="id_departamento"    value="<c:out value="${asignacion.id_departamento}"/>">
	    <c:forEach var="asignacionahorro" items="${asignacion.materia_ahorro}">
	      <input type=hidden name="modelo_ahorro"      value="<c:out value="${asignacionahorro.modelo_ahorro}"/>">
	    </c:forEach>  
	    <input type=hidden name="id_tipo_grado"      value="<c:out value="${asignacion.id_tipo_grado}"/>">
          </td>
        </form>
      </tr>
    </form>
  </c:forEach>
</table>
</c:if>
</c:if>

<%@ include file="../../Inferior.jsp" %>