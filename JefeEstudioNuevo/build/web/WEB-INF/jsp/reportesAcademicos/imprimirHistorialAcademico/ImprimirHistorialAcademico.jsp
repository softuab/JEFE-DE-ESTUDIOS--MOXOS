<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<table width="85%" border = 0 align="center">
  <!-- SE REPITE-->
  <thead>
  <tr>
    <td width="100%" height = "70%" align="center" cellspancin="0" cellpading="0">
    <table width="100%" border = 0 height = "80%" align= "center">
      <tr>
        <td width="7%" align="center"  height = "70%">
          <form name="fvolver" action="listarProgramasPlanes.fautapo" method="post">
            <input type="hidden" name="aplicacion"  value="/" >
            <input type="hidden" name="id_programa" value='<c:out value="${id_programa}"/>' >
            <div> <a href="javascript:document.fvolver.submit();">
            <img width="100%" src="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion"></a></div>
          </form>
        </td>
        <td width="72%" align="center">

<!-- ================================================= TITULO ================================================= -->

<table width="100%" heigth="80%" cellpading="2" cellspacing="0"  align= "center" border = 0>
     <tr>
        <td align="center"><font size="5"><font face ='Vivaldi'><b>UNIVERSIDAD AUTÓNOMA DEL BENI <BR>JOSÉ BALLIVIÁN</font></font></td
            <tr>
   
        </tr>
                   </tr>
          </table>
        </td>
  
      </tr>
    </table>
<hr>
<table align= "center">
  <tr>
    <td colspan="2" align="center"><font size="4"><b>HISTORIAL ACADÉMICO</font></b></td>
  </tr>
</table>
<hr>  
</td>
  </tr>
  
  
  <!-- HASTA AQUI SE REPITE-->
  
  <tr>
    <td> 
	<br>
	<br>
<table width = "100%" border = 0 align= "center"> 
<tr>
    <td><b>Facultad</b></td>
    <td><c:out value="${datosFacultad.facultad}"/></td>
 </tr>
 <tr>
    <td><b>Carrera</b></td>
    <td colspan="3"><c:out value="${datosPrograma.programa}"/></td>

    <td><b>Nivel</b></td>
    <td ><c:out value="${datosGrados.grado_academico}"/></td>
 
 </tr>
 <tr>
    <td><b>Apellidos y Nombres</b></td>
      <td colspan="3">
      <c:out value="${datosPersona.paterno}"/> &nbsp;
      <c:out value="${datosPersona.materno}"/> &nbsp;
      <c:out value="${datosPersona.nombres}"/>
      </td>
      
    <td><b>Plan</b></td>
    <td><c:out value="${datosEstudiante.id_plan}"/></td>
 
  </tr>
  <tr>
     <td><b>C.I.</b></td>
     <td colspan="3"><c:out value="${datosPersona.dip}"/></td>
  </tr>
<tr>
     <td><b>R.U.</b></td>
     <td colspan="3"><c:out value="${datosEstudiante.id_estudiante}"/></td>
  </tr>
</table>

    <br>
    </td>
  </tr>
  </thead>
  <tr>  
    <td align="center" >
    <table class="tabla" width="100%" border = 0 align= "center" >
      <thead>
      <tr>
        <th>NRO.</th>
        <th>SIGLA</th>
        <th>MATERIA</th>
        <th>TIPO EVAL</th>
        <th>GESTION</th>
        <th>NOTA</th>
      </tr>
      </thead>
      <c:set var="nivel_academico_ant" value="0"/>
      <c:forEach var="lista" items="${lMaterias}" varStatus="contador">
      <c:if test="${nivel_academico_ant != lista.nivel_academico}">
        <tr>
          <td colspan="6">NIVEL :: <c:out value="${lista.nivel_academico}"/></td>
        </tr>
      </c:if>
      <tr>
        <td><c:out value="${contador.count}"/></td>
        <td><c:out value="${lista.sigla}"/></td>
        <td><c:out value="${lista.materia}"/></td>
        <td><c:out value="${lista.tipo_evaluacion}"/></td>
        <c:if test="${lista.gestion != 0}">
          <td><c:out value="${lista.periodo}"/>-<c:out value="${lista.gestion}"/></td>
          <td><c:out value="${lista.nota}"/></td>
        </c:if>
        <c:if test="${lista.gestion == 0}">
          <td></td>
          <td></td>
        </c:if>
      </tr>
      <c:set var="nivel_academico_ant" value="${lista.nivel_academico}"/>
      </c:forEach>
    </table>
    </td>
  </tr>  
</table>
<br>
<br>
<br>
<table>
 <tr>
    <td align="center" colspan="3" width="8%">_____________________________________</td>
    <td align="center" width="8%">____________________________________</td>
       <p>
    <p>
    <p>
    <p>
    <p>
    <p>
  </tr>
</table>
 <p><p><p><p> 
 
 

<table width="85%" align="center" border = 0>

 <tr>
 <br><br><br><br>
    <td>TOTAL ASIGNATURAS DEL PLAN : <c:out value="${total_materias_plan}"/></td>
    <td>TOTAL ASIGNATURAS APROBADAS : <c:out value="${total_materias_aprobadas}"/></td>
    <td>PROMEDIO DE CALIFICACIONES : <c:out value="${promedio}"/></td>
  </tr>
  <tr>
    <td colspan="2" algin="right">
      <c:out value='${datosInstitucionsede.localidad}'/>, <a href='javascript: window.print()'><fmt:formatDate value="${now}" type="date" dateStyle="long"/>
    </td>
  </tr>
</table>
<%@ include file="../../Inferior.jsp" %>
