<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<script language='JavaScript' SRC=".../ajax.js"></script>
<div class="titulo"><c:out value="${titulo}"/> </div>
<br>

<form name="fvolver" action="<c:url value='/estudianteAntiguoPost/listarEstudiantes.fautapo'/>" method="post">
  <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
  <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
  <input type="hidden" name="periodo"  value="<c:out value='${periodo}'/>">
  <input type="hidden" name="ru"     value="<c:out value='${ru}'/>">
  <input type="hidden" name="nombre"  value="<c:out value='${nombre}'/>">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name=forma action="<c:url value="/estudianteAntiguoPost/registrarModificarPersonaEstudiante.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="2"> INTRODUCIR DATOS PARA MATRICULACION</th>
    </tr>  
    <tr>
      <td class="etiqueta4">Gesti&oacute;n de Matriculaci&oacute;n::<font color="red" >(*)</font></td>
      <td> <input type="text" name="gestion_matricula" value="<c:out value="${gestion_siguiente}"/>" size="4" maxlength="4" onblur='validar(this,"9");' >
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Periodo de Matriculaci&oacute;n::<font color="red" >(*)</font></td>
      <td> <input type="text" name="periodo_matricula" value="<c:out value="${periodo_siguiente}"/>" size="2" maxlength="2" onblur='validar(this,"9");'>
      </td>
    </tr>
    
    <tr>
      <th> DATOS GENERALES </th>
      <th> DATOS PROGRAMA </th>
    </tr>  
    <tr>
      <td>
        <table class="tabla">
          <tr>
            <td class="etiqueta3">1er. Apellido<br>
	      <input type="text" name="paterno" size="20" title="Apellido Paterno"   onkeyup="fmayus();" style="background-color:pink" value="<c:out value='${datosPrs.paterno}'/>" readonly />
	    </td>	
	   <td class="etiqueta3">2do. Apellido<br>
	        <input type="text" name="materno" size="20" title="Apellido Materno" onkeyup="fmayus();"  style="background-color:pink" value="<c:out value='${datosPrs.materno}'/>" readonly />
	   </td>	
	   <td class="etiqueta3">Nombres <font color="red" >(*)</font></<br>
	       <input type="text" name="nombres" size="20" title="Nombres"  onkeyup="fmayus();" style="background-color:pink" value="<c:out value='${datosPrs.nombres}'/>" readonly />
	   </td> 
	  </tr>   
	  <tr> 
	    <td class="etiqueta3"> 
	        <label><font size="1px" color="#003366"><b>DIP <font color="red" >(*)</font> </b></font><br></label>
		 <input type="text"  name="dip" title="DIP" size="10" style="background-color:pink" value="<c:out value='${datosPrs.dip}'/>" readonly />
	    </td>
	    <td class="etiqueta3">Sexo <font color='red'>(*)</font><br>
               <select name="id_tipo_sexo">
                 <option value="">-- Seleccione --</option>
                 <c:forEach var="lista" items="${lTiposSexos}" >
                   <option value='<c:out value="${lista.id_tipo_sexo}"/>' <c:if test="${lista.id_tipo_sexo == datosPrs.id_tipo_sexo}">selected</c:if> >
                   <c:out value="${lista.tipo_sexo}"/> 
                 </option>
                 </c:forEach>
                </select>
	    </td>
	    <td class="etiqueta3">Estado Civil <font color='red'>(*)</font> <br>
             <select name="id_tipo_estado_civil">
              <option value="">-- Seleccione --</option>
                <c:forEach var="lista" items="${lTiposEstadosCiviles}" >
                  <option value='<c:out value="${lista.id_tipo_estado_civil}"/>' <c:if test="${lista.id_tipo_estado_civil == datosPrs.id_tipo_estado_civil}">selected</c:if> >
                  <c:out value="${lista.tipo_estado_civil}"/> 
                </option>
              </c:forEach>
            </select>
	    </td> 
	  </tr> 
	  <tr> 
	    <td class="etiqueta3"> Domicilio <font color="red" >(*)</font> <br>
		 <textarea  name="direccion"  title="Direccion"  rows="1" column="20"/><c:out value='${datosPrs.direccion}'/></textarea>
	    </td>
	    <td class="etiqueta3"> Tel&eacute;fono<br> 
		 <input type="text"  name="telefono"  title="Telefono" size="10" value="<c:out value='${datosPrs.telefono}'/>"/>
	    </td>
	    <td class="etiqueta3"> Correo<br> 
		<input type="text"  name="correo"  title="Correo" size="20" value="<c:out value='${datosPrs.correo}'/>"/>
	    </td>
	  </tr> 
	  <tr> 
	    <td class="etiqueta3"> Celular<br> 
		 <input type="text"  name="celular"  title="Nro.Celular" size="10" value="<c:out value='${datosPrs.celular}'/>"/>
	    </td>
	    <td class="etiqueta3">Empresa Telef&oacute;nica <font color='red'>(*)</font><br>
               <select name="id_tipo_empresa_telefonica">
                 <option value="">-- Seleccione --</option>
                 <c:forEach var="listaE" items="${lTiposEmpresasTelefonicas}" >
                   <option value='<c:out value="${listaE.id_tipo_empresa_telefonica}"/>' <c:if test="${listaE.id_tipo_empresa_telefonica == datosPrs.id_tipo_empresa_telefonica}">selected</c:if> >
                   <c:out value="${listaE.tipo_empresa_telefonica}"/> 
                 </option>
                 </c:forEach>
                </select>
	    </td>
	    <td class="etiqueta3"> 
	        Grupo Sanguineo<br> 
		 <input type="text"  name="tipo_sanguineo"  title="Grupo Sanguineo" size="10" value="<c:out value='${datosPrs.tipo_sanguineo}'/>"/>
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
               padre_hijo[h] = new Array ("id_pais_n", "''", "<c:out value = "${datosPrs.id_pais}"/>");
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
               padre_hijo[h] = new Array ("id_departamento_n", "id_pais_n", "<c:out value = "${datosPrs.id_departamento}"/>");
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
             padre_hijo[h] = new Array ("id_provincia_n", "id_departamento_n", "<c:out value = "${datosPrs.id_provincia}"/>");
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
              padre_hijo[h] = new Array ("id_localidad_n", "id_provincia_n", "<c:out value = "${datosPrs.id_localidad}"/>");
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
	      <input type="text" name='fec_nacimiento'  value='<fmt:formatDate value="${datosPrs.fec_nacimiento2}" pattern="${formatoFecha}"/>' 
	       maxlength='10' size='10' title="Fecha de nacimiento" > &nbsp; <small> <a href="javascript:showCal('fec_nacimiento')"> <img src="../imagenes/dibRap/calendario.jpeg" border="0" title="Seleccione la fecha" /></a></small>
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
               padre_hijo[h] = new Array ("id_tipo_institucion", "''", "<c:out value ='${datosCol.id_tipo_institucion}'/>");
               combo[h] = new Array();
               combo[h][0] = new Array("0", "- Elija una opcion -", "");
               <c:forEach var = "codp" items = "${lTiposInstituciones}" varStatus = "tipo_institucionnc">
               Atipo_institucionnac[<c:out value = "${codp.id_tipo_institucion}"/>] = '<c:out value = "${codp.tipo_institucion}"/>';
               combo[h][<c:out value = "${tipo_institucionnc.count}"/>] = new Array("<c:out value = "${codp.id_tipo_institucion}"/>", "<c:out value = "${codp.tipo_institucion}"/>", "");
               </c:forEach>
               h++;
            </script>	
	    <td class="etiqueta3"> Colegio <font color="red" >(*)</font> <br>
                 <select id = 'id_colegio' name = 'id_colegio' size = '1'
                   onChange = "poblar('id_colegio', this.options[this.selectedIndex].value); forma.colegio.value = Acolegionac[forma.id_colegio.value];">
                 </select>
            </td>
            <script>
              var Acolegionac = new Array();
              padre_hijo[h] = new Array ("id_colegio", "id_tipo_institucion", "<c:out value ='${datosCol.id_colegio}'/>");
              combo[h] = new Array();
              combo[h][0] = new Array("0", "- Elija una opcion -", "");
              <c:forEach var = "codDN" items = "${lColegiosTipoInst}" varStatus = "colegiocDN">
               Acolegionac[<c:out value = "${codDN.id_colegio}"/>] = '<c:out value = "${codDN.colegio}"/>';
               combo[h][<c:out value = "${colegiocDN.count}"/>] = new Array("<c:out value = "${codDN.id_colegio}"/>", "<c:out value = "${codDN.colegio}"/>", "<c:out value = "${codDN.id_tipo_institucion}"/>");
              </c:forEach>
               h++;
	       iniciar();
            </script>
            <td class="etiqueta3">Turno <font color="red" >(*)</font> <br>
	      <select id = 'id_tipo_turno' name = 'id_tipo_turno' size = '1'
                   onChange = "poblar('id_tipo_turno', this.options[this.selectedIndex].value); forma.tipo_turno.value = Atipo_turno[forma.id_tipo_turno.value];">
              </select>
            </td>
            <script>
              var Atipo_turno = new Array();
              padre_hijo[h] = new Array ("id_tipo_turno", "''", "<c:out value ='${datosCol.id_tipo_turno}'/>");
              combo[h] = new Array();
              combo[h][0] = new Array("0", "- Elija una opcion -", "");
              <c:forEach var = "tur" items = "${lTiposTurnos}" varStatus = "tipo_turnocN">
               Atipo_turno[<c:out value = "${tur.id_tipo_turno}"/>] = '<c:out value = "${tur.tipo_turno}"/>';
               combo[h][<c:out value = "${tipo_turnocN.count}"/>] = new Array("<c:out value = "${tur.id_tipo_turno}"/>", "<c:out value = "${tur.tipo_turno}"/>", "");
              </c:forEach>
              h++;
	      iniciar();
            </script>
          </tr>  	 
	  <tr> 
	    <td class="etiqueta3">A&ntilde;o de Bachiller<font color="red" >(*)</font> </b></font><br> 
	     <input type="text"  name="anio_titulacion"  title="Anio Egreso" size="4" maxlength="4" value="<c:out value='${datosCol.anio_egreso}'/>"/>
	    </td>
	    <td class="etiqueta3"> 
	    </td>
	    <td class="etiqueta3"> 
	    </td>
	  <tr>
	  <tr>
	    <th colspan="3"> 
	        Datos Profesionales
	    </th>
	  </tr>   
	  <tr> 
 	    <td class="etiqueta3">Titulo Adquirido<br> 
	      <input type="text"  name="titulo"  title="" size="50" value="<c:out value='${datosPrs.titulo}'/>"/>
	    </td>
 	   <td class="etiqueta3">Universidad<br> 
		 <input type="text"  name="nro_seguro_medico"  title="Nro. Seguro Medico" size="70"  value="<c:out value='${datosPrs.nro_seguro_medico}'/>"/>
	   </td>
	   <td class="etiqueta3"> 
	   </td>
	  <tr>
	  <tr>
	    <th colspan="3"> 
	        Datos Adicionales
	    </th>
	  </tr>   
	  <tr> 
	    <td class="etiqueta3">Nro. Hijos<br> 
		 <input type="text"  name="nro_hijos"  title="Nro Hijos" size="10" value="<c:out value='${datosPrs.nro_hijos}'/>" />
	    </td>
	    <td class="etiqueta3">Nro. Dependientes<br> 
		 <input type="text"  name="nro_dependientes"  title="Nro. Dependientes" size="10" value="<c:out value='${datosPrs.nro_dependientes}'/>"/>
	    </td>
	    <td class="etiqueta3"> 
	    </td>
	  <tr>
	  </table>
	</td>
        <td valign="top">
	  <table>
	  <tr>
            <td class="etiqueta4">Fecha de Inscripci&oacute;n ::</td>
            <td><fmt:formatDate value="${datosEst.fec_inscripcion}" pattern="yyyy-MM-dd"/>
	      <input type="hidden" name='fec_inscripcion'  value='<fmt:formatDate value="${datosEst.fec_inscripcion}" pattern="yyyy-MM-dd"/>'>
            </td>
          </tr>
	  <tr>
            <td class="etiqueta4">Area/Facultad :: </td>
	    <td><c:out value="${datosFacultad.facultad}"/></td>
          </tr>
          <tr>
            <td class="etiqueta4">Programa :: </td>
            <td><c:out value="${datosPrograma.programa}"/></td>
          </tr>
    	  <tr>
	    <td class="etiqueta4"> Plan ::</td>	
	    <td><c:out value="${datosEst.id_plan}"/></td>
	  </tr>
   	  <tr>
	    <td class="etiqueta4">Tipo Grado :: </td>
	    <td><c:out value="${datosEst.tipo_grado}"/></td> 
	  </tr> 
	  <tr>
	    <td class="etiqueta4">Tipo Admisi&oacute;n :: </font>
	    </td> 
	    <td><c:out value="${datosEst.tipo_admision}"/></td> 
	</tr> 
	<tr>
	  <td class="etiqueta4">Tipo Clasificaci&oacute;n <font color="red" ><blink>(*)</blink></font>
	  </td> 
	  <td>
            <select name="id_tipo_clasificacion">
              <option value="">-- Elija una opci&oacute;n --</option>
              <c:forEach var="listaC" items="${lTiposClasificaciones}" >
              <option value='<c:out value="${listaC.id_tipo_clasificacion}"/>' <c:if test="${listaC.id_tipo_clasificacion == datosClas.id_tipo_clasificacion}">selected</c:if>>
                <c:out value="${listaC.tipo_clasificacion}"/>
              </option>
              </c:forEach>
            </select>
	  </td>
	</tr> 
	<tr>
	  <td class="etiqueta4">Tipo de Estudiante <font color="red" >(*)</font>
	  </td> 
	  <td>
            <select name="id_tipo_estudiante">
              <option value="">-- Elija una opci&oacute;n --</option>
                <c:forEach var="listaE" items="${lTiposEstudiantes}" >
                <option value='<c:out value="${listaE.id_tipo_estudiante}"/>' <c:if test="${listaE.id_tipo_estudiante == datosEst.id_tipo_estudiante}">selected</c:if>>
                  <c:out value="${listaE.tipo_estudiante}"/>
                </option>
              </c:forEach>
            </select>
	  </td>
	</tr> 
	<tr>
	 <td class="etiqueta4">
	   Tipo de Descuento <font color="red" >(*)</font> 
	 </td> 
	 <td>
          <select id="id_tipo_descuento" name="id_tipo_descuento" onchange="fdescuento()">
            <option value="">-- Elija una opci&oacute;n --</option>
            <c:forEach var="listaD" items="${lTiposDescuentos}" >
              <option value='<c:out value="${listaD.id_tipo_descuento}"/>' >
                <c:out value="${listaD.tipo_descuento}"/>
              </option>
            </c:forEach>
          </select>
	  </td>
	</tr> 
        <tr>
	  <td class="etiqueta4"> Descuento (%) <font color="red" >(*)</font></td>
          <td><input id="descuento" type="text" name="descuento" value="0" readonly> </td>
        </tr>
	<tr>
	  <th colspan="2"> DATOS <br> MATRICULAS ANTERIORES </th>
	</tr> 
	<tr>
	  <td colspan="2">
	    <table class="tabla">
	      <tr>
	       <td class="colh">? </td>
	       <td class="colh">Nro. MATRICULA </td>
	       <td class="colh">GESTION </td>
	       <td class="colh">PERIODO </td>
	       <td class="colh">ESTADO<br>DE MATRICULA </td>
	     </tr>
	     <c:forEach var="lMatricula" items="${lMatriculasEstudiante}" varStatus="contador">
	     <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td> <c:out value='${contador.count}'/> </td> 
	       <td> <c:out value='${lMatricula.id_matricula}'/> </td> 
	       <td> <c:out value='${lMatricula.gestion}'/> </td> 
	       <td> <c:out value='${lMatricula.periodo}'/> </td>  </td> 
	       <td> <font color="red" > <c:out value='${lMatricula.id_estado}'/></font> </td>  </td> 
	     </tr>
	     </c:forEach>
           </table>
	  </td>
          </tr> 
	</table> 
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type='button' name="boton" value='Guardar' class="siguiente" onClick="fguardar()">
        <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
        <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
        <input type="hidden" name="id_persona" value="<c:out value='${datosEst.id_persona}'/>">
	<input type="hidden" name="id_estudiante" value="<c:out value='${datosEst.id_estudiante}'/>">
        <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
      </td>
    </tr>
  </table>
</form>

<script language="JavaScript">
  //Esto es para el calendario
  var calFormat = "<c:out value='${formatoFecha}'/>";  
  //Fin para el calendario
  
  var variables = new Array();
  h = 0;
  <c:forEach var="lista1" items="${lTiposDescuentos}" varStatus="contador">
    variables[h] = new Array("<c:out value='${lista1.id_tipo_descuento}'/>","<c:out value='${lista1.porcentaje_descuento}'/>");
    ++h;
  </c:forEach>

  function fdescuento() {
    var objeto;
    var objeto2;
    var descuento;
    objeto = document.getElementById("id_tipo_descuento");
    for (k=0; k<variables.length; k++) {
      if (variables[k][0] == objeto.value) {
        descuento = variables[k][1];
        break;
      }
    }
    objeto2 = document.getElementById("descuento");
    objeto2.value = descuento;
  }

  
  function fmayus(){
    document.forma.paterno.value=document.forma.paterno.value.toUpperCase();
    document.forma.materno.value=document.forma.materno.value.toUpperCase();
    document.forma.nombres.value=document.forma.nombres.value.toUpperCase();
  }
  
  function cambiarDisplay(id) {
  if (!document.getElementById) return false;
     fila = document.getElementById(id);
   if (fila.style.display != "none") {
     fila.style.display = "none"; /*ocultar fila*/
   } 
   else {
    fila.style.display = ""; /*mostrar fila*/
   }
  }
  
  function fguardar()
  {
    if((document.forma.gestion_matricula.value!="") && (document.forma.periodo_matricula.value!="") &&(document.forma.nombres.value!="") && (document.forma.dip.value!="") && (document.forma.direccion.value!="") && (document.forma.fec_nacimiento.value!="") &&
       (document.forma.id_tipo_sexo.value!="") && (document.forma.id_tipo_estado_civil.value!="") && (document.forma.id_tipo_empresa_telefonica.value!="") &&
       (document.forma.id_tipo_institucion.value!=0) && (document.forma.id_colegio.value!=0) && (document.forma.id_tipo_turno.value!=0) &&
       (document.forma.id_tipo_clasificacion.value!="") && (document.forma.id_tipo_estudiante.value!="") &&(document.forma.anio_titulacion.value!="") &&
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
<%@ include file="../../Inferior.jsp" %>