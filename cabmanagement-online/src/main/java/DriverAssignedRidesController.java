

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Booking;
import com.example.model.Driver;
import com.example.service.BookingService;

/**
 * Servlet implementation class DriverAssignedRidesController
 */
@WebServlet("/driver/assignedRides")
public class DriverAssignedRidesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    
    public void init() throws ServletException {
        bookingService = new BookingService();
    }  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverAssignedRidesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("driver") == null) {
            response.sendRedirect(request.getContextPath() + "/DriverReg/driverLogin.jsp");
            return;
        }
        
        Driver driver = (Driver) session.getAttribute("driver");
        int driverId = driver.getDriver_id(); 
        
        
        List<Booking> bookings = bookingService.getBookingsByDriverId(driverId);
        request.setAttribute("bookings", bookings);
        
        
        request.getRequestDispatcher("/DriverReg/driverAssignedRides.jsp").forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
