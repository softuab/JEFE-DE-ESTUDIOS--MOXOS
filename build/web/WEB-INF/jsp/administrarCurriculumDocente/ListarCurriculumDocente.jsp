<%@ include file="../Superior.jsp" %>
<div class="titulo">Administrar Curriculum Docente</div>
<br>
<a href="javascript: document.forma.action = 'entradaCurriculumDocente.fautapo'; document.forma.submit();" class = "volver">Volver</a>
<script language='JavaScript' SRC="ajax.js"></script>
<br>
<table class="tabla">
  <tr>
    <th> Docente  ::</th>
    <td><c:out value="${datosDoc.nombre_completo}"/> </td>
  </tr>
</table>
<br>
<table align="left" class="formulario"> 
<tr>
  <td width="70%%" rowspan="2">
  <form action="cvNuevoCurriculum.fautapo" method=post name=forma>
    <input type = "hidden" name = "id_persona" value = "<c:out value = "${datosDoc.id_persona}"/>">
    <input type = "hidden" name = "id_curriculum">
    <input type = "hidden" name = "borrar">
    <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
    <jsp:useBean id="now" class="java.util.Date"/>
    <input type = hidden name = hoy value="<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
    <table class=formulario>
      <tr>
        <th colspan ="6"> Administrar CV  </th>
      </tr>
      <tr>
        <td colspan ="6">
          <a href="javascript: document.forma.submit();" class = "agregar">Nuevo</a>
        </td>
      </tr>
      <c:set var ="r" value=""/>
      <c:set var ="s" value=""/>
      <c:forEach var="c" items="${lCurriculum}" varStatus="contador">
        <c:if test="${r != c.rubro}">
          <tr>
            <th colspan = "6"><c:out value="${c.rubro}"/></th>
          </tr>
        </c:if>
        <c:if test="${s != c.sub_rubro}">
          <tr>
            <th colspan = "6"><c:out value="${c.sub_rubro}"/></th>
          </tr>
        </c:if>
        <tr> 
          <td colspan="2"><c:out value="${c.detalle}" escapeXml="false"/></td>
          <td><c:if test="${c.del != '1000-01-01' }">Del: <c:out value="${c.del}"/></c:if>&nbsp;</td>
          <td><c:if test="${c.al != '1000-01-01' }">Al: <c:out value="${c.al}"/></c:if>&nbsp;</td>
          <td><a href="javascript: document.forma.id_curriculum.value = '<c:out value="${c.id_curriculum}"/>'; document.forma.submit();" class = "modificar">Modificar</a></td>
          <td><a href="javascript: document.forma.borrar.value = 'borrar'; document.forma.id_curriculum.value = '<c:out value="${c.id_curriculum}"/>'; document.forma.submit();" class = "eliminar">Eliminar</a></td>
          <c:set var ="r" value="${c.rubro}"/>      
    	  <c:set var ="s" value="${c.sub_rubro}"/>
        </tr>
      </c:forEach>
    </table>
  </form>
  </td>
  <td valign="top">
    <table class="formulario">
      <tr><th coslpan="2">FOTO</th></tr>
      <tr>
        <td coslpan="2" align="left">
	  <form name="forma1" method="POST" action="<c:url value="/docente/adjuntarFotoDocente.fautapo"/>">
	    <div> <a class="agregar" href="javascript:document.forma1.submit();"> Adjuntar Foto </a>				    
	    <input type = "hidden" name ="id_docente" value = "<c:out value = "${datosDoc.id_docente}"/>">  
	    <input type="hidden"   name="aplicacion" value='<c:url value="/"/>' >
	    <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
	  </form>
	 </td> 
       </tr>
       <tr>
         <td>
	   <table align="center">
            <c:forEach var="listaFoto" items="${lImagenes}" varStatus="contador"> 
             <tr>
               <td align="center"> 
               <img  src='<c:url value="/"/>adjuntosMi/fotosDocentes/<c:out value="${listaFoto.adjunto}"/>' width="28" height="21" alt="Tamaño original" border="1"/>
	       </td>
	       <td>  
	         <form name="formaE<c:out value="${contador.count}"/>" method="POST" action="<c:url value="/docente/cvListarCurriculum.fautapo"/>">
	           <div> <a class="eliminar" href="javascript:document.formaE<c:out value="${contador.count}"/>.submit();"> Eliminar</a> </div>				    
		   <input type = "hidden" name ="id_dct_adjunto" value = "<c:out value = "${listaFoto.id_dct_adjunto}"/>">  
	            <input type="hidden"   name="aplicacion" value='<c:url value="/"/>' >
	           <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
		   <input type = "hidden" name = "botoncillo" value="Eliminar">
	         </form>
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
    <td valign="top">
    <table class="formulario">
      <tr> <th colspan="2">ADJUNTOS</th>
      </tr>
      <tr>
        <td>
	</td>
      </tr>
      <tr>
	<form name="forma2" method="POST" action="<c:url value="/docente/adjuntarArchivoDocente.fautapo"/>">
	 <td align="left">
	    <div> <a class="agregar" href="javascript:document.forma2.submit();"> Adjuntar Archivo </a>				    
	 </td> 
         <td align="center"><input type="button" class="descargar" value="Descargar Adjuntos" onclick="fDescargarAdjuntosD();"></td>
	   <input type = "hidden" name ="id_persona" value = "<c:out value = "${datosDoc.id_persona}"/>">  
	   <input type = "hidden" name ="id_docente" value = "<c:out value = "${datosDoc.id_docente}"/>">  
	   <input type="hidden"   name="aplicacion" value='<c:url value="/"/>' >
	   <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
	</form>    
      </tr>
    </table>
   </td>
 </tr>
</table>  

<script>
<!--
  //PARA DESCARGAR ARCHIVOS
  var dato ='';
  var _id_ingreso ='';
  function fDescargarAdjuntosD()  {
    _id_docente=document.forma2.id_docente.value;
    _aplicacion=document.forma2.aplicacion.value;
    window.open("descargarAdjuntosDocente.fautapo?&id_docente="+_id_docente+"&aplicacion="+_aplicacion,"cal","toolbar=0,width="+2*calWidth+",height="+300+",left="+(winX+calOffsetX)+",top="+(winY+calOffsetY));
  }
  //FIN PARA ADJUNTAR ARCHIVOS
  -->
</script>
  
<%@ include file="../Inferior.jsp" %>