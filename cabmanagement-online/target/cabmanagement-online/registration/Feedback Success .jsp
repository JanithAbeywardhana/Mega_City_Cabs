<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
          background-color: #f8f9fa;
          font-family: Arial, sans-serif;
      }
      .success-container {
          max-width: 600px;
          margin: 40px auto;
          background-color: #fff;
          padding: 20px;
          border-radius: 8px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          text-align: center;
      }
    </style>
</head>
<body>
    <div class="container success-container">
        <h2>Thank You for Your Feedback!</h2>
        <p>Your feedback has been submitted successfully.</p>
        <a href="${pageContext.request.contextPath}/customer/dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>