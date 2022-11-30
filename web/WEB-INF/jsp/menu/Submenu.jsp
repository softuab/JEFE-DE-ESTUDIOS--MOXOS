<ul>
    <c:forEach var="box" items="${boxList}">
        <li>
            ${box.getModule()} <!-- or whatever else you want to display -->
        </li>
    </c:forEach>
</ul>