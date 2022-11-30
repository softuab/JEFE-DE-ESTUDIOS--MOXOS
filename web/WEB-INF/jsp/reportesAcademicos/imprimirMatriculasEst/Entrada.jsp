<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>
<script language='JavaScript' SRC="./validar.js"></script>

<div class="titulo">Re-Imprimir Matriculas</div>
<br>

<form name="forma" action="<c:url value="/matriculaEst/buscarMatricula.fautapo"/>" method="POST">
  <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
  <input type="hidden" name="aplicacion"          value='<c:url value="/"/>' >
  <table class="formulario">
  <tr>
    <td>
    <table width=100%>
      <tr>
       <th> INTRODUZCA LOS DATOS </th>
      </tr>  
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca Registro Universitario</legend>
	    <table align=right>
	          <tr>
              <td class="etiqueta">Usuario</td>
                <td class="etiqueta">::</td>	
                <td><c:out value="${nombres}"/></td>
              </tr>
	      <tr>
                <td class="etiqueta">Gesti&oacute;n</td>
	        <td class="etiqueta">::<font color='red'>(*)</font></td>
                <td><input type=text name="gestion" value="<c:out value='${gestion}'/>" size="4" maxlength="8" onblur='validar(this,"9")'/></td>
              </tr>
	      <tr>
                <td class="etiqueta">Periodo</td>
	        <td class="etiqueta">::<font color='red'>(*)</font></td>
                <td><input type=text name="periodo" value="<c:out value='${periodo}'/>" size="1" maxlength="8" onblur='validar(this,"9")'/></td>
              </tr>
    	      <tr>
                <td class="etiqueta">RU</td>
	        <td class="etiqueta">::<font color='red'>(*)</font></td>
                <td><input type=text name="id_estudiante" maxlength="8" onblur='validar(this,"9")'/></td>
              </tr>
	      <tr>
              <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
            </tr>
            </table>
         </fieldset>
         </td>
        </tr>
      </table>
    </td>
  </tr>
  <!--<tr>
    <td>
    <table width=100%>
      <tr>
        <td>
        <fieldset>
          <legend>Datos Usuario</legend>
          <table align=right>
            <tr>
              <td class="etiqueta">Usuario</td>
              <td class="etiqueta">::</td>	
              <td><c:out value="${nombres}"/></td>
            </tr>
	    <tr>
              <td class="etiqueta" align="right">Clave <font color='red'>(*)</font> </td>
              <td class="etiqueta">::</td>
              <td>
                <input type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'>
              </td>
            </tr>
	    <tr>
              <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
	      <input type="hidden" name="aplicacion"        value='<c:out value="/"/>' >
            </tr>
          </table>
        </fieldset>
        </td>
      </tr>
    </table>
    </td>
  </tr> -->
  </table>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

</body>
<%@ include file="../../Inferior.jsp" %>