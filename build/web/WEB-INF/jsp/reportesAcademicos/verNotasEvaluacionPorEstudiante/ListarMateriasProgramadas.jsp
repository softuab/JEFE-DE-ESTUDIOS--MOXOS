<%@ include file="../../Superior.jsp" %>

<div class="titulo">Ver Evaluaci&oacute;n Estudiante</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<table class="tabla">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/>
    <th>Estudiante</th>
    <td class="colb"><c:out value="${datosEstudiante.nombres}"/>&nbsp;<c:out value="${datosEstudiante.paterno}"/>&nbsp;<c:out value="${datosEstudiante.materno}"/>
  </tr>
  <tr>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosEstudiante.id_plan}"/>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
  </tr>
</table>
<br>

<h3>Listado de Materias Programadas</h4>
<h3>Gesti&oacute;n : <c:out value="${periodo}"/>-<c:out value="${gestion}"/> </h3>
<table class="tabla">
  <tr>
    <th>NRO.</th>
    <th>NIVEL</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>GRUPO</th>
    <th>TIPO-EVALUACI&Oacute;N</th>
    <th>FECHA</th>
    <th>DOCENTE</th>
    <th>VER EVALUACI&Oacute;N</th>
  </tr>
  <c:forEach var="lista" items="${lProgramacion}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${contador.count}"/></td>
    <td align="center"><c:out value="${lista.nivel_academico}"/></td>
    <td><c:out value="${lista.sigla}"/></td>
    <td><c:out value="${lista.materia}"/></td>
    <td><c:out value="${lista.grupo}"/></td>
    <td><c:out value="${lista.tipo_evaluacion}"/></td>
    <td><fmt:formatDate value="${lista.fec_modificacion}" pattern="${formatoFecha}"/></td>
    <td><c:out value="${lista.nombres}"/></td>
    <form name='forma<c:out value="${contador.count}"/>' method="post" action="<c:url value="/estudiantes/listarEvaluacionEstudiante.fautapo" />">
    <td>
      <a href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>
        Evaluaci&oacute;n
	<input type="hidden" name="id_asignacion"    value='<c:out value="${lista.id_asignacion}"/>' >
        <input type="hidden" name="id_materia"       value='<c:out value="${lista.id_materia}"/>' >
        <input type="hidden" name="id_programacion"  value='<c:out value="${lista.id_programacion}"/>' >
        <input type="hidden" name="id_estudiante"    value='<c:out value="${datosEstudiante.id_estudiante}"/>' >
      </a>
    </td>      
    </form>
   </tr>
  </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>