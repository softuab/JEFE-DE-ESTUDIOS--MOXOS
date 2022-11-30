<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Resumen Detallado de Procesos/Tr&aacute;mites </div>
<br>
<form name="formatitulo" method="POST" action='<c:url value="listarCamposReferenciaProceso.fautapo"/>'>
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Gesti&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="gestion" value="<c:out value="${gestion}"/>" onblur='validar(this,"9")' size="10"></td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de proceso <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_proceso">
	  <option value="0">-- Seleccionar --</option>
          <c:forEach var="lista" items="${lProcesos}" >
	    <option value="<c:out value="${lista.id_proceso}"/>"<c:if test="${lista.id_proceso == id_proceso}">selected</c:if>>
	      <c:out value="${lista.proceso}"/>
            </option>
	  </c:forEach>
	</select>  
      </td>
    </tr>
    <tr>
      <td colspan="3" align="center"><input type="submit" class="buscar" value="Buscar"></td>
    </tr>
  </table>
</form>
<br>

<c:if test="${!empty lDatos}">
  <form name="forma" id="forma" method='post' action='<c:url value="listarCamposReferenciaProceso.fautapo"/>'>
    <input type="hidden" name="nro_pagina"  value="1" />
    <input type="hidden" name="_botoncillo" value="" />
    <input type="hidden" name="id_proceso"  value='<c:out value="${id_proceso}"/>' >
    <input type="hidden" name="gestion"     value='<c:out value="${gestion}"/>' >
    <table width="100%" class="formulario">
      <tr>
        <td width="50%">
        </td>
        <td width="50%" align="right">
          <table border="0" align="right">
            <tr>
              <td>
                <c:if test='${nro_pagina > 1}'>
                  <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='principio'; document.forma.nro_pagina.value='1';">&laquo; Principio</a>&nbsp;
                  <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='anterior'; document.forma.nro_pagina.value='<c:out value="${nro_pagina - 1}"/>';">&lsaquo; Anterior</a>
                </c:if>
                <b><c:out value="${(paginacion * (nro_pagina - 1)) + 1}"/></b> - <b><c:out value="${(paginacion * (nro_pagina - 1)) + fn:length(lDatos) -1}"/></b> de <b><c:out value="${totalRegistros}"/></b>
                <c:if test='${(nro_pagina+0) < totalPaginas}'>
                  <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='siguiente'; document.forma.nro_pagina.value='<c:out value="${nro_pagina + 1}"/>';">Siguiente &rsaquo;</a>&nbsp;
                  <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='final'; document.forma.nro_pagina.value='<c:out value="${totalPaginas}"/>';">Final &raquo;</a>
                </c:if>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </form>
  <br>

  <table class="tabla">
    <c:forEach var="datos" items="${lDatos}" varStatus="contador">
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
      <c:if test="${contador.count == 1}">
        <th>VER DATOS</th>
      </c:if>
      <c:if test="${contador.count != 1}">
        <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/buscarTramiteReferencia.fautapo"/>' >
           <input type="hidden" name="id_tramite" value='<c:out value="${datos.id_campo}"/>' >
           <input type="hidden" name="aplicacion" value='<c:url value="/"/>' >
           <td><div class="agregar"><a href='javascript: document.forma<c:out value="${contador.count}"/>.submit();'> Ver Datos </a></div></td>
        </form>
      </c:if>
      <c:forEach var="var" items="${datos.lista}" varStatus="contador1">
        <c:if test="${(contador.count == 1) && (contador1.count == 1)}">
          <th>#</th>
        </c:if>
        <c:if test="${(contador.count == 1) && (contador1.count != 1)}">
          <th><c:out value="${var.valor}"/></th>
        </c:if>
        <c:if test="${contador.count != 1}">
          <td><c:out value="${var.valor}" escapeXml="False"/></td>
        </c:if>
      </c:forEach>
      </tr>
    </c:forEach>
  </table>
</c:if>

<%@ include file="../../Inferior.jsp" %>