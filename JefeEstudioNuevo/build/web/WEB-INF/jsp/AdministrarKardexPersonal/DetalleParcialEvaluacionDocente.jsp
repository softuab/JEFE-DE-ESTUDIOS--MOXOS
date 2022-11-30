<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<div id="no-more-tables">  
    <table class="col-md-12 table-bordered table-striped table-condensed table-hover cf" id="listcursos">
        <thead class="cf">
            <tr>
                <th>GESTION/PERIODO</th>
                <th>ASIGNATURA O AREA</th>
                <th>PUNTAJE</th>
                <th>DESCARGAR</th>
                <th>ESTADO</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="detalle" items="${detalles}">
                <tr>
                    <td data-title="GESTION/PERIODO">
                        <c:out value="${detalle.gestion}"/>  / <c:out value="${detalle.periodo}"/> 
                    </td>
                    <td data-title="ASIGNATURA O AREA">
                        <c:out value="${detalle.asignatura}"/>
                    </td>
                    <td data-title="PUNTAJE">
                        <c:out value="${detalle.puntaje}"/>
                    </td>
                    <td data-title="DESCARGAR">
                        <form name="formacion${detalle.id_evaluacion_docente}" action="<c:url value="./FileDownloadController.fautapo"/>" method="GET">
                            <input type="hidden" name="name" value='${detalle.url_certificado_evaluacion}' /> 
                            <input type="hidden" name="directorio" value='evaluacion' /> 
                            <button class="btn btn-primary" type="submit"><i class="fas fa-download"></i></button>
                        </form>
                    </td>
                    <td data-title="ESTADO">
                        <c:if test="${detalle.aprobado}">
                            <span class="badge badge-success">Aprobado</span>
                        </c:if>
                        <c:if test="${!detalle.aprobado}">
                            <span class="badge badge-danger">Sin aprobar</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>