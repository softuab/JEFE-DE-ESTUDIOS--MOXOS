<%@ include file="../../Superior.jsp" %>

<div class="titulo">Imprimir Certificado de Notas</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<table class="tabla">
  <tr>
    <th>GESTION</th>
    <th>PERIODO</th>
    <th>PROGRAMA</th>
	<th>Nº CERTIFICADO</th>
	<th>OBSERVACION</th>
	<th>NIVEL</th>
  </tr>
 <tr>
    <td><c:out value='${gestion}'/></td>
    <td><c:out value='${periodo}'/></td>
    <td><c:out value='${datosPrograma.programa}'/></td>
	<td><c:out value='${nrocertificado}'/></td>
	<td><c:out value='${observacion}'/></td>
	<td><c:out value='${nivel}'/></td>

  </tr> 
</table>  
<br>
<table class="tabla"  valign=left border="0" cellspacing="2" cellpadding="3">
  <tr>
    <th>RU</th>
    <th>DIP</th>
    <th>NOMBRES</th>
    <th>PROGRAMA</th> 
    <th>VER</th>
  </tr>    
  <c:forEach var="datos" items="${lEstudiantes}" varStatus="contador">
    <form name=forma<c:out value="${contador.count}"/> method="POST" action="listarCertificadoNotas.fautapo" target="_blank">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ --> 
      <td><c:out value="${datos.id_estudiante}"/></td>
      <td><c:out value="${datos.dip}"/></td>        
      <td><c:out value="${datos.paterno}"/>&nbsp;<c:out value="${datos.materno}"/>&nbsp;<c:out value="${datos.nombres}"/></td>
      <td><c:out value="${datos.programa}"/></td>
      <td><a href="javascript: document.forma<c:out value="${contador.count}"/>.submit()">Ver datos</a>
      <input type="hidden" name="id_estudiante"        value="<c:out value="${datos.id_estudiante}"/>"/> 
      <input type="hidden" name="gestion"              value='<c:out value="${gestion}"/>' >
      <input type="hidden" name="periodo"              value='<c:out value="${periodo}"/>' >
      
	  <input type="hidden" name="nrocertificado"              value='<c:out value="${nrocertificado}"/>' >
	  <input type="hidden" name="nivel"              value='<c:out value="${nivel}"/>' >
      <input type="hidden" name="observacion"              value='<c:out value="${observacion}"/>' >
	        
	  <input type="hidden" name="id_programa"          value='<c:out value="${id_programa}"/>' >
      <input type="hidden" name="todas"                value="<c:out value='${todas}'/>"> 
    </tr>
    </form>     
  </c:forEach>
</table>

<%@ include file="../../Inferior.jsp" %>