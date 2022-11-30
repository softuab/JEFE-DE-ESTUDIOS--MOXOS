<%@ include file="../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<script language='JavaScript' SRC="../ajax.js"></script>

<div class="titulo">Administrar Docentes</div>
<br>
<form name="fvolver" action="<c:url value='/administrarDocentes/listarDocentesPersonas.fautapo'/>" method="post">
  <input type="hidden" name="nombre"  value="<c:out value='${nombre}'/>">
  <input type="hidden" name="dip"  value="<c:out value='${dip}'/>">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name="forma" action="<c:url value='/administrarDocentes/registrarDocente.fautapo'/>" method="POST">
  <table class="formulario">
    <tr>
      <th> DATOS GENERALES </th>
    </tr>  
    <tr>
      <td>
        <table class="tabla">
          <tr>
            <td class="etiqueta4">Nombres ::</td>
	    <td colspan="3">
	      <c:out value='${datosPersona.paterno}'/>
	      <c:out value='${datosPersona.materno}'/>
             <c:out value='${datosPersona.nombres}'/>
	   </td> 
	   <td class="etiqueta4">Reg.Docente.::</td>
           <td><c:out value="${datosDocente.id_docente}"/> </td>
	  </tr>   
	  <tr> 
	    <td class="etiqueta4">DIP  ::</td>
	    <td><c:out value='${datosPersona.dip}'/>
	    </td>
	    <td class="etiqueta4">Sexo ::</td>
            <td>   <c:out value="${datosPersona.tipo_sexo}"/> 
	    </td>
	    <td class="etiqueta4">Estado Civil ::</td>
            <td><c:out value="${datosPersona.tipo_estado_civil}"/> 
	    </td> 
	  </tr> 
	  <tr> 
	    <td class="etiqueta4"> Domicilio ::</td>
	    <td>  <c:out value='${datosPersona.direccion}'/>
	    </td>
	    <td class="etiqueta4"> Tel&eacute;fono ::</td> 
            <td>  <c:out value='${datosPersona.telefono}'/>
	    </td>
	    <td class="etiqueta4"> Correo ::</td> 
	    <td>  <c:out value='${datosPersona.correo}'/>
	    </td>
	  </tr> 
	  <tr> 
	    <td class="etiqueta4"> Celular ::</td> 
	    <td>  <c:out value='${datosPersona.celular}'/>
	    </td>
	    <td class="etiqueta4">Empresa Telef&oacute;nica ::</td>
            <td>   <c:out value="${datosPersona.tipo_empresa_telefonica}"/> 
	    </td>
	    <td class="etiqueta4"> 
	        Grupo Sanguineo ::</td> 
	    <td> <c:out value='${datosPersona.tipo_sanguineo}'/>
	    </td>
	  </tr> 
	  <tr>
	    <th colspan="6"> Lugar de Nacimiento
	    </th>
	  </tr>   	
	  <tr>
	    <td class="etiqueta4"> Pa&iacute;s Nac. ::</td>
	    <td> <c:out value = "${datosPersona.pais}"/>
	    </td>
	    <td class="etiqueta4"> Departamento Nac. ::</td>
	    <td>  <c:out value = "${datosPersona.departamento}"/>
	    </td>  
	     <td class="etiqueta4"> Provincia Nac. ::</td>
	     <td>  <c:out value = "${datosPersona.provincia}"/>
            </td>
	  <tr>
	  <tr>     
            <td class="etiqueta4"> Localidad Nac. ::</td>
	    <td>  <c:out value = "${datosPersona.localidad}"/>
            </td>
	    <td class="etiqueta4"> Fecha de Nacimiento ::</td>
	    <td>  <fmt:formatDate value="${datosPersona.fec_nacimiento2}" pattern="${formatoFecha}"/>
	    </td>
	    <td>
	    </td>
          </tr>  
	  <tr>
	    <th colspan="6"> 
	        Datos Academicos
	    </th>
	  </tr>  
	  <tr> 
	   <td colspan="2" class="etiqueta4">Titulo Adquirido ::</td> 
	    <td> <c:out value="${datosPersona.titulo}"/>
	    </td>
	    <td class="etiqueta4" colspan="2">A&ntilde;o de Titulaci&oacute;n ::</td> 
	    <td>  <c:out value='${datosPersona.anio_titulacion}'/>
	    </td>
	  <tr>
	  <tr>
	    <th colspan="6"> 
	        Datos Adicionales
	    </th>
	  </tr>   
	  <tr> 
	    <td class="etiqueta4">Nro. Hijos ::</td> 
	    <td>  <c:out value='${datosPersona.nro_hijos}'/>
	    </td>
	    <td class="etiqueta4">Nro. Dependientes ::</td> 
            <td>  <c:out value='${datosPersona.nro_dependientes}'/>
	    </td>
	   <td class="etiqueta4">Nro. Seguro M&eacute;dico ::</td> 
            <td>  <c:out value='${datosPersona.nro_seguro_medico}'/>
	   </td>
	  <tr>
	  </table>
	</td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input  class="cancelar" type="submit" name="boton"  value='Eliminar'>
        <input type="hidden" name="id_docente" value="<c:out value='${datosDocente.id_docente}'/>">
        <input type="hidden" name="accion"     value="<c:out value='${accion}'/>">
      </td>
    </tr>
  </table>
</form>

<%@ include file="../Inferior.jsp" %>