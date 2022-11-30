<%@ include file="../Superior.jsp"%>

<br/>
<blink>
  <center>
    <div class='cuadroError'>
      <div class="titulo">¡Aviso!</div>
      <c:out value="${mensaje}"  escapeXml="false" />
      <br>
      <br>
      <a class="volver" href="javascript:history.back();">Volver</a>
    </div>
  </center>
</blink>

<%@ include file="../Inferior.jsp"%>