<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Admin</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<h2>Add New Admin</h2>
<form action="${pageContext.request.contextPath}/addAdmin" method="post">
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    <button type="submit">Add</button>
</form>
</body>
</html>
