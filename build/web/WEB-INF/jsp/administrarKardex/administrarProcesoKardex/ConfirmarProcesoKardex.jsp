<%@ include file="../../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Kardex</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Kardex</div>
</c:if>
<c:if test="${accion == 'Eliminar'}">
  <div class="titulo"> Eliminando Kardex</div>
</c:if>

<div><a class="volver" href='listarDominios.fautapo'>Volver</a></div>
<br>

<form method="POST" action='<c:url value="/registrarProcesoKardex.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Nombre del Kardex <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${proceso}"/> </td>
    </tr>    
    <tr>
      <td class="etiqueta">Nombre del Formulario <font color='red'>(*)</font></td>
      <td class="etiqueta">::</td>
      <td><c:out value="${form}"/> </td>
    </tr>
    <!--
    <tr>
      <td class="etiqueta">Nombre de la actividad <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${actividad}"/> </td>
    </tr>
    -->
  </table>
  <center> 
    <input type="submit" class="aceptar" name='accion1' value='Aceptar'>
  </center>
  <input type="hidden" name='id_tipo_proceso'  value='<c:out value="${id_tipo_proceso}"/>'>
  <input type="hidden" name='proceso'          value='<c:out value="${proceso}"/>'>
  <input type="hidden" name='form'             value='<c:out value="${form}"/>'>
  <input type="hidden" name='actividad'        value='<c:out value="${actividad}"/>'>
  <input type="hidden" name='id_proceso'       value='<c:out value="${id_proceso}"/>'>
  <input type="hidden" name='id_form'          value='<c:out value="${id_form}"/>'>
  <input type="hidden" name='id_actividad'     value='<c:out value="${id_campo}"/>'>
  <input type="hidden" name='accion'           value='<c:out value="${accion}"/>'>
</form>

<%@ include file="../../Inferior.jsp"%>