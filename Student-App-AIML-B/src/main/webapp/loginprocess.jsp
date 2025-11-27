<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Gaming Hub</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background: linear-gradient(135deg, #0f0f23 0%, #1a0b2e 50%, #16213e 100%);
  min-height: 100vh;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

/* Animated Background */
.bg-animation {
  position: fixed;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
  z-index: 0;
}

.bg-circle {
  position: absolute;
  border-radius: 50%;
  filter: blur(80px);
  opacity: 0.1;
}

.bg-circle-1 {
  width: 400px;
  height: 400px;
  background: #9333ea;
  top: 0;
  left: 0;
  animation: float 8s ease-in-out infinite;
}

.bg-circle-2 {
  width: 400px;
  height: 400px;
  background: #06b6d4;
  bottom: 0;
  right: 0;
  animation: float 10s ease-in-out infinite reverse;
}

@keyframes float {
  0%, 100% { transform: translate(0, 0); }
  50% { transform: translate(50px, 50px); }
}

.login-container {
  width: 100%;
  max-width: 420px;
  position: relative;
  z-index: 1;
}

.login-card {
  background: rgba(30, 30, 60, 0.8);
  border: 1px solid rgba(147, 51, 234, 0.3);
  border-radius: 16px;
  padding: 40px;
  backdrop-filter: blur(10px);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.login-header {
  text-align: center;
  margin-bottom: 32px;
}

.logo {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  margin-bottom: 16px;
}

.logo-icon {
  font-size: 32px;
}

.logo-text {
  font-size: 28px;
  font-weight: 900;
  background: linear-gradient(90deg, #a855f7 0%, #06b6d4 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.login-title {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 8px;
}

.login-subtitle {
  color: #94a3b8;
  font-size: 14px;
}

.form-group {
  margin-bottom: 20px;
}

.form-label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #cbd5e1;
}

.form-input {
  width: 100%;
  padding: 14px 16px;
  background: rgba(15, 15, 35, 0.7);
  border: 1px solid rgba(147, 51, 234, 0.3);
  border-radius: 8px;
  color: white;
  font-size: 16px;
  transition: all 0.3s ease;
}

.form-input:focus {
  outline: none;
  border-color: #9333ea;
  box-shadow: 0 0 0 3px rgba(147, 51, 234, 0.2);
}

.form-input::placeholder {
  color: #64748b;
}

.remember-forgot {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.remember-me {
  display: flex;
  align-items: center;
  gap: 8px;
}

.remember-me input {
  accent-color: #9333ea;
}

.forgot-password {
  color: #06b6d4;
  text-decoration: none;
  font-size: 14px;
  transition: color 0.3s ease;
}

.forgot-password:hover {
  color: #a855f7;
}

.login-btn {
  width: 100%;
  padding: 14px;
  background: linear-gradient(90deg, #9333ea 0%, #06b6d4 100%);
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 700;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}

.login-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 25px rgba(147, 51, 234, 0.5);
}

.divider {
  display: flex;
  align-items: center;
  margin: 24px 0;
  color: #64748b;
}

.divider::before,
.divider::after {
  content: "";
  flex: 1;
  height: 1px;
  background: rgba(100, 116, 139, 0.3);
}

.divider-text {
  padding: 0 12px;
  font-size: 14px;
}

.social-login {
  display: flex;
  gap: 12px;
  margin-bottom: 24px;
}

.social-btn {
  flex: 1;
  padding: 12px;
  background: rgba(15, 15, 35, 0.7);
  border: 1px solid rgba(147, 51, 234, 0.3);
  border-radius: 8px;
  color: white;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}

.social-btn:hover {
  background: rgba(30, 30, 60, 0.8);
  border-color: #9333ea;
}

.register-link {
  text-align: center;
  color: #94a3b8;
  font-size: 14px;
}

.register-link a {
  color: #06b6d4;
  text-decoration: none;
  font-weight: 600;
  transition: color 0.3s ease;
}

.register-link a:hover {
  color: #a855f7;
}

/* Error message styling */
.error-message {
  background: rgba(239, 68, 68, 0.2);
  border: 1px solid rgba(239, 68, 68, 0.3);
  color: #fca5a5;
  padding: 12px;
  border-radius: 8px;
  margin-bottom: 20px;
  font-size: 14px;
  display: none;
}

/* Success message styling */
.success-message {
  background: rgba(34, 197, 94, 0.2);
  border: 1px solid rgba(34, 197, 94, 0.3);
  color: #4ade80;
  padding: 12px;
  border-radius: 8px;
  margin-bottom: 20px;
  font-size: 14px;
  display: none;
}

/* Responsive design */
@media (max-width: 480px) {
  .login-card {
    padding: 30px 20px;
  }

  .social-login {
    flex-direction: column;
  }

  .remember-forgot {
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
  }
}
</style>
</head>
<body>

<div class="bg-animation">
  <div class="bg-circle bg-circle-1"></div>
  <div class="bg-circle bg-circle-2"></div>
</div>

<div class="login-container">
  <div class="login-card">
    <div class="login-header">
      <div class="logo">
        <span class="logo-icon">🎮</span>
        <span class="logo-text">GAMER HUB</span>
      </div>
      <h1 class="login-title">Welcome Back</h1>
      <p class="login-subtitle">Sign in to your account</p>
    </div>

    <!-- Error message (hidden by default) -->
    <div class="error-message" id="errorMessage">
      Invalid username or password. Please try again.
    </div>

    <!-- Success message (hidden by default) -->
    <div class="success-message" id="successMessage">
      Login successful! Redirecting to your dashboard...
    </div>

    <form id="loginForm" action="dashboard.jsp" method="post">
      <div class="form-group">
        <label for="username" class="form-label">Username or Email</label>
        <input type="text" id="username" name="username" class="form-input" placeholder="Enter your username or email" required>
      </div>

      <div class="form-group">
        <label for="password" class="form-label">Password</label>
        <input type="password" id="password" name="password" class="form-input" placeholder="Enter your password" required>
      </div>

      <div class="remember-forgot">
        <label class="remember-me">
          <input type="checkbox" name="remember">
          <span>Remember me</span>
        </label>
        <a href="#" class="forgot-password">Forgot Password?</a>
      </div>

      <button type="submit" class="login-btn">
        <span>🎮</span>
        <span>Sign In</span>
      </button>
    </form>

    <div class="divider">
      <span class="divider-text">or continue with</span>
    </div>

    <div class="social-login">
      <button type="button" class="social-btn">
        <span>🔵</span>
        <span>Discord</span>
      </button>
      <button type="button" class="social-btn">
        <span>📱</span>
        <span>Google</span>
      </button>
    </div>

    <div class="register-link">
      Don't have an account? <a href="register.jsp">Create one now</a>
    </div>
  </div>
</div>

<script>
// Simple form validation and demo functionality
document.getElementById('loginForm').addEventListener('submit', function(e) {
  e.preventDefault();

  const username = document.getElementById('username').value;
  const password = document.getElementById('password').value;
  const errorMessage = document.getElementById('errorMessage');
  const successMessage = document.getElementById('successMessage');

  // Hide previous messages
  errorMessage.style.display = 'none';
  successMessage.style.display = 'none';

  // Simple validation (in a real app, this would be server-side)
  if (username === '' || password === '') {
    errorMessage.textContent = 'Please fill in all fields.';
    errorMessage.style.display = 'block';
    return;
  }

  // Demo login - in a real app, this would be a server request
  if (username === 'ShadowHunter' && password === 'gamer123') {
    successMessage.style.display = 'block';
    // Redirect to dashboard after a short delay
    setTimeout(function() {
      window.location.href = 'dashboard.jsp';
    }, 1500);
  } else {
    errorMessage.textContent = 'Invalid username or password. Try: ShadowHunter / gamer123';
    errorMessage.style.display = 'block';
  }
});

// Demo credentials helper
document.getElementById('username').addEventListener('focus', function() {
  if (this.value === '') {
    this.value = 'ShadowHunter';
  }
});

document.getElementById('password').addEventListener('focus', function() {
  if (this.value === '') {
    this.value = 'gamer123';
    this.type = 'text';
    setTimeout(() => {
      this.type = 'password';
    }, 2000);
  }
});
</script>

</body>
</html>