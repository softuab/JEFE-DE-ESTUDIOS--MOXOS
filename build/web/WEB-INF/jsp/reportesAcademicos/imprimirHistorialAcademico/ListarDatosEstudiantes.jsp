<%@ include file="../../Superior.jsp" %>

<div class="titulo">Imprimir Historial Acad&eacute;mico</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<table class="tabla">
  <tr>
    <th>PROGRAMA</th>
    <td><c:out value='${datosPrograma.programa}'/></td>
  </tr> 
</table>  
<br>
<table class="tabla" cellspacing="2" cellpadding="3">
  <tr>
    <th>RU</th>
    <th>DIP</th>
    <th>NOMBRES</th>
    <th>PROGRAMA</th> 
    <th>VER</th>
  </tr>    
  <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
    <form name=forma<c:out value="${contador.count}"/> method="POST" action="listarHistorialAcademico.fautapo" target="_blank">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ --> 
      <td><c:out value="${datos.id_estudiante}"/></td>
      <td><c:out value="${datos.dip}"/></td>        
      <td><c:out value="${datos.paterno}"/>&nbsp;<c:out value="${datos.materno}"/>&nbsp;<c:out value="${datos.nombres}"/></td>
      <td><c:out value="${datos.programa}"/></td>
      <td><a href="javascript: document.forma<c:out value="${contador.count}"/>.submit()">Ver datos</a>
      <input type="hidden" name="id_estudiante" value="<c:out value="${datos.id_estudiante}"/>"/> 
      <input type="hidden" name="id_programa"   value='<c:out value="${datosPrograma.id_programa}"/>' >
    </tr>
    </form>     
  </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>