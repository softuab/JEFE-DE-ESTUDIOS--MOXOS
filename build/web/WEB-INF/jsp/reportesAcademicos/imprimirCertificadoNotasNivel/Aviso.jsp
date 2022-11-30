<%@ include file="../../Superior.jsp"%>

<br/>
<blink>
  <center>
    <div class='cuadroAviso'>
      <div class="titulo">¡Aviso!</div>
      <c:out value="${mensaje}"/>
      <br>
      <br>
      <a class="volver" href="javascript:history.back();">Volver</a>
    </div>
  </center>
</blink>

<%@ include file="../../Inferior.jsp"%>