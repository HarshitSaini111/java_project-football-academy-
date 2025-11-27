<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Football Academy Dashboard</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
  min-height: 100vh;
  color: #2d3748;
}

.container {
  display: flex;
  min-height: 100vh;
}

/* Sidebar Styles */
.sidebar {
  width: 280px;
  background: linear-gradient(180deg, #1a1f3a 0%, #16213e 100%);
  padding: 30px 20px;
  position: fixed;
  height: 100vh;
  overflow-y: auto;
  box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
  z-index: 100;
}

.sidebar-header {
  text-align: center;
  margin-bottom: 40px;
}

.sidebar-icon {
  font-size: 48px;
  margin-bottom: 15px;
  animation: bounce 2s infinite;
}

@keyframes bounce {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}

.sidebar h2 {
  color: #ffffff;
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 8px;
}

.sidebar .subtitle {
  color: #a0aec0;
  font-size: 12px;
  font-weight: 500;
}

.nav {
  list-style: none;
}

.nav li {
  margin: 12px 0;
}

.nav a {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 16px;
  color: #cbd5e0;
  text-decoration: none;
  border-radius: 10px;
  transition: all 0.3s ease;
  font-size: 14px;
  font-weight: 600;
}

.nav a:hover,
.nav a.active {
  background: rgba(59, 130, 246, 0.2);
  color: #3b82f6;
}

/* Main Content */
.main-content {
  flex: 1;
  margin-left: 280px;
  padding: 30px;
}

/* Topbar */
.topbar {
  background: #ffffff;
  padding: 28px 32px;
  border-radius: 16px;
  margin-bottom: 30px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
}

.topbar h1 {
  color: #1a202c;
  font-size: 32px;
  margin-bottom: 18px;
  font-weight: 800;
}

.player-info {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.info-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 10px 16px;
  background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
  border-radius: 10px;
  font-size: 14px;
  font-weight: 600;
  border: 1px solid #c7d2fe;
}

.info-label {
  color: #3b82f6;
  font-weight: 700;
}

.info-item span:last-child {
  color: #1e293b;
}

/* Dashboard Cards */
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.card {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  border: 1px solid #e2e8f0;
  position: relative;
  overflow: hidden;
}

.card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, #3b82f6, #06b6d4);
}

.card:hover {
  transform: translateY(-6px);
  box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
}

.card h3 {
  color: #64748b;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 12px;
}

.card p {
  color: #0f172a;
  font-size: 36px;
  font-weight: 700;
  margin-top: 8px;
}

.card-subtitle {
  color: #94a3b8;
  font-size: 13px;
  margin-top: 8px;
  font-weight: 500;
}

/* Stats Section */
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.stat-card {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
}

.stat-card h3 {
  color: #0f172a;
  margin-bottom: 20px;
  font-size: 18px;
  font-weight: 700;
}

.stat-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 14px 0;
  border-bottom: 1px solid #f1f5f9;
  font-size: 14px;
}

.stat-item:last-child {
  border-bottom: none;
}

.stat-label {
  color: #64748b;
  font-weight: 600;
}

.stat-value {
  font-weight: 700;
  color: #3b82f6;
  font-size: 18px;
}

/* Activity Section */
.activity {
  background: #ffffff;
  padding: 30px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
  margin-bottom: 30px;
}

.activity h2 {
  color: #0f172a;
  margin-bottom: 22px;
  font-size: 20px;
  font-weight: 700;
}

.activity ul {
  list-style: none;
}

.activity li {
  padding: 16px 18px;
  margin: 12px 0;
  background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
  border-radius: 12px;
  color: #334155;
  font-size: 14px;
  border-left: 4px solid #3b82f6;
  transition: all 0.3s ease;
  font-weight: 500;
}

.activity li:hover {
  background: linear-gradient(135deg, #eff6ff 0%, #e0e7ff 100%);
  transform: translateX(8px);
  border-left-color: #06b6d4;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
}

/* Responsive */
@media (max-width: 768px) {
  .sidebar {
    width: 70px;
    padding: 20px 10px;
  }

  .sidebar h2,
  .sidebar .subtitle,
  .nav a span {
    display: none;
  }

  .sidebar-icon {
    font-size: 32px;
    margin-bottom: 20px;
  }

  .nav a {
    justify-content: center;
    padding: 12px;
  }

  .main-content {
    margin-left: 70px;
    padding: 20px;
  }

  .topbar {
    padding: 20px;
  }

  .topbar h1 {
    font-size: 24px;
  }

  .cards {
    grid-template-columns: 1fr;
  }

  .player-info {
    flex-direction: column;
  }

  .info-item {
    width: 100%;
  }
}
</style>
</head>
<body>

<div class="container">

  <!-- Sidebar -->
  <aside class="sidebar">
    <div class="sidebar-header">
      <div class="sidebar-icon"></div>
      <h2>Football Academy</h2>
      <p class="subtitle">Train With The Best</p>
    </div>
    <ul class="nav">
      <li>
        <a href="dashboard.jsp" class="active">
          <span>Dashboard</span>
        </a>
      </li>
      <li>
        <a href="profile.jsp">
          <span>Profile</span>
        </a>
      </li>
      <li>
        <a href="performance.jsp">
          <span>Performance</span>
        </a>
      </li>
      <li>
        <a href="training.jsp">
          <span>Training</span>
        </a>
      </li>
      <li>
        <a href="matches.jsp">
          <span>Matches</span>
        </a>
      </li>
      <li>
        <a href="team.jsp">
          <span>My Team</span>
        </a>
      </li>
      <li>
        <a href="logout.jsp">
          <span>Logout</span>
        </a>
      </li>
    </ul>
  </aside>

  <!-- Main Content -->
  <main class="main-content">

    <!-- Topbar -->
    <header class="topbar">
      <%
        String mob, pass, playerName = "", playerAddr = "";
        int goals = 0, matches = 0, assists = 0;
        double rating = 0.0;

        mob = (String) session.getAttribute("smob");
        pass = (String) session.getAttribute("spass");

        String url = "jdbc:mysql://localhost:3306/aimlb";
        String user = "root";
        String password = "admin@123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM student WHERE mobile='" + mob + "'");

            if(rs.next()) {
                playerName = rs.getString("name");
                playerAddr = rs.getString("address");

                goals = 34;
                matches = 48;
                assists = 22;
                rating = 8.5;
            }
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
      %>

      <h1>Welcome Back, <%= playerName %>!</h1>

      <div class="player-info">
        <div class="info-item">
          <span class="info-label">Mobile:</span>
          <span><%= mob %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Location:</span>
          <span><%= playerAddr %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Position:</span>
          <span>Midfielder</span>
        </div>
        <div class="info-item">
          <span class="info-label">Rating:</span>
          <span><%= rating %>/10</span>
        </div>
      </div>
    </header>

    <!-- Dashboard Cards -->
    <section class="cards">
      <div class="card">
        <h3>Total Goals</h3>
        <p><%= goals %></p>
        <p class="card-subtitle">This Season</p>
      </div>

      <div class="card">
        <h3>Matches Played</h3>
        <p><%= matches %></p>
        <p class="card-subtitle">All Competitions</p>
      </div>

      <div class="card">
        <h3>Assists</h3>
        <p><%= assists %></p>
        <p class="card-subtitle">Season Total</p>
      </div>

      <div class="card">
        <h3>Next Match</h3>
        <p style="font-size: 16px;">City Derby</p>
        <p class="card-subtitle">27th Nov, 7:00 PM</p>
      </div>
    </section>

    <!-- Stats Grid -->
    <section class="stats-grid">
      <div class="stat-card">
        <h3>Season Statistics</h3>
        <div class="stat-item">
          <span class="stat-label">Goals</span>
          <span class="stat-value"><%= goals %></span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Assists</span>
          <span class="stat-value"><%= assists %></span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Matches</span>
          <span class="stat-value"><%= matches %></span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Win Rate</span>
          <span class="stat-value">68%</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Training Hours</span>
          <span class="stat-value">156</span>
        </div>
      </div>

      <div class="stat-card">
        <h3>Team Rankings</h3>
        <div class="stat-item">
          <span class="stat-label">League Position</span>
          <span class="stat-value">#3</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Top Scorer</span>
          <span class="stat-value">#2</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Pass Accuracy</span>
          <span class="stat-value">87%</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Clean Sheets</span>
          <span class="stat-value">15</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Man of Match</span>
          <span class="stat-value">8</span>
        </div>
      </div>
    </section>

    <!-- Recent Activity -->
    <section class="activity">
      <h2>Recent Activity</h2>
      <ul>
        <li>Scored a hat-trick in last weekend's match!</li>
        <li>Training session scheduled for Thursday at 5:00 PM</li>
        <li>Team qualified for Quarter Finals!</li>
        <li>New training equipment arrived - Check your locker</li>
        <li>Weekly performance report available in Performance section</li>
      </ul>
    </section>

  </main>
</div>

</body>
</html>