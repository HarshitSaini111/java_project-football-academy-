<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Football Academy - Player Registration</title>
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
      margin-bottom: 36px;
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

    label .required {
      color: #e53e3e;
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

    .buttons {
      display: flex;
      gap: 12px;
      margin-top: 32px;
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

    .footer-links {
      text-align: center;
      margin-top: 28px;
      padding-top: 24px;
      border-top: 1px solid #e2e8f0;
    }

    .footer-links p {
      color: #718096;
      font-size: 14px;
      margin-bottom: 8px;
    }

    .footer-links a {
      color: #667eea;
      text-decoration: none;
      font-weight: 700;
      transition: all 0.3s ease;
    }

    .footer-links a:hover {
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
      <p>Join Our Elite Squad</p>
    </div>

    <%
    String error = request.getParameter("error");
    if("failed".equals(error)) {
    %>
        <div class="error-message">
            Registration Failed! Try Again
        </div>
    <%
    } else if("exists".equals(error)) {
    %>
        <div class="error-message">
            Mobile Number Already Registered!
        </div>
    <%
    } else if("empty".equals(error)) {
    %>
        <div class="error-message">
            All Fields Are Required!
        </div>
    <%
    } else if("invalid_mobile".equals(error)) {
    %>
        <div class="error-message">
            Invalid Mobile Number Format!
        </div>
    <%
    }
    %>

    <form name="f1" method="post" action="reg.jsp">
      <div class="form-group">
        <label for="playerName">Player Name <span class="required">*</span></label>
        <input type="text" id="playerName" name="t1" placeholder="Enter your full name" required>
      </div>

      <div class="form-group">
        <label for="mobile">Mobile Number <span class="required">*</span></label>
        <input type="text" id="mobile" name="t2" placeholder="10-digit number" pattern="[0-9]{10}" required>
      </div>

      <div class="form-group">
        <label for="address">Address <span class="required">*</span></label>
        <input type="text" id="address" name="t3" placeholder="Your location" required>
      </div>

      <div class="form-group">
        <label for="password">Password <span class="required">*</span></label>
        <input type="password" id="password" name="t4" placeholder="Create strong password" minlength="6" required>
      </div>

      <div class="buttons">
        <input type="submit" value="Join Squad">
        <input type="reset" value="Reset">
      </div>
    </form>

    <div class="footer-links">
      <p>Already Registered?</p>
      <a href="login.jsp">Login to Your Account</a>
    </div>
  </div>
</body>
</html>