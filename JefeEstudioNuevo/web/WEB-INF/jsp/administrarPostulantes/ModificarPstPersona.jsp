<%@ include file="../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<script language='JavaScript' SRC="../js/ajax.js"></script>
<c:if test="${empty titulo}">
<div class="titulo">>Administrar Datos Pst Personas</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>
<br>

<form name="fvolver" action="<c:url value='/pst_personas/entrada.fautapo'/>" method="post">
  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name=forma action="<c:url value="/pst_personas/registrarPrsPostulante.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <th> INTRODUZCA LOS DATOS </th>
    </tr>  
    <tr>
      <th> DATOS GENERALES </th>
    </tr>
    <tr> 
      <td>
        <table class="tabla">
          <tr>
            <td class="etiqueta3"> Paterno<br>
	      <input type="text" name="paterno" size="20" title="Apellido Paterno"   onkeyup="fmayus();" value='<c:out value="${datosPstPersona.paterno}"/>' />
	    </td>	
	   <td class="etiqueta3">Materno<br>
	        <input type="text" name="materno" size="20" title="Apellido Materno" onkeyup="fmayus();" value='<c:out value="${datosPstPersona.materno}"/>'  />
	   </td>	
	   <td class="etiqueta3">Nombres <font color="red" >(*)</font></<br>
	       <input type="text" name="nombres" size="20" title="Nombres"  onkeyup="fmayus();"  value='<c:out value="${datosPstPersona.nombres}"/>' />
	   </td> 
	  </tr>   
	  <tr> 
	    <td class="etiqueta3"> 
	        <label><font size="1px" color="#003366"><b>DIP <font color="red" >(*)</font> </b></font><br></label>
		 <input type="text"  name="dip" title="DIP" size="10"  value='<c:out value="${datosPstPersona.dip}"/>'/>
	    </td>
	    <td class="etiqueta3">Sexo <font color='red'>(*)</font><br>
               <select name="id_tipo_sexo">
                 <option value="">-- Seleccione --</option>
                 <c:forEach var="lista" items="${lTiposSexos}" >
                   <option value='<c:out value="${lista.id_tipo_sexo}"/>' <c:if test="${lista.id_tipo_sexo == datosPstPersona.id_tipo_sexo}">selected</c:if> >
                   <c:out value="${lista.tipo_sexo}"/> 
                 </option>
                 </c:forEach>
                </select>
	    </td>
	    <td class="etiqueta3">Estado Civil <font color='red'>(*)</font> <br>
             <select name="id_tipo_estado_civil">
              <option value="">-- Seleccione --</option>
                <c:forEach var="lista" items="${lTiposEstadosCiviles}" >
                  <option value='<c:out value="${lista.id_tipo_estado_civil}"/>' <c:if test="${lista.id_tipo_estado_civil == datosPstPersona.id_tipo_estado_civil}">selected</c:if> >
                  <c:out value="${lista.tipo_estado_civil}"/> 
                </option>
              </c:forEach>
            </select>
	    </td> 
	  </tr> 
	  <tr> 
	    <td class="etiqueta3"> Domicilio <font color="red" >(*)</font> <br>
		 <textarea  name="direccion"  title="Direccion"  rows="1" column="20"/><c:out value="${datosPstPersona.direccion}"/></textarea>
	    </td>
	    <td class="etiqueta3"> Tel&eacute;fono<br> 
		 <input type="text"  name="telefono"  title="Telefono" size="10"   value='<c:out value="${datosPstPersona.telefono}"/>' />
	    </td>
	    <td class="etiqueta3"> Correo<br> 
		<input type="text"  name="correo"  title="correo" size="20"  value='<c:out value="${datosPstPersona.correo}"/>'/>
	    </td>
	  </tr> 
	  <tr> 
	    <td class="etiqueta3"> Celular<br> 
		 <input type="text"  name="celular"  title="Nro.Celular" size="10"  value='<c:out value="${datosPstPersona.celular}"/>'/>
	    </td>
	    <td class="etiqueta3">Empresa Telef&oacute;nica <font color='red'>(*)</font><br>
               <select name="id_tipo_empresa_telefonica">
                 <option value="">-- Seleccione --</option>
                 <c:forEach var="listaE" items="${lTiposEmpresasTelefonicas}" >
                   <option value='<c:out value="${listaE.id_tipo_empresa_telefonica}"/>' <c:if test="${listaE.id_tipo_empresa_telefonica == datosPstPersona.id_tipo_empresa_telefonica}">selected</c:if> >
                   <c:out value="${listaE.tipo_empresa_telefonica}"/> 
                 </option>
                 </c:forEach>
                </select>
	    </td>
	    <td class="etiqueta3"> 
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
               padre_hijo[h] = new Array ("id_pais_n", "''", "<c:out value = "${datosPstPersona.id_pais}"/>");
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
               padre_hijo[h] = new Array ("id_departamento_n", "id_pais_n", "<c:out value = "${datosPstPersona.id_departamento}"/>");
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
             padre_hijo[h] = new Array ("id_provincia_n", "id_departamento_n", "<c:out value = "${datosPstPersona.id_provincia}"/>");
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
              padre_hijo[h] = new Array ("id_localidad_n", "id_provincia_n", "<c:out value = "${datosPstPersona.id_localidad}"/>");
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
	      <input type="text" name='fec_nacimiento' value='<fmt:formatDate value="${datosPstPersona.fec_nacimiento2}" pattern="dd/MM/yyyy"/>'
	       maxlength='10' size='10' title="Fecha de nacimiento" /> &nbsp; <small> <a href="javascript:showCal('fec_nacimiento')"> <img src="../imagenes/dibRap/calendario.jpeg" border="0" title="Seleccione la fecha" /></a></small>
	    </td>
	    <td>
	    </td>
          </tr>  
	  <tr>
	    <th colspan="3"> 
	        Datos de Bachillerato
	    </th>
	  </tr>  
          <tr >
            <td class="etiqueta3">Tipo Instituci&oacute;n <font color="red" >(*)</font> <br>
	       <select id = 'id_tipo_institucion' name = 'id_tipo_institucion' size = '1'
                onChange = "poblar('id_tipo_institucion', this.options[this.selectedIndex].value); forma.id_tipo_institucion.value = Atipo_institucionnac[forma.id_tipo_institucion.value];">
               </select>
            </td>
            <script>
               var Atipo_institucionnac = new Array();
               padre_hijo[h] = new Array ("id_tipo_institucion", "''", "<c:out value = "${datosColegio.id_tipo_institucion}"/>");
               combo[h] = new Array();
               combo[h][0] = new Array("0", "- Elija una opcion -", "");
               <c:forEach var = "codp" items = "${lTiposInstituciones}" varStatus = "tipo_institucionnc">
               Atipo_institucionnac[<c:out value = "${codp.id_tipo_institucion}"/>] = '<c:out value = "${codp.tipo_institucion}"/>';
               combo[h][<c:out value = "${tipo_institucionnc.count}"/>] = new Array("<c:out value = "${codp.id_tipo_institucion}"/>", "<c:out value = "${codp.tipo_institucion}"/>", "");
               </c:forEach>
               h++;
            </script>	
	    <td colspan="2" class="etiqueta3"> Colegio <font color="red" >(*)</font> <br>
                 <select id = 'id_colegio' name = 'id_colegio' size = '1'
                   onChange = "poblar('id_colegio', this.options[this.selectedIndex].value); forma.colegio.value = Acolegionac[forma.id_colegio.value];">
                 </select>
            </td>
            <script>
              var Acolegionac = new Array();
              padre_hijo[h] = new Array ("id_colegio", "id_tipo_institucion", "<c:out value = "${datosColegio.id_colegio}"/>");
              combo[h] = new Array();
              combo[h][0] = new Array("0", "- Elija una opcion -", "");
              <c:forEach var = "codDN" items = "${lColegiosTipoInst}" varStatus = "colegiocDN">
               Acolegionac[<c:out value = "${codDN.id_colegio}"/>] = '<c:out value = "${codDN.colegio}"/>';
               combo[h][<c:out value = "${colegiocDN.count}"/>] = new Array("<c:out value = "${codDN.id_colegio}"/>", "<c:out value = "${codDN.colegio}"/>", "<c:out value = "${codDN.id_tipo_institucion}"/>");
              </c:forEach>
               h++;
	       iniciar();
            </script>
            
          </tr>  	 
	  <tr> 
            <td class="etiqueta3">Turno <font color="red" >(*)</font> <br>
	      <select id = 'id_tipo_turno' name = 'id_tipo_turno' size = '1'
                   onChange = "poblar('id_tipo_turno', this.options[this.selectedIndex].value); forma.tipo_turno.value = Atipo_turno[forma.id_tipo_turno.value];">
              </select>
            </td>
            <script>
              var Atipo_turno = new Array();
              padre_hijo[h] = new Array ("id_tipo_turno", "''", "<c:out value = "${datosColegio.id_tipo_turno}"/>");
              combo[h] = new Array();
              combo[h][0] = new Array("0", "- Elija una opcion -", "");
              <c:forEach var = "tur" items = "${lTiposTurnos}" varStatus = "tipo_turnocN">
               Atipo_turno[<c:out value = "${tur.id_tipo_turno}"/>] = '<c:out value = "${tur.tipo_turno}"/>';
               combo[h][<c:out value = "${tipo_turnocN.count}"/>] = new Array("<c:out value = "${tur.id_tipo_turno}"/>", "<c:out value = "${tur.tipo_turno}"/>", "");
              </c:forEach>
              h++;
	      iniciar();
            </script>
	    <td colspan="2" class="etiqueta3">A&ntilde;o de Bachiller<font color="red" >(*)</font> </b></font><br> 
	     <input type="text"  name="anio_egreso"  title="Anio Egreso" size="4" maxlength="4" value="<c:out value='${datosColegio.anio_egreso}'/>"/>
	    </td>
	  <tr>
         </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type='button' name="boton" value='Guardar' class="siguiente" onClick="fguardar()">
	   <input type="hidden" name="id_persona" value="<c:out value='${id_persona}'/>">
	   <input type="hidden" name="id_postulante" value="<c:out value='${id_postulante}'/>">
        </td>
      </tr>
    </table>
</form>

<script language="JavaScript">

  var calFormat = "dd/MM/YYYY";

  function fmayus() {
    document.forma.paterno.value=document.forma.paterno.value.toUpperCase();
    document.forma.materno.value=document.forma.materno.value.toUpperCase();
    document.forma.nombres.value=document.forma.nombres.value.toUpperCase();
  }
  
  
  function fguardar()
  {
    if((document.forma.nombres.value!="") && (document.forma.dip.value!="") && (document.forma.direccion.value!="") && (document.forma.fec_nacimiento.value!="") &&
       (document.forma.id_tipo_sexo.value!="") && (document.forma.id_tipo_estado_civil.value!="") && (document.forma.id_tipo_empresa_telefonica.value!="") &&
       (document.forma.id_tipo_institucion.value!=0) && (document.forma.id_colegio.value!=0) && (document.forma.id_tipo_turno.value!=0) &&
       (document.forma.anio_egreso.value!="")
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