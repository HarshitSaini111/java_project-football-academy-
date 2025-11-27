<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Matches - Football Academy</title>
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

.team-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
  gap: 16px;
  margin-bottom: 30px;
}

.stat-box {
  background: #ffffff;
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  text-align: center;
  border: 1px solid #e2e8f0;
  position: relative;
  overflow: hidden;
}

.stat-box::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 3px;
  background: linear-gradient(90deg, #3b82f6, #06b6d4);
}

.stat-value {
  font-size: 32px;
  font-weight: 700;
  color: #0f172a;
  margin: 10px 0;
}

.stat-label {
  color: #64748b;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.matches-section {
  margin-bottom: 30px;
}

.section-header {
  background: #ffffff;
  padding: 16px 24px;
  border-radius: 12px;
  margin-bottom: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
}

.section-header h2 {
  color: #1a202c;
  font-size: 18px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.match-card {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  margin-bottom: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  border: 1px solid #e2e8f0;
  position: relative;
  overflow: hidden;
}

.match-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, #3b82f6, #06b6d4);
}

.match-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
}

.match-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding-bottom: 16px;
  border-bottom: 1px solid #e2e8f0;
  flex-wrap: wrap;
  gap: 12px;
}

.match-competition {
  display: inline-block;
  padding: 6px 14px;
  background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%);
  color: #ffffff;
  border-radius: 8px;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);
}

.match-date {
  color: #64748b;
  font-size: 13px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.3px;
}

.match-teams {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: 28px;
  align-items: center;
  margin-bottom: 20px;
}

.team {
  text-align: center;
}

.team-logo {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: linear-gradient(135deg, #3b82f6, #06b6d4);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 32px;
  margin: 0 auto 12px;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);
  font-weight: 800;
  color: #ffffff;
}

.team-name {
  font-size: 16px;
  font-weight: 700;
  color: #1a202c;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.match-score {
  text-align: center;
}

.score {
  font-size: 48px;
  font-weight: 800;
  color: #1a202c;
  display: flex;
  gap: 12px;
  align-items: center;
}

.vs {
  font-size: 14px;
  color: #3b82f6;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.match-result {
  text-align: center;
  padding: 10px;
  border-radius: 8px;
  font-weight: 700;
  margin-top: 10px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.result-won {
  background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
  color: #047857;
  border: 1px solid #6ee7b7;
}

.result-lost {
  background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
  color: #991b1b;
  border: 1px solid #fca5a5;
}

.result-draw {
  background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
  color: #92400e;
  border: 1px solid #fcd34d;
}

.result-upcoming {
  background: linear-gradient(135deg, #dbeafe 0%, #cffafe 100%);
  color: #0369a1;
  border: 1px solid #bfdbfe;
}

.match-details {
  display: flex;
  justify-content: space-around;
  padding: 16px;
  background: #f8fafc;
  border-radius: 10px;
  margin-top: 16px;
  border: 1px solid #e2e8f0;
}

.detail-item {
  text-align: center;
}

.detail-label {
  color: #64748b;
  font-size: 12px;
  margin-bottom: 4px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.3px;
}

.detail-value {
  color: #3b82f6;
  font-weight: 700;
  font-size: 16px;
}

.player-performance {
  margin-top: 16px;
  padding: 16px;
  background: #f0f4ff;
  border-radius: 10px;
  border-left: 4px solid #3b82f6;
  border: 1px solid #e0e7ff;
}

.player-performance h4 {
  color: #3b82f6;
  margin-bottom: 10px;
  font-size: 14px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.player-stats {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
  font-size: 13px;
  color: #1a202c;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.3px;
}

.standings {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  border: 1px solid #e2e8f0;
}

.standings h3 {
  color: #1a202c;
  margin-bottom: 20px;
  font-size: 18px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.standings-table {
  width: 100%;
  border-collapse: collapse;
}

.standings-table th {
  background: #f8fafc;
  padding: 12px;
  text-align: left;
  font-size: 12px;
  color: #3b82f6;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  border-bottom: 2px solid #e2e8f0;
}

.standings-table td {
  padding: 12px;
  border-bottom: 1px solid #e2e8f0;
  font-size: 14px;
  color: #1a202c;
  font-weight: 600;
}

.standings-table tr:hover {
  background: #f8fafc;
}

.position {
  font-weight: 700;
  color: #3b82f6;
  width: 40px;
}

.team-highlight {
  background: #f0f4ff;
  border-left: 4px solid #3b82f6;
}

.team-highlight td {
  color: #1a202c;
  font-weight: 700;
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

  .match-teams {
    grid-template-columns: 1fr;
    gap: 16px;
  }

  .match-header {
    flex-direction: column;
    align-items: flex-start;
  }

  .match-details {
    flex-direction: column;
    gap: 12px;
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
      <li><a href="profile.jsp"> Profile</a></li>
      <li><a href="performance.jsp">Performance</a></li>

      <li><a href="matches.jsp" class="active">Matches</a></li>
      <li><a href="team.jsp">My Team</a></li>
      <li><a href="logout.jsp">Logout</a></li>
    </ul>
  </aside>

  <main class="main-content">
    <div class="page-title">
      <h1>Match Center</h1>
      <p>View all matches, results and league standings</p>
    </div>

    <div class="team-stats">
      <div class="stat-box">
        <div class="stat-value">12</div>
        <div class="stat-label">Wins</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">8</div>
        <div class="stat-label">Losses</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">60%</div>
        <div class="stat-label">Win Rate</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">34</div>
        <div class="stat-label">Goals</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">22</div>
        <div class="stat-label">Assists</div>
      </div>
    </div>

    <div class="matches-section">
      <div class="section-header">
        <h2>Upcoming Matches</h2>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">State Championship Finals</span>
          <span class="match-date">26 Nov 2024 | 6:00 PM | Neutral Venue</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">AC</div>
            <div class="team-name">Our Academy</div>
          </div>
          <div class="match-score">
            <div class="vs">VS</div>
          </div>
          <div class="team">
            <div class="team-logo">CF</div>
            <div class="team-name">City FC</div>
          </div>
        </div>
        <div class="match-result result-upcoming">Championship Finals</div>
        <div class="match-details">
          <div class="detail-item">
            <div class="detail-label">Format</div>
            <div class="detail-value">Knockout</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Duration</div>
            <div class="detail-value">90 Minutes</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Squad</div>
            <div class="detail-value">Full Team</div>
          </div>
        </div>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">Regional League</span>
          <span class="match-date">28 Nov 2024 | 7:30 PM | Home Ground</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">AC</div>
            <div class="team-name">Our Academy</div>
          </div>
          <div class="match-score">
            <div class="vs">VS</div>
          </div>
          <div class="team">
            <div class="team-logo">UT</div>
            <div class="team-name">United Team</div>
          </div>
        </div>
        <div class="match-result result-upcoming">League Fixture</div>
      </div>
    </div>

    <div class="matches-section">
      <div class="section-header">
        <h2>Recent Results</h2>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">League Match</span>
          <span class="match-date">20 Nov 2024 | Home Ground</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">AC</div>
            <div class="team-name">Our Academy</div>
          </div>
          <div class="match-score">
            <div class="score">
              <span>3</span>
              <span style="font-size: 24px; color: #cbd5e0;">-</span>
              <span>1</span>
            </div>
          </div>
          <div class="team">
            <div class="team-logo">RU</div>
            <div class="team-name">Rival United</div>
          </div>
        </div>
        <div class="match-result result-won">Victory</div>
        <div class="player-performance">
          <h4>Your Performance</h4>
          <div class="player-stats">
            <span>Goals: 2</span>
            <span>Assists: 1</span>
            <span>Passes: 45</span>
            <span>Tackles: 8</span>
            <span>Man of Match</span>
          </div>
        </div>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">Cup Quarter Finals</span>
          <span class="match-date">15 Nov 2024 | Away</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">AC</div>
            <div class="team-name">Our Academy</div>
          </div>
          <div class="match-score">
            <div class="score">
              <span>2</span>
              <span style="font-size: 24px; color: #cbd5e0;">-</span>
              <span>0</span>
            </div>
          </div>
          <div class="team">
            <div class="team-logo">DF</div>
            <div class="team-name">Defense FC</div>
          </div>
        </div>
        <div class="match-result result-won">Victory</div>
        <div class="player-performance">
          <h4>Your Performance</h4>
          <div class="player-stats">
            <span>Goals: 1</span>
            <span>Assists: 1</span>
            <span>Passes: 38</span>
            <span>Tackles: 6</span>
            <span>Rating: 8.2</span>
          </div>
        </div>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">Friendly Match</span>
          <span class="match-date">10 Nov 2024 | Home Ground</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">AC</div>
            <div class="team-name">Our Academy</div>
          </div>
          <div class="match-score">
            <div class="score">
              <span>1</span>
              <span style="font-size: 24px; color: #cbd5e0;">-</span>
              <span>2</span>
            </div>
          </div>
          <div class="team">
            <div class="team-logo">PS</div>
            <div class="team-name">Premier Squad</div>
          </div>
        </div>
        <div class="match-result result-lost">Defeat</div>
        <div class="player-performance">
          <h4>Your Performance</h4>
          <div class="player-stats">
            <span>Goals: 0</span>
            <span>Assists: 1</span>
            <span>Passes: 32</span>
            <span>Tackles: 5</span>
            <span>Rating: 6.8</span>
          </div>
        </div>
      </div>
    </div>

    <div class="standings">
      <h3>League Standings</h3>
      <table class="standings-table">
        <thead>
          <tr>
            <th>Rank</th>
            <th>Team</th>
            <th>Matches</th>
            <th>Wins</th>
            <th>Draws</th>
            <th>Losses</th>
            <th>Points</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="position">1</td>
            <td>City FC</td>
            <td>15</td>
            <td>12</td>
            <td>2</td>
            <td>1</td>
            <td><strong>38</strong></td>
          </tr>
          <tr class="team-highlight">
            <td class="position">2</td>
            <td><strong>Our Academy</strong></td>
            <td>14</td>
            <td>12</td>
            <td>0</td>
            <td>2</td>
            <td><strong>36</strong></td>
          </tr>
          <tr>
            <td class="position">3</td>
            <td>United Team</td>
            <td>15</td>
            <td>10</td>
            <td>2</td>
            <td>3</td>
            <td><strong>32</strong></td>
          </tr>
          <tr>
            <td class="position">4</td>
            <td>Rival United</td>
            <td>14</td>
            <td>8</td>
            <td>3</td>
            <td>3</td>
            <td><strong>27</strong></td>
          </tr>
          <tr>
            <td class="position">5</td>
            <td>Defense FC</td>
            <td>15</td>
            <td>7</td>
            <td>2</td>
            <td>6</td>
            <td><strong>23</strong></td>
          </tr>
        </tbody>
      </table>
    </div>
  </main>
</div>

</body>
</html>