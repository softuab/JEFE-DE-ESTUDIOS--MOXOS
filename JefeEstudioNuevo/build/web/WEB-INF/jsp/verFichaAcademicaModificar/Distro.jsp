<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<table width="100%">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/verFichaAcademicaModificar/listarFichaAcademica.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito' >
        <div> <a href="javascript:document.fvolver.submit();">
        <IMG idth="50%" SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion" width="30%"></a></div>
      </form>
    </td>
    <td width="72%" align="center">
      <table width="100%" heigth="100%" cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><font size="4"><b><c:out value='${datosInstitucion.institucion}'/></font></td>
        <tr>
        <tr>
          <td align="center"><font size="3"><b><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></b></font></td>
        <tr>
        </tr>
          <td align="center">DATOS MODIFICACION NOTA</td>
        </tr>         
	  </table>
    </td>
	<td width="14%">
          <script>
                hora = new Date();
                var dia = hora.getDate();
				var mes = hora.getMonth()+1;
                var anio = hora.getFullYear();
                horas = hora.getHours()
				minutos = hora.getMinutes()
				segundos = hora.getSeconds()
				if (mes <= 9) mes = "0" + mes
				if (horas >= 12) tiempo = " p.m."
				else tiempo = " a.m."
				if (horas > 12) horas -= 12
				if (horas == 0) horas = 12
				if (minutos <= 9) minutos = "0" + minutos
				if (segundos <= 9) segundos = "0" + segundos								
  	        //document.write("<sup>Pagina:</sup><sup>1</sup><br>");
                document.write("<font size=1>Fecha : <a href = 'javascript: window.print()'>" +dia+"/"+mes+"/"+anio+" " + horas+":"+minutos+":"+segundos+"  "+tiempo+"</a></font>");
			</script>        
        </td>
  </tr>
</table>
<hr>
<br>
<center>
<table witdh="100%" >
 
    <td>
     <table>        
	 <tr>
	  <td align="right"><b>Sigla ::</b></td>
	  <td><c:out value="${lFichaAcademica.sigla}"/></td>
	  <td  align="right"><b>Materia ::</b></td>
	  <td><c:out value="${lFichaAcademica.materia}"/></td>
	</tr>

	<tr>
	  <td align="right"><b>Gestión ::</b></td>
	  <td><c:out value="${lFichaAcademica.gestion}"/></td>
	  <td  align="right"><b>Periodo ::</b></td>
	  <td><c:out value="${lFichaAcademica.periodo}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Nota ::</b></td>
	  <td><c:out value="${lFichaAcademica.nota}"/></td>
	  <td align="right"><b>Tipo Evaluacion ::</b></td>
	  <td><c:out value="${lFichaAcademica.tipo_evaluacion}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Estado ::</b></td>
	  <td><c:out value="${lFichaAcademica.estado}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Observación ::</b></td>
	  <td><c:out value="${lFichaAcademica.observacion}"/></td>
	</tr>
    </table>
    </td>

 </table>
 <table width="80%"> 
   <tr>
     <td width="40%">Usuario : <c:out value="${nombres}"/> </td>     
   </tr>
</table>
</center>

