<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.example.model.Driver" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Driver Dashboard</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  
   <link 
    rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
  >
  <style>

        body {
          background-color: #f8f8f8;
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          transition: background-color 0.3s, color 0.3s;
        }
        #sidebar {
          position: fixed;
          top: 0;
          left: 0;
          height: 100vh;
          width: 250px;
          background-color: #343a40;
          color: #fff;
          transition: width 0.3s;
          overflow-x: hidden;
          z-index: 1000;
        }
        #sidebar .sidebar-header {
          padding: 20px;
          background: #23272b;
          text-align: center;
        }
        #sidebar ul.components {
          padding: 20px 0;
          list-style: none;
        }
        #sidebar ul li {
          padding: 10px 20px;
          font-size: 1.1rem;
        }
        #sidebar ul li a {
          color: #d1d1d1;
          text-decoration: none;
          display: block;
          transition: color 0.3s;
        }
        #sidebar ul li a:hover {
          color: #fff;
          background-color: #575757;
          border-radius: 4px;
        }
        #content {
          margin-left: 250px;
          transition: margin-left 0.3s;
          padding: 20px;
        }
        .navbar {
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .navbar .navbar-brand {
          margin-left: 250px;
          transition: margin-left 0.3s;
        }
        @media (max-width: 768px) {
          #sidebar {
            width: 200px;
          }
          #content {
            margin-left: 200px;
          }
          .navbar .navbar-brand {
            margin-left: 200px;
          }
        }


        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #0d6efd;
            margin-right: 15px;
        }


        .dashboard-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 30px;
        }
        .dashboard-header .welcome-text h1 {
          font-size: 1.8rem;
          font-weight: 600;
        }
        .dashboard-header .welcome-text p {
          color: #666;
        }


        .stats-row {
          display: flex;
          flex-wrap: wrap;
          gap: 20px;
          margin-bottom: 30px;
        }
        .stats-card {
          flex: 1 1 200px;
          background-color: #fff;
          border-radius: 10px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          padding: 20px;
          min-width: 200px;
        }
        .stats-card h4 {
          font-size: 1rem;
          font-weight: 600;
          margin-bottom: 10px;
        }
        .stats-card p {
          font-size: 0.9rem;
          color: #555;
        }
        
        
       .uber-section {
            text-align: center;
            padding: 50px 20px;
        }
        .uber-image {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
        .uber-icon {
            font-size: 24px;
            margin-bottom: 10px;
        }
        
        
        .earn-section {
            text-align: left;
            padding: 50px 20px;
        }
        .earn-image {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .earn-content h5 {
            font-weight: bold;
        }
        .earn-content a {
            text-decoration: none;
            font-weight: bold;
        }

  
 
        .tasks-section, .activity-section {
          background-color: #fff;
          border-radius: 10px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          padding: 20px;
        }
        .tasks-section h5,
        .activity-section h5 {
          font-weight: 600;
          margin-bottom: 15px;
        }
        .tasks-section .task-item,
        .activity-section .activity-item {
          margin-bottom: 10px;
          font-size: 0.9rem;
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
    
  <nav id="sidebar">
    <div class="sidebar-header">
      <h3>Driver Dashboard</h3>
    </div>
    <ul class="components">
      <li class="active"><a href="driverDashBoard.jsp"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a></li>
      <li><a href="<%= pageContext.getServletContext().getContextPath() %>/DriverReg/editProfile"><i class="fas fa-user-edit me-2"></i>Edit Profile</a></li>
      <li><a href="${pageContext.request.contextPath}/driver/assignedRides"><i class="fas fa-car-side me-2"></i>Assigned Rides</a></li>
      
      <li><a href="${pageContext.request.contextPath}/driver/earnings" class="btn btn-primary">View Earnings</a></li>
      <li><a href="<%= pageContext.getServletContext().getContextPath() %>/driver/logout" class="btn btn-secondary"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
    </ul>
  </nav>

  
  <div id="content">
    
    <nav class="navbar-expand-lg ">
      <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
          <i class="fas fa-bars"></i>
        </button>
        <a class="navbar-brand" href="#"></a>
      </div>
    </nav>

    <div class="container dashboard-card">
      
      <%
        Driver driver = (Driver) session.getAttribute("driver");
        if (driver != null) {
      %>

      
      <div class="dashboard-header">
        <div class="welcome-text">
          <h1>Hello, <%= driver.getName() %>!</h1>
          <p>Here is your driver performance and ride statistics.</p>
        </div>
        <div class="d-flex align-items-center">
          <c:url value="/${driver.profilePic}" var="profilePicUrl" />
          <img src="${profilePicUrl}" alt="Profile Picture" class="profile-pic">
        </div>
      </div>

     
      <div class="stats-row">
       
        <div class="stats-card">
          <h4>Finished Rides</h4>
          <p><strong>12</strong> this week</p>
        </div>
        <div class="stats-card">
          <h4>Ongoing Rides</h4>
          <p><strong>2</strong> in progress</p>
        </div>
        <div class="stats-card">
          <h4>Overall Efficiency</h4>
          <p><strong>93%</strong> rating</p>
        </div>
      </div>
      
      


   

     
      <div class="row">
        <div class="col-md-6 mb-4">
          <div class="tasks-section">
            <h5>Current Tasks</h5>
            <div class="task-item">Product Review to "Rider 205"</div>
            <div class="task-item">New Ride Request from "John"</div>
            <div class="task-item">Service & Maintenance</div>
          </div>
        </div>
        <div class="col-md-6 mb-4">
          <div class="activity-section">
            <h5>Recent Activity</h5>
            <div class="activity-item">You completed a ride with “Lily”</div>
            <div class="activity-item">“Mason” gave you a 5-star rating</div>
            <div class="activity-item">You updated your vehicle details</div>
          </div>
        </div>
      </div>
      
      
      
          <section class="earn-section">
        <div class="container">
            <h2 class="mb-4">Earn on your terms</h2>
            <div class="row">
                <div class="col-md-6">
                    <img src="../img/Driving.jpg" alt="Driver" class="earn-image">
                    <div class="earn-content mt-3">
                        <h5>Earn anytime, anywhere</h5>
                        <p>Fit driving around what matters most. Drive at any time and on any day of the week.</p>
                        <a href="#">Learn more</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="../img/Driving2.jpg" alt="Car Rental" class="earn-image">
                    <div class="earn-content mt-3">
                        <h5>Need a car to earn?</h5>
                        <p>You can get an affordable car by the hour, week, or longer. Cars from our vehicle partners come with insurance, unlimited mileage, and more.</p>
                        <a href="#">Get a car</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
      
      
      
      
            <section class="uber-section">
        <h2>Why drive with Mega City Cabs</h2>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <img src="../img/DriverMega.png" alt="Uber Driving" class="uber-image">
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-4 text-center">
                    <div class="uber-icon">&#128197;</div>
                    <h5>Set your own hours</h5>
                    <p>You decide when and how often you drive.</p>
                </div>
                <div class="col-md-4 text-center">
                    <div class="uber-icon">&#128181;</div>
                    <h5>Get paid fast</h5>
                    <p>Choose how and when you want to cash out.</p>
                </div>
                <div class="col-md-4 text-center">
                    <div class="uber-icon">&#128101;</div>
                    <h5>Get support at every turn</h5>
                    <p>If you have questions, you can reach us anytime.</p>
                </div>
            </div>
        </div>
    </section>
    
    
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <div class="faq-container">
  <h2>Driver Guidelines for drive with Mega City Cabs.</h2>


  <div class="faq-item">
    <button class="faq-question">
      <span>1. When can I register to drive with Mega City Cabs?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
       Driver registrations are open only during a designated registration season at the beginning of the year. 
       Outside of this period, new registrations are not accepted.
      </p>
      
    </div>
  </div>
  
 
  <div class="faq-item">
    <button class="faq-question">
      <span>2. What do I need to provide during registration?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
        When registering during the designated season, you must submit all required documentation—including your valid 
        driver’s license, vehicle registration, insurance details, and any other stipulated requirements—to ensure you meet our standards.




      </p>
    </div>
  </div>
  

  <div class="faq-item">
    <button class="faq-question">
      <span>3. How can I view and update my assigned rides?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
        Once registered and approved, you’ll have access to your driver dashboard where you can see all assigned rides. 
        You can update the status of each ride in real time (for example, marking it as “Ride Started” when you begin the trip).
      </p>
    </div>
  </div>
  

  <div class="faq-item">
    <button class="faq-question">
      <span>4. How much commission do I earn per ride?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
       All drivers earn a commission of 10% on each ride they complete. 
       This amount is automatically calculated and credited as part of your monthly earnings.
      </p>
    </div>
  </div>
  
    <div class="faq-item">
    <button class="faq-question">
      <span>5. How is my monthly salary processed?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
       At the end of each month, administrators review your ride history and 
       process your monthly salary based on the rides you’ve completed during that period.
      </p>
    </div>
  </div>
  
  
  <div class="faq-item">
    <button class="faq-question">
      <span>6. Can I update my driver profile after registration?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
       Yes, you can edit your profile at any time through the driver dashboard. This includes updating your personal details and adding or 
       changing your profile picture to keep your information current.
      </p>
    </div>
  </div>
</div>


<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
  crossorigin="anonymous">
</script>

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


     
      <form action="<%= request.getContextPath() %>/DriverReg/uploadProfilePic" method="post" enctype="multipart/form-data" class="mt-4">
        <div class="mb-3">
          <label for="profilePic" class="form-label">Upload Profile Picture:</label>
          <input type="file" name="profilePic" id="profilePic" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Upload</button>
      </form>
      
      
      
      



      <% } else { %>
        <div class="alert alert-warning">You are not logged in. <a href="driverLogin.jsp">Login here</a>.</div>
      <% } %>
    </div>
  </div>
  
  
   <footer class="footer">
    <div class="footer-container">
        <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
        <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
</footer>

   <script src="DriverDash.js"></script> 
    
     
</body>
</html>