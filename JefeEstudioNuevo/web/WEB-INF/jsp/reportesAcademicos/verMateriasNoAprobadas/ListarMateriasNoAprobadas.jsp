<%@ include file="../../Superior.jsp" %>

<div class="titulo">Ver Materias No Aprobadas</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<table class="tabla">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/>
    <th>Estudiante</th>
    <td class="colb"><c:out value="${cliente.nombres}"/>
  </tr>
  <tr>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosEstudiante.id_plan}"/>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
  </tr>
</table>
<br>

<h4>Listado de Materias No Aprobadas</h4>
<table class="tabla">
  <tr>
    <th>NIVEL</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>MENCION</th>
  </tr>
  <c:forEach var="lista" items="${lMateriasNoAprobadas}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${lista.nivel_academico}"/></td>
    <td><c:out value="${lista.sigla}"/></td>
    <td><c:out value="${lista.materia}"/></td>
    <td><c:out value="${lista.mencion}"/></td>
   </tr>
 </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>