<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
          background-color: #f8f9fa;
          font-family: Arial, sans-serif;
      }
      .feedback-container {
          max-width: 600px;
          margin: 40px auto;
          background-color: #fff;
          padding: 20px;
          border-radius: 8px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      }
      .feedback-container h2 {
          margin-bottom: 20px;
      }
    </style>
</head>
<body>
    <div class="container feedback-container">
        <h2>Submit Your Feedback</h2>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">${param.error}</div>
        </c:if>
        <form action="${pageContext.request.contextPath}/customer/submitFeedback" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" name="email" id="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="subject" class="form-label">Subject:</label>
                <input type="text" name="subject" id="subject" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message:</label>
                <textarea name="message" id="message" class="form-control" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Feedback</button>
        </form>
    </div>
    
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>