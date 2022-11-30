<%@ include file="../Superior.jsp" %>
<script language='JavaScript' SRC="./validar.js">  </script>
<body onload='inicio(document.forma.clave)'>
  <div class="titulo">Administrar Adjuntar Fotos Estudiante</div>
  <br>
  <form name=forma action="<c:url value="/estudiante/adjListarFoto.fautapo"/>" method="POST">
  <table class="formulario">
    <tr> <th> BUSCAR ESTUDIANTE </th>
    </tr>    
    <tr>
      <td>
      <table width=100%>
        <tr>
          <td>
          <fieldset>
            <legend>Introduzca Registro del Estudiante</legend>
	      <table align=right>
    	        <tr>
                  <td class="etiqueta">R.U.</td>
	          <td class="etiqueta">::</td>
                  <td><input type=text name="id_estudiante" maxlength="8" onblur='validar(this,"9")'/></td>
      	          <td><input type=submit name="botonRU" value='Buscar' class="buscar"></td>
                </tr>
              </table>
            </fieldset>
            </td>
          </tr>
      </table>
    </td>
   </tr>
  </table>
  </form>
<%@ include file="../Inferior.jsp" %>


