<%@ include file="../Superior.jsp"%>

<div class="titulo">Administraci&oacute;n de ACLs Limbo</div>
<br>
<form name="fcrear" method="POST" action='<c:url value="/registrarAclLimbo.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta"> Proceso <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_proceso" onchange="javascript:document.fcrear.submit();">
	  <option value="">-- seleccione --
    	  <c:forEach var="lista" items="${lProcesos}">
	    <option value="<c:out value="${lista.id_proceso}"/>" <c:if test="${lista.id_proceso == id_proceso}">selected</c:if>> 
	      <c:out value="${lista.proceso}"/>
	    </option>
	  </c:forEach>
	</select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Actividades <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>	
	<select name="id_actividad" onchange="javascript:document.fcrear.submit();">
	  <option value="">-- seleccione --
    	  <c:forEach var="lista1" items="${lActividades}">
	    <option value="<c:out value="${lista1.id_actividad}"/>" <c:if test="${lista1.id_actividad == id_actividad}">selected</c:if>> 
	      <c:out value="${lista1.actividad}"/>
	    </option>
          </c:forEach>
	</select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta"> Tabla <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>	
	<select name="tabla" onchange="javascript:document.fcrear.submit();">
	  <option value="">-- seleccione --
    	  <c:forEach var="lista3" items="${lTablas}">
	    <option value="<c:out value="${lista3.tabla}"/>" <c:if test="${lista3.tabla == tabla}">selected</c:if>> 
	      <c:out value="${lista3.tabla}"/>
	    </option>
	  </c:forEach>
	</select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta"> Tipo de permisos <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="permiso" value='<c:out value="${permiso}"/>'></td>
    </tr>
    <tr>
      <td colspan=3><hr><br></td>
    </tr>
      <td colspan=3>
        <table class="formulario">
          <tr>
            <th>Campos de la Tabla</th>
            <th width="10%">&nbsp;</th>
            <th>Campos autorizados para la actividad</th>
          </tr>
	  <tr>
	    <td valign=top>
	      <table>
                <tr>
		  <th>?</th>
		  <th>Campo</th>
		</tr>
    	        <c:forEach var="campos" items="${lCampos}">    
                <tr>
    	          <td class="etiqueta2">
	            <input type="checkbox" name="campo_a" value="<c:out value="${campos.campo}"/>" >
		  </td>
    	          <td class="etiqueta2"> 
                    <c:out value="${campos.campo}"/>
	          </td>
    	        </tr>
    	        </c:forEach> 
	      </table>
	    </td>
            <td width=10%>&nbsp;</td>
	    <td valign=top>
	      <table class="formulario">
                <tr>
		  <th>?</th>
		  <th>Campo</th>
		  <th>Permiso</th>
		</tr>
    	        <c:forEach var="datos1" items="${lCamposAcl}">    
                <tr>
    	          <td class="etiqueta2">
	            <input type="checkbox" name="campo_e" value="<c:out value="${datos1.campo}"/>">
                  </td>
    	          <td class="etiqueta2">
                    <c:out value="${datos1.campo}"/>
		  </td>
    	          <td class="etiqueta2">
		    <c:out value="${datos1.permiso}"/>
	          </td>
    	        </tr>
    	        </c:forEach> 
	      </table>
	    </td>
	  </tr>
        </table>
      </td>
    </tr>
  </table>
  <center>
    <input type="submit" name='boton' class="aceptar" value='Agregar'>
    <input type="submit" name='boton' class="cancelar" value='Eliminar'>
  </center>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   

<%@ include file="../Inferior.jsp" %>
