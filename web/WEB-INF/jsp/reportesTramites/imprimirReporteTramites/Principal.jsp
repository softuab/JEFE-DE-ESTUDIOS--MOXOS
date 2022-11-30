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

  <frameset rows='13%,*' frameborder='no' border='0' framespacing='0'>
    <frame src='<c:url value="verEncabezadoImpresion.fautapo?id_tramite=${id_tramite}"/>' name='encabezado' scrolling='NO' noresize>
    <frame src='<c:url value="listarTramitesImpresion.fautapo?id_tramite=${id_tramite}"/>' name='detalle' scrolling='SI' noresize>
  </frameset>

</html>