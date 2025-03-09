

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
 * Servlet implementation class DriverController
 */
@WebServlet("/DriverReg/registerDriver")
public class DriverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriverService driverService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{
    	this.driverService = new DriverService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         String license_number = request.getParameter("license_number");
         String address = request.getParameter("address");
         String password = request.getParameter("password");
         String ride_time = request.getParameter("ride_time");
         String gender = request.getParameter("gender");
         String profilePic = request.getParameter("profilePic");
         
         
         Driver driver = new Driver(0, name, email, license_number, address, password, ride_time, gender, profilePic);
         int[] generatedId = new int[1];
         
         try {
        	 
        	 boolean isRegistered = driverService.registerDriver(driver, generatedId);
        	 
        	 if(isRegistered) {
        		 
        		 int driverId = generatedId[0];
        		 
        		 HttpSession session = request.getSession();
                 session.setAttribute("driverId", driverId);
                 
                 response.sendRedirect(request.getContextPath() + "/DriverReg/driver-questions.jsp");
        	 }else {
        		 response.getWriter().write("Failed to Register as Driver");
        	 }
         }catch(IllegalArgumentException e) {
        	 response.getWriter().write("Error: " + e.getMessage());
         }
	}

}
