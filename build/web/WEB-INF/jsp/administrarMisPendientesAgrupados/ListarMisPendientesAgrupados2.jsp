<%@ include file="../Superior.jsp" %>

<!-- TRAMITES -->  
<div class="titulo">Mis pendientes agrupados</div>
<br>
<div><a class="volver" href="listarMisPendientesAgrupados.fautapo">Volver </a></div>

<table class="tabla">
  <tr>
    <th>#</th>
    <th>REMITENTE</th>
    <th>REFERENCIAS</th>
    <th>ACTIVIDAD</th>
    <th>FORMULARIO</th>
    <th>RETROCEDER</th>
    <th>AVANZAR</th>
  </tr>
  <c:forEach var="lista" items="${lMisPendientes}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td class="colb" align="center"><c:out value="${lista.correlativo2}"/>/<c:out value="${lista.gestion}"/></td>
      <td>
        <form name=recibir<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
          <input type="hidden" name="fechainicio"         value='<c:out value="${fechainicio}"/>' >
	  <input type="hidden" name="fechafin"            value='<c:out value="${fechafin}"/>' >
	  <input type="hidden" name="fechadellunes"       value='<c:out value="${fechadellunes}"/>' >
	  <input type="hidden" name="id_estado"           value='<c:out value="${id_estado}"/>' >
	  <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type="hidden" name="accion"              value='Recibir' >
          <input type="hidden" name="aplicacion" value='<c:url value="/"/>' >
          <c:if test="${lista.id_estado == 'P'}">
	    <a href='javascript: document.recibir<c:out value="${contador.count}"/>.submit();'>
	    <img src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0"></a>
	  </c:if>
          <c:if test="${lista.id_estado != 'P'}">
	   <img width='25' height='25' src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0">
	  </c:if>
          <c:out value="${lista.usuario}"/>
	  <br><c:out value="${lista.cargo}"/>
	</form>
      </td>
      <td>
        <c:forEach var="referencias" items="${lista.lista}" >
	  <b><c:out value="${referencias.campo}"/> : </b><c:out value="${referencias.valor}"/><br>
	</c:forEach>
      </td>
      <td><b><c:out value="${lista.actividad}"/></b><br>
          <i><c:out value="${lista.proceso}"/></i>
          <br><b>ROL &nbsp; [<c:out value="${lista.rol}"/>]</b>
      </td>
      <td align=right>
        <c:if test="${lista.id_estado == 'A'}">
          <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/registrarTramite.fautapo"/>' >
	    <input type="hidden" name="fechainicio"         value='<c:out value="${fechainicio}"/>' >
	    <input type="hidden" name="fechafin"            value='<c:out value="${fechafin}"/>' >
	    <input type="hidden" name="fechadellunes"       value='<c:out value="${fechadellunes}"/>' >
	    <input type="hidden" name="id_estado"           value='<c:out value="${id_estado}"/>' >
            <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
            <input type="hidden" name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >      
            <input type="hidden" name="id_actividad_actual" value='<c:out value="${lista.id_actividad_actual}"/>' >
            <input type="hidden" name="id_form"             value='<c:out value="${lista.id_form}"/>' >
            <input type="hidden" name="proceso"             value='<c:out value="${lista.proceso}"/>' >
            <input type="hidden" name="accion"              value='Formulario' >
            <input type="hidden" name="aplicacion"          value='<c:url value="/"/>' >
	      <a href='javascript: document.forma<c:out value="${contador.count}"/>.submit();'> Formulario </a>
     	  </form>
	</c:if>
      </td>
      <td align=right>
       <c:if test="${lista.id_actividad_actual != lista.id_actividad_minima && lista.id_estado == 'A'}">
        <form name=retroceder<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
	  <input type="hidden" name="fechainicio"         value='<c:out value="${fechainicio}"/>' >
	  <input type="hidden" name="fechafin"            value='<c:out value="${fechafin}"/>' >
	  <input type="hidden" name="fechadellunes"       value='<c:out value="${fechadellunes}"/>' >
	  <input type="hidden" name="id_estado"           value='<c:out value="${id_estado}"/>' >
          <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type="hidden" name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >      
          <input type="hidden" name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
	  <input type="hidden" name="id_form"             value='<c:out value="${lista.id_form}"/>' >
          <input type="hidden" name="proceso"             value='<c:out value="${lista.proceso}"/>' >
          <input type="hidden" name="accion"              value='Retroceder' >
          <input type="hidden" name="aplicacion"          value='<c:url value="/"/>' >
          <a href='javascript: document.retroceder<c:out value="${contador.count}"/>.submit();' > Retroceder </a>
	</form>
       </c:if>
      </td> 
      <td colspan=2 align=right>
        <c:if test="${lista.id_estado == 'A'}">
	  <c:if test="${lista.id_tipo_actuacion != 3}">
            <form name=avanzar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
              <input type="hidden" name="actuacion"           value='<c:out value="${lista.actuacion}"/>' >
              <input type="hidden" name="id_tipo_actuacion"   value='<c:out value="${lista.id_tipo_actuacion}"/>' >
	  </c:if>
	  <c:if test="${lista.id_tipo_actuacion == 3}">
            <form name=avanzar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/avanzarTramite.fautapo"/>' >
	  </c:if>
	  <input type="hidden" name="fechainicio"         value='<c:out value="${fechainicio}"/>' >
	  <input type="hidden" name="fechafin"            value='<c:out value="${fechafin}"/>' >
	  <input type="hidden" name="fechadellunes"       value='<c:out value="${fechadellunes}"/>' >
	  <input type="hidden" name="id_estado"           value='<c:out value="${id_estado}"/>' >
          <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type="hidden" name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >      
          <input type="hidden" name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
	  <input type="hidden" name="id_form"             value='<c:out value="${lista.id_form}"/>' >
          <input type="hidden" name="proceso"             value='<c:out value="${lista.proceso}"/>' >
          <input type="hidden" name="accion"              value='Avanzar' >
	  <input type="hidden" name="aplicacion"          value='<c:url value="/"/>' >
	  <c:if test="${lista.id_tipo_actuacion != 3}">
            <c:if test="${lista.filas > 1}">
              <select name="para">
                <c:forEach var="lista2" items="${lista.usuarios}" >
                  <option value='<c:out value="${lista2.id_usuario}"/>'><c:out value="${lista2.usuario}"/>
                </c:forEach>
	      </select>
            </c:if>
            <c:if test="${lista.filas == 1}">
              <c:forEach var="lista2" items="${lista.usuarios}" >
  	        <input type="hidden" name="para" value='<c:out value="${lista2.id_usuario}"/>' >
              </c:forEach>
            </c:if>
	  </c:if>
          <a href='javascript: document.avanzar<c:out value="${contador.count}"/>.submit();' > Avanzar</a>
        </form>
        </c:if>
      </td>
    </tr>
    <c:set var="contador1" value="${contador.count}"/>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp" %>