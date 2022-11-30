<%@ include file="../Superior.jsp" %>
<script language='JavaScript' SRC="ajax.js"></script>
<div class="titulo">Administrar Foto Estudiante</div>
<br>
<form action="entradaAdjuntarFotoEstudiante.fautapo" method=post name="fvolver">
  <input type = "hidden" name = "id_estudiante" value = "<c:out value = "${id_estudiante}"/>">
  <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
 <div> <a class="volver" href="javascript: document.fvolver.submit();">Volver</a></div>
</form>
<br>
<table align="left" class="formulario"> 
<tr>
  <td width="70%%" rowspan="2">
    <table class="formulario">
      <tr>
        <th colspan ="6"> DATOS DEL ESTUDIANTE  </th>
      </tr>
      <tr>
        <td class="etiqueta3"> Nombres</td>
	<td class="etiqueta3"> ::</td>
        <td><c:out value="${datosEst.paterno}"/>  <c:out value="${datosEst.materno}"/>  <c:out value="${datosEst.nombres}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta3">C.I.</td>
	<td class="etiqueta3"> ::</td>
        <td><c:out value="${datosEst.dip}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta3">Registro Universitario</td>
	<td class="etiqueta3"> ::</td>
        <td><c:out value="${datosEst.id_estudiante}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta3">Programa</td>
	<td class="etiqueta3"> ::</td>
        <td><c:out value="${datosEst.programa}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta3">Facultad</td>
	<td class="etiqueta3"> ::</td>
        <td><c:out value="${datosEst.facultad}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta3">Tipo de Estudiante</td>
	<td class="etiqueta3"> ::</td>
        <td><c:out value="${datosEst.tipo_estudiante}"/> </td>
      </tr>
    </table>
  </td>
  <td valign="top">
    <table class="formulario">
      <tr><th coslpan="2">FOTO</th></tr>
      <tr>
        <td coslpan="2" align="left">
	  <form name="forma1" method="POST" action="<c:url value="/estudiante/adjuntarFotoEstudiante.fautapo"/>">
	    <div> <a class="agregar" href="javascript:document.forma1.submit();"> Adjuntar Foto </a>				    
	    <input type = "hidden" name ="id_estudiante" value = "<c:out value = "${datosEst.id_estudiante}"/>">  
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
               <img  src='<c:url value="/"/>adjuntosMi/fotosEstudiantes/<c:out value="${listaFoto.adjunto}"/>' width="70" height="80" alt="Tamaño original" border="1"/>
	       </td>
	       <td>  
	         <form name="formaE<c:out value="${contador.count}"/>" method="POST" action="<c:url value="/estudiante/adjListarFoto.fautapo"/>">
	           <div> <a class="eliminar" href="javascript:document.formaE<c:out value="${contador.count}"/>.submit();"> Eliminar</a> </div>				    
		   <input type = "hidden" name ="id_est_adjunto" value = "<c:out value = "${listaFoto.id_est_adjunto}"/>">  
		   <input type = "hidden" name ="id_estudiante" value = "<c:out value = "${listaFoto.id_estudiante}"/>">  
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
</table>  
<script>
<%@ include file="../Inferior.jsp" %>