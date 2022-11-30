<%@ include file="../Superior.jsp" %>

<table width="100%">
  <tr>
    <td width="15%" class="titulo"><c:out value="${institucion}"/></td>
    <td width="85%">
      <table>
        <tr>
          <form name="tramitesrecibidos" method="POST" action='<c:url value="/listarMisPendientes.fautapo"/>'>
            <td class="etiqueta">
              <input type="radio" name="id_tipo_proceso" value='1' onchange="javascript:document.tramitesrecibidos.submit();" > Tr&aacute;mites Recibidos
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
              <input type="radio" name="id_tipo_proceso" value='3' onchange="javascript:document.corresdespachadas.submit();" checked> Correspondencias Despachadas
            </td>
	  </form>
         </tr>
       </table>
    </td>
  </tr>
</table>

<div class="titulo">Mis pendientes</div>
<br>

<tabla class="tabla">
  <tr>
    <th>CORRESPONDENCIAS DESPACHADAS</th>
  </tr>
</tabla>

<table class="tabla">
  <tr>
    <th>#</th>
    <th>CORRELATIVO</th>
    <th>DESTINATARIO</th>
    <th>REFERENCIAS</th>
    <th>HOJA</th>
  </tr>
  <c:forEach var="lista" items="${lCorresDespachada}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
      <td align=center><c:out value="${lista.id_tramite}"/></td>
      <td align=center><c:out value="${lista.correlativo}"/></td>
      <td>
	<img width='25' height='25' src='./imagenes/procesos/<c:out value="${lista.imagen}"/>' title="<c:out value="${lista.estado}"/>"  border="0">
  	<c:out value="${lista.usuario_para}"/></d>
      </td>
      <td>
        <c:forEach var="referencias" items="${lista.lista}" >
          <b><c:out value="${referencias.campo}"/>:</b><c:out value="${referencias.valor}"/><br>
        </c:forEach>
      </td>
      <td><b><c:out value="${lista.tipo_documento}"/></b><br></td>
    </tr>
  </c:forEach>
</table>  

<%@ include file="../Inferior.jsp" %>