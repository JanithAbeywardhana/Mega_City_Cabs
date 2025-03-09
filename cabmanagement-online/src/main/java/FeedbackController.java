

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Feedback;
import com.example.service.FeedbackService;

/**
 * Servlet implementation class FeedbackController
 */
@WebServlet("/customer/submitFeedback")
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FeedbackService feedbackService;  
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	@Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }
	
    public FeedbackController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("/registration/feedbackForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        Feedback feedback = new Feedback();
        feedback.setEmail(email);
        feedback.setSubject(subject);
        feedback.setMessage(message);
        
        try {
            boolean isSubmitted = feedbackService.submitFeedback(feedback);
            if (isSubmitted) {
                response.sendRedirect(request.getContextPath() + "/registration/Feedback Success.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/registration/feedbackForm.jsp?error=Feedback submission failed");
            }
        } catch (IllegalArgumentException e) {
            response.sendRedirect(request.getContextPath() + "/registration/feedbackForm.jsp?error=" + e.getMessage());
        }
	}

}
