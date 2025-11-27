<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Get form parameters
String name = request.getParameter("t1");
String mobile = request.getParameter("t2");
String address = request.getParameter("t3");
String password = request.getParameter("t4");

// Validate inputs
if(name == null || mobile == null || address == null || password == null ||
   name.trim().isEmpty() || mobile.trim().isEmpty() || address.trim().isEmpty() || password.trim().isEmpty()) {
    response.sendRedirect("index.jsp?error=empty");
    return;
}

// Trim all values
name = name.trim();
mobile = mobile.trim();
address = address.trim();
password = password.trim();

// Validate mobile number format
if(!mobile.matches("\\d{10}")) {
    response.sendRedirect("index.jsp?error=invalid_mobile");
    return;
}

String url = "jdbc:mysql://localhost:3306/aimlb";
String user = "root";
String dbPassword = "admin@123";

Connection conn = null;
PreparedStatement checkStmt = null;
PreparedStatement insertStmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, dbPassword);

    // Check if mobile already exists
    String checkSql = "SELECT mobile FROM student WHERE mobile=?";
    checkStmt = conn.prepareStatement(checkSql);
    checkStmt.setString(1, mobile);
    rs = checkStmt.executeQuery();

    if(rs.next()) {
        // Mobile already exists
        response.sendRedirect("index.jsp?error=exists");
        return;
    }

    // Insert new student
    String insertSql = "INSERT INTO student (name, mobile, address, password) VALUES (?, ?, ?, ?)";
    insertStmt = conn.prepareStatement(insertSql);
    insertStmt.setString(1, name);
    insertStmt.setString(2, mobile);
    insertStmt.setString(3, address);
    insertStmt.setString(4, password);

    int result = insertStmt.executeUpdate();

    if(result > 0) {
        // Registration successful - redirect to login with success message
        response.sendRedirect("login.jsp?success=registered");
    } else {
        // Registration failed
        response.sendRedirect("index.jsp?error=failed");
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

        .error-details {
            background: #f8fafc;
            padding: 16px;
            border-radius: 10px;
            margin: 16px 0;
            font-size: 13px;
            color: #64748b;
            border-left: 4px solid #667eea;
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
        <div class="error-icon">⚙️</div>
        <h2>Database Driver Error</h2>
        <h3>MySQL JDBC Driver not found</h3>
        <div class="error-details">
            The MySQL JDBC driver is not configured on your server. Please ensure the driver JAR file is in the classpath.
        </div>
        <div class="error-message">
            <%= e.getMessage() %>
        </div>
        <a href="index.jsp" class="back-button">← Back to Registration</a>
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

        .error-details {
            background: #f8fafc;
            padding: 16px;
            border-radius: 10px;
            margin: 16px 0;
            font-size: 13px;
            color: #64748b;
            border-left: 4px solid #667eea;
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
        <div class="error-icon">🔌</div>
        <h2>Database Connection Error</h2>
        <h3>Could not complete registration</h3>
        <div class="error-details">
            Please verify that the MySQL database server is running and the connection parameters are correct.
        </div>
        <div class="error-message">
            Error: <%= e.getMessage() %>
        </div>
        <a href="index.jsp" class="back-button">← Back to Registration</a>
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
    <title>Registration Error - Football Academy</title>
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
        <div class="error-icon"></div>
        <h2>Registration Error</h2>
        <h3>An unexpected error occurred</h3>
        <div class="error-details">
            <%= e.getMessage() %>
        </div>
        <a href="index.jsp" class="back-button">← Back to Registration</a>
    </div>
</body>
</html>
<%
} finally {
    // Close all resources
    try {
        if(rs != null) rs.close();
        if(checkStmt != null) checkStmt.close();
        if(insertStmt != null) insertStmt.close();
        if(conn != null) conn.close();
    } catch(SQLException e) {
        e.printStackTrace();
    }
}
%>