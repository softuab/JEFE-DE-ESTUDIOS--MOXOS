<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Tramites/procesos por Funcionario</div>
<div><a class="volver" href='javascript:history.back();'>Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <th colspan="4">RESULTADO DE LA B&Uacute;SQUEDA</th>
  </tr>
  <tr>
    <th> # </th>
    <th>PROCESO</th>
    <th>REFERENCIAS</th>
    <th>REGISTRO</th>
  </tr>
  <c:forEach var="lista" items="${lTramites}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
     <form  name='flistar<c:out value="${contador.index}"/>' method="POST" action='<c:url value="/listarDetalleTramite2.fautapo"/>' >
       <td align="center"><c:out value="${lista.correlativo2}"/>/<c:out value="${lista.gestion}"/></td>
       <td>
         <img width='25' height='25' src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' border="0">
         <b><c:out value="${lista.actividad}"/></b><br>
         <a href='javascript: document.flistar<c:out value="${contador.index}"/>.submit()' >
           <i><c:out value="${lista.proceso}"/></i>
  	 </a>
	 <br>
	 <c:out value="${lista.ubicacion_organica}"/> 
       </td>
       <td>
         <c:forEach var="referencias" items="${lista.lista}" >
	   <b><c:out value="${referencias.campo}"/>   :  </b><c:out value="${referencias.valor}"/><br>
	 </c:forEach>
       </td>
       <td><fmt:formatDate value="${lista.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/></td>
       <input type="hidden" name="id_tramite"  value="<c:out value="${lista.id_tramite}"/>">
       <input type="hidden" name="correlativo" value="<c:out value="${lista.correlativo2}"/>">
       <input type="hidden" name="boton"       value="Buscar">
       <input type="hidden" name="id_proceso"  value="<c:out value="${lista.id_proceso}"/>">
     </form>
    </tr>
  </c:forEach>
</table> 

<%@ include file="../../Inferior.jsp" %>