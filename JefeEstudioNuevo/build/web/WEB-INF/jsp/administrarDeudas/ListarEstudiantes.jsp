<%@ include file="../Superior.jsp" %>

<div class="titulo">Administrar Deudas</div>
<br>
<table>
  <tr>    
    <td>
      <form name="fvolver" action="<c:url value='comprobarEntrada.fautapo'/>" method="post">
        <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
        <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
	<input type="hidden" name="id_programa" value="<c:out value='${datosPrograma.id_programa}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
  </tr>
</table>
<!--<table class="tabla">
  <tr>
    <th>PROGRAMA</th>
  </tr>
 <tr>
    <td><c:out value='${datosPrograma.programa}'/></td>
  </tr> 
</table>  -->
<br>
<table class="tabla"  valign=left border="0" cellspacing="2" cellpadding="3">

  <tr>
    <th align=center>RU</th>
    <th align=center>DIP</th>
    <th align=center>NOMBRES</th>
    <th align=center>PROGRAMA</th> 
    <th align=center>VER</th>
  </tr>    
  <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
  <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/deudas/listarDeudasEstudiante.fautapo"/>'>  
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ --> 
      <td><c:out value="${datos.id_estudiante}"/></td>
      <td><c:out value="${datos.dip}"/></td>        
      <td><c:out value="${datos.paterno}"/>&nbsp;<c:out value="${datos.materno}"/>&nbsp;<c:out value="${datos.nombres}"/></td>
      <td><c:out value="${datos.programa}"/></td>
      <td><a class="agregar" href="javascript: document.forma<c:out value="${contador.count}"/>.submit()">Ver datos</a>
      <input type="hidden" name="id_estudiante" value="<c:out value="${datos.id_estudiante}"/>"/> 
      <input type=hidden name="id_programa"   value='<c:out value="${id_programa}"/>' >
  </tr>
  </form>        
  </c:forEach>
  </tr>    

</table>  

<%@ include file="../Inferior.jsp" %>