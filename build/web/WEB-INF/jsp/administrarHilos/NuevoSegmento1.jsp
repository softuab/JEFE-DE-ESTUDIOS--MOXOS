<%@ include file="../Superior.jsp"%>

<body OnLoad="document.forma.submit()">

<form name="forma" method="post" action='<c:url value="/listarSegmentos.fautapo"/>'>
  <input type="hidden" name="id_hilo"    value='<c:out value="${id_hilo}"/>'>
  <input type="hidden" name="asunto"     value='<c:out value="${asunto}"/>'>
  <input type="hidden" name="aplicacion" value='<c:out value="${aplicacion}"/>'>
</form>

</body>

<%@ include file="../Inferior.jsp"%>
