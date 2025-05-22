<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MediCare | G14</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --light: #ecf0f1;
            --dark: #333;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            min-height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--dark);
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 3rem 1.5rem;
            max-width: 900px;
            margin: 0 auto;
        }

        h1 {
            font-size: 2.9rem;
            color: var(--secondary);
            margin-bottom: 1rem;
        }

        p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .cta-buttons {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .cta-btn {
            padding: 1rem 2rem;
            border-radius: 6px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            font-size: 1.2rem;
            letter-spacing: 0.5px;
        }

        .primary-btn {
            background: var(--primary);
            color: white;
        }

        .primary-btn:hover {
            background: #2980b9;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            transform: translateY(-3px);
        }

        .secondary-btn {
            background: var(--primary);
            color: white;
            border-radius: 8px;
            padding: 1rem 2.5rem;
            font-weight: 700;
            text-transform: uppercase;
            text-decoration: none;
            transition: all 0.3s ease;
            border: none;
        }

        .secondary-btn:hover {
            background: #2980b9;
            transform: translateY(-4px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        footer {
            background: var(--secondary);
            color: white;
            text-align: center;
            padding: 0.8rem 0;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            .cta-buttons {
                flex-direction: column;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>

<!-- Include the header from common directory -->
<jsp:include page="/header.jsp" />

<main>
    <h1>Your Trusted Medical Appointment
        System</h1>
    <p>
        Streamline your healthcare experience with our comprehensive appointment scheduling platform.
        Connect with top doctors, manage your health records, and receive personalized care — all in one place.
    </p>
    <div class="cta-buttons">
        <a href="<%= request.getContextPath() %>/appointment/addAppointment.jsp" class="secondary-btn">Book Appointment</a>
    </div>
</main>

<footer>
    <p>&copy; 2025 MediCare | G14. All rights reserved.</p>
</footer>

</body>
</html>
