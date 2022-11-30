
<%@ include file="../../Superior.jsp" %>
<body onload='inicio(document.forma.id_persona);'>
  <div class="titulo">
  <form name=forma action="<c:url value="/magnetica/Entrada.fautapo"/>" method="POST" target="_blank">
     <input type='button' value='Siguiente' class="siguiente" onClick='forma.submit()'>
  </form>
  </div>
  
</body>
