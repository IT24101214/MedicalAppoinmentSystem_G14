<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare - Your Health, Just a Click Away</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #e6ffff;
        }

        /* Header */
        header {
            background-color: #ffffff;
            padding: 15px 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #00a0b0;
            text-decoration: none;
        }

        nav {
            display: flex;
        }

        nav a {
            margin-left: 25px;
            text-decoration: none;
            color: #0096b1;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #00a0b0;
        }

        /* Main Content */
        .hero {
            height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 20px;
        }

        .hero-title-container {
            overflow: hidden;
            margin-bottom: 20px;
        }

        .hero-title {
            font-size: 48px;
            color: #00a0b0;
            margin-bottom: 20px;
            opacity: 0;
        }

        .hero-subtitle {
            font-size: 18px;
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 0 auto 40px;
            opacity: 0;
        }

        .cta-btn {
            background-color: #20b2c0;
            color: white;
            border: none;
            padding: 15px 35px;
            font-size: 18px;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .cta-btn:hover {
            background-color: #0090a0;
            transform: translateY(-2px);
        }

        /* Footer */
        footer {
            background-color: #00a0b0;
            color: white;
            text-align: center;
            padding: 15px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        /* Animations */
        @keyframes slideFromTop {
            0% {
                transform: translateY(-50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes slideFromBottom {
            0% {
                transform: translateY(50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .animate-title {
            animation: slideFromTop 1.5s forwards;
        }

        .animate-subtitle {
            animation: slideFromBottom 1.5s forwards;
            animation-delay: 0.7s;
        }

        .animate-btn {
            animation: fadeIn 1s forwards;
            animation-delay: 1.5s;
            opacity: 0;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<header>
    <a href="index.jsp" class="logo">MediCare</a>
    <nav>
        <a href="#">Availability</a>
        <a href="index.jsp">Home</a>
        <a href="addPayment.jsp">Payment</a>
        <a href="feedbackList.jsp">Feedback</a>


        <a href="Login.jsp">Login</a>
    </nav>
</header>

<main class="hero">
    <div class="hero-title-container">
        <h1 class="hero-title animate-title">Your Health, Just a Click Away</h1>
    </div>
    <p class="hero-subtitle animate-subtitle">Streamline your healthcare experience with our all-in-one appointment scheduling platform. Connect with doctors, manage your health records, and receive personalized care — all in one place</p>
    <button class="cta-btn animate-btn" onclick="window.location.href='appointment.jsp'">BOOK APPOINTMENT</button>
</main>

<footer>
    <p>© 2025 Medicare. All Right Reserved</p>
</footer>

<script>
    // Ensure animations trigger on page load
    document.addEventListener('DOMContentLoaded', function() {
        const title = document.querySelector('.hero-title');
        const subtitle = document.querySelector('.hero-subtitle');
        const ctaBtn = document.querySelector('.cta-btn');

        // Force reflow to make animations work properly
        void title.offsetWidth;
        void subtitle.offsetWidth;
        void ctaBtn.offsetWidth;

        // Add animation classes
        title.classList.add('animate-title');
        subtitle.classList.add('animate-subtitle');
        ctaBtn.classList.add('animate-btn');
    });
</script>
</body>
</html>