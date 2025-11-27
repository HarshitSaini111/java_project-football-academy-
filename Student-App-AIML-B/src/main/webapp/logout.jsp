<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Logging Out - Football Academy</title>
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

    .logout-container {
      background: #ffffff;
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
      padding: 48px 40px;
      max-width: 480px;
      width: 100%;
      text-align: center;
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

    .logout-icon {
      font-size: 72px;
      margin-bottom: 24px;
      animation: fadeInOut 2s ease-in-out infinite;
    }

    @keyframes fadeInOut {
      0%, 100% {
        opacity: 1;
        transform: scale(1);
      }
      50% {
        opacity: 0.7;
        transform: scale(1.05);
      }
    }

    h2 {
      color: #1a202c;
      font-size: 28px;
      margin-bottom: 12px;
      font-weight: 800;
      letter-spacing: 0.5px;
    }

    p {
      color: #4a5568;
      font-size: 15px;
      margin-bottom: 28px;
      line-height: 1.6;
      font-weight: 500;
    }

    .spinner {
      width: 56px;
      height: 56px;
      border: 4px solid #e2e8f0;
      border-top: 4px solid #667eea;
      border-radius: 50%;
      animation: spin 1s linear infinite;
      margin: 28px auto;
      box-shadow: 0 0 16px rgba(102, 126, 234, 0.2);
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    .message {
      color: #667eea;
      font-size: 13px;
      font-weight: 700;
      margin-top: 24px;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .footer-note {
      margin-top: 32px;
      padding-top: 24px;
      border-top: 1px solid #e2e8f0;
      color: #a0aec0;
      font-size: 13px;
      font-weight: 600;
      letter-spacing: 0.5px;
    }

    .status-box {
      background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
      border: 1px solid #c7d2fe;
      border-radius: 12px;
      padding: 16px;
      margin: 24px 0;
      color: #3730a3;
      font-size: 13px;
      font-weight: 600;
    }
  </style>
</head>
<body>

  <div class="logout-container">
    <div class="logout-icon"></div>
    <h2>See You Soon!</h2>
    <p>Thanks for training with us! Your session is being safely terminated.</p>

    <div class="status-box">
      ✓ Session Cleared
    </div>

    <div class="spinner"></div>

    <p class="message">Redirecting to login page...</p>

    <div class="footer-note">
      Keep up the great work! See you on the field soon
    </div>
  </div>

  <%
    session.invalidate();
    response.setHeader("Refresh", "2; URL=login.jsp");
  %>

</body>
</html>