<%@ include file="../Superior.jsp" %>

<div class="titulo">  Resultados de la b&uacute;squeda</div>
<div><a class="volver" href='javascript:history.back();'>Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <th colspan="6">DATOS ENCONTRADOS</th>	       
  <tr>
    <th> # </th>
    <th>ACTIVIDAD</th>
    <th>REFERENCIAS</th>
    <th>RESPONSABLE</th>
    <th>FECHA DE INGRESO</th>
  </tr>
  <c:forEach var="cod" items="${lTramitesParalelos}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
    <form name='forma<c:out value="${contador.index}"/>' method=post action='<c:url value="/listarDetalleDesbloquearTramite.fautapo"/>' >
      <td><c:out value="${cod.correlativo2}"/>/<c:out value="${cod.gestion}"/></td>
      <td><img width='25' height='25' src='./imagenes/procesos/<c:out value="${cod.imagen}"/>' border="0">
         <b><c:out value="${cod.actividad}"/></b><br>
         <a href='javascript: document.forma<c:out value="${contador.index}"/>.submit()' >
           <i><c:out value="${cod.proceso}"/></i>
         </a>
         <br><c:out value="${cod.ubicacion_organica}"/> 
      </td>
      <td>
        <c:forEach var="referencias" items="${cod.lista}">
          <b><c:out value="${referencias.campo}"/>   :  </b><c:out value="${referencias.valor}"/><br>
        </c:forEach>
      </td>
      <td><c:out value="${cod.usuario}"/><br><c:out value="${cod.cargo}"/></td>
      <td><fmt:formatDate value="${cod.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/></td>
      <input type="hidden" name="id_tramite"      value='<c:out value="${cod.id_tramite}"/>' >
      <input type="hidden" name="correlativo"     value='<c:out value="${cod.correlativo2}"/>' >
      <input type="hidden" name="boton"           value='Buscar' >
      <input type="hidden" name="id_tipo_proceso" value='<c:out value="${cod.id_tipo_proceso}"/>' >
    </form>
  </tr>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp" %>
