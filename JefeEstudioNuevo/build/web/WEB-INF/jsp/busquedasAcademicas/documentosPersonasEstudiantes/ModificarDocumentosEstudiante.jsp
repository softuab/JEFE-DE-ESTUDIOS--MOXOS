<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>

<div class="titulo">Actualizar Documentaci&oacute;n Estudiante </div>
<div class="volver"><a href='<c:url value="/documentos/buscarEstudianteEntrada.fautapo"/>'>Volver</a></div>
<br>

<form  name=forma action="<c:url value="/documentos/registrarTiposDocumentosEstudiante.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <td colspan="2">
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
    </tr>
    <tr>
      <th colspan="2">  DOCUMENTACION </th>
    </tr>   	
    <tr>
      <th>  Documentaci&oacute;n Presentada </th>
      <th>  Pr&oacute;rrogas</th>
    </tr>   	
    <tr>
      <td colspan="2">
	 <table class="tabla" witdh="50%">
	   <tr>
	     <td class="colh">? </td>
	     <td class="colh">TIPO DOCUMENTO </td>
	     <td class="colh">PRESENT&Oacute; </td>
	     <td class="colh">CANTIDAD </td>
	     <td class="colh">OBS. </td>
	     <td class="colh">HACER <br>PR&Oacute;RROGA? </td>
	     <td class="colh">TIPO COMPROMISO</td>
	     <td class="colh">DETALLE DE PRORROGA</td>
	     <td class="colh">GESTION-PERIODO </td>
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
	       <td> <input type="text" name="numero<c:out value='${lDocumento.id_tipo_documento}'/>"   size="1" maxlength="2"
	              <c:if test="${lDocumento.numero ==''}">value="1" </c:if><c:if test="${lDocumento.numero !=''}">value="<c:out value='${lDocumento.numero}'/>" </c:if>
	            >
	       </td> 
	       <td> <input type="text" name="observacion<c:out value='${lDocumento.id_tipo_documento}'/>" size="20" value="<c:out value='${lDocumento.observacion}'/>" > </td> 
	       <td nowrap>
	         <c:if test="${lDocumento.compromiso == false}">
	         No puede
		 </c:if>
		 <c:if test="${lDocumento.compromiso == true}">
		   Si<input type="radio" name="prorroga"  value="true"  > &nbsp;
                   No<input type="radio" name="prorroga"  value="false" checked >
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
	       <td> 
           <input type="text" name="fec_vencimiento<c:out value='${lDocumento.id_tipo_documento}'/>"  value='<fmt:formatDate value="${now}" pattern="${formatoFecha}"/>'
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
        <th colspan="2"> PRORROGAS REALIZADAS</th>
      </tr>   	
      <tr>
        <td valign="top">
	  <table class="tabla">
	    <tr>
	      <td class="colh">Nro. </td>
	      <td class="colh">DOCUMENTO </td>
	      <td class="colh">TIPO COMPROMISO </td>
	      <td class="colh">GESTION<br>DE PRORROGA </td>
	      <td class="colh">DETALLE</td>
	      <td class="colh">FECHA DE VENCIMIENTO </td>
	    </tr>
	    <c:forEach var="lCompromisoT" items="${lPrsCompromisosTodo}" varStatus="contadorC">
	    <tr <c:if test="${(contadorC.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	      <td><c:out value='${contadorC.count}'/>  </td> 
	      <td> <c:out value='${lCompromisoT.tipo_documento}'/>
	      <td> <c:out value='${lCompromisoT.tipo_compromiso}'/>
	      </td> 
	      <td><c:out value="${lCompromisoT.gestion}"/> / <c:out value="${lCompromisoT.periodo}"/>  </td> 
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
	<input type="hidden" name="id_persona"  value="<c:out value="${buscarEst.id_persona}"/>">
      </td>
    </tr>
  </table>
</form>

<script language="JavaScript">
 
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
</script>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   


<%@ include file="../../Inferior.jsp" %>