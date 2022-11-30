<%@ include file="../Superior.jsp"%>

<div class="titulo"> Segmentos  </div>
<br>
<table class="tabla">
  <tr>
    <th>Asunto</th>
    <td class="colb"><c:out value="${hilo.hilo}"/></td>
  </tr>
</table>
<table>
  <tr>
    <td>
        <a class="volver" href="<c:url value="/listarHilos.fautapo"></c:url>">Volver </a>
    </td>
    <form name=forma method=post action='<c:url value="/nuevoSegmento.fautapo?id_hilo=${id_hilo}&aplicacion=${aplicacion}"/>'>
      <td>
        <div class="agregar"><a href="javascript:document.forma.submit();" >Nuevo</a></div>
      </td>
    </form>
  <tr>
</table>  
<table class="tabla" width='70%'>
  <tr>
    <th> DE </th>
    <th> DETALLE </th>
    <th> ARCHIVOS ADJUNTOS </th>    
    <th> ADJUNTAR </th>
  </tr>  
  <c:forEach var="lista" items="${lSegmentos}">
   <!-- ********** Esto es para el efecto ************ -->
     <c:if test="${(contador.count mod 2) == 0}">
       <tr class="filaAlternativa" onmouseover="this.className='sobreFila'" onmouseout="this.className='filaAlternativa'">	 
     </c:if>     
     <c:if test="${(contador.count mod 2) != 0}">       
       <tr class="filaNormal" onmouseover="this.className='sobreFila'" onmouseout="this.className='filaNormal'">
     </c:if>
     <!-- ********** Fin  efecto ************ --> 
    <td width="10%"><c:out value="${lista.remitente}"/></td>
    <td><img src="./imagenes/hilos/<c:out value="${lista.imagen}"/>" border=0><b><c:out value="${lista.tipo_segmento}"/></b><br>
        <c:out value="${lista.segmento}" escapeXml="False"/><br>
        <i><c:out value="${lista.fecha1}"/></i>
    </td>
    <td><c:forEach var="adjuntos" items="${lista.lista}">
          <img src="./imagenes/botones/descargar.gif" border="0"/>
          <a href='<c:out value="${aplicacion}"/>adjuntos/<c:out value="${adjuntos.adjunto}"/>'><c:out value="${adjuntos.archivo}"/></a><br>
	</c:forEach>
    </td>
    <td>
       <img src="./imagenes/hilos/clip.gif" border=0/>
       <a href='<c:url value="/adjuntar.fautapo">?<c:param name="aplicacion" value="${aplicacion}"/>&<c:param name="id_hilo" value="${id_hilo}"/>&<c:param name="id_segmento" value="${lista.id_segmento}"/></c:url>'>
       Adjuntar</a>
    </td>
  </tr>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp"%>
