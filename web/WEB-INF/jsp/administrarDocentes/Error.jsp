<%@ include file="../Superior.jsp"%>
<div class="titulo">Administrar Docentes </div>
<br>
<blink>
  <center>
    <div class='cuadroError'>
      <div class="titulo">¡Error!</div>
      <c:out value="${mensaje}"/>
      <br>
      <br>
      <a class="volver" href="javascript:history.back();">Volver</a>
    </div>
  </center>
</blink>

<%@ include file="../Inferior.jsp"%>