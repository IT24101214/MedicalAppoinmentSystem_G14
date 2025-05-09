<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
  HttpSession session = request.getSession();
  session.invalidate();
  response.sendRedirect("adminLogin.jsp");
%>
