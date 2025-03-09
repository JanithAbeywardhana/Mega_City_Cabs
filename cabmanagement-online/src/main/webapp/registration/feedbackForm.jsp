<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
       <link 
    rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
  >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
      body {
          background-color: #f8f9fa;
          font-family: Arial, sans-serif;
      }
      
      
      
              .about-section {
            position: relative;
            width: 100%;
            height: 400px;
            background: url('../img/Childrens.jpg') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            color: white;
            padding-left: 50px;
        }
        .about-text {
            font-size: 60px;
            font-weight: bold;
            padding-left: 60px;
        }
      
      
    
.ceo-section {
    background-color: #f8f9fa; 
    padding: 80px 0;
}


.text-container {
    padding-left: 100px;
}


.ceo-text {
    color: #000;
}


.btn-dark {
    font-weight: bold;
    padding: 12px 24px;
    border-radius: 8px;
}


.image-container img {
    width: 100%;
    height: auto;
    border-radius: 10px;
}

     .custom-input {
    background-color: #f8f9fa; 
    border: 1px solid #ddd; 
    border-radius: 5px; 
    padding: 10px;
    font-size: 16px;
    width: 100%;
    transition: all 0.3s ease-in-out;
}

.custom-input:focus {
    border-color: #000; 
    outline: none;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}


.custom-btn {
    background-color: black;
    color: white;
    border: none;
    padding: 12px 200px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    transition: background 0.3s ease-in-out;
}

.custom-btn:hover {
    background-color: #222; 
}
      
    
        
        
            .faq-container {
      max-width: 1300px;
      margin: 50px 20px 50px 50px;
      padding: 0 20px;
      text-align: left;
    }

    .faq-container h2 {
      font-size: 1.8rem;
      font-weight: 600;
      margin-bottom: 30px;
    }

    
    .faq-item {
      border-bottom: 1px solid #e0e0e0;
      padding: 15px 0;
      cursor: pointer; 
      transition: background 0.3s ease;
    }
    .faq-item:hover {
      background: #fafafa;
    }
    
   
.faq-question:hover,
.faq-question:focus {
  background-color: transparent !important;
  outline: none;
}


.faq-question span {
  color: inherit; 
  
}

 .faq-question {
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 1.1rem;
  font-weight: 500;
  margin: 0;
  background: none;
  border: none;
  width: 100%;
  text-align: left;
  padding: 5px 0;
  color: black;
  
}

.arrow {
  font-size: 1.2rem;
 
  margin-left: auto; 
  transition: transform 0.3s;
}

    
    .faq-item.active .arrow {
      transform: rotate(180deg);
    }

    
    .faq-answer {
      overflow: hidden;
      max-height: 0; 
      transition: max-height 0.3s ease; 
      font-size: 0.95rem;
      line-height: 1.6;
      color: #555;
    }

    
    .faq-answer p {
      margin-top: 10px;
    }
       
        
        
        
    
.reimagine-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #f8f9fa; 
    padding: 50px;
}


.text-content {
    flex: 1;
    font-family: Arial, sans-serif;
}

.text-content h2 {
    font-size: 28px;
    font-weight: bold;
    color: #111;
    margin-bottom: 15px;
}


.custom-btn {
    background-color: black;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

.custom-btn:hover {
    background-color: #222; 
}


.image-content img {
    width: 120px; 
    height: auto;
}



/* Section Title */
.section-title {
  font-size: 1.8rem;
  font-weight: 600;
  margin-bottom: -40px;
  color: #000;
    padding: 50px 0;
}

.custom-card {
    display: flex;
    align-items: center;
    justify-content: space-between; /* Ensures even spacing */
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    width: 350px; /* Adjust width as needed */
}

.custom-card + .custom-card {
    margin-left: 40px; /* Adjust this value to control the gap */
}

.custom-card img {
    width: 80px; /* Adjust QR code size */
    height: auto;
    margin-right: 15px;
}

.card-content {
    flex-grow: 1; /* Allows text to take space */
}

.arrow-icon {
    font-size: 20px;
    color: black;
}

/* QR Code Image */
.qr-img {
  width: 100px;
  height: 100px;
  object-fit: contain;
}

/* Title in Card */
.app-title {
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 4px;
  color: #000;
}

/* Subtitle in Card */
.app-subtitle {
  font-size: 0.9rem;
  color: #666;
  margin-bottom: 0;
}

/* Arrow Icon */
.arrow-icon {
  font-size: 1.2rem;
  margin-left: 15px; /* Space between text and arrow */
  color: #000;
}

        
        
        .footer {
    background-color: black; 
    color: #333;            
    padding: 15px 0;
    font-family: Arial, sans-serif;
    text-align: center;
    font-size: 14px;
    border-top: 2px solid #ddd;
    width: 100%; 
}

.footer-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: auto;
    padding: 0 15px;
    flex-wrap: wrap;
}


.footer a {
    text-decoration: none;
    color: white; 
   
}

.footer a:hover {
    color: gray; 
}
    </style>
</head>
<body>


 <section class="about-section">
        <div class="about-text">About us</div>
    </section>
    
    
  
    
    
    
     <div class="faq-container">
  <h2>We reimagine the way the world moves for the better</h2>
  <p>Movement is what we power. It's our lifeblood. It runs through our veins. It’s what gets us out of bed each morning. It pushes us to constantly reimagine how we can move better. For you. For all the places you want to go. For all the things you want to get. For all the ways you want to earn. Across the entire world. In real time. At the incredible speed of now.</p>


  <div class="faq-item">
    <button class="faq-question">
      <span>Read our full mission statement</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
      At Mega City Cabs Service, our mission is to provide safe, reliable, and efficient transportation solutions across Colombo. We are committed to delivering exceptional customer experiences through professional drivers, well-maintained vehicles, and cutting-edge technology. 
      Our goal is to ensure convenient, affordable, and timely rides for every passenger while upholding the highest standards of safety and service excellence. Whether for daily commutes or special journeys, Mega City Cabs is your trusted travel partner.
      </p>
      
    </div>
  </div>
  </div>
  
  
  <script>
  document.addEventListener('DOMContentLoaded', () => {
    const faqItems = document.querySelectorAll('.faq-item');

    faqItems.forEach(item => {
      const questionBtn = item.querySelector('.faq-question');
      const answerPanel = item.querySelector('.faq-answer');
      
      questionBtn.addEventListener('click', () => {
        // If not active, open it
        if (!item.classList.contains('active')) {
          item.classList.add('active');
          // measure the scrollHeight and set it
          answerPanel.style.maxHeight = answerPanel.scrollHeight + 'px';
        } else {
          // Otherwise, close it
          item.classList.remove('active');
          answerPanel.style.maxHeight = 0;
        }
      });
    });
  });
</script>



    <section class="ceo-section">
        <div class="container-fluid">
            <div class="row align-items-center">
                
              
                <div class="col-md-6 text-container">
                    <h1 class="fw-bold">A letter from our <br> <span class="ceo-text">CEO</span></h1>
                    <p>Read about our team’s commitment to provide everyone on our global platform with the technology that can help them move ahead.</p>
                    <button class="btn btn-dark">Read JR's letter</button>
                </div>

          
                <div class="col-md-6 image-container">
                    <img src="../img/image2.jpeg" alt="CEO Image" class="img-fluid">
                </div>

            </div>
        </div>
    </section>
    
    

    
   <div class="container feedback-container">
    <h2>Submit Your Feedback</h2>
    <c:if test="${not empty param.error}">
        <div class="alert alert-danger">${param.error}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/customer/submitFeedback" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" name="email" id="email" class="form-control custom-input" required>
        </div>
        <div class="mb-3">
            <label for="subject" class="form-label">Subject:</label>
            <input type="text" name="subject" id="subject" class="form-control custom-input" required>
        </div>
        <div class="mb-3">
            <label for="message" class="form-label">Message:</label>
            <textarea name="message" id="message" class="form-control custom-input" rows="5" required></textarea>
        </div>
        <button type="submit" class="custom-btn">SUBMIT</button>
    </form>
</div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <section class="apps-section">
  <div class="container">
    
    <div class="row mt-4 g-4">
      
<div class="d-flex justify-content-center">
    <div class="custom-card">
        <img src="../img/QR.jpg" alt="QR Code 1">
        <div class="card-content">
            <h5>Download Mega City App</h5>
            <p>Scan to download</p>
        </div>
        <i class="fas fa-arrow-right arrow-icon"></i> <!-- Arrow icon -->
    </div>

    <div class="custom-card">
        <img src="../img/TW.jpg" alt="QR Code 2">
        <div class="card-content">
            <h5>About Us</h5>
            <p>Commit Your Thoughts</p>
        </div>
        <a href = "feedbackForm.jsp"><i class="fas fa-arrow-right arrow-icon"></i> </a><!-- Arrow icon -->
    </div>
</div>


    </div>
  </div>
</section>

<!-- Bootstrap JS (Optional) -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
  crossorigin="anonymous">
</script>
    
    
    

    
    
  <footer class="footer">
    <div class="footer-container">
        <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
        <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
</footer>

</body>
</html>