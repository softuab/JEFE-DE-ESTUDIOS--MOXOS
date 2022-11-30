<%@ include file="../../Superior.jsp" %>

<div class="titulo">Ver Ficha Acad&eacute;mica</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<table class="tabla">
  <tr>
    <th>RU</th>
    <th>DIP</th>
    <th>NOMBRES</th>
    <th>PROGRAMA</th> 
    <th>VER</th>
  </tr>    
  <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
   <form name=forma<c:out value="${contador.count}"/> method="POST" action="listarFichaAcademica.fautapo">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td><c:out value="${datos.id_estudiante}"/></td>
      <td><c:out value="${datos.dip}"/></td>
      <td><c:out value="${datos.paterno}"/>&nbsp;<c:out value="${datos.materno}"/>&nbsp;<c:out value="${datos.nombres}"/></td>
      <td><c:out value="${datos.programa}"/></td>
      <td><a href="javascript: document.forma<c:out value="${contador.count}"/>.submit()">Ver datos</a>
      <input type="hidden" name="id_estudiante" value="<c:out value="${datos.id_estudiante}"/>"/> 
      <input type="hidden" name="gestion"       value='<c:out value="${gestion}"/>' >
      <input type="hidden" name="periodo"       value='<c:out value="${periodo}"/>' >
     </tr>
    </form>
  </c:forEach>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>