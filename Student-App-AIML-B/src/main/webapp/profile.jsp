<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Player Profile - Football Academy</title>
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
  display: inline-block;
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

.main-content {
  flex: 1;
  margin-left: 280px;
  padding: 30px;
}

.page-title {
  background: #ffffff;
  padding: 28px 32px;
  border-radius: 16px;
  margin-bottom: 30px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
}

.page-title h1 {
  color: #1a202c;
  font-size: 32px;
  font-weight: 800;
  margin-bottom: 8px;
}

.page-title p {
  color: #718096;
  font-weight: 500;
}

.stats-overview {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.stat-box {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  text-align: center;
  transition: all 0.3s ease;
  border: 1px solid #e2e8f0;
  position: relative;
  overflow: hidden;
}

.stat-box::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, #3b82f6, #06b6d4);
}

.stat-box:hover {
  transform: translateY(-6px);
  box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
}

.stat-icon {
  font-size: 36px;
  margin-bottom: 12px;
}

.stat-value {
  font-size: 36px;
  font-weight: 700;
  color: #0f172a;
  margin: 12px 0;
}

.stat-label {
  color: #64748b;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.performance-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin-bottom: 30px;
}

.performance-card {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
}

.performance-card h3 {
  color: #0f172a;
  margin-bottom: 24px;
  font-size: 18px;
  font-weight: 700;
}

.progress-item {
  margin-bottom: 24px;
}

.progress-item:last-child {
  margin-bottom: 0;
}

.progress-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
  font-size: 13px;
}

.progress-label {
  color: #64748b;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.3px;
}

.progress-value {
  color: #3b82f6;
  font-weight: 700;
}

.progress-bar {
  height: 8px;
  background: #e2e8f0;
  border-radius: 10px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #3b82f6, #06b6d4);
  border-radius: 10px;
  transition: width 0.5s ease;
}

.match-history {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
}

.match-history h3 {
  color: #0f172a;
  margin-bottom: 24px;
  font-size: 18px;
  font-weight: 700;
}

.match-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 18px 20px;
  background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
  border-radius: 12px;
  margin-bottom: 12px;
  border-left: 4px solid #3b82f6;
  transition: all 0.3s ease;
}

.match-item:last-child {
  margin-bottom: 0;
}

.match-item:hover {
  background: linear-gradient(135deg, #eff6ff 0%, #e0e7ff 100%);
  transform: translateX(8px);
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
}

.match-date {
  color: #a0aec0;
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.3px;
}

.match-opponent {
  font-weight: 700;
  color: #1a202c;
  font-size: 15px;
  margin-top: 4px;
}

.match-stats {
  display: flex;
  gap: 16px;
  font-size: 13px;
  font-weight: 600;
  align-items: center;
}

.match-stats span {
  color: #64748b;
}

.match-result {
  padding: 6px 14px;
  border-radius: 8px;
  font-weight: 700;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 0.3px;
}

.win {
  background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
  color: #047857;
  border: 1px solid #6ee7b7;
}

.loss {
  background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
  color: #991b1b;
  border: 1px solid #fca5a5;
}

.draw {
  background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
  color: #92400e;
  border: 1px solid #fcd34d;
}

@media (max-width: 768px) {
  .sidebar {
    width: 70px;
    padding: 20px 10px;
  }

  .sidebar h2,
  .sidebar .subtitle {
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

  .page-title {
    padding: 20px;
  }

  .page-title h1 {
    font-size: 24px;
  }

  .performance-grid {
    grid-template-columns: 1fr;
  }

  .match-stats {
    flex-direction: column;
    gap: 8px;
    align-items: flex-start;
  }
}
</style>
</head>
<body>

<div class="container">
  <aside class="sidebar">
    <div class="sidebar-header">
      <div class="sidebar-icon"></div>
      <h2>Football Academy</h2>
      <p class="subtitle">Train With The Best</p>
    </div>
    <ul class="nav">
      <li><a href="dashboard.jsp">Dashboard</a></li>
      <li><a href="profile.jsp" class="active">Profile</a></li>
      <li><a href="performance.jsp">Performance</a></li>

      <li><a href="matches.jsp">Matches</a></li>
      <li><a href="team.jsp">My Team</a></li>
      <li><a href="logout.jsp">Logout</a></li>
    </ul>
  </aside>

  <main class="main-content">
    <div class="page-title">
      <h1>Player Profile</h1>
      <p>View your football statistics and career progress</p>
    </div>

    <div class="stats-overview">
      <div class="stat-box">
        <div class="stat-icon"></div>
        <div class="stat-value">34</div>
        <div class="stat-label">Goals Scored</div>
      </div>
      <div class="stat-box">
        <div class="stat-icon"></div>
        <div class="stat-value">22</div>
        <div class="stat-label">Assists</div>
      </div>
      <div class="stat-box">
        <div class="stat-icon"></div>
        <div class="stat-value">8.5</div>
        <div class="stat-label">Avg Rating</div>
      </div>
      <div class="stat-box">
        <div class="stat-icon"></div>
        <div class="stat-value">48</div>
        <div class="stat-label">Matches</div>
      </div>
    </div>

    <div class="performance-grid">
      <div class="performance-card">
        <h3>Skill Metrics</h3>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Dribbling</span>
            <span class="progress-value">85%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 85%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Passing</span>
            <span class="progress-value">87%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 87%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Shooting</span>
            <span class="progress-value">78%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 78%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Defense</span>
            <span class="progress-value">72%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 72%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Stamina</span>
            <span class="progress-value">90%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 90%"></div>
          </div>
        </div>
      </div>

      <div class="performance-card">
        <h3>Career Progress</h3>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">November</span>
            <span class="progress-value">12 Goals</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 80%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">October</span>
            <span class="progress-value">15 Goals</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 100%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">September</span>
            <span class="progress-value">7 Goals</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 47%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Training Hours</span>
            <span class="progress-value">156 hrs</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 78%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Win Rate</span>
            <span class="progress-value">68%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 68%"></div>
          </div>
        </div>
      </div>
    </div>

    <div class="match-history">
      <h3>Recent Match History</h3>
      <div class="match-item">
        <div>
          <div class="match-date">21 Nov 2024</div>
          <div class="match-opponent">City Derby Final</div>
        </div>
        <div class="match-stats">
          <span>Goals: 2 | Assists: 1</span>
          <span class="match-result win">Victory 3-1</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">17 Nov 2024</div>
          <div class="match-opponent">League Match</div>
        </div>
        <div class="match-stats">
          <span>Goals: 1 | Assists: 2</span>
          <span class="match-result win">Victory 4-2</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">12 Nov 2024</div>
          <div class="match-opponent">Friendly Match</div>
        </div>
        <div class="match-stats">
          <span>Goals: 0 | Assists: 1</span>
          <span class="match-result draw">Draw 1-1</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">08 Nov 2024</div>
          <div class="match-opponent">Cup Quarter Final</div>
        </div>
        <div class="match-stats">
          <span>Goals: 3 | Assists: 1</span>
          <span class="match-result win">Victory 5-0</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">03 Nov 2024</div>
          <div class="match-opponent">League Challenge</div>
        </div>
        <div class="match-stats">
          <span>Goals: 0 | Assists: 0</span>
          <span class="match-result loss">Defeat 0-2</span>
        </div>
      </div>
    </div>
  </main>
</div>

</body>
</html>