<%@ include file="../../Superior.jsp" %>

<div class="titulo">Inscripci&oacute;n de materias</div>
<br>
<table class="tabla">
 <tr>
   <th class="2"> Materias que no fueron inscritas por falta de cupo 
   </th>
 </tr>
 <tr class=colh>
    <th>SIGLA</th>
    <th>MATERIA</th>
  <c:forEach var="materias" items="${lMaterias}" varStatus="contador">
  <!-- ********** Esto es para el efecto ************ -->
  <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
   <!-- ********** Fin  efecto ************ --> 
    <td><c:out value="${materias.sigla}"/></td>
    <td><c:out value="${materias.materia}"/></td>
  </tr>
  </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>