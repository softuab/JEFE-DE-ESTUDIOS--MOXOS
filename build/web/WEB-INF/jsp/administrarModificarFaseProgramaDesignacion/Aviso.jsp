<%@ include file="../Superior.jsp"%>
<script language='JavaScript' SRC="../ajax.js"></script>
<div class="titulo">Admin. Retroceder Fase Por Programa</div>
<br>
<center>
  <blink>
    <div class='cuadroAviso' >
      <div class="titulo">Aviso</div>
        <c:out value="${mensaje}"/>
      </div>
  </blink>
  <br/>
   <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/retrocederFaseDesignacionModificar/listarProgramasFacultad.fautapo"/>'>
      <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
      <input type="hidden" name="id_programa"   value="<c:out value='${id_programa}'/>">
      <input type="hidden" name="gestion"   value="<c:out value='${gestion}'/>">
      <input type="hidden" name="periodo"   value="<c:out value='${periodo}'/>">
  </form>
</center>

<%@ include file="../Inferior.jsp"%>