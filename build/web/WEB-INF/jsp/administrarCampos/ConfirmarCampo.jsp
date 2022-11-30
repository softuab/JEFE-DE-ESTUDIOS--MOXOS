<%@ include file="../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Campos</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Campos</div>
</c:if>
<c:if test="${accion == 'Eliminar'}">
  <div class="titulo"> Eliminando Campos</div>
</c:if>

<div><a class="volver" href="<c:url value="/listarCampos.fautapo?id_area=${id_area}&id_form=${id_form}"></c:url>">Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <td class="colh">Formulario</td>
    <td><c:out value="${datosFormulario.form}"/></td>
  </tr>
</table>
<br>

<form name="adicionarform" method="POST" action='<c:url value="/registrarCampo.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta"> Campo </td>
      <td class="etiqueta">::
      <td><c:out value="${datosCampo.campo}"/></td>
    </tr>        
    <tr>
      <td class="etiqueta"> Dominio </td>
      <td class="etiqueta" >::
      <td><c:out value="${datosDominio.dominio}"/></td>
    </tr>  
    <tr>
      <td class="etiqueta">N&uacute;mero m&aacute;ximo de</td>
      <td class="etiqueta">::</td> 
      <td>
        <table class="tabla">
          <tr>
            <th><font size=1>Columnas </font></th>
            <th><font size=1>Filas</font></th>     
            <th><font size=1>Caracteres</font></th>
          </tr>
          <tr>
            <td><c:out value="${datosCampo.columnas}"/></td>            
            <td><c:out value="${datosCampo.filas}"/></td>            
            <td><c:out value="${datosCampo.caracteres}"/></td>            
          </tr>
        </table>        
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Validaci&oacute;n</td>
      <td class="etiqueta">::</td>	      
      <td><c:out value="${datosTipoValidacion.tipo_validacion}"/></td>
    </tr> 
    <c:if test="${id_tipo_validacion == '9' || id_tipo_validacion == 'F'}">
      <tr>
        <td class="etiqueta">Rango</td>
        <td class="etiqueta">::</td>	      
        <td><c:out value="${datosCampo.rango1}"/> - <c:out value="${datosCampo.rango2}"/></td>
      </tr>            
    </c:if>
    <tr>
      <td class="etiqueta">Referencia</td>
      <td class="etiqueta">::</td>	      
      <td>
      <c:if test="${referencia == 'true'}">
        Si
      </c:if>  
      <c:if test="${referencia == 'false'}">
        No
      </c:if>  
    </tr> 
    <tr>
      <td class="etiqueta">Posici&oacute;n</td>
      <td class="etiqueta">::</td>
      <td>
        <table class="tabla">
          <tr>
            <th><font size=1> X </font></th>
            <th><font size=1> Y </font></th>
 	  </tr>
	  <tr>
	    <td><c:out value="${datosCampo.nro_fila}"/></td>
            <td><c:out value="${datosCampo.nro_columna}"/></td>
	  </tr>
        </table>
      </td>
    </tr>
    
    <!-- Operaciones -->    
    <tr>
      <td class="etiqueta">Operaci&oacute;n</td>
      <td class="etiqueta">::</td>	      
      <td>
      <c:if test="${operacion == 'true'}">
        Si
      </c:if>  
      <c:if test="${operacion == 'false'}">
        No
      </c:if>  
    </tr> 
    <c:if test="${operacion == 'true'}">
    <tr>
      <td class="etiqueta">F&oacute;rmula</td>
      <td class="etiqueta">::</td>	      
      <td><c:out value="${datosCampo.formula}"/></td>
    </tr>
    </c:if> 
    <!-- Fin Operaciones -->
    <tr>
      <td class="etiqueta">Obligatorio</td>
      <td class="etiqueta">::</td>	      
      <td>
      <c:if test="${obligatorio == 'true'}">
        Si
      </c:if>  
      <c:if test="${obligatorio == 'false'}">
        No
      </c:if>  
    </tr> 
  </table>
  <center>
    <input type=submit name='accion1' class="aceptar" value='Aceptar'>
  </center>  
  <input type="hidden" name='id_form'            value='<c:out value="${id_form}"/>'>        
  <input type="hidden" name='id_proceso'         value='<c:out value="${id_proceso}"/>'>        
  <input type="hidden" name='id_dominio'         value='<c:out value="${datosDominio.id_dominio}"/>'>
  <input type="hidden" name='id_tipo_validacion' value='<c:out value="${id_tipo_validacion}"/>'>
  <input type="hidden" name='id_campo'           value='<c:out value="${id_campo}"/>'>
  <input type="hidden" name='campo'              value='<c:out value="${datosCampo.campo}"/>'>
  <input type="hidden" name='columnas'           value='<c:out value="${datosCampo.columnas}"/>'>
  <input type="hidden" name='filas'              value='<c:out value="${datosCampo.filas}"/>'>
  <input type="hidden" name='caracteres'         value='<c:out value="${datosCampo.caracteres}"/>'>
  <input type="hidden" name='rango1'             value='<c:out value="${datosCampo.rango1}"/>'>
  <input type="hidden" name='rango2'             value='<c:out value="${datosCampo.rango2}"/>'>
  <input type="hidden" name='referencia'         value='<c:out value="${referencia}"/>'>
  <input type="hidden" name='operacion'          value='<c:out value="${operacion}"/>'>
  <input type="hidden" name='nro_fila'           value='<c:out value="${datosCampo.nro_fila}"/>'>
  <input type="hidden" name='nro_columna'        value='<c:out value="${datosCampo.nro_columna}"/>'>
  <input type="hidden" name='formula'            value='<c:out value="${datosCampo.formula}"/>'>
  <input type="hidden" name='accion'             value='<c:out value="${accion}"/>'>
  <input type="hidden" name='obligatorio'        value='<c:out value="${obligatorio}"/>'>
</form>

<%@ include file="../Inferior.jsp"%>