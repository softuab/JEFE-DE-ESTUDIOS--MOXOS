<%@ include file="../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Formulario</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Formulario</div>
</c:if>
<c:if test="${accion == 'Eliminar'}">
  <div class="titulo"> Eliminando Formulario</div>
</c:if>

<div><a class="volver" href="<c:url value="/listarFormularios.fautapo"></c:url>">Volver</a></div>
<br>

<form name="adicionarform" method="POST" action='<c:url value="/registrarFormulario.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta"> Proceso </td>
      <td class="etiqueta">::
      <td><c:out value="${datosProceso.proceso}"/></td>
    </tr>        
    <tr>
      <td class="etiqueta"> Formulario </td>
      <td class="etiqueta" >::
      <td><c:out value="${datosFormulario.form}"/></td>
    </tr>
  </table>
  <center>
    <input type=submit name='accion1' class="aceptar" value='Aceptar'>
  </center>
  <input type="hidden" name='id_form'    value='<c:out value="${id_form}"/>'>        
  <input type="hidden" name='id_proceso' value='<c:out value="${id_proceso}"/>'>
  <input type="hidden" name='form'       value='<c:out value="${datosFormulario.form}"/>'>
  <input type="hidden" name='accion'     value='<c:out value="${accion}"/>'>
</form>

<%@ include file="../Inferior.jsp"%>