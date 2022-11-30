<%@ include file="../Superior.jsp" %>

<table width="100%">
  <tr>
    <td width="15%" class="titulo"><c:out value="${institucion}"/></td>
    <td width="85%">
      <table>
        <tr>
          <form name="tramitesrecibidos" method="POST" action='<c:url value="/listarMisPendientes.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='1' onchange="javascript:document.tramitesrecibidos.submit();" checked> Tr&aacute;mites Recibidos
            </td>
	  </form>
          <form name="tramitesdespachados" method="POST" action='<c:url value="/listarMisPendientesDespachados.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='4' onchange="javascript:document.tramitesdespachados.submit();" > Tr&aacute;mites Despachados
            </td>
	  </form>
          <form name="corresrecibidas" method="POST" action='<c:url value="/listarMisPendientesCorrespondencias.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='2' onchange="javascript:document.corresrecibidas.submit();" > Correspondencias Recibidas
            </td>
	  </form>
          <form name="corresdespachadas" method="POST" action='<c:url value="/listarMisPendientesCorrespondenciasDespachadas.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='3' onchange="javascript:document.corresdespachadas.submit();" > Correspondencias Despachadas
            </td>
	  </form>
         </tr>
       </table>
    </td>
  </tr>
</table>

<br>
<!-- TRAMITES -->
<form name="forma" id="forma" method='post' action="<c:url value='/listarMisPendientes.fautapo'/>">
  <input type="hidden" name="nro_pagina" value="1" />
  <input type="hidden" name="_botoncillo" value="" />
  <table width="100%" class="formulario">
    <tr>
      <td width="50%">
        <table border="0">
          <tr>
            <td> Nro de Tr&aacute;mite :: </td>
            <td><input type="text" name="nro_filtro"></td>
            <td><input type="submit" value="Filtrar" onClick="javascript: document.forma.action=''; document.forma._botoncillo.value='filtro'" class="filtro" /></td>
            <td><input type="submit" value="Todo" onClick="javascript: document.forma.action=''; document.forma._botoncillo.value='todo'" class="filtro" /></td>
          </tr>
        </table>
      </td>
      <td width="50%" align="right">
        <table border="0" align="right">
          <tr>
            <td>
              <c:if test='${nro_pagina > 1}'>
                <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='principio'; document.forma.nro_pagina.value='1';">&laquo; Principio</a>&nbsp;
                <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='anterior'; document.forma.nro_pagina.value='<c:out value="${nro_pagina - 1}"/>';">&lsaquo; Anterior</a>
              </c:if>
              <b><c:out value="${(paginacion * (nro_pagina - 1)) + 1}"/></b> - <b><c:out value="${(paginacion * (nro_pagina - 1)) + fn:length(lMisPendientes)}"/></b> de <b><c:out value="${totalRegistros}"/></b>
              <c:if test='${nro_pagina < totalPaginas}'>
                <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='siguiente'; document.forma.nro_pagina.value='<c:out value="${nro_pagina + 1}"/>';">Siguiente &rsaquo;</a>&nbsp;
                <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='final'; document.forma.nro_pagina.value='<c:out value="${totalPaginas}"/>';">Final &raquo;</a>
              </c:if>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<br>

<div class="titulo">Mis pendientes</div>
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
  <c:forEach var="lista" items="${lMisPendientes}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td class="colb" align="center"><c:out value="${lista.correlativo2}"/>/<c:out value="${lista.gestion}"/></td>
      <td>
        <form name=recibir<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientes.fautapo"/>' >
          <input type="hidden" name="id_tramite" value='<c:out value="${lista.id_tramite}"/>' >
          <input type="hidden" name="accion"     value='Recibir' >
          <input type="hidden" name="nro_pagina" value='<c:out value="${nro_pagina}"/>' >
          <input type="hidden" name="nro_filtro"  value='<c:out value="${nro_filtro}"/>' >
          <input type="hidden" name="_botoncillo" value='<c:out value="${_botoncillo}"/>' >
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
        <c:if test="${(lista.id_estado == 'A') && lista.ruta != '/dibRap.fautapo'}">
	  <c:if test="${lista.puente == 'true'}">
            <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="${lista.ruta}"/>' >
          </c:if>
	  <c:if test="${lista.puente == 'false'}">
            <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/registrarTramite.fautapo"/>' >
          </c:if>
	    <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
            <input type="hidden" name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >      
            <input type="hidden" name="id_actividad_actual" value='<c:out value="${lista.id_actividad_actual}"/>' >
            <input type="hidden" name="id_form"             value='<c:out value="${lista.id_form}"/>' >
            <input type="hidden" name="proceso"             value='<c:out value="${lista.proceso}"/>' >
            <input type="hidden" name="accion"              value='Formulario' >
            <input type="hidden" name="aplicacion"          value='<c:url value="/"/>' >
            <input type="hidden" name="nro_pagina"        value='<c:out value="${nro_pagina}"/>' >
            <input type="hidden" name="nro_filtro"        value='<c:out value="${nro_filtro}"/>' >
            <input type="hidden" name="_botoncillo"       value='<c:out value="${_botoncillo}"/>' >
              <a href='javascript: document.forma<c:out value="${contador.count}"/>.submit();'> Formulario </a>
     	  </form>
	</c:if>
      </td>
      <td align=right>
       <c:if test="${lista.id_actividad_actual != lista.id_actividad_minima && lista.id_estado == 'A'}">
        <form name=retroceder<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientes.fautapo"/>' >
          <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type="hidden" name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >
          <input type="hidden" name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
	  <input type="hidden" name="id_form"             value='<c:out value="${lista.id_form}"/>' >
          <input type="hidden" name="proceso"             value='<c:out value="${lista.proceso}"/>' >
          <input type="hidden" name="accion"              value='Retroceder' >
          <input type="hidden" name="nro_pagina"        value='<c:out value="${nro_pagina}"/>' >
          <a href='javascript: document.retroceder<c:out value="${contador.count}"/>.submit();' > Retroceder </a>
	</form>
       </c:if>
      </td>
      <td colspan=2 align=right>
        <c:if test="${lista.id_estado == 'L' || lista.id_estado == 'A'}">
	  <c:if test="${lista.id_tipo_actuacion != 3}">
            <form name=avanzar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientes.fautapo"/>' >
              <input type="hidden" name="actuacion"           value='<c:out value="${lista.actuacion}"/>' >
              <input type="hidden" name="id_tipo_actuacion"   value='<c:out value="${lista.id_tipo_actuacion}"/>' >
	  </c:if>
	  <c:if test="${lista.id_tipo_actuacion == 3}">
            <form name=avanzar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/avanzarTramite.fautapo"/>' >
	  </c:if>
          <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
          <input type="hidden" name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >
          <input type="hidden" name="id_actividad"        value='<c:out value="${lista.id_actividad_actual}"/>' >
	  <input type="hidden" name="id_form"             value='<c:out value="${lista.id_form}"/>' >
          <input type="hidden" name="proceso"             value='<c:out value="${lista.proceso}"/>' >
          <input type="hidden" name="accion"              value='Avanzar' >
	  <input type="hidden" name="nro_pagina"        value='<c:out value="${nro_pagina}"/>' >
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
    <c:set var="contador1" value="${contador.count}"/>
  </c:forEach>
</table>


<%@ include file="../Inferior.jsp" %>