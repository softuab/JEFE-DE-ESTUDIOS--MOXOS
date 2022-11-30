<%@ include file="../Superior.jsp"%>
<div class="titulo">Administrar Deudas</div>
<br>
<center>
<table class='cuadroAviso'>
  <tr>
    <td align="center">  
      <div class="titulo">¡Aviso!</div>
    </td>
  </tr>
  <tr>    
    <td aling="center">  
      <c:out value="${mensaje}"/>
    </td>
  </tr>
  <tr>    
    <td align="center">
      <form name="fvolver" action="<c:url value='comprobarEntrada.fautapo'/>" method="post">
        <input type="hidden" name="id_programa"    value="<c:out value='${id_programa}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
  </tr>
</table>        
</center>

<%@ include file="../Inferior.jsp"%>