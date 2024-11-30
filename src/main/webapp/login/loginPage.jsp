<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="width: 100%; max-width: 400px;">
        <h3 class="text-center mb-4">Login</h3>
        <form action="/loginServlet" method="post">
            <!-- Username Field -->
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input autofocus type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <!-- Password Field -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input  type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <!-- Remember Me -->
            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                <label class="form-check-label" for="rememberMe">Remember me</label>
            </div>
            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary w-100">Login</button>
            <!-- Forgot Password -->
            <div class="text-center mt-3">
                <a href="forgot-password.jsp" class="text-decoration-none">Forgot password?</a>
            </div>
        </form>
        <hr>
        <!-- Create Account Section -->
        <div class="text-center">
            <p class="mb-2">Don't have an account?</p>
            <a href="register.jsp" class="btn btn-outline-primary w-100">Create Account</a>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>