<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- This is only the header section to be included inside other pages -->
<style>
    :root {
        --primary: #3498db;
        --secondary: #343f50;
        --light: #ecf0f1;
        --dark: #333;
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1rem 2rem;
        background-color: var(--secondary);
        color: white;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        position: sticky;
        top: 0;
        z-index: 999;
    }

    .logo {
        font-size: 1.8rem;
        font-weight: bold;
        color: white;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
    }

    .logo span {
        color: var(--primary);
    }

    .nav-links {
        display: flex;
        gap: 1.2rem;
    }

    .nav-links a {
        color: white;
        text-decoration: none;
        font-weight: 500;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        transition: 0.3s ease;
        position: relative;
    }

    .nav-links a::after {
        content: '';
        position: absolute;
        width: 0%;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: var(--primary);
        transition: width 0.3s;
    }

    .nav-links a:hover::after {
        width: 100%;
    }

    .nav-links a:hover {
        background-color: rgba(255, 255, 255, 0.1);
        transform: translateY(-2px);
    }

    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
            align-items: flex-start;
            gap: 1rem;
        }

        .nav-links {
            flex-direction: column;
            width: 100%;
        }

        .nav-links a {
            width: 100%;
        }
    }
</style>

<div class="navbar">
    <div class="logo">Medi<span>Care</span>|G14</div>
    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/admin/login.jsp" class="nav-btn">Admin</a>
        <a href="<%= request.getContextPath() %>/doctor/doctorLogin.jsp">Doctor</a>
        <a href="<%= request.getContextPath() %>/payment/addPayment.jsp">Payment</a>
        <a href="<%= request.getContextPath() %>/feedback/addFeedback.jsp">Feedback</a>
    </div>
</div>
