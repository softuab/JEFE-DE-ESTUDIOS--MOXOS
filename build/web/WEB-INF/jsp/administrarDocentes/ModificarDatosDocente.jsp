<%@ include file="../Superior.jsp" %>

<div class="titulo">Administrar Datos Docentes</div>
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
      <th colspan="2"> MODIFICAR DATOS DOCENTE </th>
    </tr> 
    <tr>
      <th> DATOS GENERALES </th>
      <th> DATOS DE DOCENTE </th>
    </tr>  
    <tr>
      <td>
        <table class="tabla">
          <tr>
            <td class="etiqueta3">1er. Apellido<br>
	      <input type="text" name="paterno" size="20" title="Apellido Paterno"   onkeyup="fmayus();" value="<c:out value='${datosPersona.paterno}'/>" />
	    </td>	
	   <td class="etiqueta3">2do. Apellido<br>
	        <input type="text" name="materno" size="20" title="Apellido Materno" onkeyup="fmayus();"  value="<c:out value='${datosPersona.materno}'/>"/>
	   </td>	
	   <td class="etiqueta3">Nombres<font color="red" >(*)</font><br>
	       <input type="text" name="nombres" size="20" title="Nombres"  onkeyup="fmayus();"  value="<c:out value='${datosPersona.nombres}'/>" />
	   </td> 
	  </tr>   
	  <tr> 
	    <td class="etiqueta3"> 
	        <label><font size="1px" color="#003366"><b>DIP <font color="red" >(*)</font> </b></font><br></label>
		 <input type="text"  name="dip" title="DIP" size="10" value="<c:out value='${datosPersona.dip}'/>"/>
	    </td>
	    <td class="etiqueta3">Sexo <font color='red'>(*)</font><br>
               <select name="id_tipo_sexo">
                 <option value="">-- Seleccione --</option>
                 <c:forEach var="lista" items="${lTiposSexos}" >
                   <option value='<c:out value="${lista.id_tipo_sexo}"/>' <c:if test="${lista.id_tipo_sexo == datosPersona.id_tipo_sexo}">selected</c:if> >
                   <c:out value="${lista.tipo_sexo}"/> 
                 </option>
                 </c:forEach>
                </select>
	    </td>
	    <td class="etiqueta3">Estado Civil <font color='red'>(*)</font> <br>
             <select name="id_tipo_estado_civil">
              <option value="">-- Seleccione --</option>
                <c:forEach var="lista" items="${lTiposEstadosCiviles}" >
                  <option value='<c:out value="${lista.id_tipo_estado_civil}"/>' <c:if test="${lista.id_tipo_estado_civil == datosPersona.id_tipo_estado_civil}">selected</c:if> >
                  <c:out value="${lista.tipo_estado_civil}"/> 
                </option>
              </c:forEach>
            </select>
	    </td> 
	  </tr> 
	  <tr> 
	    <td class="etiqueta3"> Domicilio <font color="red" >(*)</font> <br>
		 <textarea  name="direccion"  title="Direccion"  rows="1" column="20"/><c:out value='${datosPersona.direccion}'/></textarea>
	    </td>
	    <td class="etiqueta3"> Tel&eacute;fono<br> 
		 <input type="text"  name="telefono"  title="Telefono" size="10" value="<c:out value='${datosPersona.telefono}'/>"/>
	    </td>
	    <td class="etiqueta3"> Correo<br> 
		<input type="text"  name="correo"  title="Correo" size="20" value="<c:out value='${datosPersona.correo}'/>"/>
	    </td>
	  </tr> 
	  <tr> 
	    <td class="etiqueta3"> Celular<br> 
		 <input type="text"  name="celular"  title="Nro.Celular" size="10" value="<c:out value='${datosPersona.celular}'/>"/>
	    </td>
	    <td class="etiqueta3">Empresa Telef&oacute;nica <font color='red'>(*)</font><br>
               <select name="id_tipo_empresa_telefonica">
                 <option value="">-- Seleccione --</option>
                 <c:forEach var="listaE" items="${lTiposEmpresasTelefonicas}" >
                   <option value='<c:out value="${listaE.id_tipo_empresa_telefonica}"/>' <c:if test="${listaE.id_tipo_empresa_telefonica == datosPersona.id_tipo_empresa_telefonica}">selected</c:if> >
                   <c:out value="${listaE.tipo_empresa_telefonica}"/> 
                 </option>
                 </c:forEach>
                </select>
	    </td>
	    <td class="etiqueta3"> 
	        Grupo Sanguineo<br> 
		 <input type="text"  name="tipo_sanguineo"  title="Grupo Sanguineo" size="10" value="<c:out value='${datosPersona.tipo_sanguineo}'/>"/>
	    </td>
	  </tr> 
	  <tr>
	    <th colspan="3"> Lugar de Nacimiento
	    </th>
	  </tr>   	
	  <tr>
	    <td class="etiqueta3"> Pa&iacute;s Nac.<font color="red" >(*)</font> <br>
	       <select id = 'id_pais_n' name = 'id_pais_n' size = '1'
                onChange = "poblar('id_pais_n', this.options[this.selectedIndex].value); forma.pais.value = Apaisnac[forma.id_pais_n.value];">
               </select>
            </td>
             <script>
               var Apaisnac = new Array();
               padre_hijo[h] = new Array ("id_pais_n", "''", "<c:out value = "${datosPersona.id_pais}"/>");
               combo[h] = new Array();
               combo[h][0] = new Array("0", "- Elija una opcion -", "");
               <c:forEach var = "codp" items = "${lPaises}" varStatus = "paisnc">
               Apaisnac[<c:out value = "${codp.id_pais}"/>] = '<c:out value = "${codp.pais}"/>';
               combo[h][<c:out value = "${paisnc.count}"/>] = new Array("<c:out value = "${codp.id_pais}"/>", "<c:out value = "${codp.pais}"/>", "");
               </c:forEach>
               h++;
             </script>	
	    <td class="etiqueta3"> Departamento Nac. <font color="red" >(*)</font> <br>
               <select id = 'id_departamento_n' name = 'id_departamento_n' size = '1'
                 onChange = "poblar('id_departamento_n', this.options[this.selectedIndex].value); forma.departamento.value = Adepartamentonac[forma.id_departamento_n.value];">
               </select>
             </td>
             <script>
               var Adepartamentonac = new Array();
               padre_hijo[h] = new Array ("id_departamento_n", "id_pais_n", "<c:out value = "${datosPersona.id_departamento}"/>");
               combo[h] = new Array();
               combo[h][0] = new Array("0", "- Elija una opcion -", "");
               <c:forEach var = "codDN" items = "${lDepartamentos}" varStatus = "departamentocDN">
                Adepartamentonac[<c:out value = "${codDN.id_departamento}"/>] = '<c:out value = "${codDN.departamento}"/>';
                combo[h][<c:out value = "${departamentocDN.count}"/>] = new Array("<c:out value = "${codDN.id_departamento}"/>", "<c:out value = "${codDN.departamento}"/>", "<c:out value = "${codDN.id_pais}"/>");
               </c:forEach>
               h++;
	       iniciar();
             </script>
	     <td class="etiqueta3"> Provincia Nac. <font color="red" >(*)</font> </b></font> <br>
	       <select id = 'id_provincia_n' name = 'id_provincia_n' size = '1'
                 onChange = "poblar('id_provincia_n', this.options[this.selectedIndex].value); forma.provincia.value = Aprovincia[forma.id_provincia_n.value];">
               </select>
            </td>
            <script>
             var Aprovincia = new Array();
             padre_hijo[h] = new Array ("id_provincia_n", "id_departamento_n", "<c:out value = "${datosPersona.id_provincia}"/>");
             combo[h] = new Array();
             combo[h][0] = new Array("0", "- Elija una opcion -", "");
             <c:forEach var = "prov" items = "${lProvincias}" varStatus = "provinciacN">
               Aprovincia[<c:out value = "${prov.id_provincia}"/>] = '<c:out value = "${prov.provincia}"/>';
               combo[h][<c:out value = "${provinciacN.count}"/>] = new Array("<c:out value = "${prov.id_provincia}"/>", "<c:out value = "${prov.provincia}"/>", "<c:out value = "${prov.id_departamento}"/>");
             </c:forEach>
             h++;
	     iniciar();
             </script>
	  <tr>
	  <tr>     
            <td class="etiqueta3"> Localidad Nac.<font color="red" >(*)</font> <br>
	      <select id = 'id_localidad_n' name = 'id_localidad_n' size = '1'
               onChange = "poblar('id_localidad_n', this.options[this.selectedIndex].value); forma.localidad.value = Alocalidad[forma.id_localidad_n.value];">
              </select>
            </td>
            <script>
              var Alocalidad = new Array();
              padre_hijo[h] = new Array ("id_localidad_n", "id_provincia_n", "<c:out value = "${datosPersona.id_localidad}"/>");
              combo[h] = new Array();
              combo[h][0] = new Array("0", "- Elija una opcion  -", "");
              <c:forEach var = "loc" items = "${lLocalidades}" varStatus = "localidadcN">
              Alocalidad[<c:out value = "${loc.id_localidad}"/>] = '<c:out value = "${loc.localidad}"/>';
              combo[h][<c:out value = "${localidadcN.count}"/>] = new Array("<c:out value = "${loc.id_localidad}"/>", "<c:out value = "${loc.localidad}"/>", "<c:out value = "${loc.id_provincia}"/>");
              </c:forEach>
              h++;
	      iniciar();
            </script>	
	    <td class="etiqueta3"> Fecha de Nacimiento <font color="red" >(*)</font> <br>
	      <input type="text" name="fec_nacimiento"  value='<fmt:formatDate value="${datosPersona.fec_nacimiento2}" pattern="${formatoFecha}"/>' 
	       maxlength='10' size='10' title="Fecha de nacimiento" > &nbsp; <small> <a href="javascript:showCal('fec_nacimiento')"> <img src="../imagenes/dibRap/calendario.jpeg" border="0" title="Seleccione la fecha" /></a></small>
	    </td>
	    <td>
	    </td>
          </tr>  
	  <tr>
	    <th colspan="3"> 
	        Datos Academicos
	    </th>
	  </tr>  
	  <tr> 
	   <td colspan="2" class="etiqueta3">Titulo Adquirido<br> 
	     <textarea name="titulo" column="30" rows="1"><c:out value="${datosPersona.titulo}"/></textarea>
	    </td>
	    <td class="etiqueta3">A&ntilde;o de Titulaci&oacute;n<font color="red" >(*)</font> </b></font><br> 
	     <input type="text"  name="anio_titulacion"  title="Anio Egreso" size="5" maxlength="5" value="<c:out value='${datosPersona.anio_titulacion}'/>"/>
	    </td>
	  <tr>
	  <tr>
	    <th colspan="3"> 
	        Datos Academicos-Universitarios
	    </th>
	  </tr>  
	  <tr> 
	   <td colspan="2" class="etiqueta3">Titulo Adquirido<br> 
	     <textarea name="titulo" column="30" rows="1"><c:out value="${datosPersona.titulo}"/></textarea>
        <input type="checkbox" id="aviso" name="tecnico" value="" /> <label for="Tecnico Superior"> Tecnico Superior</label>
		  <input type="checkbox" id="aviso" name="tecnico" value="" /> <label for="Tecnico Superior"> Licenciatura</label>
		   <input type="checkbox" id="aviso" name="tecnico" value="" /> <label for="Tecnico Superior"> Diplomado</label>
		  <input type="checkbox" id="aviso" name="tecnico" value="" /> <label for="Tecnico Superior"> Especialidad</label>
			 <input type="checkbox" id="aviso" name="tecnico" value="" /> <label for="Tecnico Superior"> Maestria</label>
			  <input type="checkbox" id="aviso" name="tecnico" value="" /> <label for="Tecnico Superior"> Doctorado</label>
			   <input type="checkbox" id="aviso" name="tecnico" value="" /> <label for="Tecnico Superior"> Postdoctorado</label>
	    </td>
	    <td class="etiqueta3">A&ntilde;o de Titulaci&oacute;n<font color="red" >(*)</font> </b></font><br> 
	     <input type="text"  name="anio_titulacion"  title="Anio Egreso" size="5" maxlength="5" value="<c:out value='${datosPersona.anio_titulacion}'/>"/>
	    </td>
	  <tr>
	  <tr>
	    <th colspan="3"> 
	        Datos Adicionales
	    </th>
	  </tr>   
	  <tr> 
	    <td class="etiqueta3">Nro. Hijos<br> 
		 <input type="text"  name="nro_hijos"  title="Nro Hijos" size="10" value="<c:out value='${datosPersona.nro_hijos}'/>" />
	    </td>
	    <td class="etiqueta3">Nro. Dependientes<br> 
		 <input type="text"  name="nro_dependientes"  title="Nro. Dependientes" size="10" value="<c:out value='${datosPersona.nro_dependientes}'/>"/>
	    </td>
	   <td class="etiqueta3">Nro. Seguro M&eacute;dico<br> 
		 <input type="text"  name="nro_seguro_medico"  title="Nro. Seguro Medico" size="10"  value="<c:out value='${datosPersona.nro_seguro_medico}'/>"/>
	   </td>
	  <tr>
	  </table>
	</td>
        <td valign="top">
	  <table>
	  <tr>
            <td class="etiqueta4">Registro<br> Docente::</td>
            <td><c:out value="${datosDocente.id_docente}"/> </td>
          </tr>
	  <!--
	  <tr>
            <td class="etiqueta4">Apodo ::</td>
            <td>
	      <input type="type" name='apodo'  value='<c:out value="${datosDocente.apodo}"/>'>
            </td>
          </tr>
	  <tr>
            <td class="etiqueta4">Categoria :: </td>
	    <td><input type="text" name="categoria" value="<c:out value="${datosDocente.categoria}"/>"></td>
          </tr>
	  -->
  	</table> 
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type='button' name="boton" value='Guardar' class="siguiente" onClick="fguardar()">
        <input type="hidden" name="id_docente" value="<c:out value='${datosDocente.id_docente}'/>">
        <input type="hidden" name="accion"     value="<c:out value='${accion}'/>">
      </td>
    </tr>
  </table>
</form>

<script language="JavaScript">
  //Esto es para el calendario
  var calFormat = "<c:out value='${formatoFecha}'/>";  
  //Fin para el calendario
  
  function fmayus(){
    document.forma.paterno.value=document.forma.paterno.value.toUpperCase();
    document.forma.materno.value=document.forma.materno.value.toUpperCase();
    document.forma.nombres.value=document.forma.nombres.value.toUpperCase();
  }
  
  function fguardar()
  {
    if((document.forma.nombres.value!="") && (document.forma.dip.value!="") && (document.forma.direccion.value!="") && (document.forma.fec_nacimiento.value!="") &&
       (document.forma.id_tipo_sexo.value!="") && (document.forma.id_tipo_estado_civil.value!="") && (document.forma.id_tipo_empresa_telefonica.value!="") &&
       (document.forma.anio_titulacion.value!="") &&
       (document.forma.id_pais_n.value!=0) &&(document.forma.id_departamento_n.value!=0)&&(document.forma.id_provincia_n.value!=0) &&(document.forma.id_localidad_n.value!=0)
      )
    {
      document.forma.submit();
    }
    else
    {
      alert("Los campos con (*), son obligatorios");
    }
  }
  iniciar();
</script>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   
<%@ include file="../Inferior.jsp" %>