<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Delete Admin</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<h2>Delete Admin</h2>
<form action="${pageContext.request.contextPath}/deleteAdmin" method="post">
  Username to delete: <input type="text" name="username"><br>
  <button type="submit">Delete</button>
</form>
</body>
</html>
