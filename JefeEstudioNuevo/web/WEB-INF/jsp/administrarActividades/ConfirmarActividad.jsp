<%@ include file="../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Actividades</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Actividades</div>
</c:if>
<c:if test="${accion == 'Eliminar'}">
  <div class="titulo"> Eliminando Actividades</div>
</c:if>

<div><a class="volver" href="javascript:history.back();">Volver</a></div>
<br>

<form name="adicionaractividad" method="POST" action='<c:url value="/registrarActividad.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Actividad</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosActividad.actividad}"/></td>            
    </tr>
    <tr>
      <td class="etiqueta">Area</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosUbicacionOrganica.ubicacion_organica}"/>
      </td>
    </tr>    
    <tr>
      <td class="etiqueta">Rol</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosRol.rol}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Duraci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosActividad.duracion}"/> &nbsp; <c:out value="${datosTipoDuracion.tipo_duracion}"/>(s)</td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo Actuaci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosTipoActuacion.tipo_actuacion}"/>
      </td>
    </tr>
    <input type="hidden" name="datosTipoActuacion.id_tipo_actuacion" value='<c:out value="${datosTipoActuacion.id_tipo_actuacion}"/>'>    

    <!--COMBO CUANDO ID TIPO ACTUACION ES GOTO-->
    <c:if test="${datosTipoActuacion.id_tipo_actuacion == '2'}">
      <tr>
        <td class="etiqueta">Siguiente actividad</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${datosActividadGoto.orden}"/>-<c:out value="${datosActividadGoto.actividad}"/>
        </td>
      </tr>
      <input type="hidden" name="actuacion_a_meter" value="<c:out value="${datosActividadGoto.orden}"/>"></td>
    </c:if>

    <!--CHECKED CUANDO ID TIPO ACTUACION ES FORK-->
    <c:if test="${datosTipoActuacion.id_tipo_actuacion == '3'}">
      <tr>
        <th colspan="2"><font size="1">Actividad</font></th>
        <th><font size="1"><center>Actuaci&oacute;n</center></font></th>	      
      </tr>
      <tr>
        <td colspan="3">
	  <table class="table">
	    <tr>
	      <td></td>
	    </tr>
	    <c:forEach var="listita" items="${listaActuacionesOrden}" varStatus="contador">
              <tr>
    	        <td align="left">
		  <input type=checkbox name="id_actividad" value="<c:out value="${listita.id_actividad}"/>" disabled>
                  <c:out value="${listita.orden}"/> - <c:out value="${listita.actividad}"/>
	        </td>
	        <td>
	          <input type='hidden' name="orden_actividad" value="<c:out value="${listita.orden}"/>"/>
	        </td>
	        <td>
  		  <c:out value="${listita.actuacion}"/>
		</td>
    	      </tr>
    	    </c:forEach>
	  </table>
        </td>
      </tr>
    </c:if>
    <tr>
      <td class="etiqueta" align=right>Orden</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosActividad.orden}"/></td>
    </tr>
    <tr>
      <td class="etiqueta" align=right>Alerta</td>
      <td class="etiqueta">::</td>
      <td>
        <c:if test="${datosActividad.alerta == 'true'}">
          Si
        </c:if>  
        <c:if test="${datosActividad.alerta == 'false'}">
          No
        </c:if>
      </td>
    </tr>
    <c:if test="${datosActividad.alerta == 'true' && cadena != null}">
      <tr>
        <td class="etiqueta">Alerta</td>
        <td class="etiqueta">::</td>
        <td class="etiqueta">
          <table>
            <c:forEach var="listita" items="${lTiposAlertas}" >
  	    <tr>
	      <td class="etiqueta"><input type="checkbox" name="alertas" value='<c:out value="${listita.id_tipo_alerta}"/>' disabled></td>
	      <td class="etiqueta" align="left"><c:out value="${listita.tipo_alerta}"/></td>
	    </tr>
            </c:forEach>
         </table>
        </td>
      </tr>
    </c:if>
    <tr>
      <td class="etiqueta" align="right">Puente</td>
      <td class="etiqueta">::</td>
      <td>
        <c:if test="${datosActividad.puente == 'true'}">
          Si
        </c:if>  
        <c:if test="${datosActividad.puente == 'false'}">
          No
        </c:if>
      </td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Ruta</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosActividad.ruta}"/></td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Fin flujo</td>
      <td class="etiqueta">::</td>
      <td>
        <c:if test="${datosActividad.fin_flujo == 'true'}">
          Si
        </c:if>  
        <c:if test="${datosActividad.fin_flujo == 'false'}">
          No
        </c:if>
      </td>
    </tr>
  </table>
  <center>
    <input type="submit" name='accion1' class="aceptar" value='Aceptar'>
    <input type="button" value='Cancelar' class="cancelar" OnClick='javascript:history.go(-2);'>
  </center>
  <input type="hidden" name='id_proceso'             value='<c:out value="${id_proceso}"/>'>
  <input type="hidden" name='id_actividad'           value='<c:out value="${id_actividad}"/>'>
  <input type="hidden" name='actividad'              value='<c:out value="${datosActividad.actividad}"/>'>
  <input type="hidden" name='duracion'               value='<c:out value="${datosActividad.duracion}"/>'>
  <input type="hidden" name='orden'                  value='<c:out value="${datosActividad.orden}"/>'>
  <input type="hidden" name='id_tipo_actuacion'      value='<c:out value="${datosTipoActuacion.id_tipo_actuacion}"/>'>
  <input type="hidden" name='id_tipo_duracion'       value='<c:out value="${datosTipoDuracion.id_tipo_duracion}"/>'>
  <input type="hidden" name='actuacion_a_meter'      value='<c:out value="${actuacion_a_meter}"/>'>
  <input type="hidden" name='id_rol'                 value='<c:out value="${datosRol.id_rol}"/>'>
  <input type="hidden" name='id_ubicacion_organica'  value='<c:out value="${datosUbicacionOrganica.id_ubicacion_organica}"/>'>
  <input type="hidden" name='id_actividad_modificar' value='<c:out value="${id_actividad_modificar}"/>'>
  <input type="hidden" name='id_actividad_eliminar'  value='<c:out value="${id_actividad}"/>'>
  <input type="hidden" name='accion'                 value='<c:out value="${accion}"/>'>
  <input type="hidden" name='alerta'                 value='<c:out value="${datosActividad.alerta}"/>'>
  <input type="hidden" name='puente'                 value='<c:out value="${datosActividad.puente}"/>'>
  <input type="hidden" name='ruta'                   value='<c:out value="${datosActividad.ruta}"/>'>
  <input type="hidden" name='fin_flujo'              value='<c:out value="${datosActividad.fin_flujo}"/>'>
  <input type="hidden" name='cadena'                 value='<c:out value="${cadena}"/>'>
</form>

<%@ include file="../Inferior.jsp"%>