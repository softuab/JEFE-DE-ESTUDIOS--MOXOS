<%@ include file="../../Superior.jsp"%>

<br/>
<blink>
  <center>
    <div class='cuadroError'>
      <div class="titulo">?Error!</div>
      <c:out value="${mensaje}"/>
      <br>
      <br>
      <form name=fvolver method=post action='entrada.fautapo'>
        <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a>
      </form>
    </div>
  </center>
</blink>

<%@ include file="../../Inferior.jsp"%>