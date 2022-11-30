<%@ include file="../../Superior.jsp"%>

<div class="titulo"> Administraci&oacute;n  de Campos kardex</div>
<br>
<form name="forma" method="POST">
  <table class="tabla">
  <tr>
    <td class="colh">Nombre del Kardex</td>
    <td><c:out value="${proceso}"/></td>
  </tr>
  <tr>
    <td class="colh">Formulario del Kardex</td>
    <td><c:out value="${datosFormulario.form}"/></td>
  </tr>
  </table>
<br>  

  <c:if test="${id_form != null && id_form != 0}">
  <table>
    <tr>
    <td> 
      <div><a class="volver" href='listarProcesosKardexs.fautapo'>Volver</a></div>
    </td>
    <td> 
      <div class="agregar">
        <a href="<c:url value="/nuevoCampoProcesoKardex.fautapo">
          <c:param name="id_form" value="${id_form}"/>
	  <c:param name="id_proceso" value="${id_proceso}"/>
	  <c:param name="id_actividad" value="${id_actividad}"/>
          <c:param name="accion" value="Adicionar"/>
        </c:url>">Nuevo</a>
      </div>
     </td> 
     </tr>
   <table>    
   
  </c:if>
</form>

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
      <form name=formaM<c:out value="${contador.count}"/> method=post action='<c:url value="/nuevoCampoProcesoKardex.fautapo"/>'>
        <td>     
          <div class="modificar"><a href="javascript:document.formaM<c:out value="${contador.count}"/>.submit();">Modificar</a></div>
    	  <input type="hidden" name="id_campo"      value=<c:out value="${lista.id_campo}"/> >
  	  <input type="hidden" name="id_form"       value=<c:out value="${id_form}"/> >	   
  	  <input type="hidden" name="id_proceso"    value=<c:out value="${id_proceso}"/> >	   	  
	  <input type="hidden" name="id_actividad"  value=<c:out value="${id_actividad}"/> >	   
	  <input type="hidden" name="sw"         value='1' >
	  <input type="hidden" name="accion"     value='Modificar' >
        </td>
      </form>
       
      <form name=formaE<c:out value="${contador.count}"/> method=post action='<c:url value="/confirmarCampoProcesoKardex.fautapo"/>'>
        <td>     
          <div class="eliminar"><a href="javascript:document.formaE<c:out value="${contador.count}"/>.submit();"> Eliminar</a></div>
          <input type="hidden" name="id_campo"   value=<c:out value="${lista.id_campo}"/> >
          <input type="hidden" name="id_form"    value=<c:out value="${id_form}"/> >
	  <input type="hidden" name="id_proceso"    value=<c:out value="${id_proceso}"/> >	   	  
	  <input type="hidden" name="id_actividad"  value=<c:out value="${id_actividad}"/> >	   
          <input type="hidden" name="accion"     value='Eliminar' >
        </td>
      </form>
    </tr>
    </c:forEach>
  </table>
</c:if>

<%@ include file="../../Inferior.jsp"%>