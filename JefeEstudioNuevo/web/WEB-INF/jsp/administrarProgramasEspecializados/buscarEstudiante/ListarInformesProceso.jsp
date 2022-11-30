<%@ include file="../../Superior.jsp" %>

<body OnLoad="document.forma.submit()">
  <form name="forma" method="post" action='<c:url value="/listarInformesActividad.fautapo"/>'>
    <input type="hidden" name="id_tramite"        value='<c:out value="${datosTramite.id_tramite}"/>'>
    <input type="hidden" name="id_proceso"        value='<c:out value="${datosTramite.id_proceso}"/>'>
    <input type="hidden" name="id_actividad"      value='<c:out value="${datosTramite.id_actividad_actual}"/>'>
    <input type="hidden" name="nombre_informe"    value='<c:out value="${nombre_informe}"/>' >
    <input type="hidden" name="aplicacion"        value='<c:out value="/"/>' >
  </form>
</body>

<%@ include file="../../Inferior.jsp" %>