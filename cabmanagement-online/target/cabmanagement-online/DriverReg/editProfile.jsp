<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.model.Driver" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
   <!-- Bootstrap CSS -->
  <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
    crossorigin="anonymous">
    
  <!-- Optional: Bootstrap Icons (if needed) -->
  <link 
    rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
  <!-- Custom Advanced CSS Styling -->
  <style>
    /* Container for the whole edit profile form with glassmorphism effect */
    .edit-profile-container {
      max-width: 600px;
      margin: 50px auto;
      padding: 40px;
      background: rgba(255, 255, 255, 0.75);
      border-radius: 15px;
      
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      border: 1px solid rgba(255, 255, 255, 0.18);
    }
    
    /* Header styling */
    .edit-profile-container h2 {
      text-align: center;
      font-weight: 700;
      margin-bottom: 30px;
      color: #333;
    }
    
    /* Form label styling */
    .form-label {
      font-weight: 600;
      margin-bottom: 5px;
      color: #444;
    }
    
    /* Advanced input styling */
    .form-control {
      border: 1px solid #ced4da;
      border-radius: 5px;
      padding: 10px;
      background-color: rgba(255, 255, 255, 0.85);
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    
    .form-control:focus {
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0,123,255,0.5);
      outline: none;
    }
    
    /* Button styling with gradient */
    .btn-primary {
      background: linear-gradient(135deg, #007bff, #0056b3);
      border: none;
      padding: 10px 20px;
      font-size: 1rem;
      border-radius: 5px;
      transition: background 0.3s ease;
    }
    
    .btn-primary:hover {
      background: linear-gradient(135deg, #0056b3, #00408a);
    }
    
    .btn-secondary {
      background: #6c757d;
      border: none;
      padding: 10px 20px;
      font-size: 1rem;
      border-radius: 5px;
      transition: background 0.3s ease;
    }
    
    .btn-secondary:hover {
      background: #5a6268;
    }
    
    /* Responsive adjustments */
    @media (max-width: 576px) {
      .edit-profile-container {
        padding: 20px;
        margin: 20px;
      }
    }
  </style>
</head>
<body>
  <div class="container mt-5 edit-profile-container">
    <h2>Edit Profile</h2>
    <%
      Driver driver = (Driver) session.getAttribute("driver");
      if (driver != null) {
    %>
    <form action="<%= request.getContextPath() %>/DriverReg/editProfile" method="post">
      <input type="hidden" name="driver_id" value="<%= driver.getDriver_id() %>">

      <div class="mb-3">
        <label class="form-label">Name:</label>
        <input type="text" name="name" class="form-control" value="<%= driver.getName() %>" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Email (Cannot be changed):</label>
        <input type="email" name="email" class="form-control" value="<%= driver.getEmail() %>" readonly>
      </div>

      <div class="mb-3">
        <label class="form-label">License Number:</label>
        <input type="text" name="license_number" class="form-control" value="<%= driver.getLicense_number() %>" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Address:</label>
        <input type="text" name="address" class="form-control" value="<%= driver.getAddress() %>" required>
      </div>

      <div class="mb-3">
        <label class="form-label">New Password (Leave blank to keep current):</label>
        <input type="password" name="password" class="form-control">
      </div>

      <div class="mb-3">
        <label class="form-label">Ride Time:</label>
        <input type="text" name="ride_time" class="form-control" value="<%= driver.getRide_time() %>" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Gender:</label>
        <select name="gender" class="form-control" required>
          <option value="Male" <%= driver.getGender().equals("Male") ? "selected" : "" %>>Male</option>
          <option value="Female" <%= driver.getGender().equals("Female") ? "selected" : "" %>>Female</option>
          <option value="Other" <%= driver.getGender().equals("Other") ? "selected" : "" %>>Other</option>
        </select>
      </div>

      <div class="d-flex justify-content-between mt-4">
        <button type="submit" class="btn btn-primary">Update Profile</button>
        <a href="driverDashBoard.jsp" class="btn btn-secondary">Cancel</a>
      </div>
    </form>
    <% } else { %>
      <p class="text-danger">You are not logged in. <a href="driverLogin.jsp">Login here</a>.</p>
    <% } %>
  </div>

  <!-- Bootstrap JS -->
  <script 
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
    crossorigin="anonymous">
  </script>

</body>
</html>