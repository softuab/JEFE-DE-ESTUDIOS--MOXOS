<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<style>
  body{
    background: url(<c:url value="/"/>imagenes/logos/fondo_uap.bmp) no-repeat center middle
  }
</style>
<br>
<table border="0" width="95%" align="center">
  <tr>
    <td width="90%">
      <form name="fvolver" action="<c:url value='/postulantes/entradaBuscarPst.fautapo'/>" method="post">
        <div><a href="javascript:document.fvolver.submit();">
        <IMG SRC='<c:url value="/"/>imagenes/logos/membrete_uap.bmp' width="100%" height="100%" border="0" ALT="logo institucion"></a></div>
    </td>
  </tr>
</table>

<body>
<center>
  <h1><b>CERTIFICADO DE HABILITACION</b></h1>
</center>

<table width="90%" align="center">
  <tr>
    <td>
    <table width="100%" cellpadding="0">
      <tr>
        <td align="center" ><c:out value="${datosPostulante.id_postulante}"/></td>
      </tr>    
      <tr>
        <td align="center">..................................................</td> 
      </tr>
      <tr>
        <td align="center" >Nº de Registro de Admisi&oacute;n</td> 
      </tr>
      <tr>
        <td colspan="3"><br></td>   
      </tr>
      <tr>
        <td align="center" width = 33% valign=bottom><c:out value="${datosPostulante.paterno}"/></td>   
        <td align="center" width = 33%  valign=bottom><c:out value="${datosPostulante.materno}"/></td>  
        <td align="center" width = 33%  valign=bottom><c:out value="${datosPostulante.nombres}"/></td> 
      </tr>
      <tr>
        <td align="center" width=33% >..................................................</td>
        <td align="center" width=33% >..................................................</td>
        <td align="center" width=33% >..................................................</td>
      </tr>
      <tr>
        <td align="center" width=33%>1er Apellido</td>
        <td align="center" width=33%>2do Apellido</td>
        <td align="center" width=33%>Nombres</td> 
      </tr>
      <tr>
        <td><p><br></td> 
      </tr>
      <tr>
        <td align="center" valign=bottom><c:out value="${datosPostulante.dip}"/></td>
        <td align="center" valign=bottom><c:out value="${datosPostulante.facultad}"/></td>
        <td align="center" valign=bottom><c:out value="${datosPostulante.programa}"/></td> 
     </tr>
     <tr>
       <td align="center" width=33% >..................................................</td>
       <td align="center" width=33% >..................................................</td>
       <td align="center" width=33% >..................................................</td> 
     </tr>
     <tr>
       <td align="center" width=33%>C. I.</td>
       <td align="center" width=33%>Facultad</td>
       <td align="center" width=33%>Carrera</td> 
     </tr>
   </table>
   </td>
  </tr>
  <tr>
    <td>
    <br>
    <table width="100%" border="1" cellspacing="0" cellpadding="10">
      <tr>
        <td align="center"><h2><a href='javascript:window.print()'>*** APROBADO ***</a></h2></td>
      </tr>
      <tr>
        <td>
        <table width="100%" border="0" cellspacing="8" cellpadding="0">
  	  <tr>
  	    <td width="40%"><b>Modalidad de Admisi&oacute;n::</b>&nbsp; <c:out value="${datosPostulante.tipo_admision}"/></td>
	    <td width="60%"><b>Periodo ::</b> <c:out value="${datosPostulante.periodo}"/>/<c:out value="${datosPostulante.gestion}"/> </td>
          </tr>
  	  <c:if test="${!empty lMateriasPlanTipoGrado}">
	    <tr>
   	      <td colspan="2" align="center">
	      <table class="tabla">
	        <tr>
  	          <th>Nro</th>
	          <th>Asignaturas Aprobadas</th>
	        </tr>
	        <c:forEach var="lista" items="${lMateriasPlanTipoGrado}" varStatus="contador">
	        <tr>
	          <td><c:out value="${contador.count}"/></td>
	          <td><c:out value="${lista.materia}"/></td>
	        </tr>
                </c:forEach>
	      </table>
	      </td>
	    </tr>
	  </c:if>
	  <tr>
	    <td colspan="2">En consecuencia queda Habilitado para tramitar su condici&oacute;n de alumno regular</td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
 
  <tr>
    <td> 
    <br><br><br><br><br<br>
	
    <table border="0" width="100%" >
      <tr>
        <td width="50%" align="center">
	  ...............................................................
	  <br>JEFE DPTO. PSICOPEDAGOGICO
	</td>
        
      </tr>
      <tr>
        <td colspan="2" align="center">
	  <br><br><br><br>
          <br>
	</td> 
      </tr>
      <tr>
	<td width="50%">
	</td>
        
      </tr>
	  
      <tr>
	<td colspan="2">
	  Trinidad, <fmt:formatDate value="${now}" pattern="EEEE"/>&nbsp; <fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  del <fmt:formatDate value="${now}" pattern="yyyy"/>
          <br>ADVERTENCIA: </b>Este documento queda nulo si en el hubiesen hecho raspaduras o enmiendas 
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</center>
</body>
<%@ include file="../../Inferior.jsp" %>