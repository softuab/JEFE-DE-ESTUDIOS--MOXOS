<%@ include file="../../Superior.jsp" %>

<c:if test="${empty titulo}">
  <div class="titulo">Registrar  Postulantes</div>
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
<form  name=forma action="<c:url value="/postulantes/registrarPerfilPostulante.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="2"> DATOS DEL POSTULANTE </th>
    </tr>  
    <tr>
      <td class="etiqueta4">Gesti&oacute;n ::</td>
      <td><c:out value="${datosPostulante.gestion}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Periodo ::</td>
      <td><c:out value="${datosPostulante.periodo}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Nombres ::</td>
      <td><c:out value="${datosPostulante.paterno}"/>  <c:out value="${datosPostulante.materno}"/>  <c:out value="${datosPostulante.nombres}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">DIP ::</td>
      <td><c:out value="${datosPostulante.dip}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Programa ::</td>
      <td><c:out value="${datosPostulante.programa}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4">Plan ::</td>
      <td><c:out value="${datosPostulante.id_plan}"/>
      </td>
    </tr>
    <c:if test="${!empty bandera}">
    <tr >
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
    </c:if>  
    <tr>
      <td colspan="2" align="center">
        <input type='submit' name="boton" value='Guardar' class="siguiente" >
	<input type="hidden" name="id_postulante"  value="<c:out value="${id_postulante}"/>">
	<input type="hidden" name="id_tramite"  value="<c:out value="${id_tramite}"/>">
	<input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
      </td>
    </tr>
  </table>
</form>


<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   
<%@ include file="../../Inferior.jsp" %>