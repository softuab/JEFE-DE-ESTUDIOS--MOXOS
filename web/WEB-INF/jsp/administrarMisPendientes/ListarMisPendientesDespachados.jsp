<%@ include file="../Superior.jsp" %>

<table width="100%">
  <tr>
    <td width="15%" class="titulo"><c:out value="${institucion}"/></td>
    <td width="85%">
      <table>
        <tr>
          <form name="tramitesrecibidos" method="POST" action='<c:url value="/listarMisPendientes.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='1' onchange="javascript:document.tramitesrecibidos.submit();"> Tr&aacute;mites Recibidos
            </td>
	  </form>
          <form name="tramitesdespachados" method="POST" action='<c:url value="/listarMisPendientesDespachados.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='4' onchange="javascript:document.tramitesdespachados.submit();" checked > Tr&aacute;mites Despachados
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
    <c:set var="contador1" value="${contador.count}"/>
  </c:forEach>
</table>


<%@ include file="../Inferior.jsp" %>