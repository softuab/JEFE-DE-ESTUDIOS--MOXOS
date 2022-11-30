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
              <input type="radio" name="id_tipo_proceso" value='4' onchange="javascript:document.tramitesdespachados.submit();"> Tr&aacute;mites Despachados
            </td>
	  </form>
          <form name="corresrecibidas" method="POST" action='<c:url value="/listarMisPendientesCorrespondencias.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='2' onchange="javascript:document.corresrecibidas.submit();" checked> Correspondencias Recibidas
            </td>
	  </form>
          <form name="corresdespachadas" method="POST" action='<c:url value="/listarMisPendientesCorrespondenciasDespachadas.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='3' onchange="javascript:document.corresdespachadas.submit();"> Correspondencias Despachadas
            </td>
	  </form>
         </tr>
       </table>
    </td>
  </tr>
</table>

<div class="titulo">Mis pendientes</div>
<br>

<form name="forma" method="POST">  
  <tabla class="tabla">
    <tr>
      <th>CORRESPONDENCIAS RECIBIDAS</th>
    </tr>
  </tabla>

  <table class="tabla">
    <tr>
      <th>#</th>    
      <th>?</th>
      <th>REMITENTE</th>
      <th>DESTINATARIO</th>
      <th>REFERENCIAS</th>
      <th>HOJA</th>
      <th>FORMULARIO</th>
    </tr>
    <c:forEach var="lista" items="${lCorresRecibida}" varStatus="contador">
        <!-- ********** Esto es para el efecto ************ -->
          <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
        <!-- ********** Fin  efecto ************ -->
        <td align="center"><c:out value="${lista.correlativo2}"/>/<c:out value="${lista.gestion}"/></td>
	<td>
	<c:if test="${lista.id_estado == 'R'}">
	  <input type="checkbox" name="id_tramite" VALUE="<c:out value="${lista.id_tramite}"/>">
          <input type=hidden name="actuacion"           value='<c:out value="${lista.actuacion}"/>' >
          <input type=hidden name="id_tipo_actuacion"   value='<c:out value="${lista.id_tipo_actuacion}"/>' >
	  <input type=hidden name="id_tipo_proceso"     value='<c:out value="${lista.id_tipo_proceso}"/>' >
	</c:if>
	</td>
	<td>
          <c:if test="${lista.id_estado == 'P'}">
            <a href="<c:url value="/listarMisPendientesCorrespondencias.fautapo"><c:param name="id_tramite" value="${lista.id_tramite}"/>&<c:param name="id_tipo_proceso" value="${lista.id_tipo_proceso}"/>&<c:param name="accion" value="Recibir"/></c:url>">
            <img src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0"></a>
          </c:if>
          <c:if test="${lista.id_estado != 'P'}">
            <img width='25' height='25' src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0">
          </c:if>
          <c:out value="${lista.cargo}"/> <br>
	  <center><c:out value="${lista.usuario}"/></center>
        </td>
	<td><c:out value="${lista.usuario_para}"/></d>
        </td>
        <td>
          <c:forEach var="referencias" items="${lista.lista}" >
	    <b><c:out value="${referencias.campo}"/>   :  </b><c:out value="${referencias.valor}"/><br>
	  </c:forEach>
        </td>
        <td><b><c:out value="${lista.tipo_documento}"/></b><br></td>
        <td align=right>
          <c:if test="${lista.id_estado == 'A' || lista.id_estado == 'R'}">
	    <a href="<c:url value="/registrarCorrespondencia.fautapo"><c:param name="id_tramite" value="${lista.id_tramite}"/>&<c:param name="id_tipo_proceso" value="${lista.id_tipo_proceso}"/>&<c:param name="id_proceso" value="${lista.id_proceso}"/>&<c:param name="id_actividad_actual" value="${lista.id_actividad_actual}"/>&<c:param name="id_form" value="${lista.id_form}"/>&<c:param name="proceso" value="${lista.proceso}"/>&<c:param name="usuario_para" value="${lista.para}"/>&<c:param name="accion" value="Formulario"/></c:url>"> Formulario </a>
	  </c:if>
        </td>
      </tr>
  </c:forEach>
</table>    
<input type=submit name='accion' class="siguiente" value='Avanzar' OnClick='javascript: document.forma.action="<c:url value="/listarMisPendientesCorrespondencias.fautapo?id_tipo_proceso=${id_tipo_proceso}"/>"'>
</form>

<%@ include file="../Inferior.jsp" %>