<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<br>
<center>

<table border=0 width=90% cellspacing=0 cellpadding=0>
  <tr>
    <td align=center valign=top><font face=Helvetica size=6><b>UNIVERSIDAD AMAZ&Oacute;NICA DE PANDO</b></font><br>
				<font face=Helvetica size=2><b>Cobija - Pando -  Bolivia</b></font><br>
				<font face=Helvetica size=1>"La conservaci&oacute;n de la amazon&iacute;a  es vital para el desarrollo sostenible de la bella tierra pandina"</font>
    </td>
  </tr>
  <tr>
    <td colspan=2><hr size=2 color=black></td>
  </tr>    
</table>
<h1><b>CERTIFICADO DE HABILITACION </b></h1>

<table width=80% border=0 cellpadding=0>
  <tr>
    <td align=center ><c:out value="${datosPostulante.id_postulante}"/></td> 
  </tr>    
  <tr>
    <td align=center>..................................................</td> 
  </tr>
  <tr>
    <td align=center >Nº de Registro de Admisi&oacute;n</td> 
  </tr>
  <tr>
    <td align=center width = 33% valign=bottom><c:out value="${datosPostulante.paterno}"/></td>   
     <td align=center width = 33%  valign=bottom><c:out value="${datosPostulante.materno}"/></td>  
     <td align=center width = 33%  valign=bottom><c:out value="${datosPostulante.nombres}"/></td> 
  </tr>
  <tr>
    <td align=center width=33% >..................................................</td>
    <td align=center width=33% >..................................................</td>
    <td align=center width=33% >..................................................</td>
  <tr>
    <td align=center width=33%>1er Apellido</td>
    <td align=center width=33%>2do Apellido</td>
    <td align=center width=33%>Nombres</td> 
  </tr>
  <tr>
    <td><p><br></td> 
  </tr>
  <tr>
    <td align=center valign=bottom><c:out value="${datosPostulante.dip}"/></td>
    <td align=center  valign=bottom><c:out value="${datosPostulante.facultad}"/></td>
    <td align=center  valign=bottom><c:out value="${datosPostulante.programa}"/></td> 
  </tr>
  <tr>
    <td align=center width=33% >..................................................</td>
    <td align=center width=33% >..................................................</td>
    <td align=center width=33% >..................................................</td> 
  </tr>
  <tr>
    <td align=center width=33%>C. I. Nº</td>
    <td align=center width=33%>Area</td>
    <td align=center width=33%>Programa</td> 
  </tr>
</table>
<p>
<table width=80% border=1  cellspacing=0 cellpadding=0>
  <tr>
    <td align="center"><h5>ASIGNATURAS APROBADAS</h5></td> 
  </tr>
  <tr>
    <td>
      <table width=80% border=0  cellspacing=8 cellpadding=0>
        <tr>
	  <td>
            <p align=center cellspacing=10>
             ____________________________________<br>    
            <a href='javascript:window.print()'><b>*** APROBADO ***</b></a>
	  </td>    
	</tr>
	<tr>
	  <td>
	    <table>
	    <c:forEach var="lista" items="${lMateriasPlanTipoGrado}" varStatus="contador">
	      <tr>
	        <td>
		  <c:out value="${lista.materia}"/> 
		</td>
	      </tr>
            </c:forEach>
	    </table>
	  </td>    
	</tr>
	<tr>
	  <td>    
            <p>Modalidad de Admisi&oacute;n::&nbsp; <c:out value="${datosPostulante.tipo_admision}"/>
            <p>Gesti&oacute;n :: <c:out value="${datosPostulante.periodo}"/>/<c:out value="${datosPostulante.gestion}"/>                                          
            <p>En consecuencia queda Habilitado para tramitar su condici&oacute;n de alumno regular                                        
	  </td>
        </tr>
      </table>
    </td>
  </tr>
 </table>
 <br><br><br><br>
 <table border=0 width=90%>  
   <tr>
     <td width=30% align=center>...............................................................
     <td width=30% align=center>...............................................................
  </tr>
  <tr>
    <td width=30% align=center valign=top>DPTO. TRAMITE Y REGISTRO</td>
    <td width=30% align=center valign=top>DIRECTOR DE AREA <p><br><p>
    </td>
   <tr>
     <td colspan=2 width=30% align=center valign=top>.....................................................................</td> 
   </tr>
   <tr>
     <td colspan=2 width=30% align=center valign=top>VICERRECTOR-U.A.B. <p><br><p></td> 
   </tr>
</table>
<br><br><br><br>
<table border=0 width=80%>  
  <tr>
    <td width=30% align=left colspan=1 valign=top>Cobija, <fmt:formatDate value="${now}" pattern="EEEE"/>&nbsp; <fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  del <fmt:formatDate value="${now}" pattern="yyyy"/>  <p></td> 
  </tr>
  <tr>
    <td colspan=3>ADVERTENCIA: </b>Este documento queda nulo si en el hubiesen hecho raspaduras o enmiendas </td> 
  </tr>    
  <tr><td colspan=3><b>NOTA: </b>Un ejemplar de este certificado, deber&aacute; quedar en Archivo universitario a tiempo de su Matriculaci&oacute;n</font>
</table>
  
<%@ include file="../../Inferior.jsp" %>