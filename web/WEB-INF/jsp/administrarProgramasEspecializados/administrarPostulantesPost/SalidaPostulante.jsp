<%@ include file="../../Superior.jsp"%>
<script language='JavaScript' SRC="../ajax.js"></script>
<c:if test="${empty titulo}">
<div class="titulo">Registrar  Postulantes</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>
<br/>
<center>
  <blink>
    <div class='cuadroAviso' >
      <div class="titulo">Aviso</div>
        <c:out value="${mensaje}"/>
      </div>
  </blink>
  <br/>
  <form method='post' action="<c:url value='/listarMisPendientes.fautapo'/>">
    <input type="hidden" name="aplicacion" value="/" >
    <input type='submit' value='Aceptar' class="aceptar">
  </form>
</center>

<%@ include file="../../Inferior.jsp"%>