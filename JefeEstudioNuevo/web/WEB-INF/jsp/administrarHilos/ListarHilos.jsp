<%@ include file="../Superior.jsp"%>

<div class="titulo"> Hilos enviados </div>
<table>
  <tr>
    <form name="forma" method="post" action='<c:url value="/nuevoHilo.fautapo"/>'>
       <td>
         <div class="agregar"><a href="javascript:document.forma.submit();" >Nuevo</a></div>
       </td>
    </form>
  </tr>
</table>
<table class="tabla">
  <tr>
    <th> DESTINATARIOS </th>
    <th> TIPO HILO </th>
    <th> ASUNTO </th>    
    <th> INICIO </th>
    <th> MENSAJES </th> 
    <th> NUEVOS </th> 
    </tr>  
   <c:forEach var="lista" items="${lHilosMios}" varStatus="contador">
    <form name=formita<c:out value="${contador.count}"/> method=post action='<c:url value="/eliminarHilos.fautapo"/>'>
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
      <td><c:out value="${lista.destinatario}"/></td>
      <td><img  src='./imagenes/hilos/<c:out value="${lista.imagen}"/>' /><c:out value="${lista.tipo_hilo}"/>
      <td><c:if test="${lista.nro_mensajes_nuevos > 0}"><b></c:if>
	  <a href='<c:url value="/listarSegmentos.fautapo"/>?aplicacion=<c:url value="/"/>&id_hilo=<c:out value="${lista.id_hilo}"/>&asunto=<c:out value="${lista.hilo}"/>'>
          <c:out value="${lista.hilo}"/></a></td>
      <td><fmt:formatDate value="${lista.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/></td>
      <td align="center"><c:out value="${lista.nro_mensajes}"/></td>
      <td align="center">
        <c:if test="${lista.nro_mensajes_nuevos > 0}">
          <b>
        </c:if>
        <c:out value="${lista.nro_mensajes_nuevos}"/>
	</b>
      </td>
      <td><input type="submit" class="cancelar" value="Eliminar"></td>
    </tr>
    <input type="hidden" name="id_hilo" value='<c:out value="${lista.id_hilo}"/>'>
    <input type="hidden" name="asunto" value='<c:out value="${lista.hilo}"/>'>
  </form>
  </c:forEach>
</table>

<br>
<div class="titulo"> Hilos recibidos </div>
<br>
<table class="tabla">
  <tr>
    <th> DE </th>
    <th> TIPO HILO </th>
    <th> ASUNTO </th>    
    <th> INICIO </th>
    <th> MENSAJES </th> 
    <th> NUEVOS </th> 
    </tr>  
  <c:forEach var="lista" items="${lHilosAMi}" varStatus="contador">
    <form name=forma<c:out value="${contador.count}"/> method=post>
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
      <td><c:out value="${lista.destinatario}"/></td>
      <td><img src='./imagenes/hilos/<c:out value="${lista.imagen}"/>' /><c:out value="${lista.tipo_hilo}"/></td>
      <td><c:if test="${lista.nro_mensajes_nuevos > 0}"><b></c:if>
	  <a href='<c:url value="/listarSegmentos.fautapo"/>?aplicacion=<c:url value="/"/>&id_hilo=<c:out value="${lista.id_hilo}"/>&asunto=<c:out value="${lista.hilo}"/>'>
          <c:out value="${lista.hilo}"/></a></td>
      <td><fmt:formatDate value="${lista.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/></td>
      <td align="center"><c:out value="${lista.nro_mensajes}"/></td>
      <td align="center">
        <c:if test="${lista.nro_mensajes_nuevos > 0}">
          <b>
        </c:if>
        <c:out value="${lista.nro_mensajes_nuevos}"/>
	</b>
      </td>
    </tr>
  </form>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp"%>
