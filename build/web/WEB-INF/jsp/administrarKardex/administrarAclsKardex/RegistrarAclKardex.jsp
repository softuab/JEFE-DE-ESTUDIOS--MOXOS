<%@ include file="../../Superior.jsp"%>

<div class="titulo">Administraci&oacute;n de ACLs Kardex</div>
<br>
<table class="tabla">
  <tr>
    <td class="colh">Nombre del Kardex</td>
    <td><c:out value="${proceso}"/></td>
  </tr>
  <tr>
    <td class="colh">Formulario del Kardex</td>
    <td><c:out value="${datosFormulario1.form}"/></td>
  </tr>
</table>
<br>

<div><a class="volver" href='listarProcesosKardexs.fautapo'>Volver</a></div>
<form name="fcrear" method="POST" action='<c:url value="/registrarAclKardex.fautapo"/>' >
  <input type="hidden" name="id_proceso" value="<c:out value="${id_proceso}"/>" />
  <input type="hidden" name="id_form" value="<c:out value="${id_form}"/>" />
  <table class="formulario" width="80%">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Estados <font color='red'>(*)</font> </td>
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
      <td class="etiqueta"> Tipo de permisos <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>	
	<select name="id_tipo_permiso">
	  <option value="">-- seleccione --
    	  <c:forEach var="lista2" items="${lTiposPermisos}">
	    <option value="<c:out value="${lista2.id_tipo_permiso}"/>" <c:if test="${lista2.id_tipo_permiso == id_tipo_permiso}">selected</c:if>> 
	      <c:out value="${lista2.tipo_permiso}"/>
	    </option>
	  </c:forEach>
	</select>
      </td>
    </tr>
    <tr>
      <td colspan=3><hr><br></td>
    </tr>
      <td colspan=3>
        <table class="formulario">
          <tr>
            <th>Campos del Formulario</th>
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
	            <input type="checkbox" name="id_campo_a" value="<c:out value="${campos.id_campo}"/>" >
		  </td>
    	          <td class="etiqueta2"> 
                    <c:out value="${campos.campo}"/>
	          </td>
    	        </tr>
    	        </c:forEach> 
	      </table>
	    </td>
            <td width="10%" valing="middle" align="center">
              <input type="submit" name='boton' class="adelante" value="Agregar" onClick='javascript:document.forma.boton.value="Agregar"'>
              <input type="submit" name='boton' class="atras" value="Eliminar" onClick='javascript:document.forma.boton.value="Eliminar"'>
	    </td>
	    <td valign="top">
	      <table class="formulario">
                <tr>
		  <th>?</th>
		  <th>Campo</th>
		  <th>Permiso</th>
		</tr>
    	        <c:forEach var="datos1" items="${lCamposAcl}">    
                <tr>
    	          <td class="etiqueta2">
	            <input type="checkbox" name="id_campo_e" value="<c:out value="${datos1.id_campo}"/>">
                  </td>
    	          <td class="etiqueta2">
                    <c:out value="${datos1.campo}"/>
		  </td>
    	          <td class="etiqueta2">
		    <c:out value="${datos1.tipo_permiso}"/>
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
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   

<%@ include file="../../Inferior.jsp" %>
