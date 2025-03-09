

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Driver;
import com.example.service.DriverService;

/**
 * Servlet implementation class DriverLoginController
 */
@WebServlet("/DriverReg/driverLog")
public class DriverLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriverService driverService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{
    	this.driverService = new  DriverService();
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			Driver driver = driverService.authenticateDriver(email, password);
			if(driver != null) {
				
				HttpSession session = request.getSession();
				session.setAttribute("driver", driver);
				response.sendRedirect(request.getContextPath() + "/DriverReg/driverDashBoard.jsp");
				
				
				
			}else {
				response.getWriter().write("Invalid Email or Password! please try again.");
			}
		}catch (IllegalArgumentException e) {
			response.getWriter().write("Error" + e.getMessage());
		}
	}

}
