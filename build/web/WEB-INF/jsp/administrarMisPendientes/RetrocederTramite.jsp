<%@ include file="../Superior.jsp" %>

<div class="titulo"> Retroceder proceso de negocio</div>

  <c:if test='${empty fechainicio  && empty fechafin  && empty fechadellunes && empty id_estado }'>
    <div><a class="volver" href="<c:url value="/listarMisPendientes.fautapo?"></c:url>">Volver</a></div>      
  </c:if>  
  <!--VOLVER PARA AGRUPADOS--> 
  <c:if test='${!empty fechainicio  || !empty fechafin  || !empty fechadellunes || !empty id_estado }'>
    <div><a class="volver" href="<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"><c:param name="nro_pagina_actual" value="${nro_pagina_actual}"/><c:param name="fechainicio" value="${fechainicio}"/><c:param name="fechafin" value="${fechafin}"/><c:param name="fechadellunes" value="${fechadellunes}"/><c:param name="id_estado" value="${id_estado}"/></c:url>" target=cuerpo>Volver</a></div>  
  </c:if>  
  <!--Fin-->    	      

<br>

<form name="forma" method="POST" action='<c:url value="/retrocederTramite.fautapo"/>'>
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Nro. de proceso de negocio</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosTramite.correlativo2}"/>/<c:out value="${datosTramite.gestion}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Observaci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td><textArea name="proveido" rows="10" cols="20" maxlength="10"></textarea></td>
    <tr>
  </table>
  <center>
     <input type="submit" class="aceptar" value="Aceptar" onclick="document.forma.accion.value='Grabar'">
  </center>
  <input type="hidden" name="accion" value=''>
  <input type="hidden" name="id_tramite"        value='<c:out value="${id_tramite}"/>' >
  <input type="hidden" name="id_actividad"      value='<c:out value="${id_actividad}"/>' >
  <input type="hidden" name="nro_pagina_actual" value='<c:out value="${nro_pagina_actual}"/>'>
  <input type="hidden" name="fechainicio"       value='<c:out value="${fechainicio}"/>' >
  <input type="hidden" name="fechafin"          value='<c:out value="${fechafin}"/>' >
  <input type="hidden" name="fechadellunes"     value='<c:out value="${fechadellunes}"/>' >
  <input type="hidden" name="id_estado"         value='<c:out value="${id_estado}"/>' >
  <input type="hidden" name="nro_pagina"      value='<c:out value="${nro_pagina}"/>' >
</form>

<%@ include file="../Inferior.jsp" %>