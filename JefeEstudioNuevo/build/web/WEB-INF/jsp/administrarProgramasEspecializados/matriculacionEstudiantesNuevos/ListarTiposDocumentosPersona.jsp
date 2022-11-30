<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>

<div class="titulo"><c:out value="${titulo}"/></div>
<br>
<script language='JavaScript' SRC="../ajax.js"></script>

<form name="fvolver" action="<c:url value='/estudianteNuevo/entrada.fautapo'/>" method="post">
   <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
   <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
   <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
   <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name=forma action="<c:url value="/estudianteNuevo/registrarTiposDocumentosPersona.fautapo"/>" method="POST">
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
	  <tr>
            <th colspan="2">HABILITAR</th>
          </tr>
	  <tr>
            <td class="etiqueta4">Estudiante ::</td>
            <td><c:if test="${buscarEst.id_estado == 'B'}"> Bloqueado </c:if>
	       <c:if test="${buscarEst.id_estado == 'A'}"> Habilitado </c:if>
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
	              <td>
		        <input type="checkbox" id="id_perfil_prorroga<c:out value='${lPerfil.id_perfil}'/>" name="id_perfil_proceso_p" value="<c:out value='${lPerfil.id_perfil_proceso}'/>"  
			  <c:if test="${lPerfil.id_perfil != formatoPerfilProrroga}">checked </c:if>
			  
			 >
		      </td> 
	              <td><c:out value='${lPerfil.perfil}'/></td> 
	              <td><c:out value='${lPerfil.tipo_perfil}'/> </td> 	
	            </tr>
	          </c:forEach>
                </table>
	    </td>
          </tr>  
	</table>
      </td>
    </tr>
    <tr>
      <th colspan="2">  DOCUMENTACION </th>
    </tr>   	
    <tr>
      <th>  Documentaci&oacute;n Presentada </th>
      <th>  Pr&oacute;rrogas</th>
    </tr>   	
    <tr>
        <!--<td valign="top"  witdh="50%">
	 <table class="tabla" witdh="50%">
	   <tr>
	     <td class="colh"># </td>
	     <td class="colh">TIPO DOCUMENTO </td>
	     <td class="colh">CANTIDAD </td>
	     <td class="colh">OBS.</td>
	     <td class="colh">CLASIFICACION</td>
	     <td class="colh">PRESENTO</td>
	   </tr>
	   <c:if test="${empty lPrsDocumentosTodo }">
	   <tr><td colspan="6" align="center">
	      No existen registros de documentaci&oacute;n.
             </td>
	   </tr>
	   </c:if>
	   <c:forEach var="lDocumentoT" items="${lPrsDocumentosTodo}" varStatus="contadorD">
	     <tr <c:if test="${(contadorD.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td><c:out value='${contadorD.count}'/></td> 
	       <td><c:out value='${lDocumentoT.tipo_documento}'/> </td> 
	       <td><c:out value='${lDocumentoT.numero}'/>  </td> 
	       <td><c:out value='${lDocumentoT.observacion}'/></td> 
	       <td><c:out value='${lDocumentoT.tipo_clasificacion}'/></td> 
	       <td><c:if test="${lDocumentoT.presento ==true}">SI </c:if><c:if test="${lDocumentoT.presento ==false}">NO</c:if></td> 
	     </tr>
	   </c:forEach>
         </table>
	</td>
	-->
	<td  colspan="2">
	 <table class="tabla" witdh="50%">
	   <tr>
	     <td class="colh">? </td>
	     <td class="colh">TIPO DOCUMENTO </td>
	     <td class="colh">PRESENT&Oacute; </td>
	     <td class="colh">CANTIDAD </td>
	     <td class="colh">OBS. </td>
	     <td class="colh">HACER <br>PR&Oacute;RROGA? </td>
	     <td class="colh">TIPO COMPROMISO</td>
	     <td class="colh">CAUSA</td>
	     <td class="colh">GESTION<br>PERIODO </td>
	     <td class="colh">FECHA DE VENCIMIENTO </td>
	   </tr>
	   <c:forEach var="lDocumento" items="${lPrsDocumentosClasificacion}" varStatus="contadorClas">
	     <tr <c:if test="${(contadorClas.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td> <c:out value='${contadorClas.count}'/> <c:if test="${lDocumento.compromiso == 'f'}"><font color='red'><b>(*)</b></font></c:if></td> 
	       <td> 
	          <c:out value='${lDocumento.tipo_documento}'/> <c:if test="${lDocumento.compromiso=='t'}"></c:if>
	       </td> 
	       <td nowrap>
	         Si<input type="radio" name="presento<c:out value='${lDocumento.id_tipo_documento}'/>"  value="true" <c:if test="${lDocumento.presento == true}"> checked </c:if> > &nbsp;
                 No<input type="radio" name="presento<c:out value='${lDocumento.id_tipo_documento}'/>"  value="false" <c:if test="${lDocumento.presento == false}"> checked</c:if> >
	       </td>
	       <td> <input type="text" name="numero<c:out value='${lDocumento.id_tipo_documento}'/>"  value="1" size="1" maxlength="2"> </td> 
	       <td> <input type="text" name="observacion<c:out value='${lDocumento.id_tipo_documento}'/>" size="20" > </td> 
	       <td nowrap>
	        <!-- Si<input type="radio" name="prorroga<c:out value='${lDocumento.id_tipo_documento}'/>"  value="true"  > &nbsp;
                 No<input type="radio" name="prorroga<c:out value='${lDocumento.id_tipo_documento}'/>"  value="false" checked >
		 -->
	         <c:if test="${lDocumento.compromiso == false}">
	         No puede
		 </c:if>
		 <c:if test="${lDocumento.compromiso == true}">
		   Si <input type="radio" id="prorroga_si<c:out value='${lDocumento.id_tipo_documento}'/>" name="prorroga<c:out value='${lDocumento.id_tipo_documento}'/>"  value="true"  OnClick="Javascript:fseleccionar();" > &nbsp;
                   No <input type="radio" id="prorroga_no<c:out value='${lDocumento.id_tipo_documento}'/>" name="prorroga<c:out value='${lDocumento.id_tipo_documento}'/>"  value="false" OnClick="Javascript:fdeseleccionar();" checked >
		 </c:if>
	       </td>
	       <c:if test="${lDocumento.compromiso == false}">
	       <td></td>
	       <td></td>
	       <td></td>
	       <td></td>
	       </c:if>
	       <c:if test="${lDocumento.compromiso == true}">
	       <td>
	         <select name="id_tipo_compromiso_<c:out value='${lDocumento.id_tipo_documento}'/>">
                   <option value="">-- Seleccione --</option>
                   <c:forEach var="lista" items="${lTiposCompromisos}" >
                     <option value='<c:out value="${lista.id_tipo_compromiso}"/>' >
                   <c:out value="${lista.tipo_compromiso}"/> 
                   </option>
                   </c:forEach>
                </select>
	       </td>
	       <td><input type="text" name="observacionCompromiso<c:out value='${lDocumento.id_tipo_documento}'/>" size="20" > </td> 	
	       <td><c:out value="${gestion}"/>-<c:out value="${periodo}"/>  </td> 
	       <td nowrap> 
	         <input type="text" name="fec_vencimiento<c:out value='${lDocumento.id_tipo_documento}'/>"  value='<fmt:formatDate value="${now}" pattern="${formatoFecha}"/>'
	          maxlength='10' size='10' title="Fecha de vencimiento" > &nbsp; <small> <a href="javascript:showCal('fec_vencimiento<c:out value='${lDocumento.id_tipo_documento}'/>')"> <img src="../imagenes/dibRap/calendario.jpeg" border="0" title="Seleccione la fecha" /></a></small>
	       </td> 
	       </c:if>
	     </tr>
	   </c:forEach>
	   <tr><td colspan="10">
	      <div class="nota">Los documentos con <font color='red'>(*)</font>, son obligatorios para el <c:out value="${datosClas.tipo_clasificacion}"/>.</div>   
             </td>
	   </tr>
	 </table>
	</td>
      </tr>
      <tr>
        <th colspan="2"> PRORROGAS REALIZADAS </th>
      </tr>   	
      <tr>
        <td valign="top">
	  <table class="tabla">
	    <tr>
	      <td class="colh">Nro. </td>
	      <td class="colh">TIPO DOCUMENTO</td>
	      <td class="colh">TIPO COMPROMISO</td>
	      <td class="colh">GESTION<br>DE PRORROGA</td>
	      <td class="colh">DETALLE</td>
	      <td class="colh">FECHA DE VENCIMIENTO</td>
	    </tr>
	    <c:forEach var="lCompromisoT" items="${lPrsCompromisosTodo}" varStatus="contadorC">
	    <tr <c:if test="${(contadorC.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	      <td><c:out value='${contadorC.count}'/>  </td> 
	      <td><c:out value='${lCompromisoT.tipo_documento}'/>
	      <td><c:out value='${lCompromisoT.tipo_compromiso}'/>
	      </td> 
	      <td><c:out value="${gestion}"/> - <c:out value="${periodo}"/>  </td> 
	      <td> <c:out value='${lCompromisoT.observacion}'/> </td> 
	      <td> <c:out value='${lCompromisoT.fec_vencimiento}'/>
	      </td> 
	    </tr>
	    </c:forEach>
          </table>
	</td>
    </tr>  	  	
    <tr>
      <td colspan="2" align="center">
        <input type='button' name="boton" value='Guardar' class="siguiente" onClick="fguardar()">
	<input type="hidden" name="id_estudiante"  value="<c:out value="${buscarEst.id_estudiante}"/>">
	<input type="hidden" name="id_persona"     value="<c:out value="${buscarEst.id_persona}"/>">
	<input type="hidden" name="id_tramite"     value="<c:out value="${id_tramite}"/>">
	<input type="hidden" name="gestion"        value="<c:out value="${gestion}"/>">
	<input type="hidden" name="periodo"        value="<c:out value="${periodo}"/>">
	<input type="hidden" name="titulo"         value="<c:out value="${titulo}"/>">
      </td>
    </tr>
  </table>
</form>

<script language="JavaScript">
  var documentos = new Array();
  var h=0;
  <c:forEach var="lDocumento" items="${lPrsDocumentosClasificacion}">
    <c:if test="${lDocumento.compromiso==true}">
      documentos[h] = <c:out value='${lDocumento.id_tipo_documento}'/>;
      h++;
    </c:if>
  </c:forEach> 
  
  function fguardar()
  {
    if((document.forma.id_estudiante.value!=0) )
    {
      document.forma.submit();
    }
    else
    {
      alert("Los documentos con (*), son obligatorios. No puede hacer PRORROGA Y/O COMPROMISO para esos documentos");
    }
  }
  
  function fseleccionar() {
    objeto = document.getElementById("id_perfil_prorroga" + <c:out value='${formatoPerfilProrroga}'/>);
    objeto.checked=1;
  } 
  function fdeseleccionar() {
    var bandera_si=false;
    objeto = document.getElementById("id_perfil_prorroga" + <c:out value='${formatoPerfilProrroga}'/>);
    for (i=0;i<documentos.length;i++) {
      var objetos_si = document.getElementById("prorroga_si"+documentos[i]);
      if((objetos_si.checked) && (bandera_si==false)) {
        bandera_si=true;
      }
    }
    if (bandera_si==false)
      objeto.checked=0;
  }
</script>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   
<%@ include file="../../Inferior.jsp" %>