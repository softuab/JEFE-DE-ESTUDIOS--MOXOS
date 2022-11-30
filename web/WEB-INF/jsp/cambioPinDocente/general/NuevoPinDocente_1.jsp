<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Cambio clave(PIN) Docente - Autoridad</div>
<br>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<table class="tabla">
  <tr>
    <td class="etiqueta">Usuario</td>
    <td class="etiqueta">::</td>
    <td>
      <c:out value="${usuario}"/>
    </td>
  </tr>    
</table>  
<br
<table class="formulario">
  <tr>
    <th colspan="2">
      ATENCION
    </th>
  </tr>    
  <tr>
    <td valing="top">
      <form action="<c:url value="/cambioPinDocenteGeneral/registrarNuevoPin.fautapo"/>" method="POST">
      <table class="formulario">
        <tr>
          <th colspan="3">INTRODUCIR NUEVA CLAVE</th>
        </tr>
	<tr>
          <td class="etiqueta" align="right">Docente</td>
          <td class="etiqueta">::</td>
          <td><c:out value="${datosDocente.nombre_completo}"/></td>
        </tr>
        <tr>
	  <td colspan="3">
	    <table>
	      <tr>
	        <td class="etiqueta" align="right">Nuevo Apodo <font color='red'>(*)</font></td>
                <td class="etiqueta">::</td>
                <td><input type=password name="nuevo_apodo" onblur='validar(nuevo_apodo,"A9")' maxlength=10/></td>
                <td class="etiqueta" align="right">Confirmar<br>Nuevo Apodo <font color='red'>(*)</font> </td>
                <td class="etiqueta">::</td>
                <td><input type=password name="conf_nuevo_apodo" maxlength="10"/></td>
              </tr>
	      <tr>
                <td class="etiqueta" align="right">Nueva Clave <font color='red'>(*)</font></td>
                <td class="etiqueta">::</td>
                <td><input type=password name="nueva_clave" onblur='validar(nueva_clave,"A9")' maxlength=10/></td>
		<td class="etiqueta" align="right">Confirmar<br>Nueva Clave <font color='red'>(*)</font> </td>
                <td class="etiqueta">::</td>
                <td><input type=password name="conf_nueva_clave" maxlength="10"/></td>
              </tr>
	    </table>
	  </td>
	</tr>      
        <tr>
          <td align="center" colspan="3">
            <input type="submit" value="Modificar" class="aceptar">
          </td>
        </tr>
      </table>
       <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>        
       <input type="hidden" name="id_docente" value="<c:out value='${datosDocente.id_docente}'/>">
      </form>
    </td>
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
  </tr>      
</table>
<%@ include file="../../Inferior.jsp" %>