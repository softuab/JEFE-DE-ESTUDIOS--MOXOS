<%@ include file="../Superior.jsp" %>

<div class="titulo">Descargar Archivos Docente</div>
<br>
<center>
  <form name="forma" method="POST">
   <table class="tabla">
     <tr>
       <th>ADJUNTOS</th>
     </tr>
     <c:forEach var="datosAdjunto" items="${lAdjuntos}" varStatus="contador">
       <!-- ********** Esto es para el efecto ************ -->
         <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
       <!-- ********** Fin  efecto ************ -->
       <td>
         <div class="descargar">
           <a href='<c:out value="${aplicacion}"/>adjuntosMi/adjuntosDocentes/<c:out value="${datosAdjunto.adjunto}"/>'><c:out value="${datosAdjunto.nombre_archivo}"/></a>
         </div><br>
       </td>
     </tr>
     </c:forEach>
   </table>
   <input type="button" value="Cerrar" onclick="window.close();">
  </form>
</center>
<%@ include file="../Inferior.jsp" %>
