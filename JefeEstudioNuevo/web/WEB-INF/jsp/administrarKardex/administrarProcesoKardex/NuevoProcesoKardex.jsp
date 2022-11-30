<%@ include file="../../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Kardex</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Kardex</div>
</c:if>

<div><a class="volver" href='listarProcesosKardexs.fautapo'>Volver</a></div>
<br>

<form name="forma" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Nombre del Kardex <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="proceso" size="30" value='<c:out value="${datosProceso.proceso}"/>'> </td>
    </tr>    
    <tr>
      <td class="etiqueta">Nombre del Formulario <font color='red'>(*)</font></td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="form" size="30" value='<c:out value="${datosForm.form}"/>'> </td>
    </tr>
    <!--
    <tr>
      <td class="etiqueta">Nombre de la actividad <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="actividad" size="30" value='<c:out value="${actividad}"/>'> </td>
    </tr>
    -->
  </table>
  <center>
    <input type="submit" class="siguiente" value='Siguiente' onclick="document.forma.accion1.value='Guardar';
								      document.forma.action='<c:url value="/confirmarProcesoKardex.fautapo"/>'">
  </center>
    <input type="hidden" name='accion1'         value=''>
    <input type="hidden" name='accion'          value='<c:out value="${accion}"/>'>
    <input type="hidden" name='id_tipo_proceso' value='<c:out value="${id_tipo_proceso}"/>'>
    <input type="hidden" name='id_proceso'      value='<c:out value="${datosProceso.id_proceso}"/>'>
    <input type="hidden" name='id_form'         value='<c:out value="${datosForm.id_form}"/>'>
    <input type="hidden" name='id_actividad'    value='<c:out value="${id_actividad}"/>'>
    
    <input type="hidden" name='recargado'  value='Si'>
    <input type="hidden" name='sw'         value='1'>
    
</form>
<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../../Inferior.jsp"%>