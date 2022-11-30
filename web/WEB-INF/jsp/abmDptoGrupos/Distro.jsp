<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<body onLoad="document.forma.submit();">
<form name="forma" method="post" action="listarGrupos.fautapo">
  <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
  <input type="hidden" name="id_prg_plan"        value="<c:out value="${id_prg_plan}"/>">
  <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
  <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
</form>  
</body>
</html>