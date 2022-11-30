<%@ include file="../../Superior.jsp" %>
<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<table borber=0>
  <tr><td valign="top">
  <table class="tabla">
    <tr>
      <th colspan="3" align="center">DATOS PERSONALES</th>
    </tr>
    <tr>
      <td class="etiqueta" align="right">RU</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${id_estudiante}"/></td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Estudiante</td>
      <td class="etiqueta">::</td>
      <td>
        <c:out value="${datosEstudiante.nombres}"/> &nbsp; 
        <c:out value="${datosEstudiante.paterno}"/> &nbsp;
        <c:out value="${datosEstudiante.materno}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Facultad</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.facultad}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Programa</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.programa}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Plan</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.id_plan}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Nacionalidad</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.nacionalidad}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Direcci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.direccion}"/>
    </tr>
  </table>
<td valign="top">
  <table id="carrito" class="tabla">
     <tr><th>Periodo</th><th>Gesti&oacute;n</th><th>Imprimir</th></tr>
      <c:forEach var="l" items="${lGestiones}" varStatus="contador">
        <tr>
	  <td><c:out value="${l.periodo}"/></td>
	  <td><c:out value="${l.gestion}"/></td>
	  <form name='forma<c:out value="${contador.count}"/>' method='post' action="<c:url value='/listarCertificadoEstudianteReporte.fautapo'/>" target="_blank">
          <td align="center">     
            <a href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Imprimir</a>
	    <input type="hidden" name="id_proceso"    value='<c:out value="${datosProceso.id_proceso}"/>'>
            <input type=hidden name="gestion"         value="<c:out value="${l.gestion}"/>">
            <input type=hidden name="periodo"         value="<c:out value="${l.periodo}"/>">
            <input type=hidden name="id_estudiante"   value="<c:out value="${l.id_estudiante}"/>">
	    
	    <input type="hidden" name="nombres" value='${datosEstudiante.paterno} ${datosEstudiante.materno} ${datosEstudiante.nombres} '>
	    <input type="hidden" name="facultad" value="${datosEstudiante.facultad}">
	    <input type="hidden" name="programa" value="${datosEstudiante.programa}">
	    <input type="hidden" name="facultad" value="${datosEstudiante.id_plan}">
          </td>
          </form>
	  </td>
	</tr>
      </c:forEach>
  </table>
</td>
</tr>
</table>
</form>

<%@ include file="../../Inferior.jsp" %>