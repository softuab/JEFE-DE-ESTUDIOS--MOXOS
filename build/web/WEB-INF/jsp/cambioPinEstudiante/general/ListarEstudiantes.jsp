<%@ include file="../../Superior.jsp" %>

<div class="titulo">Cambio Clave (PIN) Estudiante - Autoridad </div>
<br>
<form name="fvolver" action="comprobarEntrada.fautapo" method="post">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> 
   <input type="hidden" name="id_estudiante" value="<c:out value="${id_estudiante}"/>"/> 
  </div>
</form>
<table class="tabla">
  <tr>
    <th>Usuario</th>
    <th>Gesti&oacute;n Aced&eacute;mica</th>
  </tr> 
  <tr>
    <td><c:out value="${usuario}"/></td>
    <td><c:out value="${periodo}"/><b>/</b><c:out value="${gestion}"/></td>
  </tr> 
</table>  
<br>
<table class="tabla">
  <tr>
    <th>RU</th>
    <th>DIP</th>
    <th>NOMBRES</th>
    <th>PROGRAMA</th> 
    <th>Cambio PIN</th>
  </tr>    
  <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
   <form name=forma<c:out value="${contador.count}"/> method="POST" action="listarEstudiantes.fautapo">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td><c:out value="${datos.id_estudiante}"/></td>
      <td><c:out value="${datos.dip}"/></td>
      <td><c:out value="${datos.paterno}"/>&nbsp;<c:out value="${datos.materno}"/>&nbsp;<c:out value="${datos.nombres}"/></td>
      <td><c:out value="${datos.programa}"/></td>
      <td><a class="agregar" href="javascript: document.forma<c:out value="${contador.count}"/>.submit()">Cambio PIN</a>
      <input type="hidden" name="id_estudiante" value="<c:out value="${datos.id_estudiante}"/>"/> 
      <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>"/> 
      <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>"/> 
     </tr>
    </form>
  </c:forEach>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>