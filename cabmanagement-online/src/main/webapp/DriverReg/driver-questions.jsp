<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #3a7bd5;
      --secondary-color: #00d2ff;
      --dark-color: #333333;
      --light-color: #f8f9fa;
    }
    
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0;
      padding: 20px;
    }
    
    .questionnaire-container {
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 100%;
      max-width: 900px;
      display: flex;
      position: relative;
    }
    
    .questionnaire-image {
      flex: 1;
      background-image: url('../img/Driving2.jpg');
      background-size: cover;
      background-position: center;
      display: none;
    }
    
    .questionnaire-form {
      flex: 1;
      padding: 40px;
      position: relative;
    }
    
    .form-header {
      margin-bottom: 30px;
      text-align: center;
    }
    
    .form-header h1 {
      color: var(--dark-color);
      font-weight: 600;
      margin-bottom: 10px;
      font-size: 28px;
    }
    
    .form-header p {
      color: #777;
      font-size: 15px;
    }
    
    .form-label {
      font-size: 15px;
      color: #555;
      font-weight: 500;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
    }
    
    .form-label i {
      margin-right: 8px;
      color: var(--primary-color);
      width: 20px;
      text-align: center;
    }
    
    .form-select {
      height: 50px;
      border: none;
      border-bottom: 2px solid #eee;
      border-radius: 0;
      padding: 10px 15px;
      font-size: 15px;
      background-position: right 15px center;
      box-shadow: none !important;
      transition: all 0.3s;
    }
    
    .form-select:focus {
      border-color: var(--primary-color);
    }
    
    .question-card {
      background-color: #f9fbff;
      border-radius: 12px;
      padding: 20px;
      margin-bottom: 20px;
      border: 1px solid #eef2f7;
      transition: all 0.3s ease;
    }
    
    .question-card:hover {
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      transform: translateY(-2px);
    }
    
    .question-number {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 28px;
      height: 28px;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      color: white;
      border-radius: 50%;
      font-size: 14px;
      margin-right: 10px;
    }
    
    .submit-btn {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      border: none;
      border-radius: 30px;
      padding: 13px;
      font-size: 16px;
      font-weight: 500;
      letter-spacing: 0.5px;
      color: white;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.3);
      transition: all 0.3s;
      margin-top: 15px;
    }
    
    .submit-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 7px 20px rgba(58, 123, 213, 0.4);
    }
    
    .submit-btn:active {
      transform: translateY(0);
    }
    
    .progress-container {
      margin-bottom: 30px;
    }
    
    .progress {
      height: 8px;
      border-radius: 4px;
      background-color: #eef2f7;
      overflow: hidden;
    }
    
    .progress-bar {
      background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
      border-radius: 4px;
      width: 83%; /* 5 out of 6 questions (assuming there's one more step) */
    }
    
    .progress-text {
      display: flex;
      justify-content: space-between;
      margin-top: 8px;
      font-size: 13px;
      color: #777;
    }
    
    /* Animation */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .questionnaire-form {
      animation: fadeIn 0.8s ease forwards;
    }
    
    /* Responsive styles */
    @media (min-width: 992px) {
      .questionnaire-image {
        display: block;
      }
    }
    
    @media (max-width: 768px) {
      .questionnaire-form {
        padding: 25px;
      }
      
      .question-card {
        padding: 15px;
      }
    }
  </style>
</head>
<body>
  <div class="questionnaire-container">
    <div class="questionnaire-image"></div>
    <div class="questionnaire-form">
      <div class="form-header">
        <h1>Complete Your Profile</h1>
        <p>Help us understand your driving experience and preferences</p>
      </div>
      
      <div class="progress-container">
        <div class="progress">
          <div class="progress-bar"></div>
        </div>
        <div class="progress-text">
          <span>Profile Setup</span>
          <span>Final Step</span>
        </div>
      </div>

      <form action="submit-driver-questions" method="post">
        <div class="question-card">
          <label class="form-label">
            <span class="question-number">1</span>
            <i class="fas fa-history"></i> How many years of experience do you have?
          </label>
          <select class="form-select" name="first_question" id="first_question" required>
            <option value="">Select Experience</option>
            <option value="1">0-1 years</option>
            <option value="2">1-3 years</option>
            <option value="3">3-5 years</option>
            <option value="4">5+ years</option>
          </select>
        </div>

        <div class="question-card">
          <label class="form-label">
            <span class="question-number">2</span>
            <i class="fas fa-moon"></i> Are you comfortable driving at night?
          </label>
          <select class="form-select" name="second_question" id="second_question" required>
            <option value="">Select Comfort Level</option>
            <option value="1">Not comfortable</option>
            <option value="2">Somewhat comfortable</option>
            <option value="3">Comfortable</option>
            <option value="4">Very comfortable</option>
          </select>
        </div>

        <div class="question-card">
          <label class="form-label">
            <span class="question-number">3</span>
            <i class="fas fa-map-marked-alt"></i> How familiar are you with city routes?
          </label>
          <select class="form-select" name="third_question" id="third_question" required>
            <option value="">Select Familiarity</option>
            <option value="1">Not familiar</option>
            <option value="2">Somewhat familiar</option>
            <option value="3">Familiar</option>
            <option value="4">Very familiar</option>
          </select>
        </div>

        <div class="question-card">
          <label class="form-label">
            <span class="question-number">4</span>
            <i class="fas fa-shield-alt"></i> How do you rate your defensive driving skills?
          </label>
          <select class="form-select" name="forth_question" id="forth_question" required>
            <option value="">Select Skill Level</option>
            <option value="1">Basic</option>
            <option value="2">Intermediate</option>
            <option value="3">Advanced</option>
            <option value="4">Expert</option>
          </select>
        </div>

        <div class="question-card">
          <label class="form-label">
            <span class="question-number">5</span>
            <i class="fas fa-ambulance"></i> Availability for emergency rides?
          </label>
          <select class="form-select" name="fifth_question" id="fifth_question" required>
            <option value="">Select Availability</option>
            <option value="1">Not available</option>
            <option value="2">Rarely available</option>
            <option value="3">Usually available</option>
            <option value="4">Always available</option>
          </select>
        </div>

        <button type="submit" class="btn submit-btn w-100">
          Complete Profile <i class="fas fa-arrow-right ms-2"></i>
        </button>
      </form>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>