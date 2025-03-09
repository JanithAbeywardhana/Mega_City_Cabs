

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.DriverQuestion;
import com.example.service.DriverQuestionService;

/**
 * Servlet implementation class driverQuestionController
 */
@WebServlet("/DriverReg/submit-driver-questions")
public class driverQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriverQuestionService driverQuestionService;
	private DriverQuestion driverQuestion;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public driverQuestionController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{
        this.driverQuestionService = new DriverQuestionService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer driverId = (Integer) session.getAttribute("driverId");
        
        if (driverId == null) {
            response.getWriter().write("Error");
            return;
        }
        
        
        
        
        String first_question = request.getParameter("first_question");
        String second_question = request.getParameter("second_question");
        String third_question = request.getParameter("third_question");
        String forth_question = request.getParameter("forth_question");
        String fifth_question = request.getParameter("fifth_question");
        
        
        DriverQuestion driverQuestion = new DriverQuestion();
        driverQuestion.setDriver_id(driverId);
        driverQuestion.setFirst_question(first_question);
        driverQuestion.setSecond_question(second_question);
        driverQuestion.setThird_question(third_question);
        driverQuestion.setForth_question(forth_question);
        driverQuestion.setFifth_question(fifth_question);
        
        
    
        System.out.println("Driver ID: " + driverQuestion.getDriver_id());
        System.out.println("First Question: " + driverQuestion.getFirst_question());
        System.out.println("Second Question: " + driverQuestion.getSecond_question());
        System.out.println("Third Question: " + driverQuestion.getThird_question());
        System.out.println("Fourth Question: " + driverQuestion.getForth_question());
        System.out.println("Fifth Question: " + driverQuestion.getFifth_question());
        
       
        boolean isAdded = driverQuestionService.addDriverQuestion(driverQuestion);
        
        
    
        if (isAdded) {
            response.sendRedirect(request.getContextPath() + "/DriverReg/driverDashBoard.jsp");
        } else {
            response.getWriter().write("Failed to save driver questions.");
        }
        
        
	}

}
