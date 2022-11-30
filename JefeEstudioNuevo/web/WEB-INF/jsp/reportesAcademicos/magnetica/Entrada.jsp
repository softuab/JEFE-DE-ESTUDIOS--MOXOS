<%@ include file="../../Superior.jsp" %>
<style>    input{background-color:red} </style>
<body onload='inicio(document.forma.id_persona);'>

  <div class="titulo">LECTOR DE TARJETA MAGN&Eacute;TICA</div>
  <br>
  <form name=forma action="<c:url value="/magnetica/verFichaAcademica.fautapo"/>" method="POST">      
  <input type="hidden" value="<c:out value='${registro}'/>" name="registro">
    <table class="formulario">
      <tr>
        <th colspan="2" align="center">
	  <img src="../imagenes/logos/lector.gif" border="0" ALT="TARJETA">  
	</th>
      </tr>
      <tr>
        <td class="etiqueta" align="center"></td>
        <td align="center"><input type="password" name="id_persona"></td>
      </tr>

      <tr>
        <td align="center" colspan="2">
	    <font color="#0B1D84">
	    <h3>INSERTE SU TARJETA MAGN&Eacute;TICA</h3>
	    </font>
	</td>	
      </tr>
      <tr>
        <td align="center" colspan="2">
	    <font color="red"><b>
	    <c:out value="${mensaje}"/>
	    </b>
	    </font>
	</td>
      </tr>      
    </table>
  </form>
</body>

