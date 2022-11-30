<%@ include file="../Superior.jsp" %>

<div class="titulo">Mis pendientes agrupados </div>
<br>

<table class="tabla">
  <tr>
    <th>ESTADOS</th>
    <th>TOTAL</th>
    <th>ANTES <br>del &nbsp;<c:out value="${diasemana}"/> <br><fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/></th>
    <th>
      <table border="0">
        <tr>
	  <th colspan="2">ESTA SEMANA</th>
	<tr>
	  <th>Del &nbsp;<c:out value="${diasemana}"/><br><fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/></th>
	  <th>al &nbsp;<c:out value="${diaayer}"/><br><fmt:formatDate value="${fechaayer}" pattern="${formatoFecha}"/></th>
	</tr>
       </table>
    </th>
    <th>HOY <br> <c:out value="${diaactual}"/> <br> <fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/></th>
  </tr>

  <!--ACTIVOS-->
  <tr onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <td align="center">
      <img src='./imagenes/procesos/activo1.jpeg' title="Mis Pendientes Activos"  border="0" width='25' height='25'>
    </td>
    <td align="center">
      <c:out value="${totalTramitesActivos.nro_total_tramites}"/>
    </td>
    <td align="center">
      <form name=pendientesActivosAntes  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
        <input type=hidden name="id_estado"            value='A' >
        <input type=hidden name="fechadellunes"        value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	<c:if test="${totalTramitesActivos.nro_tramites_anteriores !='0'}"> 
          <a href='javascript: document.pendientesActivosAntes.submit();' > <c:out value="${totalTramitesActivos.nro_tramites_anteriores}"/>   </a>
	</c:if> 
	<c:if test="${totalTramitesActivos.nro_tramites_anteriores =='0'}"> 
          <c:out value="${totalTramitesActivos.nro_tramites_anteriores}"/> 
	</c:if>
      </form>    
    </td>
    <td align="center">
      <form name=pendientesActivosSemana  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
        <input type=hidden name="id_estado"            value='A' >
        <input type=hidden name="fechainicio"          value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >      
        <input type=hidden name="fechafin"             value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	<c:if test="${totalTramitesActivos.nro_tramites_semanal !='0'}"> 
          <a href='javascript: document.pendientesActivosSemana.submit();' > <c:out value="${totalTramitesActivos.nro_tramites_semanal}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesActivos.nro_tramites_semanal =='0'}"> 
	  <c:out value="${totalTramitesActivos.nro_tramites_semanal}"/> 
	</c:if>
      </form>      
    </td>
    <td align="center">
      <form name=pendientesActivosHoy  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
        <input type=hidden name="id_estado"           value='A' >
        <input type=hidden name="fechainicio"         value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >      
        <input type=hidden name="fechafin"            value='<fmt:formatDate value="${fechamaniana}" pattern="${formatoFecha}"/>'>       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	<c:if test="${totalTramitesActivos.nro_tramites_hoy !='0'}"> 
          <a href='javascript: document.pendientesActivosHoy.submit();' > <c:out value="${totalTramitesActivos.nro_tramites_hoy}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesActivos.nro_tramites_hoy =='0'}"> 
	  <c:out value="${totalTramitesActivos.nro_tramites_hoy}"/> 
	</c:if>
      </form>
    </td>
  </tr>

  <!--BLOQUEADOS-->
  <tr onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <td align="center"><a href='javascript: document.recibir<c:out value="${contador.count}"/>.submit();'>
      <img src='./imagenes/procesos/bloqueado.jpeg' title="<c:out value="${lista.estado}"/>"  border="0" width='25' height='25'></a>
    </td>
    <td align="center">
      <c:out value="${totalTramitesBloqueados.nro_total_tramites}"/>
    </td>
    <td align="center">
      <form name=pendientesBloqueadosAntes  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
        <input type=hidden name="id_estado"                 value='B' >
        <input type=hidden name="fechadellunes"             value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
        <c:if test="${totalTramitesBloqueados.nro_tramites_anteriores !='0'}"> 
	  <a href='javascript: document.pendientesBloqueadosAntes.submit();' > <c:out value="${totalTramitesBloqueados.nro_tramites_anteriores}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesBloqueados.nro_tramites_anteriores =='0'}"> 
	  <c:out value="${totalTramitesBloqueados.nro_tramites_anteriores}"/> 
	</c:if>
      </form>
    </td>
    <td align="center">
       <form name=pendientesBloqueadosSemana  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
        <input type=hidden name="id_estado"            value='B' >
        <input type=hidden name="fechainicio"          value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >      
        <input type=hidden name="fechafin"             value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	<c:if test="${totalTramitesBloqueados.nro_tramites_semanal !='0'}"> 
          <a href='javascript: document.pendientesBloqueadosSemana.submit();' > <c:out value="${totalTramitesBloqueados.nro_tramites_semanal}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesBloqueados.nro_tramites_semanal =='0'}"> 
	  <c:out value="${totalTramitesBloqueados.nro_tramites_semanal}"/> 
	</c:if>  
      </form>      
    </td>
    <td align="center">
       <form name=pendientesBloqueadosHoy  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
         <input type=hidden name="id_estado"           value='B' >
         <input type=hidden name="fechainicio"         value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >      
         <input type=hidden name="fechafin"            value='<fmt:formatDate value="${fechamaniana}" pattern="${formatoFecha}"/>'>       
         <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	 <c:if test="${totalTramitesBloqueados.nro_tramites_hoy !='0'}"> 
           <a href='javascript: document.pendientesBloqueadosHoy.submit();' > <c:out value="${totalTramitesBloqueados.nro_tramites_hoy}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesBloqueados.nro_tramites_hoy =='0'}"> 
 	  <c:out value="${totalTramitesBloqueados.nro_tramites_hoy}"/> 
	</c:if>  
      </form>
    </td>
  </tr>

  <!--POR RECIBIR -->
   <tr bgColor="#FFFFD9" onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">

    <td align="center"><a href='javascript: document.recibir<c:out value="${contador.count}"/>.submit();'>
       <img src='./imagenes/procesos/pendiente.jpeg' title="<c:out value="${lista.estado}"/>"  border="0"></a>
    </td>
    <td align="center">
      <c:out value="${totalTramitesPorRecibir.nro_total_tramites}"/>
    </td>
    <td align="center">
       <form name=pendientesPorRecibirAntes  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
        <input type=hidden name="id_estado"                 value='P' >
        <input type=hidden name="fechadellunes"             value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
        <c:if test="${totalTramitesPorRecibir.nro_tramites_anteriores !='0'}"> 
	  <a href='javascript: document.pendientesPorRecibirAntes.submit();' > <c:out value="${totalTramitesPorRecibir.nro_tramites_anteriores}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesPorRecibir.nro_tramites_anteriores =='0'}"> 
	  <c:out value="${totalTramitesPorRecibir.nro_tramites_anteriores}"/> 
	</c:if>
      </form>      
      
    </td>
    <td align="center">
       <form name=pendientesPorRecibirSemana  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
        <input type=hidden name="id_estado"            value='P' >
        <input type=hidden name="fechainicio"          value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >      
        <input type=hidden name="fechafin"             value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	<c:if test="${totalTramitesPorRecibir.nro_tramites_semanal !='0'}"> 
          <a href='javascript: document.pendientesPorRecibirSemana.submit();' > <c:out value="${totalTramitesPorRecibir.nro_tramites_semanal}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesPorRecibir.nro_tramites_semanal =='0'}"> 
	  <c:out value="${totalTramitesPorRecibir.nro_tramites_semanal}"/> 
	</c:if>  
      </form>      
     
    </td>
    <td align="center">
      <form name=pendientesPorRecibirHoy  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>' >
         <input type=hidden name="id_estado"           value='P' >
         <input type=hidden name="fechainicio"         value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >      
         <input type=hidden name="fechafin"            value='<fmt:formatDate value="${fechamaniana}" pattern="${formatoFecha}"/>'>       
         <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	 <c:if test="${totalTramitesPorRecibir.nro_tramites_hoy !='0'}"> 
           <a href='javascript: document.pendientesPorRecibirHoy.submit();' > <c:out value="${totalTramitesPorRecibir.nro_tramites_hoy}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesPorRecibir.nro_tramites_hoy =='0'}"> 
 	  <c:out value="${totalTramitesPorRecibir.nro_tramites_hoy}"/> 
	</c:if>  
      </form>
    </td>
  </tr>

  <!--TRAMITES DESPACHADOS-->
  <tr onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <td align="center"><a href='javascript: document.recibir<c:out value="${contador.count}"/>.submit();'>
      <img src='./imagenes/procesos/despachados.gif' title="<c:out value="${lista.estado}"/>"  border="0" ></a>
    </td>
    <td align="center">
      <c:out value="${totalTramitesDespachados.nro_total_tramites}"/>
    </td>
    <td align="center">
      <form name=pendientesDespachadosAntes  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado2.fautapo"/>' >
        <input type=hidden name="id_estado"                 value='P' >
        <input type=hidden name="fechadellunes"             value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
        <c:if test="${totalTramitesDespachados.nro_tramites_anteriores !='0'}"> 
	  <a href='javascript: document.pendientesDespachadosAntes.submit();' > <c:out value="${totalTramitesDespachados.nro_tramites_anteriores}"/></a>
        </c:if>
	<c:if test="${totalTramitesDespachados.nro_tramites_anteriores =='0'}"> 
	  <c:out value="${totalTramitesDespachados.nro_tramites_anteriores}"/> 
	</c:if>
      </form>
    </td>
    <td align="center">
       <form name=pendientesDespachadosSemana  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado2.fautapo"/>' >
        <input type=hidden name="id_estado"            value='P' >
        <input type=hidden name="fechainicio"          value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >      
        <input type=hidden name="fechafin"             value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	<c:if test="${totalTramitesDespachados.nro_tramites_semanal !='0'}"> 
          <a href='javascript: document.pendientesDespachadosSemana.submit();' > <c:out value="${totalTramitesDespachados.nro_tramites_semanal}"/></a>
        </c:if>
	<c:if test="${totalTramitesDespachados.nro_tramites_semanal =='0'}"> 
	  <c:out value="${totalTramitesDespachados.nro_tramites_semanal}"/> 
	</c:if>  
      </form>      
    </td>
    <td align="center">
       <form name=pendientesDespachadosHoy method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado2.fautapo"/>' >
         <input type=hidden name="id_estado"           value='P' >
         <input type=hidden name="fechainicio"         value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >      
         <input type=hidden name="fechafin"            value='<fmt:formatDate value="${fechamaniana}" pattern="${formatoFecha}"/>'>       
         <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	 <c:if test="${totalTramitesDespachados.nro_tramites_hoy !='0'}"> 
           <a href='javascript: document.pendientesDespachadosHoy.submit();' > <c:out value="${totalTramitesDespachados.nro_tramites_hoy}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesDespachados.nro_tramites_hoy =='0'}"> 
 	  <c:out value="${totalTramitesDespachados.nro_tramites_hoy}"/> 
	</c:if>  
      </form>
    </td>
  </tr>
  <tr>
    <th> TOTAL PENDIENTES </th>
    <th> <c:out value="${totalTramites.nro_total_tramites}"/> </th>
    <th> <c:out value="${totalTramites.nro_tramites_anteriores}"/> </th>
    <th> <c:out value="${totalTramites.nro_tramites_semanal}"/> </th>
    <th> <c:out value="${totalTramites.nro_tramites_hoy}"/> </th>
  </tr>
  </tr>
    <td colspan=5><br></td>
  <tr>

  <!--TRAMITES CONFIRMADOS-->
  <tr onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <td align="center"><a href='javascript: document.recibir<c:out value="${contador.count}"/>.submit();'>
      <img src='./imagenes/procesos/confirmados.gif' title="<c:out value="${lista.estado}"/>"  border="0" ></a>
    </td>
    <td align="center">
      <c:out value="${totalTramitesConfirmados.nro_total_tramites}"/>
    </td>
    <td align="center">
      <form name=pendientesConfirmadosAntes  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado2.fautapo"/>' >
        <input type=hidden name="id_estado"                 value='A' >
        <input type=hidden name="fechadellunes"             value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
        <c:if test="${totalTramitesConfirmados.nro_tramites_anteriores !='0'}"> 
	  <a href='javascript: document.pendientesConfirmadosAntes.submit();' > <c:out value="${totalTramitesConfirmados.nro_tramites_anteriores}"/></a>
        </c:if>
	<c:if test="${totalTramitesConfirmados.nro_tramites_anteriores =='0'}"> 
	  <c:out value="${totalTramitesConfirmados.nro_tramites_anteriores}"/> 
	</c:if>
      </form>
    </td>
    <td align="center">
       <form name=pendientesConfirmadosSemana  method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado2.fautapo"/>' >
        <input type=hidden name="id_estado"            value='A' >
        <input type=hidden name="fechainicio"          value='<fmt:formatDate value="${fechadellunes}" pattern="${formatoFecha}"/>' >      
        <input type=hidden name="fechafin"             value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >       
        <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	<c:if test="${totalTramitesConfirmados.nro_tramites_semanal !='0'}"> 
          <a href='javascript: document.pendientesConfirmadosSemana.submit();' > <c:out value="${totalTramitesConfirmados.nro_tramites_semanal}"/></a>
        </c:if>
	<c:if test="${totalTramitesConfirmados.nro_tramites_semanal =='0'}"> 
	  <c:out value="${totalTramitesConfirmados.nro_tramites_semanal}"/> 
	</c:if>  
      </form>      
    </td>
    <td align="center">
       <form name=pendientesConfirmadosHoy method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado2.fautapo"/>' >
         <input type=hidden name="id_estado"           value='A' >
         <input type=hidden name="fechainicio"         value='<fmt:formatDate value="${fechahoy}" pattern="${formatoFecha}"/>' >      
         <input type=hidden name="fechafin"            value='<fmt:formatDate value="${fechamaniana}" pattern="${formatoFecha}"/>'>       
         <input type=hidden name="aplicacion" value='<c:url value="/"/>' >
	 <c:if test="${totalTramitesConfirmados.nro_tramites_hoy !='0'}"> 
           <a href='javascript: document.pendientesConfirmadosHoy.submit();' > <c:out value="${totalTramitesConfirmados.nro_tramites_hoy}"/>   </a>
        </c:if>
	<c:if test="${totalTramitesConfirmados.nro_tramites_hoy =='0'}"> 
 	  <c:out value="${totalTramitesConfirmados.nro_tramites_hoy}"/> 
	</c:if>  
      </form>
    </td>
  </tr>
  <tr>
    <th> TOTAL MOVIMIENTO </th>
    <th> <c:out value="${totalTramites2.nro_total_tramites}"/> </th>
    <th> <c:out value="${totalTramites2.nro_tramites_anteriores}"/> </th>
    <th> <c:out value="${totalTramites2.nro_tramites_semanal}"/> </th>
    <th> <c:out value="${totalTramites2.nro_tramites_hoy}"/> </th>
  </tr>
</table>

<%@ include file="../Inferior.jsp" %>