<%@ include file="../Superior.jsp"%>

<div class="titulo"> Administraci&oacute;n de Campos</div>
<br>

<table class="tabla">
  <tr>
    <th>Formulario</th>
    <td class="colb"><c:out value="${datosFormulario.form}"/>
  </tr>
</table>
<br>

<table>
  <tr>
    <form name="forma" method="post" action='<c:url value="/nuevoCampo.fautapo"/>'>
    <td><div><a class="volver" href="<c:url value="/listarFormularios.fautapo?"></c:url>">Volver</a></div></td>
    <td><div class="agregar"><a href="javascript:document.forma.submit();" >Nuevo</a></div></td>
       <input type="hidden" name="id_form" value='<c:out value="${id_form}" />'>
       <input type="hidden" name="accion"  value='Adicionar'>
    </td>
  </form>
  <tr>
</table>

<c:if test="${id_form != null && id_form != 0}">
  <table class="tabla">  
    <tr>
      <th> Nro </th>
      <th> ID </th>
      <th> CAMPO </th>
      <th> DOMINIO </th>
      <th> COL. x FIL. </th>
      <th> MAX. </th>
      <th> REFs. </th>
      <th> VALIDACION </th>      
      <th> X, Y </th>
      <th> OPEs. </th>
      <th> FORMULA </th>    
      <th> OBLIGATORIO </th>    
      <th> MODIFICAR </th>
      <th> ELIMINAR </th>
    </tr>  
    <c:forEach var="lista" items="${lCampos}" varStatus="contador">
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
      <td align="center"><c:out value="${contador.count}"/></td>
      <td><c:out value = "${lista.id_campo}"/></td>
      <td><c:out value = "${lista.campo}"/></td>
      <td><c:out value="${lista.dominio}"/></td>
      <td align="right"><c:out value="${lista.columnas}"/> x <c:out value="${lista.filas}"/></td>
      <td align="right"><c:out value="${lista.caracteres}"/></td>
      <td align="right">
        <c:if test="${lista.referencia == 'true'}">
          Si
        </c:if>
        <c:if test="${lista.referencia == 'false'}">
          No
        </c:if>
      </td>
      <td align="right">
        <c:out value="${lista.tipo_validacion}"/>
	<c:if test="${lista.id_tipo_validacion == '9'}">
          <br><c:out value="${lista.rango1}"/> - <c:out value="${lista.rango2}"/>
	</c:if>
      </td>
      <td align="center"><c:out value="${lista.nro_fila}"/>, <c:out value="${lista.nro_columna}"/></td>
      <td align=right>
        <c:if test="${lista.operacion == 'true'}">
          Si
        </c:if>
        <c:if test="${lista.operacion == 'false'}">
          No
        </c:if>
      </td>
      <td align=right><c:out value="${lista.formula}"/></td>
      <td align=right>
        <c:if test="${lista.obligatorio == 'true'}">
          Si
        </c:if>
        <c:if test="${lista.obligatorio == 'false'}">
          No
        </c:if>
      </td>
      <form name=formaM<c:out value="${contador.count}"/> method=post action='<c:url value="/nuevoCampo.fautapo"/>'>
        <td>     
          <div class="modificar"><a href="javascript:document.formaM<c:out value="${contador.count}"/>.submit();">Modificar</a></div>
    	  <input type="hidden" name="id_campo"   value=<c:out value="${lista.id_campo}"/> >
  	  <input type="hidden" name="id_form"    value=<c:out value="${id_form}"/> >	   
	  <input type="hidden" name="sw"         value='1' >
	  <input type="hidden" name="accion"     value='Modificar' >
        </td>
      </form>
       
      <form name=formaE<c:out value="${contador.count}"/> method=post action='<c:url value="/confirmarCampo.fautapo"/>'>
        <td>     
          <div class="eliminar"><a href="javascript:document.formaE<c:out value="${contador.count}"/>.submit();"> Eliminar</a></div>
          <input type="hidden" name="id_campo"   value=<c:out value="${lista.id_campo}"/> >
          <input type="hidden" name="id_form"    value=<c:out value="${id_form}"/> >
          <input type="hidden" name="accion"     value='Eliminar' >
        </td>
      </form>
    </tr>
    </c:forEach>
  </table>
</c:if>

<%@ include file="../Inferior.jsp"%>