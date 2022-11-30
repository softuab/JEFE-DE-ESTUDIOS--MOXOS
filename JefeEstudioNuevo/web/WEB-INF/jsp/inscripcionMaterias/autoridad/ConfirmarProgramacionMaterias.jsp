<%@ include file="../../Superior.jsp" %>

<div class="titulo">Inscripci&oacute;n de materias</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<form method=post action=<c:url value="/inscripcionMaterias/registrarProgramacionMaterias.fautapo"/> >

<table class="tabla">
    <tr>
        <th>RU</th>
        <th>NOMBRES</th>
        <th>PLAN</th>
        <th>PROGRAMA</th>
        <th>TIPO PROGRAMACION</th>
        <th>TIPO EVALUACIO&acute;N</th>
        <th>GESTION DE PROGRAMACI&Oacute;N</th>
        <th>PERIODO DE PROGRAMACI&Oacute;N</th>
    </tr>  
    <tr>  
        <td class=colb><c:out value="${datosEstudiante.id_estudiante}"/>
    <td class=colb><c:out value="${datosPersona.paterno}"/> &nbsp; <c:out value="${datosPersona.materno}"/> &nbsp; <c:out value="${datosPersona.nombres}"/>
    <td class=colb><c:out value="${datosEstudiante.id_plan}"/>
    <td class=colb><c:out value="${datosPrograma.programa}"/>
    <td class=colb align="center"> 
    <c:forEach var="parametro" items="${lParametros}" >
        <c:out value="${parametro.tipo_programacion}"/><br>
    </c:forEach>
</td>
<td class=colb><c:out value="${datosTipoEval.tipo_evaluacion}"/>
<td class=colb><c:out value="${gestion}"/>
<td class=colb><c:out value="${periodo}"/>
</tr>  
</table>

<br>
<div class="H3">Materias </div>
<table class="tabla">
    <tr>
        <th>NRO</th>
        <th>SIGLA</th>
        <th>MATERIA</th>
        <th>PARALELO/GRUPO</th>
    <c:forEach var="materias" items="${lMaterias}" varStatus="contador">
        <input type=hidden name='materia<c:out value="${contador.index}"/>' value='<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_modelo_ahorro}"/>:<c:out value="${materias.id_grupo}"/>' >
        <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
            <!-- ********** Fin  efecto ************ -->        
            <td><c:out value="${contador.count}"/></td>
        <td><c:out value="${materias.sigla}"/></td>
        <td><c:out value="${materias.materia}"/></td>
        <td><c:out value="${materias.grupo}"/></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="5" align="center"><input type=submit value=Confirmar></td>
</table>
<input type=hidden name=id_estudiante value=<c:out value="${datosEstudiante.id_estudiante}"/> >
<input type=hidden name=id_periodo               value=<c:out value="${id_periodo}"/> >
<input type=hidden name=total_materias           value=<c:out value="${total_materias}"/> >
<input type=hidden name="gestion"                value='<c:out value="${gestion}"/>' >
<input type=hidden name="periodo"                value='<c:out value="${periodo}"/>' >
<input type=hidden name="id_tipo_evaluacion"     value='<c:out value="${id_tipo_evaluacion}"/>' >
</form>

<%@ include file="../../Inferior.jsp" %>