<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor Sign In</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        mint: {
                            light: '#D1FAF0',
                            DEFAULT: '#3EB489',
                            dark: '#2C9C7F',
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-mint-light min-h-screen flex items-center justify-center">
<div class="bg-white shadow-md rounded px-10 pt-8 pb-6 w-full max-w-md border-t-4 border-mint">
    <h2 class="text-2xl font-bold text-mint mb-4 text-center">
        <i class="bi bi-box-arrow-in-right"></i> Doctor Sign In
    </h2>

    <% String error = (String) request.getAttribute("errorMessage");
        if (error != null) { %>
    <div class="bg-red-100 text-red-700 p-2 rounded mb-4 text-sm">
        <i class="bi bi-exclamation-circle"></i> <%= error %>
    </div>
    <% } %>

    <form action="doctorLogin" method="post" class="space-y-4">
        <div>
            <label class="block text-gray-700 font-semibold">Doctor ID</label>
            <input type="text" name="doctorId" required pattern="DOC\d{3}"
                   title="Doctor ID must be in the format DOC001"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint uppercase"
                   placeholder="Enter Doctor ID (e.g., DOC001)" />

        </div>

        <div class="text-center">
            <button type="submit"
                    class="bg-mint hover:bg-mint-dark text-white px-6 py-2 rounded-full font-semibold">
                <i class="bi bi-arrow-right-circle-fill"></i> Sign In
            </button>
        </div>
    </form>
</div>
</body>
</html>
