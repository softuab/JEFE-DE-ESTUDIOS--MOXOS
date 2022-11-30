<%@ include file="../Superior.jsp" %>

<body onload='inicio(document.forma.clave)'>

<div class="titulo"><c:out value="${tabla.etiqueta}" /></div>

<br>
<form action='<c:url value="/dibRapFiltrado/listarDatos.fautapo"/>' method="post">
<input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
<input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
<input type="hidden" name="p" value="<c:out value='${permiso}' />">
<input type="hidden" name="f" value="<c:out value='${condicion}' />">
<input type="hidden" name="a" value="<c:out value='${id_actividad}' />">

<table class="formulario" >
  <tr>
    <th colspan=3 align="center">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta">Usuario</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${cliente.nombres}" /></td>
  </tr>
  <tr>
    <td class="etiqueta">Gesti&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="gestion" value='<c:out value="${cliente.gestion}" />' onblur='validar(gestion,"9")' size=4 maxlength=4></td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo</td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="periodo" value='<c:out value="${cliente.periodo}" />' onblur='validar(periodo,"9")' size=1 maxlength=1> </td>
  </tr>
  <tr>
    <td class="etiqueta" align="right">Clave</td>
    <td class="etiqueta">::</td>
    <td><input type="password" name="clave"></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><input type="submit" value="Buscar" class="siguiente"></td>
  </tr>
</table>

</form>

<%@ include file="../Inferior.jsp" %>