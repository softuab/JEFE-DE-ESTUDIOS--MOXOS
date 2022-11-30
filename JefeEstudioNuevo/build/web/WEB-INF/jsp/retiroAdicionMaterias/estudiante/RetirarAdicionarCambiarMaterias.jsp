<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="../validar.js"></script>

<div class="titulo">Retiro dici&oacute;n de materias</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<form method=post action=<c:url value="/retiroAdicionMateriasEstudiante/listarProgramacionMaterias.fautapo"/> >

    <table class="tabla">
        <tr>
            <th class=colh>RU </th>
            <th class=colh>NOMBRES</th>
            <th class=colh>PLAN</th>
            <th class=colh>PROGRAMA</th>

        <tr>
            <td class=colb><c:out value="${datosEstudiante.id_estudiante}"/>
            <td class=colb><c:out value="${datosPersona.paterno}"/> &nbsp; <c:out value="${datosPersona.materno}"/> &nbsp; <c:out value="${datosPersona.nombres}"/>
            <td class=colb><c:out value="${datosEstudiante.id_plan}"/>
            <td class=colb><c:out value="${datosPrograma.programa}"/>
    </table>
    <br>

    <table class="tabla">
        <tr class=colh>
            <td align=center colspan=3>SELECCIONE  UNA  ACCI&Oacute;N</td>
        </tr>
        <tr class=colh>
            <td align=center><input type=submit name="accion" value="Retiro"></td>
            <td align=center><input type=submit name="accion" value="Adicion"></td>
            <td align=center><input type=submit name="accion" value="Cambio de grupo"></td>
        </tr>
    </table>

</form>

<%@ include file="../../Inferior.jsp" %>