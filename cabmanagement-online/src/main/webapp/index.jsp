<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
     <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
    crossorigin="anonymous"
  >
  
  <link 
    rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
  >
    
    <link rel="stylesheet" href="index.css">
 
  
  
  <style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column; 
    align-items: center;
    height: auto;
    background-color: #f8f8f8;
}



.header {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    
    padding: 15px 10px;
    margin-top:-60px;
    
}


.logo-container {
    margin-right:1010px;
    display: flex;
    align-items: center;
}


.logo-container img {
    width: 200px; 
    height: auto;
    margin-right: -50px;
}



.logo-text {
    font-size: 20px;
    font-weight: bold;
    color: #0a3d62; 
    font-family: Arial, sans-serif;
}






.container {
    display: flex;
    justify-content: space-between;
    align-items: center; 
    margin-left: 100px;
    max-width: 1100px; 
    width: 100%;
    padding: 10px;
    margin-top: -60px;
}


.text-section {
    max-width: 40%;
}

h1 {
    font-size: 4.0rem;
    font-weight: bold;
}

.highlight {
    color: gray;
    font-weight: bold;
}

p {
    font-size: 1rem;
    color: #555;
}

button {
    background-color: black;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    font-size: 1rem;
    width: 100%;
    border-radius: 5px;
}

button:hover {
    background-color: #333;
}


.image-section {
    width: 50px;
    margin-right: 500px;
}



.Mega-section {
    padding: 80px 0;
   margin-left: 40px;
  
}

.black-box {
    background-color: black;
    color: white;
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.black-box h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

.signup-link {
    color: #ccc;
    font-size: 16px;
    text-decoration: none;
}

.signup-link:hover {
    color: white;
    text-decoration: underline;
}

.black-box hr {
    border: none;
    height: 1px;
    background-color: white;
    margin: 20px 0;
}

.card {
    background-color: white;
    border: none;
    overflow: hidden;
}

.card img {
    width: 100%;
    height: auto;
}

.card-content {
    padding: 15px;
}

.category {
    font-size: 14px;
    color: gray;
    text-transform: uppercase;
}

.card h3 {
    font-size: 20px;
    font-weight: bold;
    margin: 10px 0;
}

.date {
    font-size: 14px;
    color: gray;
}




.features {
    max-width: 1200px;
    margin: 50px auto;
    text-align: center;
    padding: 40px;
}

.features-container h1 {
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 30px;
    text-align: center;
}


.feature-container {
    display: flex;
    justify-content: space-between; 
    gap: 20px;
}


.feature-card {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    
    width: 40%;
    position: relative;
}


.feature-card:hover {
    transform: scale(1);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}


.feature-img {
    width: 300px;
    height: 300px;
    object-fit: contain;
    margin-bottom: 10px;
    background-color: #f8f8f8;
}


.feature-card h3 i {
    font-size: 20px;
    margin-right: 5px;
}


.button-group {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 15px;
}

.book-now, .learn-more {
    background-color: black;
    color: white;
    border: none;
    padding: 8px 12px;
    font-size: 12px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.book-now:hover {
    background-color: #ff9800;
}

.learn-more {
    background-color: gray;
}

.learn-more:hover {
    background-color: black;
}


@media (max-width: 900px) {
    .feature-container {
        flex-direction: column; 
        align-items: center;
    }

    .feature-card {
        width: 80%;
    }
}



.why-choose-us {
    text-align: center;
    padding: 50px 20px;
    margin: -5px auto; 
    max-width: 1400px; 
    width: 100%; 
}

.why-choose-us h2 {
    font-size: 2rem;
    
    color: #333;
}

.subtitle {
    font-size: 0.9rem;
    color: #777;
    margin-bottom: 30px;
}


.f-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px;
    max-width: 1200px;
    margin: 0 auto;
}

.f {
    background-color: #fff;
    padding: 20px;
    width: 250px;
    text-align: center;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.f i {
    font-size: 40px;
    color: black;
    margin-bottom: 15px;
}

.f h3 {
    font-size: 0.9rem;
    
    color: #333;
}

.f p {
    font-size: 0.9rem;
    color: #666;
}


.f:hover {
    transform: translateY(-5px);
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.15);
}





.how-it-works {
    padding: 50px 20px;
    max-width: 1200px;
    margin: auto;
    text-align: center;
   
    
}

.how-it-works h2 {
    font-size: 2.5rem;
   
    color: black;
    margin-bottom: 10px;
}

.how-it-works h3{
    font-size: 1.0rem;
    font-weight: bold;
}

.how-it-works p {
    font-size: 0.9rem;
    color: #333;
}

.highlights {
    font-weight: bold;
    color: #333;
}

.steps-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    margin-top: 40px;
    position: relative;
}


.step {
    
    padding: 20px;
    text-align: center;
    
    position: relative;
    transition: transform 0.3s ease-in-out;
}



.step-icon {
    background-color: #e0f2ff;
    width: 60px;
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    margin: 0 auto 15px;
    position: relative;
}


.step::after {
    content: "";
    position: absolute;
    top: 50px; 
    left: 48%;
    width: 300px; 
    height: 1px;
    background-color: #0073e6;
    z-index: -1;
}


.step:last-child::after {
    display: none;
}


@media (max-width: 900px) {
    .steps-container {
        flex-direction: column;
        align-items: center;
    }

    .step {
        width: 80%;
        margin-bottom: 20px;
    }

    
    .step::after {
        display: none;
    }
}
.step-icon i {
    font-size: 24px;
    color: #0073e6;
}

.payment-options {
    display: flex;
    align-items: center; 
    justify-content: center; 
    gap: 20px;  
    margin-top: 30px;
    flex-wrap: wrap; 
}




.payment-options img {
    width: 50px;
    height: auto;
    
}


@media (max-width: 900px) {
    .steps-container {
        flex-direction: column;
    }

    .step {
        width: 80%;
        margin-bottom: 20px;
    }
}




   .featuress-container {
       
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        

        .features-container p {
            color: #666;
            margin-bottom: 10px;
            font-size: 2rem;
        }

        .features-grid {
            display: flex;
            justify-content: center;
            gap: 40px;
        }

        .feature-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px;
            transition: transform 0.3s ease;
            width: 250px; 
            text-align: center; 
        }



        .feature-card img {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            margin-bottom: 10px;
            object-fit: cover; 
        }

        .feature-card h3 {
            font-size: 1rem;
            margin-bottom: 10px;
            color: #333;
            text-align: left;
        }

        .feature-card p {
            font-size: 0.7rem;
            color: #666;
            text-align: left;
        }
        
        
        
         .section-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            
        }

        .image-container {
            flex: 1;
            display: flex;
            justify-content: center;
            position: relative;
            width: 300px;
            height: 400px;
            overflow: hidden;
            border-radius: 15px;
        }

        .image-container img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            
           
            
        }

   

        .content-container {
            flex: 2;
            padding: 0 20px;
        }

        .content-container h1 {
            font-size: 2rem;
            color: #333;
        }

        .content-container h1 span {
            color: gray;
        }

        .content-container p {
            color: #666;
            line-height: 1.6;
            margin: 15px 0;
        }

        .content-container a {
            text-decoration: none;
            color: black;
        }

  
        
        
        
       
.hero-section {
    position: relative;
    width: 90%; 
    max-width: 1200px; 
    margin: 30px auto; 
    height: 400px;
    background-image: url('img/TravelGirl.jpg'); 
    background-size: cover;
    background-position: center;
    border-radius: 20px; 
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}






.driver-registration {
    display: flex;
    align-items: center;
    gap: 60px; 
    padding: 60px 8%;
    
}


.content {
    width: 50%;
}

.content h5 {
    color: gray;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
}

.content h2 {
    font-size: 28px;
    font-weight: 600;
    margin: 10px 0;
}

.content p {
    font-size: 14px;
    line-height: 1.6;
    color: #444;
    margin-bottom: 15px;
}


.register-btn {
    background-color: Black;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    transition: 0.3s ease;
}

.register-btn:hover {
    background-color: #cc7a00;
}


.image-container {
    width: 50%;
    text-align: right;
}

.image-container img {
    width: 100%;
    
    border-radius: 10px;
}



.hero {
    background-color: #000; 
    color: white; 
    height: 90vh;
    width: 100%;
}


.hero h1 {
    font-size: 3rem; 
    max-width: 700px;
}


.text-muted {
    color: #fff !important;
}


.btn-light {
   border-radius: 20px;
    padding: 10px 25px; 
    font-size: 1.1rem;
}


.img-fluid {
    max-width: 100px;
    height: auto;
}

.text-offwhite {
  color: gray !important;
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
    
    
    
    /* Section Container */
.apps-section {
  background-color: #f9f9f9; /* Light gray background, if desired */
  padding: 40px 0;
  width: 100%;
}

/* Section Title */
.section-title {
  font-size: 1.8rem;
  font-weight: 600;
  margin-bottom: -40px;
  color: #000;
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
 
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 </head>
   <body>


     <header class="header">
       <div class="logo-container">
        <img src="img/1R.png" alt="Mega City Cab Logo">
        
       </div>
     </header>
     


     
     




 <div class="container">
 
        <div class="text-section">
            <h1>We'll take you <br>
                <span class="highlight">Place</span> <br>
                Where ever, <br>
                <span class="highlight">When ever.</span>
            </h1>
            <p>Safe affordable rides to everywhere in Colombo. Grab Your cab now, get 20% off!</p>
            
            <a href = "registration/login.jsp">
            <button  id="rideButton"  >Let's Ride</button>
            </a>
         </div>
        
        <div class="image-section">
            <img src="img/img1.png" alt="Cab Service Icon">
        </div>
  </div>
  
  
  
   <section class="why-choose-us">
        <h2>Why Choose Us</h2>
        <p class="subtitle">We specialize in execute travel to and from all airports, seaports, Business meetings & long distances</p>

        <div class="f-container">
            <div class="f">
                <i class="fas fa-calendar-check"></i>
                <h3>Easy Online Booking</h3>
                <p>Introducing our intuitive online booking system, designed to provide you with the flexibility to add or modify reservations at any time.</p>
            </div>
            <div class="f">
                <i class="fas fa-user-tie"></i>
                <h3>Professional Drivers</h3>
                <p>Experience the pinnacle of professionalism with our expert drivers. Our professional drivers are more than just chauffeurs.</p>
            </div>
            <div class="f">
                <i class="fas fa-car"></i>
                <h3>Premium Fleet of Automobiles</h3>
                <p>Our premium vehicles are meticulously selected to offer the utmost in comfort, style, and performance.</p>
            </div>
            <div class="f">
                <i class="fas fa-credit-card"></i>
                <h3>Online Payment</h3>
                <p>We understand the importance of efficiency, and our secure online payment platform allows you to settle your transportation charges effortlessly.</p>
            </div>
        </div>
    </section> 
  
  
  
  
  <section class="Mega-section">
    <div class="container">
        <div class="row">
            <!-- Left Black Box -->
            <div class="col-md-4 black-box">
                <h2>Get a ride when you need one</h2>
                <a href="#" class="signup-link">Sign up to ride</a>
                <hr>
                <h2>Start earning in your city</h2>
                <a href="#" class="signup-link">Sign up to drive</a>
            </div>

            <!-- Right Two Cards -->
            <div class="col-md-4">
                <div class="card">
                    <img src="img/AIRide.jpg" alt="Train Image">
                    <div class="card-content">
                        <span class="category">Engineering, Backend, Data / ML, AI</span>
                        <h3>How Mega City Cabs Leverages AI to Optimize Ride Operations</h3>
                        <span class="date">January 9 / Global</span>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <img src="img/Ridee.jpg" alt="Stadium Image">
                    <div class="card-content">
                        <span class="category">Transit</span>
                        <h3>How Mega City Cabs Supports University Transport with Reliable Rides</h3>
                        <span class="date">January 6 / Global</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


  
  
  
  
  
       
    
    
    
    <div class="section-container">
        <div class="image-container">
            <img src="img/Sl.png" alt="Professional Woman">
        </div>
        <div class="content-container">
            <h1>Reliable <span>cab and tour</span> services</h1>
            <a href="#">About us more details</a>
            <p>
               Mega City Cabs is your go-to solution for reliable and comfortable taxi services in Colombo. 
               Whether you need a quick city ride, an airport transfer, or a personalized tour, 
               we ensure a seamless travel experience with well-maintained vehicles and professional drivers. 
               Enjoy safe, timely, and affordable rides with Mega City Cabs—your trusted transport partner!
            </p>
            
         </div>
    </div>
    
    
     <section class="hero d-flex align-items-center">
        <div class="container">
            <div class="row align-items-center">
               
                <div class="col-md-6">
                    <h1 class="fw-bold">Drive when you want, make what you need</h1>
                    <p class="text-offwhite">Earn on your own schedule.</p>
                    <div class="d-flex align-items-center mt-3">
                        <a href ="DriverReg/DRegister.jsp"><button class="btn btn-light fw-bold px-4 py-2 me-3">Get started</button></a>
                        
                        <a href="DriverReg/driverLogin.jsp" class="text-offwhite  text-decoration-none ms-3">
                         Already have an account? <span class="text-white fw-bold">Sign in</span>
                        </a>
                    </div>
                </div>

               
                <div class="col-md-6 text-center">
                    <img src="img/Driver11.png" alt="Driver Illustration" class="img-fluid">
                </div>
            </div>
        </div>
    </section>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 

    





<div class="faq-container">
  <h2>User Guidelines for ride with Mega City Cabs.</h2>


  <div class="faq-item">
    <button class="faq-question">
      <span>1. Why must I register to book a ride?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
        To ensure your safety and provide a personalized experience, all customers must register with Mega City Cabs. 
        Registration helps us verify your identity, offer real-time ride updates, and securely store your booking history.
      </p>
      
    </div>
  </div>
  
 
  <div class="faq-item">
    <button class="faq-question">
      <span>2. Which areas does Mega City Cabs serve?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
        We currently operate exclusively within the Western Province to ensure prompt and reliable service. 
        Rides outside this area are not available at this time.


      </p>
    </div>
  </div>
  

  <div class="faq-item">
    <button class="faq-question">
      <span>3. How do I confirm my booking and pay for my ride?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
        Once you select your ride and review the trip details, you'll receive a prompt to confirm your booking. 
        You can then choose to pay directly to your driver or use our secure online payment system integrated into our platform.
      </p>
    </div>
  </div>
  

  <div class="faq-item">
    <button class="faq-question">
      <span>4. Can I download my booking receipt?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
        Yes. After your ride is completed and your payment is confirmed, you can download a digital copy of your 
        booking receipt from your account dashboard for your records.
      </p>
    </div>
  </div>
  
    <div class="faq-item">
    <button class="faq-question">
      <span>5. How can I view my ride status and booking history?</span>
      <i class="bi bi-chevron-down arrow"></i>
    </button>
    <div class="faq-answer">
      <p>
       Your account dashboard provides real-time updates on your current ride status as well as a comprehensive history of all your past bookings, 
       making it easy to track your trips and manage your travel records.
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



    

    
    
    <section class="how-it-works">
    <h2>How it works</h2>
    <p>Find and book a <span class="highlights">reliable cab</span> with our <span class="highlights">easy taxi booking service.</span></p>

    <div class="steps-container">
        <div class="step">
            <div class="step-icon"><i class="fas fa-map-marker-alt"></i></div>
            <h3>Pick your location</h3>
            <p>Choose a destination and schedule your ride. We connect you with the best drivers.</p>
        </div>

        <div class="step">
            <div class="step-icon"><i class="fas fa-car"></i></div>
            <h3>Choose your ride</h3>
            <p>Select from a range of cars to match your needs. All drivers are verified professionals.</p>
        </div>

        <div class="step">
            <div class="step-icon"><i class="fas fa-credit-card"></i></div>
            <h3>Pay securely</h3>
            <p>Complete your ride payment safely through our website or app.</p>
        </div>

        <div class="step">
            <div class="step-icon"><i class="fas fa-shield-alt"></i></div>
            <h3>Ride with confidence</h3>
            <p>Our drivers are rated by customers to ensure safety and reliability.</p>
        </div>
    </div>

    <div class="payment-options">
        
        <img src="img/MasterC.png" alt="Mastercard">
        <img src="img/CreditC.png" alt="Visa">
        <img src="img/VizaC.png" alt="Amex">
        <img src="img/Paypal.png" alt="PayPal">
        
    </div>
</section>


<section class="apps-section">
  <div class="container">
    <h2 class="section-title">Its easier in the apps</h2>
    <div class="row mt-4 g-4">
      
<div class="d-flex justify-content-center">
    <div class="custom-card">
        <img src="img/QR.jpg" alt="QR Code 1">
        <div class="card-content">
            <h5>Download Mega City App</h5>
            <p>Scan to download</p>
        </div>
        <i class="fas fa-arrow-right arrow-icon"></i> <!-- Arrow icon -->
    </div>

    <div class="custom-card">
        <img src="img/TW.jpg" alt="QR Code 2">
        <div class="card-content">
            <h5>About Us</h5>
            <p>Commit Your Thoughts</p>
        </div>
        <a href = "registration/feedbackForm.jsp"><i class="fas fa-arrow-right arrow-icon"></i> </a><!-- Arrow icon -->
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
     

   
        
        



  
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
  <script src="index.js"></script>

</body>
</html>
