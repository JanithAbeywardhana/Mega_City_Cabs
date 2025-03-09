

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dao.DriverDAO;
import com.example.model.Driver;

/**
 * Servlet implementation class UpdateDriverProfileController
 */
@WebServlet("/DriverReg/editProfile")
public class UpdateDriverProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDriverProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("/DriverReg/editProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int driverId = Integer.parseInt(request.getParameter("driver_id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email"); // Read-only field
        String licenseNumber = request.getParameter("license_number");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String rideTime = request.getParameter("ride_time");
        String gender = request.getParameter("gender");
        String profilePic = request.getParameter("profilePic");

       
        Driver existingDriver = DriverDAO.getDriverByEmail(email);
        if (existingDriver == null) {
        	response.sendRedirect(request.getContextPath() +"/DriverReg/editProfile.jsp?error=User not found");
            return;
        }

        
        if (password == null || password.isEmpty()) {
            password = existingDriver.getPassword();
        }

        
        Driver updatedDriver = new Driver(driverId, name, email, licenseNumber, address, password, rideTime, gender, profilePic);

       
        boolean isUpdated = DriverDAO.updateDriverProfile(updatedDriver);

        if (isUpdated) {
           
            HttpSession session = request.getSession();
            session.setAttribute("driver", updatedDriver);

            response.sendRedirect(request.getContextPath() +"/DriverReg/driverDashBoard.jsp?success=Profile updated successfully");
        } else {
            response.sendRedirect(request.getContextPath() +"/DriverReg/editProfile.jsp?error=Update failed. Try again.");
        }
    }
	}


