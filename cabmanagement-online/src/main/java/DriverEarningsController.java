

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Driver;
import com.example.service.BookingService;

/**
 * Servlet implementation class DriverEarningsController
 */
@WebServlet("/driver/earnings")
public class DriverEarningsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService = new BookingService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverEarningsController() {
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
        double earnings = bookingService.calculateDriverEarnings(driver.getDriver_id());
        request.setAttribute("earnings", earnings);
        request.getRequestDispatcher("/DriverReg/driverEarnings.jsp").forward(request, response);
   }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
