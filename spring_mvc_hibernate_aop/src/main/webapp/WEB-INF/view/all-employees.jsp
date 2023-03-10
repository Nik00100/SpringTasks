<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>

<h2>All Employees</h2>
<br>

<%--    table - таблица--%>
<%--    tr - строка таблицы--%>
<%--    th - заголовок таблицы--%>
<table>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Department</th>
        <th>Salary</th>
        <th>Operations</th>
    </tr>

    <%--    с:forEach - для организации цикла (emp переменная из списка allEmps)--%>
    <%--    td - ячейка таблицы--%>
    <c:forEach var="emp" items="${allEmps}">

        <c:url var="updateButton" value="/updateInfo">
<%--            id работника сохраняем в параметр empId--%>
            <c:param name="empId" value="${emp.id}"></c:param>
        </c:url>

        <c:url var="deleteButton" value="/deleteEmployee">
            <%--            id работника сохраняем в параметр empId--%>
            <c:param name="empId" value="${emp.id}"></c:param>
        </c:url>

        <tr>
            <td>${emp.name}</td>
            <td>${emp.surname}</td>
            <td>${emp.department}</td>
            <td>${emp.salary}</td>
            <td><input type="button" value="Update"
                onclick="window.location.href = '${updateButton}'">
<%--            </td>-- это чтобы кнопки были в одной ячейке%>
<%--            <td>--%>
                <input type="button" value="Delete"
                       onclick="window.location.href = '${deleteButton}'"></td>
        </tr>
    </c:forEach>

</table>
<br><br>

<input type="button" value="Add"
    onclick="window.location.href = 'addNewEmployee'">

</body>

</html>