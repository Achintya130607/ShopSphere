<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Login</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            min-height: 100vh;
            background:
                radial-gradient(circle at 15% 10%, rgba(59,130,246,.18), transparent 28%),
                radial-gradient(circle at 90% 80%, rgba(124,58,237,.16), transparent 28%),
                linear-gradient(135deg,#eef4ff,#f7f5ff,#f9fbff);
        }

        .page {
            padding: 70px 20px;
        }

        .auth-card {
            max-width: 460px;
            margin: auto;
            padding: 38px;
            border-radius: 28px;
            background: rgba(255,255,255,.92);
            box-shadow: 0 25px 60px rgba(30,41,59,.12);
            border: 1px solid rgba(255,255,255,.95);
            backdrop-filter: blur(12px);
        }

        .logo {
            width: 74px;
            height: 74px;
            margin: auto auto 18px;
            border-radius: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 34px;
            color: white;
            background: linear-gradient(135deg,#2563eb,#7c3aed);
        }

        h1 {
            text-align: center;
            margin: 0 0 8px;
            font-size: 34px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 28px;
        }

        .error {
            padding: 12px;
            border-radius: 12px;
            background: #fef2f2;
            color: #b91c1c;
            text-align: center;
            font-weight: bold;
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin: 12px 0 7px;
            font-weight: bold;
            color: #334155;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 12px;
            outline: none;
            font-size: 15px;
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,.12);
        }

        /* Password field */
        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input {
            padding-right: 50px;
        }

        .eye-button {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: auto;
            margin: 0;
            padding: 4px;
            border: none;
            background: transparent;
            box-shadow: none;
            color: #64748b;
            font-size: 20px;
            cursor: pointer;
        }

        .eye-button:hover {
            background: transparent;
            color: #4f46e5;
            box-shadow: none;
        }

        button[type="submit"] {
            width: 100%;
            margin-top: 20px;
            padding: 14px;
            border: 0;
            border-radius: 13px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
            box-shadow: 0 12px 25px rgba(37,99,235,.22);
        }

        button[type="submit"]:hover {
            transform: translateY(-1px);
        }

        .bottom {
            text-align: center;
            margin-top: 22px;
            color: #64748b;
        }

        .bottom a {
            color: #4f46e5;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="page">

    <div class="auth-card">

        <div class="logo">🛍️</div>

        <h1>Welcome Back</h1>

        <div class="subtitle">
            Login to your ShopSphere account
        </div>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <div class="error">
                Invalid email or password.
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">

            <label>Email</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <label>Password</label>

            <div class="password-wrapper">

                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Enter your password"
                       required>

                <button type="button"
                        class="eye-button"
                        id="togglePassword"
                        onclick="togglePassword()"
                        aria-label="Show password">
                    👁️
                </button>

            </div>

            <button type="submit">
                Login →
            </button>

        </form>

        <div class="bottom">
            Don't have an account?
            <a href="${pageContext.request.contextPath}/register">
                Create Account
            </a>
        </div>

    </div>

</div>

<script>
    function togglePassword() {

        const password = document.getElementById("password");
        const toggleButton = document.getElementById("togglePassword");

        if (password.type === "password") {

            password.type = "text";
            toggleButton.textContent = "🙈";
            toggleButton.setAttribute("aria-label", "Hide password");

        } else {

            password.type = "password";
            toggleButton.textContent = "👁️";
            toggleButton.setAttribute("aria-label", "Show password");

        }
    }
</script>

</body>
</html>