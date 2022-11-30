<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Redireccionar Kardex </div>
<br>

<form name="forma" method="POST" action='<c:url value="/redireccionarKardex.fautapo"/>' >
<table>
  <tr>
    <td valign="top">
    <table class="formulario" valign="top">
      <tr>
        <th colspan="3">ESTADO ACTUAL</th>
      </tr>
      <tr>
        <td class="etiqueta">Proceso Kardex <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>	      
        <td>
        <select name="id_proceso" OnChange='javascript: document.forma.submit()'>
	  <option value="">-- seleccionar --</option>
            <c:forEach var="lista" items="${lProcesos}" >
	      <OPTION value="<c:out value="${lista.id_proceso}"/>"<c:if test="${lista.id_proceso == id_proceso}">selected</c:if>>
	      <c:out value="${lista.proceso}"/>
            </c:forEach>
	</select>  
        </td>
      </tr>
      <tr> 
        <td class="etiqueta">Estado <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
        <select name="id_actividad">
          <option value="">-- seleccione --
          <c:forEach var="lista" items="${lActividades}" >
            <option value="<c:out value="${lista.id_actividad}"/>" <c:if test="${lista.id_actividad == id_actividad}">selected </c:if>>
	      <c:out value="${lista.actividad}"/>
	    </option>
          </c:forEach>
        </select>
        </td>
      </tr>
      <tr>  
        <td colspan="3" align="center"><input class="buscar" type="submit" name="boton" value="Buscar"></td>
      </tr>
    </table>
    <br> 
    <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>
    </td>

  <c:if test="${sw=='1'}">
    <td valign="top">
    <table class="formulario" valign="top">
      <tr>
        <th colspan="3">ESTADO DESTINO</th>
      </tr>
      <tr> 
        <td class="etiqueta">Estado Destino <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
        <select name="id_actividad_excep"  OnChange='javascript: document.forma.submit()'>
          <option value="">-- seleccione --</option>
          <c:forEach var="lista" items="${lActividadesExcep}">
            <option value="<c:out value="${lista.id_actividad}"/>" <c:if test="${lista.id_actividad == id_actividad_excep}">selected </c:if>>
	      <c:out value="${lista.actividad}"/>
	    </option>
          </c:forEach>
        </select>
        </td>
      </tr>  
      <tr> 
        <td class="etiqueta">Usuarios <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
        <select name="id_usuario" >
          <option value="">-- seleccione --</option>
          <c:forEach var="lista" items="${lUsuariosActividad}">
            <option value="<c:out value="${lista.id_usuario}"/>" <c:if test="${lista.id_usuario == id_usuario}">selected </c:if>>
  	      <c:out value="${lista.nombres}"/>
	    </option>
          </c:forEach>
        </select>
        </td>
      </tr>  
      <tr>
        <td class="etiqueta">Todos(?) <font color='red'>(*)</font>  </td>
        <td class="etiqueta">::</td>
        <td>Si<input type="radio" name="todo" value="true" <c:if test="${todo == 'true'}"  > checked </c:if>  OnChange='javascript: document.forma.submit()'> &nbsp;
            No <input type="radio" name="todo" value="false" <c:if test="${todo == 'false'}" >checked</c:if>  OnChange='javascript: document.forma.submit()'> </td>
      </tr>
      <input type="hidden" name="boton" value="<c:out value="${boton}"/>">
      <tr>  
        <td colspan="3" align="center"><input class="aceptar" type="submit" name="boton1" value="Redireccionar"></td>
      </tr>
    </table>    
    </td>
  </tr>
  <tr>
    <td colspan="2">
    <table class="tabla" width="100%">
      <tr>
        <th colspan="8">RESULTADO DE LA B&Uacute;SQUEDA</th>
      </tr>
      <tr>
        <c:if test="${todo=='false'}">   
          <th>?</th>
	</c:if>   
        <th>#</th>
	<th>PROCESO</th>
	<th>REFERENCIAS</th>
	<th>REGISTRO</th>
	<th>USUARIO</th>
      </tr>
      <c:forEach var="lista" items="${lTramites}" varStatus="contador">
        <!-- ********** Esto es para el efecto ************ -->
          <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
        <!-- ********** Fin  efecto ************ -->
	<c:if test="${todo=='false'}">   
          <td><input type="checkbox" name="id_tramite" value='<c:out value="${lista.id_tramite}"/>'</td> 
	</c:if>
	<td align="center"><c:out value="${lista.id_tramite}"/></td>
        <td><img width='25' height='25' src='./imagenes/procesos/kardex.jpeg' border="0"> 
	    <b><c:out value="${lista.actividad}"/></b><br>
            <i><c:out value="${lista.proceso}"/></i>
        </td>
        <td><c:forEach var="referencias" items="${lista.lista}" >
	      <b><c:out value="${referencias.campo}"/>   :  </b><c:out value="${referencias.valor}"/><br>
	    </c:forEach>
        </td>
        <td><fmt:formatDate value="${lista.fec_registro}" pattern='dd-MM-yyyy HH:mm'/></td>
  	<td><c:out value="${lista.usuario}"/><br>Cargo:<c:out value="${lista.cargo}"/></td>
	<input type="hidden" name="id_proceso" value="<c:out value="${lista.id_proceso}"/>">
      </tr>
      </c:forEach>
    </table>
    </td>
  </c:if>
  </tr>
</table>
   <input type="hidden" name="sw" value="<c:out value="${sw}"/>">
</form>

<%@ include file="../../Inferior.jsp" %>