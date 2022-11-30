<%@ include file="../../Superior.jsp" %>

<form method="post" action="listarTramitesImpresionPDF.fautapo">
<input type="hidden" name="id_tramite" value="<c:out value="${id_tramite}"/>">

<table width="100%" cellspacing="0" cellpadding="0">
  <tr class="colb">
    <td width="20%">
      <table>
        <tr>
          <td>
            <div><a class="volver" href="<c:url value="/buscarTramiteImpresion.fautapo"></c:url>" target="cuerpo"> Volver</a></div>
          </td>
        </tr>
      </table>
    </td>
    <td width="20%">&nbsp;</td>
    <td width="60%"><input type="submit" name="imprimir" value="Ver PDF"></td>
  </tr>
</table>
</form>

<%@ include file="../../Inferior.jsp" %>