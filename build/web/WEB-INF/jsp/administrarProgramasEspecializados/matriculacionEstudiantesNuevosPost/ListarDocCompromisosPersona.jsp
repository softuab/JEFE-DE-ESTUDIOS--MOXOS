<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<script language='JavaScript' SRC=".../ajax.js"></script>
<c:if test="${empty titulo}">
<div class="titulo">Registrar Compromisos Persona</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<script language='JavaScript' SRC="../ajax.js"></script>

<form name="fvolver" action="<c:url value='/postulantes/entrada.fautapo'/>" method="post">
   <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
   <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
   <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
   <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name=forma action="<c:url value="/estudianteNuevoPost/registrarCompromisosDocumentosPersona.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="2"> SELECCIONE LOS COMPROMISOS </th>
    </tr>  
    <tr>
      <td class="etiqueta4">Nombres ::</td>
      <td><c:out value="${buscarEst.paterno}"/>  <c:out value="${buscarEst.materno}"/>  <c:out value="${buscarEst.nombres}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">DIP ::</td>
      <td><c:out value="${buscarEst.dip}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Programa ::</td>
      <td><c:out value="${buscarEst.programa}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Tipo Clasificaci&oacute;n ::</td>
      <td><c:out value="${buscarEst.tipo_clasificacion}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Tipo Estudiante ::</td>
      <td><c:out value="${buscarEst.tipo_estudiante}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Tipo Grado ::</td>
      <td><c:out value="${buscarEst.tipo_grado}"/>
      </td>
    </tr>
    <tr>
        <td colspan="2">
	 <table class="tabla">
	   <tr>
	     <td class="colh">Nro. </td>
	     <td class="colh">TIPO DOCUMENTO </td>
	   </tr>
	   <c:forEach var="lDocumento" items="${lPrsDocumentosEstadoN}" varStatus="contador">
	     <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td> <c:out value='${contador.count}'/>  </td> 
	       </td> 
	       <td> <c:out value='${lDocumento.tipo_documento}'/>
               </td> 
	     </tr>
	   </c:forEach>
         </table>
	</td>
    </tr>  	
    <tr>
        <td colspan="2">
	 <table class="tabla">
	   <tr>
	     <td class="colh">Nro. </td>
	     <td class="colh">TIPO COMPROMISO </td>
	     <td class="colh">GESTION/PERIODO </td>
	     <td class="colh">OBSERVACIONES </td>
	     <td class="colh">FECHA DE VENCIMIENTO </td>
	   </tr>
	   <c:forEach var="lCompromiso" items="${lTiposCompromisos}" varStatus="contador">
	     <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td><c:out value='${contador.count}'/>  </td> 
	       <td><input type="checkbox" name="id_tipo_compromiso_p" value="<c:out value='${lCompromiso.id_tipo_compromiso}'/>"> 
	           <c:out value='${lCompromiso.tipo_compromiso}'/>
	       </td> 
	       <td><c:out value="${gestion}"/> / <c:out value="${periodo}"/>  </td> 
	       <td> <input type="text" name="observacion<c:out value='${lCompromiso.id_tipo_compromiso}'/>" size="20" > </td> 
	       <td> 
	         <input type="text" name="fec_vencimiento<c:out value='${lCompromiso.id_tipo_compromiso}'/>"  value='<fmt:formatDate value="${now}" pattern="${formatoFecha}"/>'
	          maxlength='10' size='10' title="Fecha de vencimiento" > &nbsp; <small> <a href="javascript:showCal('fec_vencimiento<c:out value='${lCompromiso.id_tipo_compromiso}'/>')"> <img src="../imagenes/dibRap/calendario.jpeg" border="0" title="Seleccione la fecha" /></a></small>
	       </td> 
	     </tr>
	   </c:forEach>
         </table>
	</td>
    </tr>  	
    <tr>
      <td colspan="2" align="center">
        <input type='button' name="boton" value='Guardar' class="siguiente" onClick="fguardar()">
	<input type="hidden" name="id_estudiante"  value="<c:out value="${id_estudiante}"/>">
	<input type="hidden" name="id_persona"  value="<c:out value="${buscarEst.id_persona}"/>">
	<input type="hidden" name="id_tramite"  value="<c:out value="${id_tramite}"/>">
	 <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
      </td>
    </tr>
  </table>
</form>

<script language="JavaScript">
  //Esto es para el calendario
  var calFormat = "<c:out value='${formatoFecha}'/>";  
  //Fin para calendario
  
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
    if((document.forma.id_persona.value!=0) && (document.forma.id_persona.value!="") )
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