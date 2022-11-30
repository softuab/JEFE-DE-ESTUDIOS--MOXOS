<%@ include file="../../Superior.jsp"%>

<br/>
<blink>
  <center>
    <div class='cuadroError'>
      <div class="titulo">¡Error!</div>
      <c:out value="${mensaje}"/>
      <br>
      <br>
      <form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito' >
        <a class="volver" href="javascript:document.fvolver.submit();">Volver</a>
      </form>
    </div>
  </center>
</blink>

<%@ include file="../../Inferior.jsp"%>