<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Football Academy - Login</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .container {
      background: #ffffff;
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
      padding: 48px;
      max-width: 480px;
      width: 100%;
      animation: slideIn 0.6s ease-out;
    }

    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateY(-30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .header {
      text-align: center;
      margin-bottom: 32px;
    }

    .header .icon {
      font-size: 56px;
      margin-bottom: 16px;
      display: inline-block;
    }

    .header h2 {
      color: #1a202c;
      font-size: 28px;
      margin-bottom: 8px;
      font-weight: 800;
      letter-spacing: 0.5px;
    }

    .header p {
      color: #667eea;
      font-size: 14px;
      font-weight: 600;
      letter-spacing: 0.5px;
    }

    .welcome-text {
      text-align: center;
      color: #4a5568;
      margin-bottom: 28px;
      font-size: 15px;
      font-weight: 500;
    }

    .error-message {
      background: linear-gradient(135deg, #fee 0%, #fdd 100%);
      color: #c53030;
      padding: 14px 16px;
      border-radius: 12px;
      margin-bottom: 24px;
      text-align: center;
      font-weight: 600;
      font-size: 13px;
      border: 1px solid #fc8181;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }

    .error-message::before {
      content: '⚠️';
    }

    .form-group {
      margin-bottom: 24px;
    }

    label {
      display: block;
      color: #2d3748;
      font-weight: 600;
      margin-bottom: 8px;
      font-size: 13px;
      letter-spacing: 0.3px;
    }

    .input-wrapper {
      position: relative;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 12px 16px;
      border: 2px solid #e2e8f0;
      border-radius: 10px;
      font-size: 14px;
      transition: all 0.3s ease;
      background: #f8fafc;
      color: #1a202c;
      font-weight: 500;
    }

    input::placeholder {
      color: #a0aec0;
    }

    input:focus {
      outline: none;
      border-color: #667eea;
      background: #ffffff;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    .forgot-password {
      text-align: right;
      margin-top: 8px;
    }

    .forgot-password a {
      color: #667eea;
      text-decoration: none;
      font-size: 12px;
      transition: all 0.3s ease;
      font-weight: 600;
    }

    .forgot-password a:hover {
      color: #764ba2;
      text-decoration: underline;
    }

    .remember-me {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-top: 16px;
      margin-bottom: 24px;
      font-size: 13px;
      color: #4a5568;
      font-weight: 500;
    }

    .remember-me input[type="checkbox"] {
      width: 18px;
      height: 18px;
      cursor: pointer;
      accent-color: #667eea;
      border-radius: 4px;
    }

    .remember-me label {
      margin: 0;
      font-weight: 500;
      cursor: pointer;
      color: #4a5568;
    }

    .buttons {
      display: flex;
      gap: 12px;
      margin-top: 28px;
    }

    input[type="submit"],
    input[type="reset"] {
      flex: 1;
      padding: 12px 20px;
      border: none;
      border-radius: 10px;
      font-size: 14px;
      font-weight: 700;
      cursor: pointer;
      transition: all 0.3s ease;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    input[type="submit"] {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: #ffffff;
      box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    }

    input[type="submit"]:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
    }

    input[type="submit"]:active {
      transform: translateY(0);
    }

    input[type="reset"] {
      background: #e2e8f0;
      color: #2d3748;
      border: 1px solid #cbd5e0;
    }

    input[type="reset"]:hover {
      background: #cbd5e0;
      transform: translateY(-2px);
    }

    .divider {
      display: flex;
      align-items: center;
      margin: 28px 0;
      color: #a0aec0;
      font-size: 12px;
      font-weight: 600;
    }

    .divider::before,
    .divider::after {
      content: '';
      flex: 1;
      height: 1px;
      background: #e2e8f0;
    }

    .divider::before {
      margin-right: 12px;
    }

    .divider::after {
      margin-left: 12px;
    }

    .signup-section {
      text-align: center;
      padding-top: 20px;
      border-top: 1px solid #e2e8f0;
    }

    .signup-section p {
      color: #718096;
      font-size: 14px;
      margin-bottom: 10px;
      font-weight: 500;
    }

    .signup-section a {
      color: #667eea;
      text-decoration: none;
      font-weight: 700;
      font-size: 14px;
      transition: all 0.3s ease;
    }

    .signup-section a:hover {
      color: #764ba2;
      text-decoration: underline;
    }

    @media (max-width: 480px) {
      .container {
        padding: 32px 24px;
      }

      .header h2 {
        font-size: 24px;
      }

      input[type="text"],
      input[type="password"] {
        font-size: 16px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <div class="icon">⚽</div>
      <h2>Football Academy</h2>
      <p>Train With The Best</p>
    </div>

    <div class="welcome-text">
      Welcome back! Login to access your training portal
    </div>

    <%
    String error = request.getParameter("error");
    if("invalid".equals(error)) {
    %>
        <div class="error-message">
            Invalid Credentials! Try Again
        </div>
    <%
    }
    %>

    <form name="f1" method="post" action="logins.jsp">
      <div class="form-group">
        <label for="mobile">Mobile Number</label>
        <div class="input-wrapper">
          <input type="text" id="mobile" name="t1" placeholder="Enter your mobile number" pattern="[0-9]{10}" required>
        </div>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <div class="input-wrapper">
          <input type="password" id="password" name="t2" placeholder="Enter your password" required>
        </div>
        <div class="forgot-password">
          <a href="forgot-password.jsp">Forgot Password?</a>
        </div>
      </div>

      <div class="remember-me">
        <input type="checkbox" id="remember" name="remember">
        <label for="remember">Remember me</label>
      </div>

      <div class="buttons">
        <input type="submit" value="Login">
        <input type="reset" value="Clear">
      </div>
    </form>

    <div class="divider">OR</div>

    <div class="signup-section">
      <p>New to Football Academy?</p>
      <a href="index.jsp">Join Our Squad</a>
    </div>
  </div>
</body>
</html>