<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Get parameters and trim them
String mob = request.getParameter("t1");
String pass = request.getParameter("t2");

// Validate inputs
if(mob == null || pass == null || mob.trim().isEmpty() || pass.trim().isEmpty()) {
    response.sendRedirect("login.jsp?error=empty");
    return;
}

// Trim the values
mob = mob.trim();
pass = pass.trim();

String url = "jdbc:mysql://localhost:3306/aimlb";
String user = "root";
String password = "admin@123";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);

    // Use PreparedStatement to prevent SQL injection
    String sql = "SELECT * FROM student WHERE mobile=? AND password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, mob);
    pstmt.setString(2, pass);
    rs = pstmt.executeQuery();

    if(rs.next()) {
        // Login successful - set session attributes
        session.setAttribute("smob", mob);
        session.setAttribute("spass", pass);

        // Redirect to dashboard
        response.sendRedirect("dashboard.jsp");
    } else {
        // Invalid credentials
        response.sendRedirect("login.jsp?error=invalid");
    }

} catch(ClassNotFoundException e) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Error - Football Academy</title>
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

        .error-container {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            padding: 48px;
            max-width: 600px;
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

        .error-icon {
            font-size: 72px;
            margin-bottom: 24px;
        }

        h2 {
            color: #1a202c;
            font-size: 28px;
            margin-bottom: 12px;
            font-weight: 800;
            letter-spacing: 0.5px;
        }

        h3 {
            color: #667eea;
            font-size: 18px;
            margin-bottom: 24px;
            font-weight: 600;
        }

        .error-message {
            background: linear-gradient(135deg, #fef3c7 0%, #fee2e2 100%);
            color: #92400e;
            padding: 20px;
            border-radius: 12px;
            margin: 24px 0;
            font-family: 'Courier New', monospace;
            font-size: 13px;
            border: 1px solid #fcd34d;
            word-break: break-word;
            line-height: 1.6;
        }

        .back-button {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #ffffff;
            padding: 12px 36px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-top: 28px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            font-size: 14px;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        .back-button:active {
            transform: translateY(0);
        }

        .error-details {
            background: #f8fafc;
            padding: 16px;
            border-radius: 10px;
            margin: 16px 0;
            font-size: 13px;
            color: #64748b;
            border-left: 4px solid #667eea;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚙️</div>
        <h2>Database Driver Error</h2>
        <h3>MySQL JDBC Driver not found</h3>
        <div class="error-details">
            The MySQL JDBC driver is not configured on your server. Please ensure the driver JAR file is in the classpath.
        </div>
        <div class="error-message">
            <%= e.getMessage() %>
        </div>
        <a href="login.jsp" class="back-button">← Back to Login</a>
    </div>
</body>
</html>
<%
} catch(SQLException e) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Error - Football Academy</title>
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

        .error-container {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            padding: 48px;
            max-width: 600px;
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

        .error-icon {
            font-size: 72px;
            margin-bottom: 24px;
        }

        h2 {
            color: #1a202c;
            font-size: 28px;
            margin-bottom: 12px;
            font-weight: 800;
            letter-spacing: 0.5px;
        }

        h3 {
            color: #667eea;
            font-size: 18px;
            margin-bottom: 24px;
            font-weight: 600;
        }

        .error-message {
            background: linear-gradient(135deg, #fef3c7 0%, #fee2e2 100%);
            color: #92400e;
            padding: 20px;
            border-radius: 12px;
            margin: 24px 0;
            font-family: 'Courier New', monospace;
            font-size: 13px;
            border: 1px solid #fcd34d;
            word-break: break-word;
            line-height: 1.6;
        }

        .back-button {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #ffffff;
            padding: 12px 36px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-top: 28px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            font-size: 14px;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        .back-button:active {
            transform: translateY(0);
        }

        .error-details {
            background: #f8fafc;
            padding: 16px;
            border-radius: 10px;
            margin: 16px 0;
            font-size: 13px;
            color: #64748b;
            border-left: 4px solid #667eea;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">🔌</div>
        <h2>Database Connection Error</h2>
        <h3>Could not connect to database</h3>
        <div class="error-details">
            Please verify that the MySQL database server is running and the connection parameters are correct.
        </div>
        <div class="error-message">
            Error: <%= e.getMessage() %>
        </div>
        <a href="login.jsp" class="back-button">← Back to Login</a>
    </div>
</body>
</html>
<%
} catch(Exception e) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Error - Football Academy</title>
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

        .error-container {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            padding: 48px;
            max-width: 600px;
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

        .error-icon {
            font-size: 72px;
            margin-bottom: 24px;
        }

        h2 {
            color: #1a202c;
            font-size: 28px;
            margin-bottom: 12px;
            font-weight: 800;
            letter-spacing: 0.5px;
        }

        h3 {
            color: #c53030;
            font-size: 16px;
            margin-bottom: 24px;
            font-weight: 600;
        }

        .error-details {
            background: #f8fafc;
            padding: 16px;
            border-radius: 10px;
            margin: 16px 0;
            font-size: 13px;
            color: #64748b;
            border-left: 4px solid #e53e3e;
        }

        .back-button {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #ffffff;
            padding: 12px 36px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-top: 28px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            font-size: 14px;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        .back-button:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚠️</div>
        <h2>Login Error</h2>
        <h3>An unexpected error occurred</h3>
        <div class="error-details">
            <%= e.getMessage() %>
        </div>
        <a href="login.jsp" class="back-button">← Back to Login</a>
    </div>
</body>
</html>
<%
} finally {
    // Close resources properly
    try {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    } catch(SQLException e) {
        // Log the error
        e.printStackTrace();
    }
}
%>