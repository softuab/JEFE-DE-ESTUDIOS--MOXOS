<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<script language='JavaScript' SRC="../js/ajax.js"></script>
<c:if test="${empty titulo}">
<div class="titulo">Registrar  Postulantes</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>
<br>

<form name="fvolver" action="<c:url value='/pstPersonas/entrada.fautapo'/>" method="post">
  <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name=forma action="<c:url value="/pstPersonas/registrarPstPersona.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="2"> INTRODUZCA LOS DATOS </th>
    </tr>  
    <tr>
      <td colspan="2" class="etiqueta4"><center>Gesti&oacute;n ::&nbsp;<c:out value="${gestion}"/>
        <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>"> </center>
      </td>
    </tr>
    <tr>
      <td class="etiqueta4" colspan="2"><center>Periodo :: &nbsp;<c:out value="${periodo}"/>
        <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>"></center>
      </td>
    </tr>
    <tr>
      <th colspan="2"> DATOS GENERALES </th>
    </tr>  
    <tr>
      <td colspan="2">
        <table class="tabla">
         <tr>
         <td>
	    <font size="1px" color="#003366"><b>1er. Apellido </b></font></label><br>
	      <input type="text" name="paterno" size="20" title="Apellido Paterno"  onkeyup="fmayus();" />
	   </td>	
	      <td><label><font size="1px" color="#003366"><b>2do. Apellido </b></font></label><br>
	        <input type="text" name="materno" size="20" title="Apellido Materno" onkeyup="fmayus();" />
	      </td>	
	      <td>	
	       <label><font size="1px" color="#003366"><b>Nombres <font color="red" >(*)</font> </b></font></label><br>
	       <input type="text" name="nombres" size="20" title="Nombres"  onkeyup="fmayus();" />
	      </td> 
	    </tr>   
	    <tr> 
	     <td> 
	        <label><font size="1px" color="#003366"><b>DIP <font color="red" >(*)</font> </b></font><br></label>
		 <input type="text"  name="dip" title="DIP" size="10" />
	     </td>
	     <td> 
	        <label><font size="1px" color="#003366"><b>Direccion <font color="red" >(*)</font> </b></font><br></label>
		 <input type="text"  name="direccion"  title="Direccion"  size="20"/>
	     </td>
	     <td class="etiqueta3"> 
	        Telefono<br> 
		 <input type="text"  name="telefono"  title="Telefono" size="10" />
	     </td>
	    </tr> 
	    <tr>
	      <td colspan="3"> 
	        <label><font size="1px" color="#003366"><b>Fecha de Nacimiento <font color="red" >(*)</font> </b></font></label><br>
	        <input type="text" name='fec_nacimiento'  value='1980-01-01' 
	        maxlength='10' size='10' title="Fecha de nacimiento" /> &nbsp; <small> <a href="javascript:showCal('fec_nacimiento')"> <img src="../imagenes/dibRap/calendario.jpeg" border="0" title="Seleccione la fecha" /></a></small>
	     </td>
	    </tr>   	
	  </table>
	</td>
      </tr>
      <c:if test="${!empty bandera}">
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
      </c:if> 
     <c:if test="${id_tramite != null}">
     <tr>
       <td class="etiqueta3">Requisitos</td>
       <td class="etiqueta3">::</td>
       <td><c:out value="${requisitos}"/>
     </tr>
     </c:if>
     <c:if test="${tieneDescuento == 1}">
     <tr>
       <td class="etiqueta" align="right">Descuento (%)</td>
       <td class="etiqueta">::</td>
       <td><input type="text" name="descuento" value='<c:out value="${descuento}"/>'>
     </tr>
     <tr>
      <td class="etiqueta">Tipo de Descuento <font color="red" >(*)</font> </td> 
      <td class="etiqueta">::</td>
      <td>
          <select name="id_tipo_descuento">
            <option value="">-- Elija una opci&oacute;n --</option>
            <c:forEach var="listaD" items="${lTiposDescuentos}" >
              <option value='<c:out value="${listaD.id_tipo_descuento}"/>' >
                <c:out value="${listaD.tipo_descuento}"/>
              </option>
            </c:forEach>
          </select>
       </td>
     </tr>
     </c:if>      
    <c:if test="${(id_tramite == null || id_tramite=='') && (!empty lTuplas)}">
    <tr><td>
    <table class="tabla">
      <tr>
        <th>?</th>
        <th>Requisito</th>
      </tr>
      <c:forEach var="lista" items="${lTuplas}">
        <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
        <!-- ********** Fin  efecto ************ -->
          <td class="etiqueta2"><input type="checkbox" name="id_tupla" value="<c:out value="${lista.id_tupla}"/>" ></td>
          <td class="etiqueta2"><c:out value="${lista.tupla}"/></td>
        </tr>
      </c:forEach>
     </table>
     </td></tr>  
     </c:if>
      <tr>
        <td colspan="2" align="center">
          <input type='button' name="boton" value='Guardar' class="siguiente" onClick="fguardar()">
	  <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
          <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
	  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
        </td>
      </tr>
    </table>
</form>

<script language="JavaScript">
  
  function fmayus(){
    document.forma.paterno.value=document.forma.paterno.value.toUpperCase();
    document.forma.materno.value=document.forma.materno.value.toUpperCase();
    document.forma.nombres.value=document.forma.nombres.value.toUpperCase();
  }
  
  function fguardar()
  {
    if((document.forma.nombres.value!="") && (document.forma.dip.value!="") && (document.forma.direccion.value!="") && (document.forma.fec_nacimiento.value!=""))
    {
      document.forma.submit();
    }
    else
    {
      alert("Los campos con (*), son obligatorios");
    }
  }
</script>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   
<%@ include file="../../Inferior.jsp" %>