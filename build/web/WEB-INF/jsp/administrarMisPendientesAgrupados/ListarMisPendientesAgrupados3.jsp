<%@ include file="../Superior.jsp" %>

<!-- TRAMITES -->  
<div class="titulo">Mis pendientes agrupados</div>
<br>
<div><a class="volver" href="listarMisPendientesAgrupados.fautapo">Volver </a></div>

<table class="tabla">
  <tr>
    <th>#</th>
    <th>DESTINATARIO</th>
    <th>REFERENCIAS</th>
    <th>ACTIVIDAD</th>
  </tr>
  <c:forEach var="lista" items="${lMisPendientes}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td class="colb" align="center"><c:out value="${lista.correlativo2}"/>/<c:out value="${lista.gestion}"/></td>
      <td>
	<img src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0">
        <c:out value="${lista.usuario}"/>
	<br><c:out value="${lista.cargo}"/>
      </td>
      <td>
        <c:forEach var="referencias" items="${lista.lista}" >
	  <b><c:out value="${referencias.campo}"/> : </b><c:out value="${referencias.valor}"/><br>
	</c:forEach>
      </td>
      <td><b><c:out value="${lista.actividad}"/></b><br>
          <i><c:out value="${lista.proceso}"/></i>
      </td>
    </tr>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp" %>