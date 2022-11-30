<%@ include file="../../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Campos Kardex</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Campos Kardex</div>
</c:if>

<div><a class="volver" href="<c:url value="/listarCamposProcesoKardex.fautapo?id_area=${id_area}&id_proceso=${id_proceso}&id_form=${id_form}"></c:url>">Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <td class="colh">Formulario</td>
    <td><c:out value="${datosFormulario.form}"/></td>
  </tr>
</table>
<br>

<form name="adicionarcampo" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Campo <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="campo" size="100" maxlength="100" value='<c:out value="${campo}"/>'></td>            
    </tr>    
    <tr>
      <td class="etiqueta"> Dominio <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td>
        <SELECT NAME="id_dominio">
          <option value="0">-- seleccione --
            <c:forEach var="lista" items="${lDominios}">
              <option value="<c:out value="${lista.id_dominio}"/>" <c:if test="${lista.id_dominio == id_dominio}"> selected </c:if>>
                <c:out value="${lista.dominio}"/>
              </option>
            </c:forEach>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">N&uacute;mero m&aacute;ximo de <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td> 
      <td>
         <table class="tabla">
	   <tr>
	      <th align=center><font size=1>Columnas </font></th>
              <th align=center><font size=1>Filas</font></th>     
              <th align=center><font size=1>Caracteres</font></th>
	   </tr>
	   <tr>
	      <td class=colb align=center><input type="text" name="columnas" value='<c:out value="${columnas}"/>' size="3" maxlength="3" onblur='validar(columnas,"9")'></td>            
              <td class=colb align=center><input type="text" name="filas" value='<c:out value="${filas}"/>' size="3" maxlength="3" onblur='validar(filas,"9")'></td>            
              <td class=colb align=center><input type="text" name="caracteres" value='<c:out value="${caracteres}"/>' size="3" maxlength="3" onblur='validar(caracteres,"9")'></td>            
	   </tr>
	 </table>        
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Validaci&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td>
          <SELECT name="id_tipo_validacion" OnChange='javascript: document.adicionarcampo.submit()'>
   	      <option value="">-- seleccione --
                  <c:forEach var="val" items="${lTiposValidaciones}">
		    <OPTION value="<c:out value="${val.id_tipo_validacion}"/>"<c:if test="${val.id_tipo_validacion == id_tipo_validacion}">selected</c:if>>
	            <c:out value="${val.tipo_validacion}"/>
                  </c:forEach>
	  </SELECT>  
      </td>
    </tr> 
    <input type="hidden" name='id_tipo_validacion' value='<c:out value="${id_tipo_validacion}"/>'>    
    <c:if test="${id_tipo_validacion == '9' || id_tipo_validacion == 'F'}">
      <tr>
        <td class="etiqueta">Rango <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>	      
        <td><input type="text" name="rango1" value='<c:out value="${rango1}"/>' onblur='validar(rango1,"9")'> - 
	    <input type="text" name="rango2" value='<c:out value="${rango2}"/>' onblur='validar(rango2,"9")'>
        </td>	    
      </tr>            
    </c:if>
    <tr>
      <td class="etiqueta">Referencia <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td>Si<input type="radio" name="referencia" value="true" <c:if test="${referencia == 'true'}"> checked </c:if> > &nbsp;
          No <input type="radio" name="referencia" value="false" <c:if test="${referencia == 'false'}">checked</c:if> > </td>
    </tr> 
    
    <tr >
      <td class="etiqueta">Posici&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <table class="tabla">
          <tr>
            <th> <font size=1> X </font></th>
            <th> <font size=1>Y</font></th>
	  </tr>
	  <tr>
	    <td class=colb> <input type=text name="nro_fila" value='<c:out value="${nro_fila}"/>' onblur='validar(this,"9")' size="3"></td>
            <td class=colb><input type=text name="nro_columna" value='<c:out value="${nro_columna}"/>' onblur='validar(this,"9")' size="3"></td>
	  </tr>
        </table>
      </td>
    </tr>    
    <!-- Operaciones -->    
    <tr>
      <td class="etiqueta">Operaci&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td>Si<input type="radio" name="operacion" value="true" onchange="javascript:document.adicionarcampo.submit();" <c:if test="${operacion == 'true'}"> checked </c:if> > &nbsp;
          No<input type="radio" name="operacion" value="false" onchange="javascript:document.adicionarcampo.submit();"  <c:if test="${operacion == 'false'}">checked</c:if> > </td>
    </tr> 	  
    <c:if test="${operacion == 'true'}">
      <tr>
        <td class="etiqueta">F&oacute;rmula <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>	      
        <td><input type="text" name="formula" value='<c:out value="${formula}"/>' size="45"> </td>
      </tr>
    </c:if>
  </table>     
<!-- Fin Operaciones -->
  <center>
    <input type="submit" class="siguiente" value='Siguiente' onclick="document.adicionarcampo.accion1.value='Guardar';
								      document.adicionarcampo.action='<c:url value="/confirmarCampoProcesoKardex.fautapo"/>'">
  </center>
  <input type="hidden" name='accion1'    value=''>
  <input type="hidden" name='id_campo'   value='<c:out value="${id_campo}"/>'>
  <input type="hidden" name='id_form'    value='<c:out value="${id_form}"/>'>
  <input type="hidden" name='id_proceso' value='<c:out value="${id_proceso}"/>'>
  <input type="hidden" name='sw'         value='<c:out value="${sw}"/>'>
  <input type="hidden" name='accion'     value='<c:out value="${accion}"/>'>
  <input type="hidden" name='id_campo'   value='<c:out value="${datosCampo.id_campo}"/>'>
  <input type="hidden" name='recargado'  value='Si'>
</form>
<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../../Inferior.jsp"%>