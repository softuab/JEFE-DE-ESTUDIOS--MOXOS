<%@ include file="../../Superior.jsp"%>
<script language='JavaScript' SRC="../ajax.js"></script>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<br/>
<center>
  <div class='cuadroAviso' >
   <div class="titulo">Aviso</div>
     <blink> <c:out value="${mensaje}"/> </blink>
   </div>
<br/>
  <form method='post' action="<c:url value='/listarMisPendientes.fautapo'/>">
    <input type="hidden" name="aplicacion" value="/" >
    <input type='submit' value='Aceptar' class="aceptar">
  </form>
</center>

<%@ include file="../../Inferior.jsp"%>