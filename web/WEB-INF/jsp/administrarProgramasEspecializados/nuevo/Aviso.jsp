<%@ include file="../../Superior.jsp"%>

<br/>
<center>

<blink>
  <div class='cuadroAviso' >
    <div class="titulo">Aviso</div>
    <c:out value="${mensaje}"/>
  </div>
</blink>
    <br/>
    <form method='post' action="<c:url value='/listarMisPendientes.fautapo'/>">
      <input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
      <input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
      <input type="hidden" name="p" value="<c:out value='${permiso}' />">
      <input type="hidden" name="f" value="<c:out value='${condicion}' />">
      <input type="hidden" name="a" value="<c:out value='${id_actividad}' />">
      <input type="hidden" name="aplicacion" value="/" >
      <input type='submit' value='Aceptar' class="aceptar">
    </form>

</center>

<%@ include file="../../Inferior.jsp"%>