<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/* Overall Page Styling */
body {
  background-color: #f0f2f5;
  font-family: 'Roboto', sans-serif;
  margin: 0;
  padding: 0;
}

/* Container for the Edit Profile Page */
.profile-container {
  max-width: 1000px;
  margin: 30px auto;  /* Top margin ensures heading is at the top */
  padding: 0 15px;
}

/* Page Heading */
.profile-heading {
  text-align: center;
  font-size: 2rem;
  color: #333;
  font-weight: 700;
  margin-bottom: 30px;
}

/* Main Content: Two-Column Layout */
.profile-content {
  display: flex;
  background-color: #fff;
  border-radius: 8px;
  
  overflow: hidden;
}

/* Left Column: Image Section */
.profile-image {
  flex: 1;
  
  display: flex;
  justify-content: center;
  align-items: center;
  padding: -10px;
}

.profile-image img {
  
  border-radius: 8px;
  width: 400px;
}

/* Right Column: Form Section */
.profile-form {
  flex: 2;
  padding: 40px;
}

.profile-form form {
  /* Remove default <br> spacing if present */
}

.profile-form form label {
  display: block;
  font-weight: 600;
  color: #555;
  margin-bottom: 5px;
}

.profile-form form input[type="text"],
.profile-form form input[type="email"],
.profile-form form input[type="password"] {
  width: 100%;
  padding: 10px 12px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 4px;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.profile-form form input[type="text"]:focus,
.profile-form form input[type="email"]:focus,
.profile-form form input[type="password"]:focus {
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0,123,255,0.5);
  outline: none;
}

.profile-form form input[type="submit"] {
  width: 100%;
  background-color: #007bff;
  color: #fff;
  padding: 12px;
  font-size: 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.profile-form form input[type="submit"]:hover {
  background-color: #0056b3;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
  .profile-content {
    flex-direction: column;
  }
  .profile-image,
  .profile-form {
    padding: 20px;
  }
}
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="profile-container">
        <div class="profile-heading">Edit Your Profile</div>
        <div class="profile-content">
            <!-- Left Column: Image -->
            <div class="profile-image">
                <img src="../img/EditProfile.png" alt="Profile Picture">
            </div>
            <!-- Right Column: Form -->
            <div class="profile-form">
                <c:if test="${not empty errorMessage}">
                    <p class="text-danger text-center">${errorMessage}</p>
                </c:if>
                <form action="${pageContext.request.contextPath}/customer/editProfile" method="post">
                    <input type="hidden" name="customer_id" value="${customer.customer_id}" />
                    
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${customer.name}" required>
                    
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${customer.email}" required>
                    
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="${customer.password}" required>
                    
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${customer.address}" required>
                    
                    <label for="phone_number">Phone Number:</label>
                    <input type="text" id="phone_number" name="phone_number" value="${customer.phone_number}" required>
                    
                    <label for="nic">NIC:</label>
                    <input type="text" id="nic" name="nic" value="${customer.nic}" required>
                    
                    <input type="submit" value="Update Profile">
                </form>
            </div>
        </div>
    </div>
</body>
</html>