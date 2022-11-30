<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<div class="titulo">Eliminar Certificado</div>
<br>
<form name="forma" action="confirmarBorrado.fautapo" method="post" >
  <input type="hidden" name="hora" value="<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss"/>">

<table class="formulario" >
  <tr>
    <th colspan=3 align="center">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta">Usuario</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${usuario}" /></td>
  </tr>
  <tr>
    <td class="etiqueta">Nro. de Certificado <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="nro_certificado"></td>
  </tr>
    <tr>
    <td class="etiqueta">Tipo Certificado </td>
    <td class="etiqueta">::</td>
	<td>
       <select name="tipo_cert">
	   <option value="27">Certificado de Notas</option>
       <option value="31">Historial Academico</option>    
       </select> 
	 </td>
  </tr>
   <tr>
    <td class="etiqueta">Sede</td>
    <td class="etiqueta">::</td>
    <td>
     
	<!-- <select name="sede">
       <option value=""> - Elija una sede - </option>    
  	   <c:forEach var="tipo" items="${lTiposSedes}">
          <option value="<c:out value="${tipo.id_sede}"/>"> <c:out value="${tipo.sede}"/></option>
        </c:forEach>-->
		
	 
	   <select name="sede">
	   <option value="1">CENTRAL-TRINIDAD</option>
       <option value="8">RIBERALTA</option>    
  	   <option value="4">GUAYARAMERIN</option>
          
       
		
	  </select>
	 
    </td>
  </tr>
  
  
  
  <tr>
    <td class="etiqueta">Clave <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td><input type="password" name="clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss"/>"></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><input type="submit" value="Buscar" class="siguiente"></td>
  </tr>
</table>

</form>

<%@ include file="../../Inferior.jsp" %>