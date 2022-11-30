<%@ include file="../../Superior.jsp" %>

<div class="titulo">Confirmar Anulacion del Certificado</div>
<a class="volver" href="javascript:history.back();">Volver</a>
<br>
<!--<h3><center>CERTIFICADO : <c:out value="${LCertGen.carrera}"/></center></h3>
 MODELO DE REGISTRO DE MOTIVO DE ELIMINACION-->
 
 
<form name="formulario" method="POST" action="borrarCertificado.fautapo">
<table class="formulario">


 <c:forEach var="lista" items="${certgen}" varStatus="contador">
    <tr>
	  <td><font size="2">Nro de Certificado:</font></td>	
      <td><font size="2"><c:out value="${lista.nrocertificado_gestion}"/></font></td>	
	  
   </tr>
 </c:forEach> 
 </table>
</form>

 <!--<div class="titulo">Regularizar Bloqueos/Desbloqueos Estudiante</div>
<br>
<form name="fvolver" action="listarBloqueosEstudiante.fautapo" method="post">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
   <input type="hidden" name="id_estudiante" value="<c:out value="${datosRegularizacion.id_estudiante}"/>" >
</form>
-->
<form name="formulario" method="POST" action="borrarCertificado.fautapo">
<table class="formulario">
<c:forEach var="lista" items="${certgen}" varStatus="contador">

  <tr>
    <th colspan="2">Introduzca Razones de Anulacion</td>
  </tr>
  <tr>
    <td class="etiqueta">Sede::</td>
    <td><c:out value="${lista.id_sede}"/> </td>
  </tr>
  <tr>
    <td class="etiqueta">Carrera::</td>
  <td><c:out value="${lista.carrera}"/></td>
  </tr>
   <tr>
    <td class="etiqueta">Nro Certificado - Gestion::</td>
     <td><c:out value="${lista.nrocertificado_gestion}"/> </td>
  </tr>

  <tr>
    <td class="etiqueta">Ru::</td>
 <td><c:out value="${lista.ru}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Ci::</td>
    <td><c:out value="${lista.ci}"/> </td>
  </tr>
  <tr>
    <td class="etiqueta">Estudiante ::</td>
    <td> <c:out value="${lista.estudiante}"/> </td>

  </tr>
  
   </c:forEach> 
 <tr>
    <td class="etiqueta">Observaciones<font color='red'>(*)</font> ::</td>
    <td><textarea name="obs" cols="20" rows="3"></textarea>
  </td>
  </tr>
  <tr>

  </tr>
  <tr>
    <td align="center" colspan="2">
       <input class="aceptar" type="submit" value="Aceptar">
	   <c:forEach var="lista" items="${certgen}" varStatus="contador">
         <input type="hidden" name="id_certificados_generados" value="<c:out value="${lista.id_certificados_generados}"/>">
	   </c:forEach> 
    </td>
  </tr>   
</table>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>


<!--  FIN DE REGISTRO DE ELIMINACION

<br>

<br>
<form method="post" action="borrarCertificado.fautapo">
    <c:forEach var="lista" items="${certgen}" varStatus="contador">
     <input type="hidden" name="id_certificados_generados" value="<c:out value="${lista.id_certificados_generados}"/>">
    <!-- <input type="hidden" name="obs">
	 </c:forEach> 
  <input type="submit" class="cancelar" value="Eliminar">
</form>-->
</center>
<%@ include file="../../Inferior.jsp" %>