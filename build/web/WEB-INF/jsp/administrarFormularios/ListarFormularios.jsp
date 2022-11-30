<%@ include file="../Superior.jsp"%>

<div class="titulo"> Administraci&oacute;n de Formularios</div>
<br>
<form name="forma" method="POST">
  <div class="agregar">
    <a href="<c:url value="/nuevoFormulario.fautapo"><c:param name="accion" value="Adicionar"/></c:url>">Nuevo</a>
  </div>
</form>

  <table class="tabla">  
    <tr>
      <th> Nro </th>
      <th> AREA </th>
      <th> PROCESO </th>
      <th> FORMULARIO </th>
      <th> MODIFICAR </th>
      <th> ELIMINAR </th>
    </tr>
    <c:forEach var="lista" items="${lFormularios}" varStatus="contador">
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
      <td align="center"><c:out value="${contador.count}"/></td>
      <td><c:out value = "${lista.ubicacion_organica}"/></td>
      <td><c:out value = "${lista.proceso}"/></td>
      <form name=formanuevo<c:out value="${contador.count}"/> method=post action='<c:url value="/listarCampos.fautapo"/>'>
        <td>     
          <a class="enlace2" href="javascript:document.formanuevo<c:out value="${contador.count}"/>.submit();"><c:out value = "${lista.form}"/></a>
  	  <input type="hidden" name="id_form" value=<c:out value="${lista.id_form}"/> >
        </td>
      </form>

      <form name=formaM<c:out value="${contador.count}"/> method=post action='<c:url value="/nuevoFormulario.fautapo"/>'>
        <td>     
          <div class="modificar"><a href="javascript:document.formaM<c:out value="${contador.count}"/>.submit();">Modificar</a></div>
    	  <input type="hidden" name="id_form" value=<c:out value="${lista.id_form}"/> >
    	  <input type="hidden" name="accion" value='Modificar'>
        </td>
      </form>
       
      <form name=formaE<c:out value="${contador.count}"/> method=post action='<c:url value="/confirmarFormulario.fautapo"/>'>
        <td>     
          <div class="eliminar"><a href="javascript:document.formaE<c:out value="${contador.count}"/>.submit();"> Eliminar</a></div>
          <input type="hidden" name="id_form" value=<c:out value="${lista.id_form}"/> >
          <input type="hidden" name="accion"  value='Eliminar'>
        </td>
      </form>
    </tr>
    </c:forEach>
  </table>

<%@ include file="../Inferior.jsp"%>