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
      
      
        .mission-section {
            text-align: left;
            padding: 50px 20px;
            max-width: 88%;
            margin: auto;
        }
        
        .mission-section h1{
            font-size: 30px;
        }
        
        .mission-section p{
            font-size: 13px;
             text-align: justify;
        }
        
        .mission-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.5s ease-in-out;
        }
        .toggle-btn {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
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
    
    
         <section class="mission-section">
        <h1 >We reimagine the way the world moves for the better</h1>
        <p>Movement is what we power. It's our lifeblood. It runs through our veins. It’s what gets us out of bed each morning. It pushes us to constantly reimagine how we can move better. For you. For all the places you want to go. For all the things you want to get. For all the ways you want to earn. Across the entire world. In real time. At the incredible speed of now.</p>
        
        <button class="toggle-btn" onclick="toggleMission()">&#9650;</button>
        
        <div class="mission-content" id="mission-content">
            <h4>Read our full mission statement</h4>
            <p>At Mega City Cabs Service, our mission is to provide safe, reliable, and efficient transportation solutions across Colombo. We are committed to delivering exceptional customer experiences through professional drivers, well-maintained vehicles, and cutting-edge technology. 
            Our goal is to ensure convenient, affordable, and timely rides for every passenger while upholding the highest standards of safety and service excellence. Whether for daily commutes or special journeys, Mega City Cabs is your trusted travel partner.</p>
            
        </div>
    </section>
    
    <script>
        function toggleMission() {
            var content = document.getElementById("mission-content");
            var btn = document.querySelector(".toggle-btn");
            if (content.style.maxHeight === "0px" || content.style.maxHeight === "") {
                content.style.maxHeight = content.scrollHeight + "px";
                btn.innerHTML = "&#9660;"; // Down arrow
            } else {
                content.style.maxHeight = "0px";
                btn.innerHTML = "&#9650;"; // Up arrow
            }
        }
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
    
    

    
    
         <footer class="footer">
    <div class="footer-container">
        <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
        <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
</footer>

</body>
</html>