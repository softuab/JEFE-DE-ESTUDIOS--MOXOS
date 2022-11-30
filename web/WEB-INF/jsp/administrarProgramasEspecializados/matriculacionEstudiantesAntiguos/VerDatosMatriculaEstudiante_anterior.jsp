<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<c:if test="${empty titulo}">
<div class="titulo">Administrar Estudiante Antiguo</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>
<br>
<form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
  <input type="hidden" name="aplicacion" value="/" >
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br> <br>

<table class="formulario">
  <tr>
    <td colspan="8">
      <table cellpadding="1" cellspacing="0" border="1" width="100%">
      <tr>
      <td align="center">VICE <br>RECTORADO</td>
      <td  align="center" colspan="4">UNIVERSIDAD AMAZONICA DE PANDO <BR> CEDULA UNIVERSITARIA <br> GESTION 2007 </td>
      <td>N&#186; <c:out value="${datoEst.id_matricula}"/> </td>
      </tr>   
     </table>
     <td>      
   </tr>     
   <tr width="100%">
      <td align="center" colspan="8"><u><c:out value="${datoEst.paterno}"/>  <c:out value="${datoEst.materno}"/>  <c:out value="${datoEst.nombres}"/></u> <br><tiny> <b>NOMBRE <b></tiny></td>
   </tr>
   <tr>
    <td colspan="2" rowspan="4">
        <table width="100" height="100" class="tabla">
        <tr> <td> </td>  </tr>
        </table>
    </td>
    <td colspan="2" align="center"><u><c:out value="${datoEst.dip}"/></u> <br><font size="1"> <b>CARNET DE IDENTIDAD <b></font> </td>
    <td colspan="2" align="center"><u><c:out value="${datoEst.id_estudiante}"/></u><br><font size="1"> <b>REGISTRO UNIVERSITARIO <b></font> </td>
  </tr>
  <tr> 
     <td align="center" colspan="4"><u><c:out value="${datoEst.facultad}"/></u> <br><font size="1"> <b>FACULTAD <b></font></td>
  </tr>  
  <tr> 
     <td align="center" colspan="4"><u><c:out value="${datoEst.programa}"/></u> <br><font size="1"> <b>PROGRAMA <b></font></td>
  </tr>
  <tr> 
    <td align="center" colspan="2"><u><c:out value="${datoEst.tipo_grado}"/></u> <br><font size="1"> <b>CATEGORIA MATRICULA <b></font></td>
    <td align="center" colspan="2"><u><c:out value="${datoEst.tipo_estudiante}"/> &nbsp; <fmt:formatDate value="${datoEst.fec_inscripcion}" pattern="yyyy"/></u> <br><font size="1"> <b>(NUEVO/ANTIGUO) <b></font></td>
  </tr>
  <tr> 
    <td colspan="4"> Cobija,  <fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  de <fmt:formatDate value="${now}" pattern="yyyy"/></td>
    <td  align="center" colspan="4"><u>____________</u> </td>
  </tr>
  <tr> 
    <td colspan="8"> </td>
  </tr>

</table>

<br> <br>
<table class="tabla">
    <tr> <th colspan="2"> CLAVE DE ACCESO </th> </tr>
    <tr> <td class="etiqueta4"> CLAVE::</td>
      <td><c:out value="${datoEst.clave}"/> </td>
    </tr>
</table>
<br> <br>

<%@ include file="../../Inferior.jsp" %>