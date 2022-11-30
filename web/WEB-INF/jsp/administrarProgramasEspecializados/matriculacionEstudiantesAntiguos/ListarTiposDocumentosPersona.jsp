<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>

<c:if test="${empty titulo}">
<div class="titulo">Documentos x Clasificaci&oacute;n del Estudiante </div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<script language='JavaScript' SRC="../ajax.js"></script>

<form name="fvolver" action="<c:url value='/estudianteAntiguo/entrada.fautapo'/>" method="post">
   <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
   <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
   <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
   <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name=forma action="<c:url value="/estudianteAntiguo/registrarTiposDocumentosPersona.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <td>
        <table class="formulario">
          <tr>
            <th colspan="2"> DATOS DEL ESTUDIANTE </th>
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
            <td class="etiqueta4">Plan ::</td>
            <td><c:out value="${buscarEst.id_plan}"/>
            </td>
          </tr>
          <tr>
            <td class="etiqueta4">Tipo Clasificaci&oacute;n ::</td>
            <td><c:out value="${datosClas.tipo_clasificacion}"/>
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
	</table>
      </td>
      <td valign="top">  	  
        <table class="formulario">
          <tr>
	    <th colspan="2">DATOS PARA CAJAS </th> 
	  </tr> 
	  <tr>
            <td colspan="2">
	      <table class="tabla">
	         <tr>
	           <td class="colh">? </td>
	           <td class="colh">PERFIL </td>
	           <td class="colh">TIPO PERFIL </td>
	         </tr>
	          <c:forEach var="lPerfil" items="${lPerfilesProcesos}" varStatus="contador">
	            <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	              <td>  <input type="checkbox" name="id_perfil_proceso_p" value="<c:out value='${lPerfil.id_perfil_proceso}'/>"  checked>  </td> 
	              <td> 
	                 <c:out value='${lPerfil.perfil}'/>
	              </td> 
	              <td> <c:out value='${lPerfil.tipo_perfil}'/>
	               </td> 	
	            </tr>
	          </c:forEach>
                </table>
	    </td>
          </tr>  
	</table>
      </td>
    </tr>
    <tr>
      <th colspan="2">  DOCUMENTACION A PRESENTAR </th>
    </tr>   	
    <tr>
        <td colspan="2">
	 <table class="tabla">
	   <tr>
	     <td class="colh">? </td>
	     <td class="colh">TIPO DOCUMENTO </td>
	     <td class="colh">CANTIDAD </td>
	     <td class="colh">OBSERVACIONES </td>
	   </tr>
	   <c:forEach var="lDocumento" items="${lTiposDocumentosClasf}" varStatus="contador">
	     <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td> <c:out value='${contador.count}'/> <c:if test="${lDocumento.compromiso == 'f'}"><font color='red'>(*)</font></c:if></td> 
	       <td> 
	          <input type="checkbox" name="id_tipo_documento_p"  id="id_tipo_doc<c:out value='${lDocumento.id_tipo_documento}'/>"  value="<c:out value='${lDocumento.id_tipo_documento}'/>"> 
	          <c:out value='${lDocumento.tipo_documento}'/> <c:if test="${lDocumento.compromiso=='t'}"></c:if>
	       </td> 
	       <td> <input type="text" name="numero<c:out value='${lDocumento.id_tipo_documento}'/>"  value="1" size="1" maxlength="2"> </td> 
	       <td> <input type="text" name="observacion<c:out value='${lDocumento.id_tipo_documento}'/>" size="20" > </td> 
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
  var lista_documentos = new Array();
  var h=0;
  var nro_comp=0;
  <c:forEach var="listas" items="${lTiposDocumentosClasf}" varStatus="contador">
    <c:if test="${listas.compromiso == 'f'}">
      lista_documentos[h]= new Array('<c:out value="${listas.id_tipo_documento}"/>','<c:out value="${listas.compromiso}"/>');
      h++;
      nro_comp++;
    </c:if>
  </c:forEach> 
 
  function fguardar()
  {
    var salida = '';
    var contador=0;
    for (i=0;i<lista_documentos.length;i++) {
      salida = document.getElementById('id_tipo_doc' + lista_documentos[i][0]).checked;
      if (salida == false){
        contador++;
      }
    }
    if((document.forma.id_estudiante.value!=0) && (contador == 0))
    {
      document.forma.submit();
    }
    else
    {
      alert("Los documentos con (*), son obligatorios. No puede hacer un compromiso para esos documentos");
    }
  }
  iniciar();
</script>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   
<%@ include file="../../Inferior.jsp" %>