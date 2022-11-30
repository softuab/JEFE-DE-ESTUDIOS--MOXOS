<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Documentacion Completa</div>
<br>
<div class="volver"><a href='<c:url value="/documentacion/buscarEstudianteEntrada.fautapo"/>'>Volver</a></div>
<table class="tabla">
  <tr>
    <th>Nro.</th>
    <th>RU</th>
    <th>DIP</th>
    <th>NOMBRES</th>
    <th>PROGRAMA</th> 
    <th>PLAN</th>
    <th>TIPO ESTUDIANTE</th>
    <th>DOCUMENTACION COMPLETA</th>
  </tr>    
  <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
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
      <form name='forma<c:out value="${contador.count}"/>' method='post' action="<c:url value='/documentacion/registrarTiposDocumentosEstudiante.fautapo'/>">
          <td align="center">
	  <a href='javascript:document.forma<c:out value="${contador.count}"/>.submit();'>Documentaci&oacute;n</a>
	  <input type="hidden"  name="id_estudiante" value="<c:out value="${datos.id_estudiante}"/>" >
          </td>
      </form>
      </td>
    </tr>
  </c:forEach>
  </tr>    
</table>  

<%@ include file="../../Inferior.jsp" %>