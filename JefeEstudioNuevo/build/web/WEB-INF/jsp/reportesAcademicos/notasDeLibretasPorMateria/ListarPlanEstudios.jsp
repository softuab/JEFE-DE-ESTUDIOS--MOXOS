<%@ include file="../../Superior.jsp" %>

<div class="titulo">Evaluaci&oacute;n de Estudiantes por Materia</div>
<form name="fvolver" method="POST" action='listarProgramasPlanes.fautapo' >
  <input type="hidden" name="id_facultad"        value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_prg_plan"        value="<c:out value="${id_prg_plan}"/>">
  <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
  <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
  <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<table class="tabla">
  <tr>
    <th>Gesti&oacute;n</th>
    <td class="colb"><c:out value="${gestion}"/></td>
    <th>Periodo</th>
    <td class="colb"><c:out value="${periodo}"/></td>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/></td>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosPrgPlan.id_plan}"/></td>
    <th>Tipo Evaluaci&oacute;n</th>
    <td class="colb"><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/></td>
  </tr>
</table>
<br>

<form name="forma" method="POST" action='listarEvaluacionEstudiantes.fautapo' target="_blank">
  <input type="hidden" name="id_prg_plan"        value="<c:out value="${datosPrgPlan.id_prg_plan}"/>">
  <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
  <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
  <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
  <table class="tabla">
    <tr>
      <th>?</th>
      <th>MENCION</th>
      <th>NIVEL</th>
      <th>SIGLA</th>
      <th>MATERIA</th>
      <th>GRUPO</th>
      <th>NRO. PROGRAMADOS</th>
    </tr>
    <c:set var="nivel_academico_ant" value="0"/>
    <c:forEach var="lista" items="${lMateriasPlan}" varStatus="contador">
      <c:if test="${nivel_academico_ant != lista.nivel_academico}">
        <tr>
          <td colspan="6">NIVEL :: <c:out value="${lista.nivel_academico}"/></td>
        </tr>
      </c:if>
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
        <td class="colb"><input type="radio" name="id_materia" value="<c:out value="${lista.id_materia}"/>:<c:out value="${lista.id_modelo_ahorro}"/>:<c:out value="${lista.id_grupo}"/>"></td>
        <td><c:out value="${lista.mencion}"/></td>
        <td><c:out value="${lista.nivel_academico}"/></td>
        <td><c:out value="${lista.sigla}"/></td>
        <td><c:out value="${lista.materia}"/></td>
        <td align="center"><c:out value="${lista.grupo}"/></td>
        <td align="center"><c:out value="${lista.numero}"/></td>
      </tr>
      <c:set var="nivel_academico_ant" value="${lista.nivel_academico}"/>
    </c:forEach>
  </table>
  <center>
      <input type="submit" class="siguiente" value='Siguiente'>
  </center>
</form>

<%@ include file="../../Inferior.jsp" %>