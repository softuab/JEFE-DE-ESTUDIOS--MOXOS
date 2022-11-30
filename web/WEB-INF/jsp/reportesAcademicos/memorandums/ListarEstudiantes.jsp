<%@ include file="../../Superior.jsp" %>

<div class="titulo">Buscar Estudiantes</div>
<div class="volver"><a href='<c:url value="/buscarEstudianteEntrada.fautapo"/>'>Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <th>Nro.</th>
    <th>RU</th>
    <th>DIP</th>
    <th>NOMBRES</th>
    <th>PROGRAMA</th> 
    <th>PLAN</th>
    <th>TIPO ESTUDIANTE</th>
  </tr>    
  <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
  <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/buscarEstudiante.fautapo"/>'>
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ --> 
      <td><c:out value="${contador.count}"/></td>
      <td><c:out value="${datos.id_estudiante}"/></td>
      <td><c:out value="${datos.dip}"/></td>        
      <td><c:out value="${datos.nombre_completo}"/></td>
      <td><c:out value="${datos.programa}"/></td>
      <td><c:out value="${datos.id_plan}"/></td>
      <td><c:out value="${datos.tipo_estudiante}"/></td>
    </tr>
  </form>        
  </c:forEach>
  </tr>    
</table>  

<%@ include file="../../Inferior.jsp" %>