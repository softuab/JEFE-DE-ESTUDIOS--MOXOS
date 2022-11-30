<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <title>Sistema Integrado - Moxos</title>
  <link rel="stylesheet" href="<c:url value='/pagina.css'/>" type="text/css">
  <link rel="stylesheet" href="<c:url value='/basico.css'/>" type="text/css">  
  <script language="javascript" src="<c:url value='/js/ajax.js'/>"></script>
  <script language="JavaScript" src="<c:url value='/js/datepicker.js'/>"></script>
  <script language="javascript" src="<c:url value='/js/combos.js'/>"></script>
  <script language="JavaScript">
  var formatoFecha='<c:out value="${formatoFecha}"/>';
  function setCargarGrupos(valor){
    martillo='id_grupo';
    campo_id='id_grupo';
    campito='grupo';
    param='id_materia='+valor+'&id_tipo_evaluacion='+<c:out value="${id_tipo_evaluacion}"/>+'&gestion='+<c:out value="${gestion}"/>+'&periodo='+<c:out value="${periodo}"/>;
    getConexion('<c:url value="/ajax/listarMtrGruposNoAsignados.fautapo"/>', 'setCargarCombito');
  }
  </script>
</head>
<body>
<div class="titulo">Administraci&oacute;n de Notas - Modificaci&oacute;n</div>
<div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
<table class="tabla">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/></td>
    <th>Estudiante</th>
    <td colspan="3" class="colb">
      <c:out value="${datosEstudiante2.nombres}"/> &nbsp; 
      <c:out value="${datosEstudiante2.paterno}"/> &nbsp;
      <c:out value="${datosEstudiante2.materno}"/>
    </td>
  </tr>
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
    <th>Plan</th>
    <td colspan="3" class="colb"><c:out value="${datosEstudiante.id_plan}"/>
  </tr>	
  <tr>
    <th>Sigla</th>
    <td class="colb"><c:out value="${lFichaAcademica.sigla}"/></td>
    <th>Materia</th>
    <td colspan="3" class="colb">
      <c:out value="${lFichaAcademica.materia}"/> &nbsp; 
    </td>
  </tr>
  <tr>
    <th>Tipo Evaluación</th>
    <td class="colb"><c:out value="${lFichaAcademica.tipo_evaluacion}"/></td>
    <th>Gestion</th>
    <td class="colb">
      <c:out value="${lFichaAcademica.periodo}"/>-<c:out value="${lFichaAcademica.gestion}"/>&nbsp; 
    </td>
    <th>Nota</th>
    <td class="colb">
      <c:out value="${lFichaAcademica.nota}"/>&nbsp; 
    </td>
</tr>
</table>
<br>

<form name=forma method="post" action="registrarModificacion.fautapo">
  <input type="hidden" name="id_estudiante"      value="<c:out value="${id_estudiante}"/>">
  <input type="hidden" name="_yabe"              value="<c:out value="${_yabe}"/>">
<table class="formulario">
<tr>
  <th colspan="3">INTRODUZCA LOS DATOS</th>
</tr>
<tr>
  <td class="etiqueta">Gestión</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="gestion" value="<c:out value="${lFichaAcademica.gestion}"/>"></td>
</tr>
<tr>
  <td class="etiqueta">Periodo</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="periodo" value="<c:out value="${lFichaAcademica.periodo}"/>"></td>
</tr>
<tr>
  <td class="etiqueta">Nota</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="nota" value="<c:out value="${lFichaAcademica.nota}"/>"></td>
</tr>
<tr>
  <td class="etiqueta">Tipo Evaluación</td>
  <td class="etiqueta">::</td>
  <td>
      <select id="id_tipo_evaluacion" name="id_tipo_evaluacion">
      <option value="-1">Elija una opci&oacute;n...</option>
      <c:forEach var="tipo" items="${lListarTiposEvaluaciones}" >
        <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>" <c:if test="${tipo.tipo_evaluacion==lFichaAcademica.tipo_evaluacion}">selected="true"</c:if>><c:out value="${tipo.tipo_evaluacion}"/></option>
      </c:forEach>
     </select>
  </td>
</tr>
<tr>
  <td class="etiqueta">Estado</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td>
      <select id="id_estado" name="id_estado">
      <option value="-1">Elija una opci&oacute;n...</option>
      <c:forEach var="estado" items="${lListarTiposEstados}" >
        <option value="<c:out value="${estado.id_estado}"/>" <c:if test="${estado.id_estado==lFichaAcademica.id_estado}">selected="true"</c:if>><c:out value="${estado.estado}"/></option>
      </c:forEach>
     </select>
  </td>
</tr>
<tr>
  <td class="etiqueta">Observación</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="observacion" value="<c:out value="${lFichaAcademica.observacion}"/>"></td>
</tr>
</table>
<center>
  
  <input type='button' name="boton" value='Guardar' class="siguiente" onClick="fguardar()">
</center>

</form>

<script language="JavaScript">

 function fguardar()
  {
    if((document.forma.gestion.value!="") && (document.forma.periodo.value!="") && (document.forma.nota.value!="") && (document.forma.observacion.value!="")        
      )
    {
      document.forma.submit();
    }
    else
    {
      alert("Los campos con (*), son obligatorios");
    }
  }
  iniciar();
</script>

</body>
</html>