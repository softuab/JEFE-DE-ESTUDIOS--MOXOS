<%@ include file="../Superior.jsp" %>
<div class="titulo">Administrar Curriculum Docente</div>
<br/>
<br/>
<blink>
  <center>
    <div class='cuadroAviso' >
      <H3>Aviso!</H3>
      <font><c:out value="${mensaje}"/></font>
    </div>

<form action="cvListarCurriculum.fautapo" method=post name=forma>
  <input type = "hidden" name = "id_persona" value = "<c:out value = "${id_persona}"/>">
  <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
<input type=submit value="Volver" class = "volver">
</form>
  </center>
</blink>

