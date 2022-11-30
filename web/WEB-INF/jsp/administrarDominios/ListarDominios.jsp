<%@ include file="../Superior.jsp"%>

<div class="titulo">  Administraci&oacute;n de dominios</div>
<br>

<table>
  <tr>
  <form name="forma" method="post" action='<c:url value="/nuevoDominio.fautapo"/>'>
    <td colspan="2">
      <div class="agregar">
       <a href="javascript:document.forma.submit();" >Nuevo</a>
       <input type="hidden" name="accion" value='Adicionar'>
      </div>
    </td>
  </form>
  <tr>
</table> 

<table class="tabla"> 
  <tr>
    <th> Nro </th>
    <th>AREA</th>
    <th>DOMINIO</th>
    <th>PADRE</th>
    <th>PRIVADO</th>
    <th>TIPO</th>
    <th>FORMULARIO</th>
    <th>CAMPO (F)</th>
    <th>TABLA</th>
    <th>PRIMARIO (T)</th>
    <th>CAMPO (T)</th>
    <th>MODIFICAR</th>
    <th>ELIMINAR</th>
  </tr>
  <c:forEach var="lista1" items="${lDominios}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
     <td align=center><c:out value="${contador.count}"/></td> 
     <td><c:out value="${lista1.ubicacion_organica}"/></td>
     <c:if test="${lista1.id_tipo_dominio == 1}">
       <form name=formanuevo<c:out value="${contador.count}"/> method=post action='<c:url value="/listarTuplas.fautapo"/>'>
        <td>     
          <a class="enlace2" href="javascript:document.formanuevo<c:out value="${contador.count}"/>.submit();"><c:out value = "${lista1.dominio}"/></a>
  	  <input type="hidden" name="id_dominio" value=<c:out value="${lista1.id_dominio}"/> >
	  <input type="hidden" name="accion" value='Modificar' >
       </td>
       </form>
     </c:if>
     <c:if test="${lista1.id_tipo_dominio != 1}">
       <td><c:out value = "${lista1.dominio}"/></td>
     </c:if>
     <td><c:out value = "${lista1.dominio_padre}"/></td>
     <td align="center"> <c:if test="${lista1.privado == 'true'}"> SI </c:if>
	                <c:if test="${lista1.privado == 'false'}"> NO </c:if>
     <td><c:out value = "${lista1.tipo_dominio}"/></td>
     <td><c:out value = "${lista1.form}"/></td>
     <td><c:out value = "${lista1.campo}"/></td>
     <td><c:out value = "${lista1.tabla}"/></td>
     <td><c:out value = "${lista1.primario}"/></td>
     <td><c:out value = "${lista1.campos}"/></td>
     <form name=formamodificar<c:out value="${contador.count}"/> method=post action='<c:url value="/nuevoDominio.fautapo"/>'>
      <td>
        <div class="modificar"><a href="javascript:document.formamodificar<c:out value="${contador.count}"/>.submit();">Modificar</a></div>
	<input type="hidden" name="id_dominio" value=<c:out value="${lista1.id_dominio}"/> >
	<input type="hidden" name="accion"     value='Modificar' >
	<input type="hidden" name="sw"         value='0' >
     </td>
     </form>
     <form name=formaeliminar<c:out value="${contador.count}"/> method=post action='<c:url value="/confirmarDominio.fautapo"/>'>
       <td>     
         <div class="eliminar"><a href="javascript:document.formaeliminar<c:out value="${contador.count}"/>.submit();"> Eliminar</a></div>
         <input type="hidden" name="id_dominio" value=<c:out value="${lista1.id_dominio}"/> >
         <input type="hidden" name="accion"     value='Eliminar' >
       </td>
     </form>
   <tr>	   
   </c:forEach>
</table>

<%@ include file="../Inferior.jsp"%>