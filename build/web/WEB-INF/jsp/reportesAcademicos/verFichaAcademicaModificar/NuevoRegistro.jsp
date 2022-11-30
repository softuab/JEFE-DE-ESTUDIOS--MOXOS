<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="titulo">Administraci&oacute;n de Grupos - Agregando</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<table class="tabla">
<tr>
  <th>Programa</th>
  <td><c:out value="${programa.programa}"/></td>
  <th>Plan</th>
  <td><c:out value="${datosPrgPlan.id_plan}"/></td>
  <th>Tipo Evaluaci&oacute;n</th>
  <td><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/></td>
  <th>Gesti&oacute;n</th>
  <td><c:out value="${gestion}"/></td>
  <th>Periodo</th>
  <td><c:out value="${periodo}"/></td>
</tr>
</table>
<br>

<form method="post" action="registrarNuevo.fautapo">
  <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
  <input type="hidden" name="id_prg_plan"        value="<c:out value="${id_prg_plan}"/>">
  <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
  <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
<table class="formulario">
<tr>
  <th colspan="3">INTRODUZCA LOS DATOS</th>
</tr>
<tr>
  <td class="etiqueta">Materia</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td>
    <select id="id_materia" name="id_materia" onChange="setCargarGrupos(this.options[this.selectedIndex].value)">
      <option value="-1">Elija una opci&oacute;n...</option>
      <c:forEach var="materia" items="${lMaterias}" >
        <option value="<c:out value="${materia.id_materia}"/>"><c:out value="${materia.materia}"/></option>
      </c:forEach>
    </select>
  </td>
</tr>
<tr>
  <td class="etiqueta">Grupo</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td>
    <select id="id_grupo" name="id_grupo" disabled="true">
      <option value="-1">Elija una opci&oacute;n...</option>
    </select>
  </td>
</tr>
<tr>
  <td class="etiqueta">Cupo M&aacute;ximo</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="cupo_max"></td>
</tr>
<tr>
  <td class="etiqueta">Horas</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="horas"></td>
</tr>
<tr>
  <td class="etiqueta">Nro. Resoluci&oacute;n</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="nro_resolucion"></td>
</tr>
<tr>
  <td class="etiqueta">Fecha Resoluci&oacute;n</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td>
    <input type="text" name="fec_resolucion" id="fec_resolucion"><small><a href="#" onClick="showCalendar('fec_resolucion','<c:url value="/"/>');"><img src="<c:url value="/imagenes/dibRap/calendario.jpeg"/>"></a></small>
  </td>
</tr>
</table>
<center>
  <input type="submit" value="Siguiente" class="siguiente">
</center>

</form>
</body>
</html>