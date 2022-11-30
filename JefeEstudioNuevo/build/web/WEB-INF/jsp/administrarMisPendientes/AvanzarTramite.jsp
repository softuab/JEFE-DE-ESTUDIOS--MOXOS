<%@ include file="../Superior.jsp" %>

<div class="titulo"> Avanzar proceso de negocio</div>
<div><a class="volver" href="<c:url value="/listarMisPendientes.fautapo?"></c:url>">Volver</a></div>
<br>

<form name="avanzar" method="POST" action='<c:url value="/avanzarTramite.fautapo"/>' >
  <c:if test="${datosActividad.id_tipo_actuacion == 3}">
    <table class="formulario">
      <tr>
        <th>SELECCIONE UNA ACTUACI&Oacute;N</th>
      </tr>
      <c:forEach var="actuacion" items="${lActuaciones}">
      <tr>
         <td><input type="radio" name="actuacion" value='<c:out value="${actuacion.orden}"/>' onchange="javascript:document.avanzar.submit();" <c:if test="${orden == actuacion.orden}">checked </c:if> >
	   <c:out value="${actuacion.actuacion}"/>
	 </td>
      </tr>
      </c:forEach>
      <tr>
        <td>
        <c:if test="${nro_usuarios > 1}">
          <select name="para">
            <c:forEach var="lista2" items="${lUsuariosActSig}" >
              <option value='<c:out value="${lista2.id_usuario}"/>'><c:out value="${lista2.usuario}"/>
            </c:forEach>
	  </select>
        </c:if>
        <c:if test="${nro_usuarios == 1}">
          <c:forEach var="lista2" items="${lUsuariosActSig}" >
  	    <input type="hidden" name="para" value='<c:out value="${lista2.id_usuario}"/>' >
          </c:forEach>
        </c:if>
	</td>
      </tr>
    </table>
  </c:if>
<center>
  <input type="submit" class="siguiente" value="Avanzar" onclick='document.avanzar.accion.value="avanzar"'>
</center>

<input type=hidden name='id_tramite'          value='<c:out value="${id_tramite}"/>' >
<input type=hidden name='id_proceso'          value='<c:out value="${id_proceso}"/>'>	      
<input type=hidden name='id_actividad'        value='<c:out value="${id_actividad}"/>'>
<input type=hidden name='id_form'             value='<c:out value="${id_form}"/>'>
<input type=hidden name='id_proceso'          value='<c:out value="${id_proceso}"/>'>
<input type=hidden name='id_tipo_actuacion'   value='<c:out value="${datosActividad.id_tipo_actuacion}"/>'>
<input type=hidden name="recargado"           value='si' >
<input type=hidden name="accion"              value='' >
<input type=hidden name="nro_pagina"          value=<c:out value="${nro_pagina}"/> >
</form>
<%@ include file="../Inferior.jsp" %>