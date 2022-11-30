<%@ include file="../../Superior.jsp" %>

<div class="titulo">Cambio Clave (PIN) Estudiante - Autoridad </div>
<br>
<tabla>
  <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="comprobarEntrada.fautapo"/>'>
    <td>
      <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
      <input type="hidden" name="id_estudiante"     value='<c:out value="${id_estudiante}"/>'>
      <input type="hidden" name="dip"               value='<c:out value="${dip}"/>'>
      <input type="hidden" name="nombres"           value='<c:out value="${nombres}"/>'>
      <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>"/> 
      <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>"/> 
    </td>
  </form>
</table>
<table class="tabla">
  <tr>
    <td class="etiqueta">Usuario</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${usuario}"/></td>
  </tr>
</table>
<form action="<c:url value="registrarNuevoPin.fautapo"/>" method="POST">
<table class="formulario">
  <tr>
    <th colspan="2">ATENCION</th>
  </tr>
  <tr>
    <td valign="top">
      <table class="formulario">
        <tr>
           <td class="colh">Recomendaciones:</td>
        </tr>
        <tr>
           <td class="colb"> <b>* Digite un m&aacute;ximo de 10 caracteres y un m&iacute;nimo de 6.</b></td>
        </tr>
        <tr>
           <td class="colb"> <b>* Utilize caracteres validos [A-Z],[a-z] y [1-9].</b></td>
        </tr>
        <tr>
           <td class="colb"> <b> * No utilize palabras del diccionario ni nombres propios.</b></td>
        </tr>
        <tr>
           <td class="colb"> <b> * Invente una palabra que pueda recordar.</b></td>
        </tr>
         <tr>
           <td class="colb"> <b> * Componga palabras e inserte números.</b></td>
        </tr>
      </table>
    </td>
    <td valing="top">
      <table class="formulario">
        <tr>
          <th colspan="6" align=center colspan=3>Introducir datos</th>
        </tr>
	<tr>    
          <td colspan="2" class="etiqueta" align=right>Gesti&oacute;n Acad&eacute;mica</td>
          <td colspan="2" class="etiqueta">::</td>
          <td colspan="2"><c:out value="${datosMatricula.periodo}"/><b>/</b><c:out value="${datosMatricula.gestion}"/></td>
        </tr>
        <tr>
          <td colspan="2" class="etiqueta">Estudiante</td>
          <td colspan="2" class="etiqueta">::</td>
          <td colspan="2"><c:out value="${datosEstudiante.nombres}"/>&nbsp;<c:out value="${datosEstudiante.paterno}"/>&nbsp;<c:out value="${datosEstudiante.materno}"/> </td>
        </tr>
        <tr>    
          <td colspan="2" class="etiqueta" align=right>R.U.</td>
          <td colspan="2" class="etiqueta">::</td>
          <td colspan="2"><c:out value="${datosEstudiante.id_estudiante}"/></td>
        </tr>
        <tr>
	  <td colspan="6">
	    <table>
	      <tr>
                <td class="etiqueta" align=right>Nuevo Apodo <font color='red'>(*)</font></td>
                <td class="etiqueta">::</td>
                <td><input type=password name="apodo_nuevo" onblur='validar(apodo_nuevo,"A9")' maxlength="30"/></td>
		
		<td class="etiqueta" align=right>Confirmar Nuevo Apodo<font color='red'>(*)</font> </td>
                <td class="etiqueta">::</td>
                <td><input type=password name="confirmar_apodo" maxlength="30"/></td>
              </tr>
              <tr>
                <td class="etiqueta" align=right>Nueva Clave <font color='red'>(*)</font></td>
                <td class="etiqueta">::</td>
                <td><input type=password name="clave_nueva" onblur='validar(nueva_clave,"A9")' maxlength="30"/></td>
      	  
                <td class="etiqueta" align=right>Confirmar Nueva Clave <font color='red'>(*)</font> </td>
                <td class="etiqueta">::</td>
                <td><input type=password name="confirmar_clave" maxlength="30"/></td>
              </tr>
	    </table>
	  </td>
	</tr>           
        <tr>
          <td align="center" colspan="6">
            <input type="submit" value="Modificar" class="aceptar">
            <input type="hidden" name="id_estudiante"  value='<c:out value="${datosEstudiante.id_estudiante}"/>'>
	    <input type="hidden" name="id_matricula"   value='<c:out value="${datosMatricula.id_matricula}"/>'>
	    <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>"/> 
            <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>"/> 
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>  
</form>

<%@ include file="../../Inferior.jsp" %>
      

      
      
      
      
      






