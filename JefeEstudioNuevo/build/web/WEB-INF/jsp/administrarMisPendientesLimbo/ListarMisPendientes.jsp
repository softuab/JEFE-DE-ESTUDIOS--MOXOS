<%@ include file="../Superior.jsp" %>

<table width="100%">
  <tr>
    <td width="15%" class="titulo"><c:out value="${institucion}"/></td>
    <td width="85%">
    </td>
  </tr>
</table>

<form name="forma" id="forma" method='post' action="<c:url value='/listarMisPendientesLimbo.fautapo'/>">
  <input type="hidden" name="nro_pagina" value="1" />
  <input type="hidden" name="_botoncillo" value="" />
  <table border="0" align="right">
    <tr>
      <td align="right">
        <c:if test='${nro_pagina > 1}'>
          <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='principio'; document.forma.nro_pagina.value='1';">&laquo; Principio</a>&nbsp;
          <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='anterior'; document.forma.nro_pagina.value='<c:out value="${nro_pagina - 1}"/>';">&lsaquo; Anterior</a>
        </c:if>
        <b><c:out value="${(paginacion * (nro_pagina - 1)) + 1}"/></b> - <b><c:out value="${(paginacion * (nro_pagina - 1)) + fn:length(lMisPendientesLimbo)}"/></b> de <b><c:out value="${totalRegistros}"/></b>
        <c:if test='${nro_pagina < totalPaginas}'>
          <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='siguiente'; document.forma.nro_pagina.value='<c:out value="${nro_pagina + 1}"/>';">Siguiente &rsaquo;</a>&nbsp;
          <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='final'; document.forma.nro_pagina.value='<c:out value="${totalPaginas}"/>';">Final &raquo;</a>
        </c:if>
      </td>
    </tr>
  </table>
</form>
<br>

<div class="titulo">Mis pendientes limbo</div>
<table class="tabla" width="100%">
  <tr>
    <th>#</th>
    <th>REMITENTE</th>
    <th>REFERENCIAS</th>
    <th>ACTIVIDAD</th>
    <th>FORMULARIO</th>
    <th>RETROCEDER</th>
    <th>AVANZAR</th>
  </tr>
  <c:forEach var="lista" items="${lMisPendientesLimbo}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td class="colb" align=center><c:out value="${lista.id_tramite}"/></td>
      <td>
        <form name=recibir<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientesLimbo.fautapo"/>' >
          <input type=hidden name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type=hidden name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >
          <input type=hidden name="accion"              value='Recibir' >
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
      </td>
      <td align=right>
        <c:if test="${(lista.id_estado == 'L' || lista.id_estado == 'A') && lista.ruta != '/dibRap.fautapo'}">
          <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="${lista.ruta}"/>' >
            <input type=hidden name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
            <input type=hidden name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >
            <input type=hidden name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
            <input type=hidden name="proceso"             value='<c:out value="${lista.proceso}"/>' >
            <input type=hidden name="accion"              value='Formulario'>
            <input type=hidden name="aplicacion"          value='<c:url value="/"/>' >
              <a href='javascript: document.forma<c:out value="${contador.count}"/>.submit();'> Formulario </a>
     	  </form>
 	</c:if>

        <c:if test="${(lista.id_estado == 'L' || lista.id_estado == 'A') && lista.ruta == '/dibRap.fautapo'}">
          <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/administrarProgramasEspecializados.fautapo"/>' >
            <input type=hidden name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
            <input type=hidden name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >
            <input type=hidden name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
            <input type=hidden name="proceso"             value='<c:out value="${lista.proceso}"/>' >
            <input type=hidden name="ruta"                value='<c:out value="${lista.ruta}"/>' >
            <input type=hidden name="accion"              value='Formulario'>
            <input type=hidden name="aplicacion"          value='<c:url value="/"/>' >
              <a href='javascript: document.forma<c:out value="${contador.count}"/>.submit();'> Formulario </a>
     	  </form>
	</c:if>
      </td>
      <td align=right>
       <c:if test="${lista.id_actividad_actual != lista.id_actividad_minima && (lista.id_estado == 'L' || lista.id_estado == 'A')}">
        <form name=retroceder<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientesLimbo.fautapo"/>' >
          <input type=hidden name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type=hidden name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >
          <input type=hidden name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
          <input type=hidden name="proceso"             value='<c:out value="${lista.proceso}"/>' >
          <input type=hidden name="accion"              value='Retroceder' >
          <a href='javascript: document.retroceder<c:out value="${contador.count}"/>.submit();' > Retroceder </a>
	</form>
       </c:if>
      </td> 
      <td colspan=2 align=right>
        <c:if test="${lista.id_estado == 'L' || lista.id_estado == 'A'}">
	  <c:if test="${lista.id_tipo_actuacion != 3}">
            <form name=avanzar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientesLimbo.fautapo"/>' >
              <input type=hidden name="actuacion"           value='<c:out value="${lista.actuacion}"/>' >
              <input type=hidden name="id_tipo_actuacion"   value='<c:out value="${lista.id_tipo_actuacion}"/>' >
	  </c:if>
	  <c:if test="${lista.id_tipo_actuacion == 3}">
            <form name=avanzar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/avanzarTramiteLimbo.fautapo"/>' >
	  </c:if>
          <input type=hidden name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type=hidden name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >
          <input type=hidden name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
          <input type=hidden name="proceso"             value='<c:out value="${lista.proceso}"/>' >
          <input type=hidden name="accion"              value='Avanzar'>
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
          <a href='javascript: document.avanzar<c:out value="${contador.count}"/>.submit();' > Avanzar </a>
        </form>
        </c:if>
      </td>
    </tr>
  </c:forEach>
</table>
<%@ include file="../Inferior.jsp" %>