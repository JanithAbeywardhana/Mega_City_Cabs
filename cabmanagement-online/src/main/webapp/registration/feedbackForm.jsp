<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      --accent-color: #20bf6b;
      --dark-color: #333333;
      --light-color: #f8f9fa;
    }
    
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      margin: 0;
      padding: 0;
      color: var(--dark-color);
    }
    
    /* Hero Section */
    .hero-section {
      position: relative;
      height: 500px;
      background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('../img/Childrens.jpg') no-repeat center center/cover;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 0 50px;
      overflow: hidden;
    }
    
    .hero-content {
      position: relative;
      z-index: 2;
      max-width: 800px;
    }
    
    .hero-title {
      font-size: 60px;
      font-weight: 800;
      margin-bottom: 20px;
      animation: fadeInUp 1s ease;
    }
    
    .hero-subtitle {
      font-size: 20px;
      font-weight: 400;
      margin-bottom: 30px;
      opacity: 0.9;
      animation: fadeInUp 1s ease 0.2s both;
    }
    
    .hero-gradient {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      height: 150px;
      background: linear-gradient(to top, rgba(0, 0, 0, 0.7), transparent);
    }
    
    .floating-card {
      background: white;
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      margin-top: -80px;
      position: relative;
      z-index: 5;
      animation: fadeIn 1s ease 0.4s both;
    }
    
    /* Mission Section */
    .mission-section {
      padding: 80px 0;
    }
    
    .mission-header {
      margin-bottom: 30px;
    }
    
    .mission-title {
      font-size: 36px;
      font-weight: 700;
      margin-bottom: 20px;
      color: var(--dark-color);
    }
    
    .mission-text {
      font-size: 18px;
      line-height: 1.7;
      color: #555;
      margin-bottom: 30px;
    }
    
    .mission-card {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      border-radius: 15px;
      padding: 30px;
      color: white;
      box-shadow: 0 10px 20px rgba(58, 123, 213, 0.2);
      height: 100%;
      transition: all 0.3s ease;
      cursor: pointer;
      overflow: hidden;
      position: relative;
    }
    
    .mission-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(58, 123, 213, 0.3);
    }
    
    .mission-card-title {
      font-size: 22px;
      font-weight: 600;
      margin-bottom: 15px;
      display: flex;
      align-items: center;
    }
    
    .mission-card-title i {
      margin-right: 10px;
      font-size: 24px;
    }
    
    .mission-card-text {
      font-size: 16px;
      line-height: 1.6;
      opacity: 0.9;
    }
    
    .mission-card::after {
      content: '';
      position: absolute;
      bottom: -30px;
      right: -30px;
      width: 100px;
      height: 100px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
    }
    
    .mission-statement {
      background: #f9fbff;
      border-radius: 12px;
      padding: 30px;
      margin-top: 30px;
      border: 1px solid #eef2f7;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }
    
    .mission-statement::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 5px;
      height: 100%;
      background: linear-gradient(to bottom, var(--primary-color), var(--secondary-color));
    }
    
    .mission-statement-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      cursor: pointer;
      padding: 0;
      background: none;
      border: none;
      width: 100%;
      text-align: left;
      color: var(--dark-color);
    }
    
    .mission-statement-title {
      font-size: 18px;
      font-weight: 600;
      margin: 0;
    }
    
    .mission-statement-icon {
      font-size: 20px;
      transition: transform 0.3s ease;
    }
    
    .mission-statement.active .mission-statement-icon {
      transform: rotate(180deg);
    }
    
    .mission-statement-content {
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.3s ease;
      margin-top: 0;
      font-size: 16px;
      line-height: 1.7;
      color: #555;
    }
    
    .mission-statement.active .mission-statement-content {
      max-height: 500px;
      margin-top: 20px;
    }
    
    /* CEO Section */
    .ceo-section {
      padding: 100px 0;
      background: linear-gradient(to right, #f8f9fa 50%, #e9ecef 50%);
      overflow: hidden;
    }
    
    .ceo-container {
      position: relative;
    }
    
    .ceo-image-container {
      position: relative;
      z-index: 2;
    }
    
    .ceo-image {
      border-radius: 15px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
    }
    
    .ceo-image:hover {
      transform: scale(1.02);
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    }
    
    .ceo-content {
      padding: 0 50px;
    }
    
    .ceo-title {
      font-size: 42px;
      font-weight: 800;
      margin-bottom: 20px;
      line-height: 1.2;
    }
    
    .ceo-highlight {
      background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
    }
    
    .ceo-text {
      font-size: 18px;
      line-height: 1.7;
      color: #555;
      margin-bottom: 30px;
    }
    
    .ceo-btn {
      background: var(--dark-color);
      color: white;
      border: none;
      border-radius: 50px;
      padding: 15px 30px;
      font-size: 16px;
      font-weight: 600;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    .ceo-btn:hover {
      background: #222;
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }
    
    /* Feedback Section */
    .feedback-section {
      padding: 80px 0;
      background: linear-gradient(135deg, rgba(58, 123, 213, 0.05), rgba(0, 210, 255, 0.05));
    }
    
    .feedback-container {
      max-width: 800px;
      margin: 0 auto;
      background: white;
      border-radius: 15px;
      padding: 40px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
    }
    
    .feedback-title {
      font-size: 32px;
      font-weight: 700;
      margin-bottom: 30px;
      text-align: center;
      color: var(--dark-color);
    }
    
    .feedback-input {
      background-color: #f8f9fa;
      border: 1px solid #eef2f7;
      border-radius: 8px;
      padding: 15px;
      font-size: 16px;
      transition: all 0.3s ease;
      margin-bottom: 20px;
    }
    
    .feedback-input:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 10px rgba(58, 123, 213, 0.1);
    }
    
    .feedback-textarea {
      min-height: 150px;
    }
    
    .feedback-btn {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      color: white;
      border: none;
      border-radius: 50px;
      padding: 15px 30px;
      font-size: 16px;
      font-weight: 600;
      width: 100%;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.2);
    }
    
    .feedback-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(58, 123, 213, 0.3);
    }
    
    /* App Section */
    .app-section {
      padding: 80px 0;
    }
    
    .app-title {
      font-size: 32px;
      font-weight: 700;
      margin-bottom: 40px;
      text-align: center;
      color: var(--dark-color);
    }
    
    .app-card {
      background: white;
      border-radius: 15px;
      padding: 25px;
      display: flex;
      align-items: center;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
      margin: 0 15px;
    }
    
    .app-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
    }
    
    .app-qr {
      width: 100px;
      height: 100px;
      object-fit: contain;
      margin-right: 20px;
    }
    
    .app-card-content {
      flex-grow: 1;
    }
    
    .app-card-title {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 5px;
      color: var(--dark-color);
    }
    
    .app-card-subtitle {
      font-size: 14px;
      color: #777;
    }
    
    .app-arrow {
      font-size: 20px;
      color: var(--dark-color);
      transition: transform 0.3s ease;
    }
    
    .app-card:hover .app-arrow {
      transform: translateX(5px);
    }
    
    /* Footer */
    .footer {
      background: var(--dark-color);
      color: white;
      padding: 20px 0;
      text-align: center;
    }
    
    .footer-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 20px;
    }
    
    .footer-links a {
      color: white;
      text-decoration: none;
      margin: 0 15px;
      transition: color 0.3s ease;
    }
    
    .footer-links a:hover {
      color: var(--secondary-color);
    }
    
    /* Animations */
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    /* Responsive */
    @media (max-width: 992px) {
      .hero-title {
        font-size: 48px;
      }
      
      .ceo-content {
        padding: 30px 0 0 0;
      }
      
      .app-card {
        margin-bottom: 20px;
      }
    }
    
    @media (max-width: 768px) {
      .hero-title {
        font-size: 36px;
      }
      
      .hero-section {
        height: 400px;
        padding: 0 30px;
      }
      
      .floating-card {
        margin-top: -40px;
        padding: 20px;
      }
      
      .ceo-title {
        font-size: 32px;
      }
      
      .mission-title, .feedback-title, .app-title {
        font-size: 28px;
      }
      
      .mission-card {
        margin-bottom: 20px;
      }
    }
  </style>
</head>
<body>
  <!-- Hero Section -->
  <section class="hero-section">
    <div class="hero-content">
      <h1 class="hero-title">About Us</h1>
      <p class="hero-subtitle">Get to know the team driving your journey forward</p>
    </div>
    <div class="hero-gradient"></div>
  </section>
  
  <div class="container">
    <div class="floating-card">
      <h2 class="mission-title">We reimagine the way the world moves for the better</h2>
      <p class="mission-text">Movement is what we power. It's our lifeblood. It runs through our veins. It's what gets us out of bed each morning. It pushes us to constantly reimagine how we can move better. For you. For all the places you want to go. For all the things you want to get. For all the ways you want to earn. Across the entire world. In real time. At the incredible speed of now.</p>
      
      <div class="mission-statement">
        <button class="mission-statement-header">
          <h3 class="mission-statement-title">Read our full mission statement</h3>
          <i class="fas fa-chevron-down mission-statement-icon"></i>
        </button>
        <div class="mission-statement-content">
          <p>At Mega City Cabs Service, our mission is to provide safe, reliable, and efficient transportation solutions across Colombo. We are committed to delivering exceptional customer experiences through professional drivers, well-maintained vehicles, and cutting-edge technology.</p>
          <p>Our goal is to ensure convenient, affordable, and timely rides for every passenger while upholding the highest standards of safety and service excellence. Whether for daily commutes or special journeys, Mega City Cabs is your trusted travel partner.</p>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Mission Section -->
  <section class="mission-section">
    <div class="container">
      <div class="mission-header">
        <h2 class="mission-title">Our Values</h2>
        <p class="mission-text">Our values define who we are and how we operate. They guide our decisions, shape our culture, and drive our commitment to excellence.</p>
      </div>
      
      <div class="row g-4">
        <div class="col-md-4">
          <div class="mission-card">
            <h3 class="mission-card-title">
              <i class="fas fa-shield-alt"></i> Safety First
            </h3>
            <p class="mission-card-text">We prioritize the safety of our passengers, drivers, and the community above all else. Our commitment to safety is unwavering and integral to every aspect of our service.</p>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="mission-card">
            <h3 class="mission-card-title">
              <i class="fas fa-heart"></i> Customer Obsession
            </h3>
            <p class="mission-card-text">We are dedicated to exceeding customer expectations at every touchpoint. We listen, learn, and constantly innovate to provide exceptional experiences.</p>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="mission-card">
            <h3 class="mission-card-title">
              <i class="fas fa-globe"></i> Sustainability
            </h3>
            <p class="mission-card-text">We are committed to reducing our environmental impact and contributing to a more sustainable future through responsible practices and innovation.</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- CEO Section -->
  <section class="ceo-section">
    <div class="container ceo-container">
      <div class="row align-items-center">
        <div class="col-lg-6 ceo-image-container">
          <img src="../img/image2.jpeg" alt="CEO Image" class="img-fluid ceo-image">
        </div>
        
        <div class="col-lg-6 ceo-content">
          <h2 class="ceo-title">A letter from our <br><span class="ceo-highlight">CEO</span></h2>
          <p class="ceo-text">Read about our team's commitment to provide everyone on our global platform with the technology that can help them move ahead. Discover our vision for the future of transportation and how we're working to make it a reality.</p>
          <button class="ceo-btn">Read JR's letter</button>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Feedback Section -->
  <section class="feedback-section">
    <div class="container">
      <div class="feedback-container">
        <h2 class="feedback-title">Submit Your Feedback</h2>
        
        <form action="${pageContext.request.contextPath}/customer/submitFeedback" method="post">
          <div class="mb-4">
            <label for="email" class="form-label fw-bold">Email:</label>
            <input type="email" name="email" id="email" class="form-control feedback-input" required>
          </div>
          
          <div class="mb-4">
            <label for="subject" class="form-label fw-bold">Subject:</label>
            <input type="text" name="subject" id="subject" class="form-control feedback-input" required>
          </div>
          
          <div class="mb-4">
            <label for="message" class="form-label fw-bold">Message:</label>
            <textarea name="message" id="message" class="form-control feedback-input feedback-textarea" rows="5" required></textarea>
          </div>
          
          <button type="submit" class="feedback-btn">
            <i class="fas fa-paper-plane me-2"></i> SUBMIT FEEDBACK
          </button>
        </form>
      </div>
    </div>
  </section>
  
  <!-- App Section -->
  <section class="app-section">
    <div class="container">
      <h2 class="app-title">Connect With Us</h2>
      
      <div class="d-flex flex-wrap justify-content-center">
        <div class="app-card">
          <img src="../img/QR.jpg" alt="QR Code 1" class="app-qr">
          <div class="app-card-content">
            <h5 class="app-card-title">Download Mega City App</h5>
            <p class="app-card-subtitle">Scan to download</p>
          </div>
          <i class="fas fa-arrow-right app-arrow"></i>
        </div>
        
        <div class="app-card">
          <img src="../img/TW.jpg" alt="QR Code 2" class="app-qr">
          <div class="app-card-content">
            <h5 class="app-card-title">About Us</h5>
            <p class="app-card-subtitle">Commit Your Thoughts</p>
          </div>
          <a href="feedbackForm.jsp" class="text-decoration-none text-dark">
            <i class="fas fa-arrow-right app-arrow"></i>
          </a>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Footer -->
  <footer class="footer">
    <div class="footer-container">
      <div class="footer-links">
        <a href="#">Home</a>
        <a href="#">About Us</a>
        <a href="#">Services</a>
        <a href="#">Contact</a>
        <a href="#">Privacy Policy</a>
      </div>
      
      <div class="footer-copyright">
        &copy; 2025 Mega City Cabs Service. All Rights Reserved.
      </div>
    </div>
  </footer>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const missionStatement = document.querySelector('.mission-statement');
      const missionHeader = document.querySelector('.mission-statement-header');
      const missionContent = document.querySelector('.mission-statement-content');
      
      missionHeader.addEventListener('click', () => {
        missionStatement.classList.toggle('active');
        if (missionStatement.classList.contains('active')) {
          missionContent.style.maxHeight = missionContent.scrollHeight + 'px';
        } else {
          missionContent.style.maxHeight = 0;
        }
      });
    });
  </script>
    
    
    

    
    
  <footer class="footer">
    <div class="footer-container">
        <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
        <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
</footer>

</body>
</html>