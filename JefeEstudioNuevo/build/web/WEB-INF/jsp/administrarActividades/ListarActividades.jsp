<%@ include file="../Superior.jsp"%>

<div class="titulo"> Administraci&oacute;n de actividades</div>
<br>

<form name="forma" method="POST">
  <table class="formulario">
    <tr>
      <th>Tipo de proceso</th>
      <th>::</th>
      <td>
        <select name="id_proceso" OnChange="javascript: document.forma.submit()">
	  <option value="0">-- Seleccionar --</option>
          <c:forEach var="lista" items="${lProcesos}" >
	    <option value="<c:out value="${lista.id_proceso}"/>"<c:if test="${lista.id_proceso == id_proceso}">selected</c:if>>
	      <c:out value="${lista.proceso}"/>
            </option>
	  </c:forEach>
	</select>  
      </td>
    </tr>  
  </table>

  <c:if test="${id_proceso != null}">
    <div class="agregar">
      <a href="<c:url value="/nuevaActividad.fautapo">
        <c:param name="id_proceso" value="${id_proceso}"/>
        <c:param name="accion" value="Adicionar"/>
      </c:url>">Nuevo</a>
    </div>
  </c:if>
</form>

<c:if test="${id_proceso != null}">
 <table class="tabla">
   <tr>
     <th> Nro </th>
     <th> ACTIVIDAD </th>
     <th> ROL </th>
     <th> AREA </th>
     <th> DURACI&Oacute;N </th>
     <th> ORDEN </th>
     <th> TIPO ACTUACI&Oacute;N </th>
     <th> ACTUACI&Oacute;N </th>
     <th> ALERTA </th>
     <th> TIPO ALERTA </th>
     <th> LIMBO </th>
     <th> RUTA </th>
     <th> FIN FLUJO </th>
     <th> MODIFICAR </th>
     <th> ELIMINAR </th>    
  </tr>
  <c:forEach var="lista1" items="${lActividades}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td align="center"><c:out value="${contador.count}"/></td>
      <td><c:out value="${lista1.actividad}"/></td>
      <td><c:out value="${lista1.rol}"/></td>
      <td><c:out value="${lista1.ubicacion_organica}"/></td>
      <td><c:out value="${lista1.duracion}"/> &nbsp; <c:out value="${lista1.tipo_duracion}"/>(s)</td>
      <td><c:out value="${lista1.orden}"/></td>
      <td><c:out value="${lista1.tipo_actuacion}"/></td>
      <td><c:out value="${lista1.actuacion}"/></td>
      <td>
        <c:if test="${lista1.alerta == 'true'}">
	  SI
	</c:if>
        <c:if test="${lista1.alerta == 'false'}">
	  NO
	</c:if>
      </td>
      <td><c:out value="${lista1.tipo_alerta}"/></td>
      <td>
        <c:if test="${lista1.puente == 'true'}">
	  SI
	</c:if>
        <c:if test="${lista1.puente == 'false'}">
	  NO
	</c:if>
      </td>
      <td><c:out value="${lista1.ruta}"/></td>
      <td>
        <c:if test="${lista1.fin_flujo == 'true'}">
	  SI
	</c:if>
        <c:if test="${lista1.fin_flujo == 'false'}">
	  NO
	</c:if>
      </td>
     <form name=formamodificar<c:out value="${contador.count}"/> method="post" action='<c:url value="/nuevaActividad.fautapo"/>'>
       <td>     
         <div class="modificar"><a href="javascript:document.formamodificar<c:out value="${contador.count}"/>.submit();"> Modificar</a></div>
 	 <input type="hidden" name="id_actividad"           value='<c:out value="${lista1.id_actividad}"/>'>
	 <input type="hidden" name="id_actividad_modificar" value='<c:out value="${lista1.id_actividad}"/>'>
	 <input type="hidden" name="id_proceso"             value='<c:out value="${lista1.id_proceso}"/>'>
  	 <input type="hidden" name="accion"                 value="Modificar">
       </td>
     </form>
     <form name=formaeliminar<c:out value="${contador.count}"/> method="post" action='<c:url value="/confirmarActividad.fautapo"/>'>
       <td>     
         <div class="eliminar"><a href="javascript:document.formaeliminar<c:out value="${contador.count}"/>.submit();"> Eliminar</a></div>
         <input type="hidden" name="id_actividad" value='<c:out value="${lista1.id_actividad}"/>'>
         <input type="hidden" name="id_proceso"   value='<c:out value="${lista1.id_proceso}"/>'>
         <input type="hidden" name="accion"       value="Eliminar">
       </td>
     </form>
   <tr>	   
   </c:forEach>
 </table>
</c:if>

<%@ include file="../Inferior.jsp"%>