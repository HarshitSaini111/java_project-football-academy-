<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Football Academy - Tournaments</title>
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
      padding: 40px 20px;
      color: #2d3748;
    }

    .container {
      max-width: 1400px;
      margin: 0 auto;
    }

    /* Header Section */
    .page-header {
      background: #ffffff;
      padding: 40px;
      border-radius: 16px;
      margin-bottom: 40px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
      border: 1px solid #e2e8f0;
    }

    .page-header h1 {
      color: #1a202c;
      font-size: 48px;
      font-weight: 800;
      margin-bottom: 12px;
    }

    .page-header p {
      color: #718096;
      font-size: 16px;
      font-weight: 500;
    }

    /* Filter Buttons */
    .filter-tabs {
      display: flex;
      gap: 16px;
      margin-bottom: 40px;
      flex-wrap: wrap;
    }

    .filter-btn {
      flex: 1;
      min-width: 180px;
      padding: 14px 24px;
      background: #ffffff;
      border: 2px solid #e2e8f0;
      border-radius: 12px;
      color: #64748b;
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .filter-btn:hover {
      background: #f8fafc;
      border-color: #cbd5e0;
      transform: translateY(-2px);
    }

    .filter-btn.active {
      background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%);
      border-color: #3b82f6;
      color: #ffffff;
      box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
    }

    /* Events List */
    .events-list {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .event-card {
      background: #ffffff;
      border: 1px solid #e2e8f0;
      border-radius: 16px;
      padding: 28px;
      display: flex;
      gap: 28px;
      transition: all 0.3s ease;
      cursor: pointer;
      position: relative;
      overflow: hidden;
    }

    .event-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, #3b82f6, #06b6d4);
    }

    .event-card:hover {
      transform: translateY(-4px);
      border-color: #3b82f6;
      box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
    }

    .event-card.hidden {
      display: none;
    }

    /* Date Box */
    .date-box {
      background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%);
      border-radius: 12px;
      padding: 24px;
      min-width: 140px;
      text-align: center;
      display: flex;
      flex-direction: column;
      justify-content: center;
      box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);
      flex-shrink: 0;
    }

    .date-day {
      font-size: 42px;
      font-weight: 800;
      color: #ffffff;
      line-height: 1;
      margin-bottom: 4px;
    }

    .date-month {
      font-size: 14px;
      font-weight: 700;
      color: #ffffff;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: 10px;
    }

    .date-time {
      font-size: 13px;
      font-weight: 600;
      color: rgba(255, 255, 255, 0.9);
      padding-top: 10px;
      border-top: 1px solid rgba(255, 255, 255, 0.3);
    }

    /* Event Content */
    .event-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .event-type {
      display: inline-block;
      padding: 6px 14px;
      border-radius: 8px;
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      width: fit-content;
    }

    .event-type.tournament {
      background: linear-gradient(135deg, #dbeafe 0%, #cffafe 100%);
      color: #0369a1;
      border: 1px solid #bfdbfe;
    }

    .event-type.practice {
      background: linear-gradient(135deg, #dcfce7 0%, #bbf7d0 100%);
      color: #166534;
      border: 1px solid #bbf7d0;
    }

    .event-type.matches {
      background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
      color: #92400e;
      border: 1px solid #fcd34d;
    }

    .event-title {
      font-size: 24px;
      font-weight: 800;
      color: #1a202c;
    }

    .event-meta {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
    }

    .meta-tag {
      padding: 6px 12px;
      background: #f1f5f9;
      border: 1px solid #e2e8f0;
      border-radius: 8px;
      color: #64748b;
      font-size: 12px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.3px;
    }

    .event-description {
      color: #64748b;
      font-size: 14px;
      line-height: 1.6;
      font-weight: 500;
      margin-top: 4px;
    }

    .event-actions {
      display: flex;
      gap: 12px;
      margin-top: 12px;
    }

    .btn {
      padding: 10px 24px;
      border: none;
      border-radius: 10px;
      font-size: 13px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .btn-primary {
      background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%);
      color: #ffffff;
      box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 16px rgba(59, 130, 246, 0.4);
    }

    .btn-secondary {
      background: #f1f5f9;
      color: #3b82f6;
      border: 1px solid #cbd5e0;
    }

    .btn-secondary:hover {
      background: #e2e8f0;
      transform: translateY(-2px);
    }

    /* Responsive */
    @media (max-width: 768px) {
      .event-card {
        flex-direction: column;
        padding: 20px;
      }

      .date-box {
        min-width: 100%;
      }

      .page-header {
        padding: 24px;
      }

      .page-header h1 {
        font-size: 32px;
      }

      .filter-tabs {
        flex-direction: column;
      }

      .filter-btn {
        min-width: 100%;
      }

      .event-title {
        font-size: 20px;
      }

      .event-actions {
        flex-direction: column;
      }

      .btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- Page Header -->
    <div class="page-header">
      <h1>Tournaments & Matches</h1>
      <p>Upcoming matches, tournaments and training sessions</p>
    </div>

    <!-- Filter Tabs -->
    <div class="filter-tabs">
      <button class="filter-btn active" data-filter="all">All Events</button>
      <button class="filter-btn" data-filter="tournament">Tournaments</button>
      <button class="filter-btn" data-filter="practice">Training</button>
      <button class="filter-btn" data-filter="matches">Matches</button>
    </div>

    <!-- Events List -->
    <div class="events-list">
      <!-- Event 1 - Tournament -->
      <div class="event-card" data-type="tournament" onclick="openEvent('state-championship')">
        <div class="date-box">
          <div class="date-day">26</div>
          <div class="date-month">Nov</div>
          <div class="date-time">6:00 PM</div>
        </div>
        <div class="event-content">
          <span class="event-type tournament">Tournament</span>
          <h2 class="event-title">State Championship Finals</h2>
          <div class="event-meta">
            <span class="meta-tag">Neutral Venue</span>
            <span class="meta-tag">Full Squad</span>
            <span class="meta-tag">Knockout Round</span>
          </div>
          <p class="event-description">
            Championship finals. Last chance to qualify for regional pro league. Team warmup starts 30 minutes before match.
          </p>
          <div class="event-actions">
            <button class="btn btn-primary" onclick="registerEvent(event, 'state-championship')">Register Now</button>
            <button class="btn btn-secondary" onclick="viewDetails(event, 'state-championship')">View Details</button>
          </div>
        </div>
      </div>

      <!-- Event 2 - Training -->
      <div class="event-card" data-type="practice" onclick="openEvent('skill-training')">
        <div class="date-box">
          <div class="date-day">24</div>
          <div class="date-month">Nov</div>
          <div class="date-time">8:00 PM</div>
        </div>
        <div class="event-content">
          <span class="event-type practice">Training</span>
          <h2 class="event-title">Skill Development Session</h2>
          <div class="event-meta">
            <span class="meta-tag">Academy Ground</span>
            <span class="meta-tag">All Players</span>
            <span class="meta-tag">2 Hours</span>
          </div>
          <p class="event-description">
            Focus on dribbling, passing accuracy and ball control drills. Practice new formations and defensive tactics.
          </p>
          <div class="event-actions">
            <button class="btn btn-primary" onclick="registerEvent(event, 'skill-training')">Join Session</button>
            <button class="btn btn-secondary" onclick="viewDetails(event, 'skill-training')">View Details</button>
          </div>
        </div>
      </div>

      <!-- Event 3 - Matches -->
      <div class="event-card" data-type="matches" onclick="openEvent('city-derby')">
        <div class="date-box">
          <div class="date-day">27</div>
          <div class="date-month">Nov</div>
          <div class="date-time">7:00 PM</div>
        </div>
        <div class="event-content">
          <span class="event-type matches">Match</span>
          <h2 class="event-title">City Derby</h2>
          <div class="event-meta">
            <span class="meta-tag">Home Stadium</span>
            <span class="meta-tag">League Match</span>
            <span class="meta-tag">90 Minutes</span>
          </div>
          <p class="event-description">
            Competitive league match against top regional rivals. Test tactics in high-pressure match environment with full crowd support.
          </p>
          <div class="event-actions">
            <button class="btn btn-primary" onclick="registerEvent(event, 'city-derby')">Confirm Participation</button>
            <button class="btn btn-secondary" onclick="viewDetails(event, 'city-derby')">View Details</button>
          </div>
        </div>
      </div>

      <!-- Event 4 - Tournament -->
      <div class="event-card" data-type="tournament" onclick="openEvent('winter-cup')">
        <div class="date-box">
          <div class="date-day">30</div>
          <div class="date-month">Nov</div>
          <div class="date-time">5:00 PM</div>
        </div>
        <div class="event-content">
          <span class="event-type tournament">Tournament</span>
          <h2 class="event-title">Winter Cup Championship</h2>
          <div class="event-meta">
            <span class="meta-tag">Neutral Ground</span>
            <span class="meta-tag">Full Squad</span>
            <span class="meta-tag">Prize Money</span>
          </div>
          <p class="event-description">
            Season-ending championship event. Top 16 teams compete for glory and prize money. Multiple matches streaming live across platforms.
          </p>
          <div class="event-actions">
            <button class="btn btn-primary" onclick="registerEvent(event, 'winter-cup')">Register Now</button>
            <button class="btn btn-secondary" onclick="viewDetails(event, 'winter-cup')">View Details</button>
          </div>
        </div>
      </div>

      <!-- Event 5 - Training -->
      <div class="event-card" data-type="practice" onclick="openEvent('tactical-workshop')">
        <div class="date-box">
          <div class="date-day">28</div>
          <div class="date-month">Nov</div>
          <div class="date-time">9:00 PM</div>
        </div>
        <div class="event-content">
          <span class="event-type practice">Training</span>
          <h2 class="event-title">Tactical Workshop</h2>
          <div class="event-meta">
            <span class="meta-tag">Ground + Video Room</span>
            <span class="meta-tag">All Levels</span>
            <span class="meta-tag">3 Hours</span>
          </div>
          <p class="event-description">
            Learn advanced tactics from senior coaches. Focus on set pieces, positioning, and team coordination strategies.
          </p>
          <div class="event-actions">
            <button class="btn btn-primary" onclick="registerEvent(event, 'tactical-workshop')">Join Workshop</button>
            <button class="btn btn-secondary" onclick="viewDetails(event, 'tactical-workshop')">View Details</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    // Filter functionality
    const filterBtns = document.querySelectorAll('.filter-btn');
    const eventCards = document.querySelectorAll('.event-card');

    filterBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        // Remove active class from all buttons
        filterBtns.forEach(b => b.classList.remove('active'));

        // Add active class to clicked button
        btn.classList.add('active');

        const filter = btn.dataset.filter;

        // Filter events
        eventCards.forEach(card => {
          if (filter === 'all' || card.dataset.type === filter) {
            card.classList.remove('hidden');
          } else {
            card.classList.add('hidden');
          }
        });
      });
    });

    // Open event (card click)
    function openEvent(eventId) {
      console.log('Opening event:', eventId);
      alert('Opening event: ' + eventId + '\n\nIn production, this would navigate to the event details page.');
    }

    // Register for event
    function registerEvent(e, eventId) {
      e.stopPropagation();
      console.log('Registering for event:', eventId);
      alert('Registration initiated for: ' + eventId + '\n\nIn production, this would open the registration form.');
    }

    // View event details
    function viewDetails(e, eventId) {
      e.stopPropagation();
      console.log('Viewing details for:', eventId);
      alert('Viewing details for: ' + eventId + '\n\nIn production, this would show detailed event information.');
    }
  </script>
</body>
</html>