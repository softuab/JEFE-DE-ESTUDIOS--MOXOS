<%@ include file="../../Superior.jsp" %>

<!-- TRAMITES -->  
<table border="0" align="right">
  <tr>
    <form name="anterior" method="POST" action='<c:url value="/listarMisPendientesKardex.fautapo"/>' >
      <input type="hidden" name="nro_pagina" value='<c:out value="${nro_pagina_anterior}"/>' >
      <input type="hidden" name="id_proceso" value='<c:out value="${id_proceso}"/>' >
      <td>
        <a href='javascript: document.anterior.submit();'><img src='./imagenes/procesos/atras.ico' title="<c:out value="${lista.estado}"/>"  border="0"></a>
      </td>
      <td valign="middle">
        <a href='javascript: document.anterior.submit();'>Anterior</a>&nbsp;&nbsp;- 
      </td>
    </form>
    <form name="siguiente" method="POST" action='<c:url value="/listarMisPendientesKardex.fautapo"/>' >
      <input type="hidden" name="nro_pagina" value='<c:out value="${nro_pagina_siguiente}"/>' >
      <input type="hidden" name="id_proceso" value='<c:out value="${id_proceso}"/>' >
      <td valign="middle">
	<a href='javascript: document.siguiente.submit();'>Siguiente</a>
      </td>
      <td>
        <a href='javascript: document.siguiente.submit();'><img src='./imagenes/procesos/siguiente.ico' title="<c:out value="${lista.estado}"/>"  border="0"></a>
      </td>
    </form>
  </tr>
</table>
<br>
<div class="titulo">Mis pendientes Kardex</div>
<br>
<c:if test="${banderakardex =='1'}">
<table class="tabla">
  <tr>
    <td class="colh">Kardex</td>
    <td><c:out value="${proceso}"/></td>
  </tr>
</table>
<br>
<div><a class="volver" href='listarKardexsProcesos.fautapo'>Volver</a></div>
</c:if>
<c:if test="${ banderakardex !='1'}">
<div><a class="volver" href='registrarKardexNuevo.fautapo'>Volver</a></div>
</c:if>
<table class="tabla">
  <tr>
    <th>#</th>
    <th>REMITENTE</th>
    <th>REFERENCIAS</th>
    <th>ACTIVIDAD</th>
    <th>FORMULARIO</th>
    
  </tr>
  <c:forEach var="lista" items="${lMisPendientes}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td class="colb" align=center><c:out value="${lista.id_tramite}"/></td>
      <td>
        <form name=recibir<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarMisPendientesKardex.fautapo"/>' >
          <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
	  <input type="hidden" name="id_proceso"          value='<c:out value="${id_proceso}"/>' >
          <input type="hidden" name="accion"              value='Recibir' >
          <input type="hidden" name="nro_pagina"        value='<c:out value="${nro_pagina}"/>' >
	  <input type="hidden" name="banderakardex"     value='<c:out value="${banderakardex}"/>' >
          <c:if test="${lista.id_estado == 'P'}">
	    <a href='javascript: document.recibir<c:out value="${contador.count}"/>.submit();'>
	    <img src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0"></a>
	  </c:if>
          <c:if test="${lista.id_estado != 'P'}">
	   <!--<img width='25' height='25' src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0">-->
	   <img width='25' height='25' src='./imagenes/procesos/kardex.jpeg' title="<c:out value="${lista.estado}"/>"  border="0">
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
          <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/registrarTramiteKardex.fautapo"/>' >
            <input type="hidden" name="id_tramite"          value='<c:out value="${lista.id_tramite}"/>' >
            <input type="hidden" name="id_proceso"          value='<c:out value="${lista.id_proceso}"/>' >      
            <input type="hidden" name="id_actividad_actual" value='<c:out value="${lista.id_actividad_actual}"/>' >
            <input type="hidden" name="id_form"             value='<c:out value="${lista.id_form}"/>' >
            <input type="hidden" name="proceso"             value='<c:out value="${lista.proceso}"/>' >
            <input type="hidden" name="accion"              value='Formulario' >
            <input type="hidden" name="aplicacion"          value='<c:url value="/"/>' >
            <input type="hidden" name="nro_pagina"        value='<c:out value="${nro_pagina}"/>' >
            <input type="hidden" name="banderakardex"     value='<c:out value="${banderakardex}"/>' >
              <a href='javascript: document.forma<c:out value="${contador.count}"/>.submit();'> Modificar </a>
     	  </form>
	</c:if>
      </td>
     
    </tr>
    <c:set var="contador1" value="${contador.count}"/>
  </c:forEach>
</table>


<%@ include file="../../Inferior.jsp" %>