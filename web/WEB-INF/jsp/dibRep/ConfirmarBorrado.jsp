<%@ include file="../Superior.jsp" %>

<div class="titulo">Eliminando Consulta</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<form name='forma' method='post' action="<c:url value='/registrarBorrado.fautapo'/>">

<table class="formulario">
  <tr>
    <th colspan="3" align="center">CONFIRME LA ELIMINACI&Oacute;N</th>
  </tr>

  <tr>
      <td class="etiqueta">Nro de Consulta</td>
      <td class="etiqueta" >::</td>
      <td><c:out value="${consulta.id_consulta}"/></td>
  </tr>

  <tr>
      <td class="etiqueta">Descripcion</td>
      <td class="etiqueta" >::</td>
      <td><c:out value="${consulta.descripcion}"/></td>
  </tr>

  <tr>
      <td class="etiqueta">Consulta</td>
      <td class="etiqueta" >::</td>
      <td><c:out value="${consulta.consulta}"/></td>
  </tr>

</table>
<center>
  <input type='submit' value='Aceptar' class="aceptar" > &nbsp;
  <input type='button' value='Cancelar' class="cancelar" OnClick='javascript:history.back()'>
</center>
<input type="hidden" name="c" value='<c:out value="${consulta.id_consulta}"/>' >

</form>

<%@ include file="../Inferior.jsp" %>