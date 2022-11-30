<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
  <title>MI Wayka</title>
  <link rel="stylesheet" href="./pagina.css" type="text/css">
  <link rel="stylesheet" href="../pagina.css" type="text/css">
  <script language='JavaScript' SRC="./funciones.js"></script>
  <script language='JavaScript' SRC="../funciones.js"></script>
  <meta content="text/html; charset=iso8859-15" http-equiv="Content-Type" />
  <META HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
  <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
  <META http-equiv="expires" content="0">
  <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT">
  <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
</head>

  <frameset rows='30%,*' frameborder='no' border='0' framespacing='0'>
    <frame src='<c:url value="verEncabezadoProgramasEspecializados.fautapo?id_tramite=${id_tramite}&id_proceso=${id_proceso}&id_actividad=${id_actividad}&aplicacion=${aplicacion}"/>' name='encabezado' scrolling='NO' noresize>
    <frame src='<c:url value="${ruta}?id_tramite=${id_tramite}&id_proceso=${id_proceso}&a=${id_actividad}&t=${datosTabla.id_tabla}&f=${filtro}&p=${permiso}"/>' name='detalle' scrolling='SI' noresize>
  </frameset>

</html>