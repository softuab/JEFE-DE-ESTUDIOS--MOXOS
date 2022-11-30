<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Datos del proceso de negocio </div>
<div><a class="volver" href='javascript:history.back();'>Volver</a></div>
<br>
<table class="tabla">
  <tr>
    <th>#</th>
    <th>PROCESO DE NEGOCIO</th>
    <th>ACTIVIDAD ACTUAL</th>
    <th>ESTADO ACTUAL</th>
  </tr>
  <tr>
    <td align="right"><c:out value="${datosTramite.correlativo2}"/>/<c:out value="${datosTramite.gestion}"/></td>
    <td><c:out value="${datosTramite.proceso}"/></td>
    <td><c:out value="${datosTramite.actividad}"/></td>
    <td><c:out value="${datosTramiteUbiOrg.estado}"/></td>
  </tr>
</table>
<br>
<table class="tabla">
  <tr>
    <th colspan="5">DATOS GENERALES</th>
  </tr>
  <c:forEach var="valores" items="${lValores}">
    <tr>
      <td class="etiqueta">
        <c:out value="${valores.campo}"/>
      </td>
      <td>
        <c:out value="${valores.valor}"/>
      </td>
    </tr>
  </c:forEach>
</table>
<br>
<c:if test="${datosProceso.id_tipo_proceso == '1'}">
<table>
  <tr>
    <c:set var="fec_registro" value="${datosTramite.fec_registro}"/>
    <c:set var="activ_aux" value="no"/>
    <!-- INICIO JOJO  -->
    <c:set var="total_estimado" value="0" />
    <!-- FIN JOJO  -->
    
    <c:forEach var="act" items="${lActividades}" varStatus="contador">
      <!-- INICIO JOJO  -->
      <c:set var="total_estimado" value="${total_estimado + act.duracion}"/>
      <!-- FIN JOJO  -->

       <c:forEach var="hist" items="${lTramitesLog}">
         <c:if test="${act.id_actividad == hist.id_actividad}">
            <c:set var="fec_registro" value="${hist.fec_registro}"/>
            <c:set var="para" value="${hist.usuario}"/>		
         </c:if>
       </c:forEach>
    <td>
    <c:if test="${act.orden < datosActividad.orden}">
      <table>
        <tr>
	  <td align=center></td>
	</tr> 
	<tr>
	  <td align=center><font size=1><b><c:out value="${contador.count}"/></fonts></td>
	</tr> 
        <tr>
	  <td align=center><img src="./imagenes/busquedas/botones/azul_a.gif" title="<c:out value="${act.actividad}"/> - <c:out value="${act.ubicacion_organica}"/>"  border=0/></td>
	</tr>
	<tr>
	  <td align=center><font size=1><b><fmt:formatDate value="${fec_registro}" pattern="${formatoFecha} ${formatoHora}"/></fonts></td>
	</tr>
      </table>
    </c:if>        

    <c:if test="${act.orden == datosActividad.orden}">
      <table>
        <tr>
	  <td align=center><font size=1><b>Esta aqu&iacute;</font></td>
	</tr> 
	<tr>
	  <td align=center><img src="./imagenes/busquedas/botones/fleaazul15.gif" border=0/></td>
	</tr>
        <tr>
	  <td align=center><img src="./imagenes/busquedas/botones/azul_a.gif" title="<c:out value="${act.actividad}"/> - <c:out value="${act.ubicacion_organica}"/>" border=0/></td>
	</tr>
	<tr>
	  <td align=center><font size=1><b><fmt:formatDate value="${datosTramite.fec_modificacion}" pattern="${formatoFecha} ${formatoHora}"/></fonts></td>
	</tr>
      </table>
    </c:if>        

    <c:if test="${act.orden > datosActividad.orden}">
      <table>
        <tr>
	  <td></td>
	</tr> 
  	<tr>
	  <td align=center><font size=1><b><c:out value="${contador.count}"/></fonts></td>
	</tr>
        <tr>
	  <td align=center><img src="./imagenes/busquedas/botones/orange_b.gif" border=0 title="<c:out value="${act.actividad}"/> - <c:out value="${act.ubicacion_organica}"/>"/></td>
	</tr>
      </table>  
    </c:if>        
    </td>
    </c:forEach>	
  </tr>    
</table> 
<br>

<table>
  <tr>
    <td align=right><img src="./imagenes/busquedas/botones/azul_a.gif" width=40% heigh=20%/></td>
    <td><font size=1><b>Actividades conclu&iacute;das</font></td>
    <td align=right><img src="./imagenes/busquedas/botones/orange_b.gif" width=40% heigh=20%/></td>
    <td><font size=1><b>Actividades que faltan</font></td>
  </tr>   	     
  <tr>
    <td align=right><font size=1><b>Nota: </font></td>
    <td colspan=3><font size=1>Acercar el mouse al cuadro para ver la actividad - Unidad</font></td>
  </tr>   	     
</table>
</c:if>

<table class="tabla"> 
  <tr>
    <th colspan="8"> DETALLE HIST&Oacute;RICO DEL PROCESO DE NEGOCIO </th>
  </tr>
  <tr>
    <th colspan="2"> Actividad </th>
    <th> Responsable </th>
    <th> Tiempo Estimado </th>
    <th> Tiempo Transcurrido </th>
    <th> Proveido </th>
    <th> Adjuntos </th>
  </tr>  
  <!-- INICIO JOJO  -->
  <c:set var="total_dias" value="0" />
  <c:set var="total_horas" value="0" />
  <c:set var="total_minutos" value="0" />
  <c:set var="total_segundos" value="0" />
  <!-- FIN JOJO  -->

  <c:forEach var="cod" items="${lTramitesLog}" varStatus="contador" >
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
    <td colspan="2">
      <img width='25' height='25' src='./imagenes/procesos/<c:out value="${cod.imagen}"/>'>
      <c:if test="${cod.retrocedido==0}"><img width='20' height='20' src="./imagenes/busquedas/arriba.jpeg" border=0/></c:if>
      <c:if test="${cod.retrocedido==1}"><img width='20' height='20' src="./imagenes/busquedas/abajo.jpeg" border=0/></c:if>
      <c:out value="${cod.actividad}"/></td>
    <td><c:out value="${cod.usuario}"/>
      <br><b>Cargo</b>&nbsp; <c:out value="${cod.cargo}"/>
      <br><b>Unidad</b>&nbsp; <c:out value="${cod.ubicacion_organica}"/>
    </td>
    <td>
      <c:out value="${cod.duracion}"/> &nbsp; <c:out value="${cod.tipo_duracion}"/> (s)
    </td>
    <td>
      <c:if test="${cod.estado == 'Recibido'}">
        <b><c:out value="${cod.estado}"/> </b> <br>
        <fmt:formatDate value="${cod.fec_modificacion}" pattern="${formatoFecha} ${formatoHora}"/>
        <c:if test="${cod.dia != '0' }">
          <br><c:out value="${cod.dia}"/> <c:if test="${cod.dia > '1' }"> D&iacute;as </c:if> <c:if test="${cod.dia == '1' }"> D&iacute;a </c:if>
          <!-- INICIO JOJO  -->
          <c:set var="total_dias" value="${total_dias + cod.dia}" />
          <!-- FIN JOJO  -->
        </c:if>
        <c:if test="${cod.horas != '00' }">
          <br><c:out value="${cod.horas}"/> Horas 
          <!-- INICIO JOJO  -->
          <c:set var="total_horas" value="${total_horas + cod.horas}" />
          <!-- FIN JOJO  -->
        </c:if>
        <c:if test="${cod.minutos != '00' }">
          <br><c:out value="${cod.minutos}"/> Minutos 
          <!-- INICIO JOJO  -->
          <c:set var="total_minutos" value="${total_minutos + cod.minutos}" />
          <!-- FIN JOJO  -->
        </c:if>
        <c:if test="${cod.segundos != '00' }">
          <br><c:out value="${cod.segundos}"/> Segundos 
          <!-- INICIO JOJO  -->
          <c:set var="total_segundos" value="${total_segundos + cod.segundos}" />
          <!-- FIN JOJO  -->
        </c:if>
        <br>
    	<b>Hasta hoy &nbsp; </b>
	<fmt:formatDate value="${cod.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/>
      </c:if>

      <c:if test="${cod.estado == 'Concluido'}">
        <strong><c:out value="${cod.estado}"/></strong><br>
        <fmt:formatDate value="${cod.fec_modificacion}" pattern="${formatoFecha} ${formatoHora}"/> 
      </c:if>	

      <c:if test="${cod.estado == 'Recibido/Enviado'}">	
        <b>Recibido &nbsp; </b>
           <fmt:formatDate value="${cod.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/> 
        <c:if test="${cod.dia != '0' }">
          <br><c:out value="${cod.dia}"/> <c:if test="${cod.dia > '1' }"> D&iacute;as </c:if> <c:if test="${cod.dia == '1' }"> D&iacute;a </c:if>
          <!-- INICIO JOJO  -->
          <c:set var="total_dias" value="${total_dias + cod.dia}" />
          <!-- FIN JOJO  -->
        </c:if>
        <c:if test="${cod.horas != '00' }">
          <br><c:out value="${cod.horas}"/> Horas 
          <!-- INICIO JOJO  -->
          <c:set var="total_horas" value="${total_horas + cod.horas}" />
          <!-- FIN JOJO  -->
        </c:if>
        <c:if test="${cod.minutos != '00' }">
          <br><c:out value="${cod.minutos}"/> Minutos 
          <!-- INICIO JOJO  -->
          <c:set var="total_minutos" value="${total_minutos + cod.minutos}" />
          <!-- FIN JOJO  -->
        </c:if>
        <c:if test="${cod.segundos != '00' }">
          <br><c:out value="${cod.segundos}"/> Segundos 
          <!-- INICIO JOJO  -->
          <c:set var="total_segundos" value="${total_segundos + cod.segundos}" />
          <!-- FIN JOJO  -->
        </c:if>
        <br>
    	<b>Enviado &nbsp; </b>
	<fmt:formatDate value="${cod.fec_modificacion}" pattern="${formatoFecha} ${formatoHora}"/>
      </c:if>   
    </td>
    <td>
      <c:out value="${cod.proveido}" escapeXml="False"/>
    </td>
    <td>			   
      <c:forEach var="adj" items="${lAdjuntos}" varStatus="contador" >		   
        <c:if test="${cod.id_actividad == adj.id_actividad}">
          <img src="./imagenes/botones/descargar.gif" border=0/>
          <a href='<c:out value="${aplicacion}"/>adjuntos/<c:out value="${adj.adjunto}"/>'><c:out value="${adj.archivo}"/></a><br>
        </c:if>
      </c:forEach>
    </td>
  </tr>
  </c:forEach>
  <!-- INICIO JOJO  -->
  <tr>
    <td colspan="7">&nbsp;</td>
  </tr>
  <tr>
    <th colspan="3">TOTALES</th>
    <th align="left" valign="top"></th>
    <th align="left" colspan="3">Tiempo Transcurrido <br/>
      <c:set var="total_minutos" value="${total_minutos + (total_segundos / 60)}" />
      <c:set var="total_segundos" value="${total_segundos % 60}" />
      <c:set var="total_horas" value="${total_horas + (total_minutos / 60)}" />
      <c:set var="total_minutos" value="${total_minutos % 60}" />
      <c:set var="total_dias" value="${total_dias + (total_horas / 24)}" />
      <c:set var="total_horas" value="${total_horas % 24}" />
      <c:if test="${total_dias > 0.5}">
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${total_dias - 0.499999}" /> D&iacute;as <br/>
      </c:if>
      <c:if test="${total_horas > 0.5}">
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${total_horas - 0.499999}"/> Horas <br/>
      </c:if>
      <c:if test="${total_minutos > 0.5}">
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${total_minutos - 0.499999}"/> Minutos <br/>
      </c:if>
      <c:out value="${total_segundos}"/> Segundos
    </th>
  </tr>
  <!-- FIN JOJO  -->
</table>

<%@ include file="../../Inferior.jsp" %>