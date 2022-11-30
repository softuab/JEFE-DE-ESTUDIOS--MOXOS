<%@ include file="../Superior.jsp" %>

<body OnLoad="document.forma.submit()">
  <form name="forma" method="post" action='<c:url value="/listarInformesActividad.fautapo"/>'>
    <input type="hidden" name="id_tramite"        value='<c:out value="${id_tramite}"/>'>
    <input type="hidden" name="id_proceso"        value='<c:out value="${id_proceso}"/>'>
    <input type="hidden" name="id_tipo_proceso"   value='<c:out value="${id_tipo_proceso}"/>'>    
    <input type="hidden" name="id_tipo_proceso"   value='<c:out value="${id_tipo_proceso}"/>'>
    <input type="hidden" name="id_actividad"      value='<c:out value="${id_actividad}"/>'>
    <input type="hidden" name="nro_pagina_actual" value='<c:out value="${nro_pagina_actual}"/>'>
    <input type="hidden" name="fechainicio"       value='<c:out value="${fechainicio}"/>' >
    <input type="hidden" name="fechafin"          value='<c:out value="${fechafin}"/>' >
    <input type="hidden" name="fechadellunes"     value='<c:out value="${fechadellunes}"/>' >
    <input type="hidden" name="id_estado"         value='<c:out value="${id_estado}"/>' >
    <input type="hidden" name="nombre_informe"    value='<c:out value="${nombre_informe}"/>' >
    <input type="hidden" name="aplicacion"        value='<c:out value="${aplicacion}"/>' >
  </form>
</body>

<%@ include file="../Inferior.jsp" %>