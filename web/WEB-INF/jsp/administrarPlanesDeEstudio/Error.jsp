<%@ include file="../Superior.jsp"%>

<br/>
<blink>
  <center>
    <div class='cuadroError'>
      <div class="titulo">¡Error!</div>
      <c:out value="${mensaje}"/>
      <br><br>
      <form name="fvolver" method="POST" action='<c:url value="/listarPlanesDeEstudio.fautapo"/>' >
        <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
        <input type="hidden" name="id_prg_plan" value="<c:out value="${datosPrgPlan.id_prg_plan}"/>">
        <div><a class="volver" href='javascript: document.fvolver.submit();' > Volver </a></div>
      </form>
    </div>
  </center>
</blink>

<%@ include file="../Inferior.jsp"%>