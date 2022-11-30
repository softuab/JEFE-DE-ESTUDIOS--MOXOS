<%@ include file="../../Superior.jsp"%>

<div class="titulo">  Administraci&oacute;n de Kardex</div>
<br>

<table>
  <tr>
  <form name="forma" method="post" action='<c:url value="/nuevoProcesoKardex.fautapo"/>'>
    <td colspan="2">
      <div class="agregar">
       <a href="javascript:document.forma.submit();" >Nuevo</a>
       <input type="hidden" name="accion" value='Adicionar'>
       <input type="hidden" name="id_tipo_proceso" value=<c:out value="${id_tipo_proceso}"/> >
      </div>
    </td>
  </form>
  <tr>
</table> 

<table class="tabla"> 
  <tr>
    <th> Nro </th>
    <th>PROCESO KARDEX</th>
    <th>FORMULARIO KARDEX</th>
    <th>CREAR CAMPOS</th>
    <th>ASIGNAR PERMISOS</th>
    <th>MODIFICAR</th>
    <th>ELIMINAR</th>
  </tr>
  <c:forEach var="lista1" items="${lProcesosKardexs}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
     <td align=center><c:out value="${contador.count}"/></td> 
     <td><c:out value="${lista1.proceso}"/></td>
     <td><c:out value = "${lista1.form}"/></td>
     <form name=formacampos<c:out value="${contador.count}"/> method=post action='<c:url value="/listarCamposProcesoKardex.fautapo"/>'>
       <td>     
          <a class="enlace2" href="javascript:document.formacampos<c:out value="${contador.count}"/>.submit();">Crear Campos</a>
  	  <input type="hidden" name="id_proceso"      value=<c:out value="${lista1.id_proceso}"/> >
	  <input type="hidden" name="id_form"         value=<c:out value="${lista1.id_form}"/> >
	  <input type="hidden" name="id_actividad"    value=<c:out value="${lista1.id_actividad}"/> >
	  <input type="hidden" name="id_tipo_proceso" value=<c:out value="${lista1.id_tipo_proceso}"/> >
       </td>
     </form>
     <form name=formaAcls<c:out value="${contador.count}"/> method=post action='<c:url value="/registrarAclKardex.fautapo"/>'>
      <td>     
          <a class="enlace2" href="javascript:document.formaAcls<c:out value="${contador.count}"/>.submit();">Asignar Permisos </a>
  	  <input type="hidden" name="id_proceso"      value=<c:out value="${lista1.id_proceso}"/> >
	  <input type="hidden" name="id_form"         value=<c:out value="${lista1.id_form}"/> >
	  <input type="hidden" name="id_actividad"    value=<c:out value="${lista1.id_actividad}"/> >
	  <input type="hidden" name="id_tipo_proceso" value=<c:out value="${lista1.id_tipo_proceso}"/> >
	  
       </td>
     </form>
     
     
     <form name=formamodificar<c:out value="${contador.count}"/> method=post action='<c:url value="/nuevoProcesoKardex.fautapo"/>'>
      <td>
        <div class="modificar"><a href="javascript:document.formamodificar<c:out value="${contador.count}"/>.submit();">Modificar</a></div>
	<input type="hidden" name="id_proceso"      value=<c:out value="${lista1.id_proceso}"/> >
	<input type="hidden" name="id_form"         value=<c:out value="${lista1.id_form}"/> >
	<input type="hidden" name="id_actividad"    value=<c:out value="${lista1.id_actividad}"/> >
	<input type="hidden" name="id_tipo_proceso" value=<c:out value="${lista1.id_tipo_proceso}"/> >
	<input type="hidden" name="accion"     value='Modificar' >
	<input type="hidden" name="sw"         value='0' >
     </td>
     </form>
     <form name=formaeliminar<c:out value="${contador.count}"/> method=post action='<c:url value="/confirmarProcesoKardex.fautapo"/>'>
       <td>     
         <div class="eliminar"><a href="javascript:document.formaeliminar<c:out value="${contador.count}"/>.submit();"> Eliminar</a></div>
	 <input type="hidden" name="id_proceso"      value=<c:out value="${lista1.id_proceso}"/> >
	 <input type="hidden" name="id_form"         value=<c:out value="${lista1.id_form}"/> >
	 <input type="hidden" name="id_actividad"    value=<c:out value="${lista1.id_actividad}"/> >
	 <input type="hidden" name="id_tipo_proceso" value=<c:out value="${lista1.id_tipo_proceso}"/> >
         <input type="hidden" name="accion"     value='Eliminar' >
       </td>
     </form>
   <tr>	   
   </c:forEach>
</table>

<%@ include file="../../Inferior.jsp"%>