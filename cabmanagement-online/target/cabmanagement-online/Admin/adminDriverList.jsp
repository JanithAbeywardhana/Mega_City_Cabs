<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f4f7fc;
            font-family: Arial, sans-serif;
        }
        .driver-card {
            margin-bottom: 20px;
        }
        .driver-card .card-header {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }
        .driver-card .card-body {
            background-color: #fff;
        }
        .driver-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #0d6efd;
            margin-bottom: 10px;
        }
        .action-buttons .btn {
            margin-right: 5px;
        }
    </style>
</head>
<body>



<div class="container my-4">
    <h2 class="text-center">Driver Profiles</h2>
    <c:if test="${empty drivers}">
        <div class="alert alert-info text-center">No drivers found.</div>
    </c:if>
    <div class="row">
        <c:forEach var="driver" items="${drivers}">
            <div class="col-md-4">
                <div class="card driver-card shadow-sm">
                    <div class="card-header text-center">
                        Driver ID: ${driver.driver_id}
                    </div>
                    <div class="card-body text-center">
                        <c:url value="/${driver.profilePic}" var="profilePicUrl" />
                        <img src="${profilePicUrl}" alt="Profile Picture">
                        <h5 class="mt-2">${driver.name}</h5>
                        <p>Email: ${driver.email}</p>
                        <p>License: ${driver.license_number}</p>
                        <p>Ride Time: ${driver.ride_time}</p>
                    </div>
                    <div class="card-footer text-center action-buttons">
                        <a href="${pageContext.request.contextPath}/admin/deleteDriver?id=${driver.driver_id}" 
                           class="btn btn-danger btn-sm" 
                           onclick="return confirm('Are you sure you want to delete this driver?');">
                           Delete
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/Admin/adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>
<!-- Bootstrap JS Bundle (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>